//
//  PhotoCollectionViewCell.swift
//  GooglyPuff
//
//  Created by Joseph Ugowe on 11/17/2017.
//  Copyright © 2017 Joseph Ugowe. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  @IBOutlet var imageView: UIImageView!
  var representedAssetIdentifier: String!
  var thumbnailImage: UIImage! {
    didSet {
      imageView.image = thumbnailImage
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }
}
