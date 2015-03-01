//
//  UIViewOperators.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


public func |- <T: CGFloatConvertable> (view: UIView, constant: T) -> PartialConstraint {
    return view |- constant.toCGFloat()
}

public func |- (view: UIView, constant: CGFloat) -> PartialConstraint {
    return PartialConstraint(secondItem: view, constant: constant)
}

public func >= <T: CGFloatConvertable> (view: UIView, constant: T) -> LayoutConstraint {
    return view >= constant.toCGFloat()
}

private func sizeConstraintWithView(view: UIView, #constant: CGFloat, #relation: NSLayoutRelation) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.firstItem = view
    constraint.firstItemAttribute = .Size
    constraint.constant = constant
    constraint.relation = relation
    return constraint
}

public func >= (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return sizeConstraintWithView(view, constant: constant, relation: .GreaterThanOrEqual)
}

public func <= <T: CGFloatConvertable> (view: UIView, constant: T) -> LayoutConstraint {
    return view <= constant.toCGFloat()
}

public func <= (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return sizeConstraintWithView(view, constant: constant, relation: .LessThanOrEqual)
}

public func == <T: CGFloatConvertable> (view: UIView, constant: T) -> LayoutConstraint {
    return view == constant.toCGFloat()
}

public func == (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return sizeConstraintWithView(view, constant: constant, relation: .Equal)
}

public func == (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.firstItem = leftView
    constraint.firstItemAttribute = .Size
    constraint.relation = .Equal
    constraint.secondItem = rightView
    constraint.secondItemAttribute = .Size
    return constraint
}

public func =| (constant: CGFloat, view: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}

public func |= (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

public func || (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}
