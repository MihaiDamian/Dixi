//
//  LayoutConstraint.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation
import UIKit


public struct LayoutConstraint {
    
    enum Axis {
        case Horizontal
        case Vertical
    }
    
    enum LayoutAttribute {
        case Size
    }
    
    var axis = Axis.Horizontal
    
    var leftHandView: UIView!
    var leftHandAttribute: LayoutAttribute!
    var relation = NSLayoutRelation.Equal
    var rightHandView: UIView?
    var constant: CGFloat = 0
    
    public var autolayoutConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: leftHandView,
            attribute: autolayoutLeftHandAttribute,
            relatedBy: relation,
            toItem: rightHandView,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: constant)
    }
    
    public var autolayoutLeftHandAttribute: NSLayoutAttribute {
        switch (leftHandAttribute!, axis) {
        case (.Size, .Horizontal):
            return .Width
        case (.Size, .Vertical):
            return .Height
        }
    }
}


prefix func ^ (constraint: LayoutConstraint) -> LayoutConstraint {
    return LayoutConstraint()
}

prefix func ^ (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return [LayoutConstraint()]
}

prefix func > (constraint: LayoutConstraint) -> LayoutConstraint {
    return LayoutConstraint()
}

prefix func > (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return [LayoutConstraint()]
}

func ~ (constraint: LayoutConstraint, priority: Int) -> LayoutConstraint {
    return LayoutConstraint()
}
