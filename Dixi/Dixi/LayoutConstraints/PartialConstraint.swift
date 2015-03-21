//
//  PartialConstraint.swift
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
    A PartialConstraint is used as an opaque, intermediate structure, in situations where a fully specified constraint
    can't be constructed by a single operator. A PartialConstraint is not a valid constraint and can't be converted to
    NSLayoutConstraint.
*/
public struct PartialConstraint {
    
    let secondItem: View
    let constant: CGFloat
}


/**
    Leading distance to view operator. See also |- (the trailing distance operator).

    :param: partialConstraint A PartialConstraint.
    :param: view A view that has a leading distance to the view specified by the PartialConstraint.
    :returns: A LayoutConstraint that defined a distance between two views.
*/
public func -| (partialConstraint: PartialConstraint, view: View) -> LayoutConstraint {
    
    var constraint = LayoutConstraint()
    constraint.secondItem = partialConstraint.secondItem
    constraint.secondItemAttribute = .DistanceToSibling
    constraint.constant = partialConstraint.constant
    constraint.firstItem = view
    constraint.firstItemAttribute = .DistanceToSibling
    return constraint
}
