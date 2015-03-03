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
        case DistanceToSibling
        case LeadingOrTopToSuperview
//        case TrailingOrToSuperview
    }
    
    var axis = Axis.Horizontal
    
    var firstItem: UIView!
    var firstItemAttribute: LayoutAttribute!
    var relation = NSLayoutRelation.Equal
    var secondItem: UIView?
    var secondItemAttribute: LayoutAttribute?
    var constant: CGFloat = 0
    var priority: UILayoutPriority?
    
    public var autolayoutConstraint: NSLayoutConstraint {
        var constraint = NSLayoutConstraint(item: firstItem,
            attribute: autolayoutFirstItemAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: autolayoutSecondItemAttribute,
            multiplier: 1,
            constant: constant)
        if let priority = priority {
            constraint.priority = priority
        }
        return constraint
    }
    
    private var autolayoutFirstItemAttribute: NSLayoutAttribute {
        switch (firstItemAttribute!, axis) {
        case (.Size, .Horizontal):
            return .Width
        case (.Size, .Vertical):
            return .Height
        case (.DistanceToSibling, .Horizontal):
            return .Leading
        case (.DistanceToSibling, .Vertical):
            return .Top
        case (.LeadingOrTopToSuperview, .Horizontal):
            return .Leading
        case (.LeadingOrTopToSuperview, .Vertical):
            return .Top
        }
    }
    
    private var autolayoutSecondItemAttribute: NSLayoutAttribute {
        switch (secondItemAttribute, axis) {
        case (.Some(.Size), .Horizontal):
            return .Width
        case (.Some(.Size), .Vertical):
            return .Height
        case (.Some(.DistanceToSibling), .Horizontal):
            return .Trailing
        case (.Some(.DistanceToSibling), .Vertical):
            return .Bottom
        case (.Some(.LeadingOrTopToSuperview), .Horizontal):
            return .Leading
        case (.Some(.LeadingOrTopToSuperview), .Vertical):
            return .Top
        default:
            return .NotAnAttribute
        }
    }
}


public prefix func ^ (constraint: LayoutConstraint) -> LayoutConstraint {
    var constraint = constraint
    constraint.axis = .Vertical
    return constraint
}

public prefix func ^ (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return constraint.map { ^$0 }
}

public prefix func > (constraint: LayoutConstraint) -> LayoutConstraint {
    var constraint = constraint
    constraint.axis = .Horizontal
    return constraint
}

public prefix func > (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return constraint.map { >$0 }
}

public func ~ (constraint: LayoutConstraint, priority: UILayoutPriority) -> LayoutConstraint {
    var constraint = constraint
    constraint.priority = priority
    return constraint
}
