//
//  UIViewExtensionTests.swift
//  Dixi
//
//  Created by Mihai Damian on 04/03/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import XCTest
import Dixi


class UIViewExtensionTests: XCTestCase {

    func testAddConstraints() {
        
        let rootView = UIView()
        let childView = UIView()
        rootView.addSubview(childView)
        let leftDistance = 50
        let rightDistance = 60
        let height = 30
        
        let expectedConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-leftDistance-[childView(>=height)]-rightDistance-|",
            options: NSLayoutFormatOptions(0),
            metrics: ["leftDistance": leftDistance, "rightDistance": rightDistance, "height": height],
            views: ["childView": childView]) as! [NSLayoutConstraint]
        
        rootView.addConstraints(^[leftDistance |-| childView, childView |-| rightDistance, childView >= height])
        
        let addedConstraints = rootView.constraints() as! [NSLayoutConstraint]
        // We can't simply compare the array for equality since the order of expected constraints is not clearly defined.
        for constraint in expectedConstraints {
            XCTAssert(contains(addedConstraints, constraint), "Expected constraint was not added by Dixi")
        }
        
        XCTAssert(count(addedConstraints) == count(expectedConstraints), "Unexpected constraint added by Dixi")
    }
}
