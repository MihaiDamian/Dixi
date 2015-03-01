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
        case Distance
    }
    
    var axis = Axis.Horizontal
    
    var firstItem: UIView!
    var firstItemAttribute: LayoutAttribute!
    var relation = NSLayoutRelation.Equal
    var secondItem: UIView?
    var secondItemAttribute: LayoutAttribute?
    var constant: CGFloat = 0
    
    public var autolayoutConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: firstItem,
            attribute: autolayoutFirstItemAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: autolayoutSecondItemAttribute,
            multiplier: 1,
            constant: constant)
    }
    
    public var autolayoutFirstItemAttribute: NSLayoutAttribute {
        switch (firstItemAttribute!, axis) {
        case (.Size, .Horizontal):
            return .Width
        case (.Size, .Vertical):
            return .Height
        case (.Distance, .Horizontal):
            return .Leading
        case (.Distance, .Vertical):
            return .Bottom
        }
    }
    
    public var autolayoutSecondItemAttribute: NSLayoutAttribute {
        switch (secondItemAttribute, axis) {
        case (.Some(.Size), .Horizontal):
            return .Width
        case (.Some(.Size), .Vertical):
            return .Height
        case (.Some(.Distance), .Horizontal):
            return .Trailing
        case (.Some(.Distance), .Vertical):
            return .Top
        default:
            return .NotAnAttribute
        }
    }
}


public prefix func ^ (constraint: LayoutConstraint) -> LayoutConstraint {
    return LayoutConstraint()
}

public prefix func ^ (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return [LayoutConstraint()]
}

public prefix func > (constraint: LayoutConstraint) -> LayoutConstraint {
    return LayoutConstraint()
}

public prefix func > (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return [LayoutConstraint()]
}

public func ~ (constraint: LayoutConstraint, priority: Int) -> LayoutConstraint {
    return LayoutConstraint()
}
