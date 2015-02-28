//
//  UIViewOperators.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


func |- (view: UIView, measure: CGFloat) -> PartialConstraint {
    return PartialConstraint()
}

public func >= <T: CGFloatConvertable> (view: UIView, measure: T) -> LayoutConstraint {
    return view >= measure.toCGFloat()
}

public func >= (view: UIView, measure: CGFloat) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.leftHandView = view
    constraint.leftHandAttribute = .Size
    constraint.constant = measure
    constraint.relation = .GreaterThanOrEqual
    return constraint
}

func <= (view: UIView, measure: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

func == (view: UIView, measure: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

func == (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}

func =| (measure: CGFloat, view: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}

func |= (view: UIView, measure: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

func || (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}
