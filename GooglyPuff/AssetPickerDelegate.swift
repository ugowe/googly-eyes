//
//  AssetPickerDelegate.swift
//  GooglyPuff
//
//  Created by Joseph Ugowe on 11/17/2017.
//  Copyright © 2017 Joseph Ugowe. All rights reserved.
//

import Foundation
import Photos

protocol AssetPickerDelegate {
  func assetPickerDidFinishPickingAssets(_ selectedAssets: [PHAsset])
  func assetPickerDidCancel()
}
