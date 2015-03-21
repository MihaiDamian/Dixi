//
//  LayoutConstraint.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#else
    import AppKit
#endif


/**
    A LayoutConstraint is a Dixi constraint represented as an opaque structure. It can be converted at any time to a NSLayoutConstraint.
*/
public struct LayoutConstraint {
    
    enum Axis {
        case Horizontal
        case Vertical
    }
    
    enum LayoutAttribute {
        case Size
        case DistanceToSibling
        case LeadingOrTopToSuperview
        case TrailingOrBottomToSuperview
    }
    
    private var axis = Axis.Horizontal
    
    var firstItem: View!
    var firstItemAttribute: LayoutAttribute!
    var relation = NSLayoutRelation.Equal
    var secondItem: View?
    var secondItemAttribute: LayoutAttribute?
    var constant: CGFloat = 0
    private var priority: LayoutPriority?
    
    /**
        The NSLayoutConstraint representation of the LayoutConstraint.
    */
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
        case (.TrailingOrBottomToSuperview, .Horizontal):
            return .Trailing
        case (.TrailingOrBottomToSuperview, .Vertical):
            return .Bottom
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
        case (.Some(.TrailingOrBottomToSuperview), .Horizontal):
            return .Trailing
        case (.Some(.TrailingOrBottomToSuperview), .Vertical):
            return .Bottom
        default:
            return .NotAnAttribute
        }
    }
}


/**
    Vertical axis operator.

    :param: constraint Any LayoutConstraint.
    :returns: A LayoutConstraint that defines all relations between views on the vertical axis (e.g. top distance, height, bottom distance).
*/
public prefix func ^ (constraint: LayoutConstraint) -> LayoutConstraint {
    var constraint = constraint
    constraint.axis = .Vertical
    return constraint
}

/**
    Vertical axis operator.

    :param: constraints An array of LayoutConstraints.
    :returns: An array of LayoutConstraints that define all relations between views on the vertical axis (e.g. top distance, height, bottom distance).
*/
public prefix func ^ (constraints: [LayoutConstraint]) -> [LayoutConstraint] {
    return constraints.map { ^$0 }
}

/**
    Horizontal axis operator. By default all constraints are defined on the horizontal axis. This operator is optional.

    :param: constraint Any LayoutConstraint.
    :returns: A LayoutConstraint that defines all relations between views on the horizontal axis (e.g. leading distance, width, trailing distance).
*/
public prefix func > (constraint: LayoutConstraint) -> LayoutConstraint {
    var constraint = constraint
    constraint.axis = .Horizontal
    return constraint
}

/**
    Horizontal axis operator. By default all constraints are defined on the horizontal axis. This operator is optional.

    :param: constraints An array of LayoutConstraints.
    :returns: An array of LayoutConstraints that define all relations between views on the vertical axis (e.g. leading distance, width, trailing distance).
*/
public prefix func > (constraints: [LayoutConstraint]) -> [LayoutConstraint] {
    return constraints.map { >$0 }
}

/**
    Priority operator.

    :param: Any LayoutConstraint.
    :param: priority A layout priority value.
    :returns: A constraint with the specified priority.
*/
public func ~ (constraint: LayoutConstraint, priority: LayoutPriority) -> LayoutConstraint {
    var constraint = constraint
    constraint.priority = priority
    return constraint
}
