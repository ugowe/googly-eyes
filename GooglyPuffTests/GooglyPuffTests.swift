//
//  GooglyPuffTests.swift
//  GooglyPuff
//
//  Created by Joseph Ugowe on 11/17/2017.
//  Copyright © 2017 Joseph Ugowe. All rights reserved.
//

import XCTest
@testable import GooglyPuff

private let defaultTimeoutLengthInSeconds: Int = 10 // 10 Seconds

class GooglyPuffTests: XCTestCase {
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testLotsOfFacesImageURL() {
    downloadImageURLWithString(lotsOfFacesURLString)
  }
  
  func testSuccessKidImageURL() {
    downloadImageURLWithString(successKidURLString)
  }
  
  func testOverlyAttachedGirlfriendImageURL() {
    downloadImageURLWithString(overlyAttachedGirlfriendURLString)
  }
  
  func downloadImageURLWithString(_ urlString: String) {
    XCTFail("Not implemented!")
  }
}
