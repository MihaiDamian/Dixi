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

public func >= (view: UIView, constant: CGFloat) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.firstItem = view
    constraint.firstItemAttribute = .Size
    constraint.constant = constant
    constraint.relation = .GreaterThanOrEqual
    return constraint
}

public func <= (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

public func == (view: UIView, constant: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

public func == (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    return LayoutConstraint()
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
