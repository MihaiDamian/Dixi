//
//  UIViewOperators.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


public func |- <T: CGFloatConvertible> (view: UIView, constant: T) -> PartialConstraint {
    return view |- constant.toCGFloat()
}

public func |- (view: UIView, constant: CGFloat) -> PartialConstraint {
    return PartialConstraint(secondItem: view, constant: constant)
}

public func >= <T: CGFloatConvertible> (view: UIView, constant: T) -> LayoutConstraint {
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

public func <= <T: CGFloatConvertible> (view: UIView, constant: T) -> LayoutConstraint {
    return view <= constant.toCGFloat()
}

public func <= (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return sizeConstraintWithView(view, constant: constant, relation: .LessThanOrEqual)
}

public func == <T: CGFloatConvertible> (view: UIView, constant: T) -> LayoutConstraint {
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

public func =| <T: CGFloatConvertible> (constant: T, view: UIView) -> LayoutConstraint {
    return constant.toCGFloat() =| view
}

public func =| (constant: CGFloat, view: UIView) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.firstItem = view
    constraint.firstItemAttribute = .LeadingOrTopToSuperview
    constraint.relation = .Equal
    assert(view.superview != nil, "Can't use `distance from superview` operator on view that has no superview")
    constraint.secondItem = view.superview!
    constraint.secondItemAttribute = .LeadingOrTopToSuperview
    constraint.constant = constant
    return constraint
}

public func |= (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

public func || (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}
