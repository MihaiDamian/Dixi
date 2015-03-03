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
    
    var rootView: UIView!
    
    private func constraintWithVisualFormat(format: String,
        options: NSLayoutFormatOptions = NSLayoutFormatOptions(0),
        metrics: [String: AnyObject]?,
        views: [String: UIView]) -> NSLayoutConstraint {
            
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views).first! as! NSLayoutConstraint
    }
    
    override func setUp() {
        rootView = UIView()
    }
    
    func testWidthGreaterThan() {
        
        let view = UIView()
        rootView.addSubview(view)
        let width = 50
        let expectedConstraint = constraintWithVisualFormat("[view(>=width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = rootView.addConstraint(view >= width)
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testWidthLessThan() {
        
        let view = UIView()
        rootView.addSubview(view)
        let width = 50
        let expectedConstraint = constraintWithVisualFormat("[view(<=width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = rootView.addConstraint(view <= width)
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testWidthEqualToConstant() {
        
        let view = UIView()
        rootView.addSubview(view)
        let width = 50
        let expectedConstraint = constraintWithVisualFormat("[view(width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = rootView.addConstraint(view == width)
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testWidthEqualToView() {
        
        let view1 = UIView()
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        rootView.addSubview(view1)
        rootView.addSubview(view2)
        let expectedConstraint = constraintWithVisualFormat("[view1(==view2)]",
            metrics: nil,
            views: ["view1": view1, "view2": view2])
        let dixiConstraint = rootView.addConstraint(view1 == view2)
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testHeightEqualToView() {
        
        let view1 = UIView()
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        rootView.addSubview(view1)
        rootView.addSubview(view2)
        let expectedConstraint = constraintWithVisualFormat("V:[view1(==view2)]",
            metrics: nil,
            views: ["view1": view1, "view2": view2])
        let dixiConstraint = rootView.addConstraints(^[view1 == view2]).first!
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testDistance() {
        
        let leftView = UIView()
        let rightView = UIView()
        rootView.addSubview(leftView)
        rootView.addSubview(rightView)
        let distance = 100
        let expectedConstraint = constraintWithVisualFormat("[leftView]-distance-[rightView]",
            metrics: ["distance": distance],
            views: ["leftView": leftView, "rightView": rightView])
        let dixiConstraint = rootView.addConstraint(leftView |- distance -| rightView)
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testVerticalDistance() {
        
        let leftView = UIView()
        let rightView = UIView()
        rootView.addSubview(leftView)
        rootView.addSubview(rightView)
        let distance = 75
        let expectedConstraint = constraintWithVisualFormat("V:[leftView]-distance-[rightView]",
            metrics: ["distance": distance],
            views: ["leftView": leftView, "rightView": rightView])
        let dixiConstraint = rootView.addConstraints(^[leftView |- distance -| rightView]).first!
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testHorizontalAxis() {
        
        let view = UIView()
        rootView.addSubview(view)
        let width = 70
        let expectedConstraint = constraintWithVisualFormat("H:[view(<=width)]",
            metrics: ["width": width],
            views: ["view": view])
        let dixiConstraint = rootView.addConstraints(>[view <= width]).first!
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testPriority() {
        
        let view = UIView()
        rootView.addSubview(view)
        let width = 100
        let priority: UILayoutPriority = 20
        let expectedConstraint = constraintWithVisualFormat("[view(width@priority)]",
            metrics: ["width": width, "priority": priority],
            views: ["view": view])
        let dixiConstraint = rootView.addConstraint(view == width ~ priority)
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
    
    func testLeadingDistanceToSuperview() {
        
        let view = UIView()
        rootView.addSubview(view)
        let distance = 50
        let expectedConstraint = constraintWithVisualFormat("|-distance-[view]",
            metrics: ["distance": distance],
            views: ["view": view])
        let dixiConstraint = rootView.addConstraint(distance =| view)
        
        XCTAssert(expectedConstraint == dixiConstraint, "Constraints should be identical")
    }
}
