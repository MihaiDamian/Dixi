//
//  UIViewExtensionTests.swift
//  Dixi
//
//  Created by Mihai Damian on 04/03/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import XCTest
import Dixi

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif


class UIViewExtensionTests: XCTestCase {

    func testAddConstraints() {
        
        let rootView = View()
        let childView = View()
        rootView.addSubview(childView)
        let leftDistance = 50
        let rightDistance = 60
        let height = 30
        
        let expectedConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-leftDistance-[childView(>=height)]-rightDistance-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: ["leftDistance": leftDistance, "rightDistance": rightDistance, "height": height],
            views: ["childView": childView])
        
        rootView.addConstraints(^[leftDistance |-| childView, childView |-| rightDistance, childView >= height])
        
#if os(iOS)
        let addedConstraints = rootView.constraints
#else
        let addedConstraints = rootView.constraints
#endif
        
        // We can't simply compare the array for equality since the order of expected constraints is not clearly defined.
        for expectedConstraint in expectedConstraints {
            var found = false
            for addedConstraint in addedConstraints {
                if addedConstraint == expectedConstraint {
                    found = true
                    break
                }
            }
            XCTAssert(found, "Expected constraint was not added by Dixi")
        }
        
        XCTAssert(addedConstraints.count == expectedConstraints.count, "Unexpected constraint added by Dixi")
    }
}
