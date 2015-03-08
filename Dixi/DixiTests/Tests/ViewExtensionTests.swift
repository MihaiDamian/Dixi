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
            options: NSLayoutFormatOptions(0),
            metrics: ["leftDistance": leftDistance, "rightDistance": rightDistance, "height": height],
            views: ["childView": childView]) as! [NSLayoutConstraint]
        
        rootView.addConstraints(^[leftDistance |-| childView, childView |-| rightDistance, childView >= height])
        
#if os(iOS)
        let addedConstraints = rootView.constraints() as! [NSLayoutConstraint]
#else
        let addedConstraints = rootView.constraints as! [NSLayoutConstraint]
#endif
        // We can't simply compare the array for equality since the order of expected constraints is not clearly defined.
        for constraint in expectedConstraints {
            XCTAssert(contains(addedConstraints, constraint), "Expected constraint was not added by Dixi")
        }
        
        XCTAssert(count(addedConstraints) == count(expectedConstraints), "Unexpected constraint added by Dixi")
    }
}
