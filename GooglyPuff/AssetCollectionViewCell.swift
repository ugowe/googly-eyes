//
//  AssetCollectionViewCell.swift
//  GooglyPuff
//
//  Created by Joseph Ugowe on 11/17/2017.
//  Copyright © 2017 Joseph Ugowe. All rights reserved.
//

import UIKit

class AssetCollectionViewCell: UICollectionViewCell {
  @IBOutlet var imageView: UIImageView!
  @IBOutlet fileprivate var checkMark: UIView?
  
  var representedAssetIdentifier: String!
  var thumbnailImage: UIImage! {
    didSet {
      imageView.image = thumbnailImage
    }
  }
  
  override var isSelected: Bool {
    didSet {
      checkMark?.isHidden = !isSelected
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }
}
