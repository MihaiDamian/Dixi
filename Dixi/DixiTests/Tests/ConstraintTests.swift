//
//  ConstraintTests.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import UIKit
import XCTest
import Dixi


class ConstraintTests: XCTestCase {

    func testConstraintWidthGreaterThan() {
        
        let view = UIView()
        let measure = 50
        let expectedConstraint = NSLayoutConstraint.constraintsWithVisualFormat("[view(>=measure)]",
            options: NSLayoutFormatOptions(0),
            metrics: ["measure": 50],
            views: ["view": view]).first as! NSLayoutConstraint
        let constructedConstraint = (view >= measure).autolayoutConstraint
        
        XCTAssert(constructedConstraint == expectedConstraint, "")
    }
}
