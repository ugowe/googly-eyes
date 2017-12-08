//
//  SelectedAssets.swift
//  GooglyPuff
//
//  Created by Joseph Ugowe on 11/17/2017.
//  Copyright © 2017 Joseph Ugowe. All rights reserved.
//


import Foundation
import Photos

class SelectedAssets: NSObject {
  var assets: [PHAsset]
  
  override init() {
    assets = []
  }
  
  init(assets:[PHAsset]) {
    self.assets = assets
  }
}
