//
//  UIViewOperators.swift
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
    Trailing distance to view operator. See also -| (the leading distance operator).

    :param: view The constraint's initial view.
    :param: constant The trailing/bottom distance.
    :returns: A PartialConstraint that specifies the trailing distance to a yet to be defined view. This constraint should be used as an input to the leading distance to view operator.
*/
public func |- <T: CGFloatConvertible> (view: View, constant: T) -> PartialConstraint {
    return view |- constant.toCGFloat()
}

/**
    Trailing distance to view operator.

    :param: view The constraint's initial view.
    :param: constant The trailing/bottom distance.
    :returns: A PartialConstraint that specifies the trailing distance to a yet to be defined view. This constraint should be used as an input to the leading distance to view operator.
*/
public func |- (view: View, constant: CGFloat) -> PartialConstraint {
    return PartialConstraint(secondItem: view, constant: constant)
}

private func sizeConstraintWithView(view: View, #constant: CGFloat, #relation: NSLayoutRelation) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.firstItem = view
    constraint.firstItemAttribute = .Size
    constraint.constant = constant
    constraint.relation = relation
    return constraint
}

private func sizeConstraintWithLeftView(leftView: View, #rightView: View, #relation: NSLayoutRelation) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.firstItem = leftView
    constraint.firstItemAttribute = .Size
    constraint.relation = relation
    constraint.secondItem = rightView
    constraint.secondItemAttribute = .Size
    return constraint
}

/**
    Width greater or equal than constant operator.

    :param: view The constraint's view.
    :param: constant The width.
    :returns: A LayoutConstraint specifying the view's width to be greater than the constant.
*/
public func >= <T: CGFloatConvertible> (view: View, constant: T) -> LayoutConstraint {
    return view >= constant.toCGFloat()
}

/**
    Width greater or equal than constant operator.

    :param: view The constraint's view.
    :param: constant The width.
    :returns: A LayoutConstraint specifying the view's width to be greater than the constant.
*/
public func >= (view: View, constant: CGFloat) -> LayoutConstraint {
    return sizeConstraintWithView(view, constant: constant, relation: .GreaterThanOrEqual)
}

/**
    Width greater or equal than view operator.

    :param: leftView The first view in the constraint.
    :param: rightView The second view in the constraint.
    :returns: A LayoutConstraint specifying the first view's width to be greater or equal to the second view's width.
*/
public func >= (leftView: View, rightView: View) -> LayoutConstraint {
    return sizeConstraintWithLeftView(leftView, rightView: rightView, relation: .GreaterThanOrEqual)
}

/**
    Width smaller or equal than constant operator.

    :param: view The constraint's view.
    :param: constant The width.
    :returns: A LayoutConstraint specifying the view's width to be smaller than the constant.
*/
public func <= <T: CGFloatConvertible> (view: View, constant: T) -> LayoutConstraint {
    return view <= constant.toCGFloat()
}

/**
    Width smaller or equal than constant operator.

    :param: view The constraint's view.
    :param: constant The width.
    :returns: A LayoutConstraint specifying the view's width to be smaller than the constant.
*/
public func <= (view: View, constant: CGFloat) -> LayoutConstraint {
    return sizeConstraintWithView(view, constant: constant, relation: .LessThanOrEqual)
}

/**
    Width smaller or equal than view operator.

    :param: leftView The first view in the constraint.
    :param: rightView The second view in the constraint.
    :returns: A LayoutConstraint specifying the first view's width to be smaller or equal to the second view's width.
*/
public func <= (leftView: View, rightView: View) -> LayoutConstraint {
    return sizeConstraintWithLeftView(leftView, rightView: rightView, relation: .LessThanOrEqual)
}

/**
    Width equal to constant operator.

    :param: view The constraint's view.
    :param: constant The width.
    :returns: A LayoutConstraint specifying the view's width to be equal to a constant.
*/
public func == <T: CGFloatConvertible> (view: View, constant: T) -> LayoutConstraint {
    return view == constant.toCGFloat()
}

/**
    Width equal to constant operator.

    :param: view The constraint's view.
    :param: constant The width.
    :returns: A LayoutConstraint specifying the view's width to be equal to a constant.
*/
public func == (view: View, constant: CGFloat) -> LayoutConstraint {
    return sizeConstraintWithView(view, constant: constant, relation: .Equal)
}

/**
    Width equal to view operator.

    :param: leftView The first view in the constraint.
    :param: rightView The second view in the constraint.
    :returns: A LayoutConstraint specifying the first view's width to be equal to the second view's width.
*/
public func == (leftView: View, rightView: View) -> LayoutConstraint {
    var constraint = LayoutConstraint()
    constraint.firstItem = leftView
    constraint.firstItemAttribute = .Size
    constraint.relation = .Equal
    constraint.secondItem = rightView
    constraint.secondItemAttribute = .Size
    return constraint
}

/**
    Leading distance to superview operator.

    :param: constant The leading distance to the superview.
    :param: view The view that needs to be distanced from the superview. The view needs to have a superview.
    :returns: A LayoutConstraint specifying the leading distance from the view to its superview.
*/
public func |-| <T: CGFloatConvertible> (constant: T, view: View) -> LayoutConstraint {
    return constant.toCGFloat() |-| view
}

/**
    Leading distance to superview operator.

    :param: constant The leading distance to the superview.
    :param: view The view that needs to be distanced from the superview. The view needs to have a superview.
    :returns: A LayoutConstraint specifying the leading distance from the view to its superview.
*/
public func |-| (constant: CGFloat, view: View) -> LayoutConstraint {
    assert(view.superview != nil, "Can't use `distance to superview` operator on view that has no superview")
    
    var constraint = LayoutConstraint()
    constraint.firstItem = view
    constraint.firstItemAttribute = .LeadingOrTopToSuperview
    constraint.relation = .Equal
    constraint.secondItem = view.superview!
    constraint.secondItemAttribute = .LeadingOrTopToSuperview
    constraint.constant = constant
    return constraint
}

/**
    Trailing distance to superview operator.

    :param: view The view that needs to be distanced from the superview. The view needs to have a superview.
    :param: constant The trailing distance to the superview.
    :returns: A LayoutConstraint specifying the trailing distance from the view to its superview.
*/
public func |-| <T: CGFloatConvertible> (view: View, constant: T) -> LayoutConstraint {
    return view |-| constant.toCGFloat()
}

/**
    Trailing distance to superview operator.

    :param: view The view that needs to be distanced from the superview. The view needs to have a superview.
    :param: constant The trailing distance to the superview.
    :returns: A LayoutConstraint specifying the trailing distance from the view to its superview.
*/
public func |-| (view: View, constant: CGFloat) -> LayoutConstraint {
    assert(view.superview != nil, "Can't use `distance to superview` operator on view that has no superview")
    
    var constraint = LayoutConstraint()
    constraint.firstItem = view.superview!
    constraint.firstItemAttribute = .TrailingOrBottomToSuperview
    constraint.relation = .Equal
    constraint.secondItem = view
    constraint.secondItemAttribute = .TrailingOrBottomToSuperview
    constraint.constant = constant
    return constraint
}

/**
    Flush views operator.

    :param: leftView The first view of the constraint.
    :param: rightView The second view of the constraint.
    :returns: A LayoutConstraint specifying a distance of 0 points between the two views.
*/
public func || (leftView: View, rightView: View) -> LayoutConstraint {
    
    var constraint = LayoutConstraint()
    constraint.firstItem = rightView
    constraint.firstItemAttribute = .DistanceToSibling
    constraint.relation = .Equal
    constraint.secondItem = leftView
    constraint.secondItemAttribute = .DistanceToSibling
    return constraint
}

/**
    Standard distance operator.

    :param: leftView The first view of the constraint.
    :param: rightView The second view of the constraint.
    :returns: A LayoutConstraint specifying a standard (8 points) distance between the two views.
*/
public func - (leftView: View, rightView: View) -> LayoutConstraint {
    
    var constraint = leftView || rightView
    constraint.constant = 8
    return constraint
}
