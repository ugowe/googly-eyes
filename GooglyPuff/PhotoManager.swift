//
//  PhotoManager.swift
//  GooglyPuff
//
//  Created by Joseph Ugowe on 11/17/2017.
//  Copyright © 2017 Joseph Ugowe. All rights reserved.
//

import Foundation

// Notification when new photo instances are added
let photoManagerContentAddedNotification = "com.raywenderlich.GooglyPuff.PhotoManagerContentAdded"
// Notification when content updates (i.e. Download finishes)
let photoManagerContentUpdatedNotification = "com.raywenderlich.GooglyPuff.PhotoManagerContentUpdated"

// Photo Credit: Devin Begley, http://www.devinbegley.com/
let overlyAttachedGirlfriendURLString = "http://i.imgur.com/UvqEgCv.png"
let successKidURLString = "http://i.imgur.com/dZ5wRtb.png"
let lotsOfFacesURLString = "http://i.imgur.com/tPzTg7A.jpg"

typealias PhotoProcessingProgressClosure = (_ completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (_ error: NSError?) -> Void

private let _sharedManager = PhotoManager()

class PhotoManager {
    class var sharedManager: PhotoManager {
        return _sharedManager
    }
    
    fileprivate let concurrentPhotoQueue = DispatchQueue(label: "com.GooglyPuff.photoQueue", attributes: .concurrent)
    
    fileprivate var _photos: [Photo] = []
    
    var photos: [Photo] {
        var photosCopy: [Photo]!
        concurrentPhotoQueue.sync {
            photosCopy = self._photos
        }
        return photosCopy
    }
    
    func addPhoto(_ photo: Photo) {
        concurrentPhotoQueue.async(flags: .barrier) {
            self._photos.append(photo)
            DispatchQueue.main.async {
                self.postContentAddedNotification()
            }
        }
    }
    
    func downloadPhotosWithCompletion(_ completion: BatchPhotoDownloadingCompletionClosure?) {
        var storedError: NSError?
        for address in [overlyAttachedGirlfriendURLString,
                        successKidURLString,
                        lotsOfFacesURLString] {
                            let url = URL(string: address)
                            let photo = DownloadPhoto(url: url!) {
                                _, error in
                                if error != nil {
                                    storedError = error
                                }
                            }
                            PhotoManager.sharedManager.addPhoto(photo)
        }
        
        completion?(storedError)
    }
    
    fileprivate func postContentAddedNotification() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: photoManagerContentAddedNotification), object: nil)
    }
}
