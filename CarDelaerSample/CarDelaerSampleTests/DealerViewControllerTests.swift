//
//  DealerViewControllerTests.swift
//  CarDelaerSampleTests
//
//  Created by Mohit on 30/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import XCTest
@testable import CarDelaerSample

class DealerViewControllerTests: XCTestCase {
    override func setUp() { }
    
    func testCallDelegate() {
        //TODO:
    }
}

class MocCallkDelegate: CallDelegate {
    var shouldCallToDeler = false
    func callToDealer(phone: String) {
        shouldCallToDeler = true
    }
}
