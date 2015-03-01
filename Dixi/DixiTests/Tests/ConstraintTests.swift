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
    
    private var environment: ViewTestEnvironment!
    
    override func setUp() {
        environment = ViewTestEnvironment()
    }
    
    private struct ViewTestEnvironment {
        
        private let superview = UIView()
        
        func applyConstraints(constraints: [NSLayoutConstraint]) {
            
            superview.addConstraints(constraints)
            
            for subview in superview.subviews as! [UIView] {
                subview.setNeedsLayout()
                subview.layoutIfNeeded()
            }
        }
        
        func makeSubview() -> UIView {
            let subview = UIView()
            subview.setTranslatesAutoresizingMaskIntoConstraints(false)
            superview.addSubview(subview)
            return subview
        }
    }

    func testConstraintWidthGreaterThan() {
        
        let view1 = environment.makeSubview()
        let view2 = environment.makeSubview()
        
        let width: CGFloat = 50
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("[view(>=width)]",
            options: NSLayoutFormatOptions(0),
            metrics: ["width": 50],
            views: ["view": view1]) as! [NSLayoutConstraint]
        let expectedConstraint = constraints.first!
        let dixiConstraint = (view2 >= width).autolayoutConstraint
        
        environment.applyConstraints([expectedConstraint, dixiConstraint])
        
        XCTAssert(view1.frame == view2.frame, "Constraints should produce same result")
        XCTAssert(view2.frame.width >= width, "Incorrect width")
    }
    
    func testConstraintDistance() {
        
        let leftView1 = environment.makeSubview()
        let rightView1 = environment.makeSubview()
        
        let leftView2 = environment.makeSubview()
        let rightView2 = environment.makeSubview()
        
        let distance: CGFloat = 100
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("[leftView]-distance-[rightView]",
            options: NSLayoutFormatOptions(0),
            metrics: ["distance": distance],
            views: ["leftView": leftView1, "rightView": rightView1]) as! [NSLayoutConstraint]
        let expectedConstraint = constraints.first!
        let dixiConstraint = (leftView2 |- distance -| rightView2).autolayoutConstraint
        
        environment.applyConstraints([expectedConstraint, dixiConstraint])
        
        XCTAssert(leftView1.frame == leftView2.frame && rightView1.frame == rightView2.frame, "Constraints should produce same result")
        XCTAssert(rightView2.frame.minX - leftView2.frame.minX == distance, "Incorrect spacing between views")
    }
}
