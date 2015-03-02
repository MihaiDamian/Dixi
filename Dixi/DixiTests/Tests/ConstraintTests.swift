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
    
    private func constraintWithVisualFormat(format: String,
        options: NSLayoutFormatOptions = NSLayoutFormatOptions(0),
        metrics: [String: AnyObject]?,
        views: [String: UIView]) -> NSLayoutConstraint {
            
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views).first! as! NSLayoutConstraint
    }
    
    func testWidthGreaterThan() {
        
        let view = UIView()
        let width = 50
        let expectedConstraint = constraintWithVisualFormat("[view(>=width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = (view >= width).autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testWidthLessThan() {
        
        let view = UIView()
        let width = 50
        let expectedConstraint = constraintWithVisualFormat("[view(<=width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = (view <= width).autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testWidthEqualToConstant() {
        
        let view = UIView()
        let width = 50
        let expectedConstraint = constraintWithVisualFormat("[view(width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = (view == width).autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testWidthEqualToView() {
        
        let view1 = UIView()
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        let expectedConstraint = constraintWithVisualFormat("[view1(==view2)]",
            metrics: nil,
            views: ["view1": view1, "view2": view2])
        let dixiConstraint = (view1 == view2).autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testHeightEqualToView() {
        
        let view1 = UIView()
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        let expectedConstraint = constraintWithVisualFormat("V:[view1(==view2)]",
            metrics: nil,
            views: ["view1": view1, "view2": view2])
        let dixiConstraint = (^[view1 == view2]).first!.autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testDistance() {
        
        let leftView = UIView()
        let rightView = UIView()
        let distance = 100
        let expectedConstraint = constraintWithVisualFormat("[leftView]-distance-[rightView]",
            metrics: ["distance": distance],
            views: ["leftView": leftView, "rightView": rightView])
        let dixiConstraint = (leftView |- distance -| rightView).autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testVerticalDistance() {
        
        let leftView = UIView()
        let rightView = UIView()
        let distance = 75
        let expectedConstraint = constraintWithVisualFormat("V:[leftView]-distance-[rightView]",
            metrics: ["distance": distance],
            views: ["leftView": leftView, "rightView": rightView])
        let dixiConstraint = (^[leftView |- distance -| rightView]).first!.autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testHorizontalAxis() {
        
        let view = UIView()
        let width = 70
        let expectedConstraint = constraintWithVisualFormat("H:[view(<=width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = (>[view <= width]).first!.autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testPriority() {
        
        let view = UIView()
        let width = 100
        let priority: UILayoutPriority = 20
        let expectedConstraint = constraintWithVisualFormat("[view(width@priority)]",
            metrics: ["width": width, "priority": priority],
            views: ["view": view])
        let dixiConstraint = (view == width ~ priority).autolayoutConstraint
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
}
