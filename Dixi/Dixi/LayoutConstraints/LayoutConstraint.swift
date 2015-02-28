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
    
    struct SizeConstraint {
        
        let measure: CGFloat
        let relation: NSLayoutRelation
    }
    
    enum Axis {
        case Horizontal
        case Vertical
    }
    
    var axis = Axis.Horizontal
    
    var leftHandView: UIView!
    var rightHandView: UIView?
    
    var sizeConstraint: SizeConstraint?
    
    public var autolayoutConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: leftHandView,
            attribute: leftHandlayoutAttribute,
            relatedBy: layoutRelation,
            toItem: rightHandView,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: constant)
    }
    
    private var leftHandlayoutAttribute: NSLayoutAttribute {
        if let sizeConstraint = sizeConstraint {
            switch axis {
            case .Horizontal:
                return .Width
            case .Vertical:
                return .Height
            }
        }
        return .NotAnAttribute
    }
    
    private var layoutRelation: NSLayoutRelation {
        if let sizeConstraint = sizeConstraint {
            return sizeConstraint.relation
        }
        return .Equal
    }
    
    private var constant: CGFloat {
        if let sizeConstraint = sizeConstraint {
            return sizeConstraint.measure
        }
        return 0
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
