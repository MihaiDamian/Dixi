//
//  PartialConstraint.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation


public struct PartialConstraint {
    
    let secondItem: UIView
    let constant: CGFloat
}


public func -| (partialConstraint: PartialConstraint, view: UIView) -> LayoutConstraint {
    
    var constraint = LayoutConstraint()
    constraint.secondItem = partialConstraint.secondItem
    constraint.secondItemAttribute = .Distance
    constraint.constant = partialConstraint.constant
    constraint.firstItem = view
    constraint.firstItemAttribute = .Distance
    return constraint
}
