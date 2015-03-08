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


public struct PartialConstraint {
    
    let secondItem: View
    let constant: CGFloat
}


public func -| (partialConstraint: PartialConstraint, view: View) -> LayoutConstraint {
    
    var constraint = LayoutConstraint()
    constraint.secondItem = partialConstraint.secondItem
    constraint.secondItemAttribute = .DistanceToSibling
    constraint.constant = partialConstraint.constant
    constraint.firstItem = view
    constraint.firstItemAttribute = .DistanceToSibling
    return constraint
}
