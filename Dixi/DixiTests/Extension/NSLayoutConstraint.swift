//
//  NSLayoutConstraint.swift
//  Dixi
//
//  Created by Mihai Damian on 28/02/15.
//  Copyright (c) 2015 Mihai Damian. All rights reserved.
//

import Foundation
import UIKit


func == (leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) -> Bool {
    
    let equalPriority = leftConstraint.priority == rightConstraint.priority
    let equalFirstItem = leftConstraint.firstItem === rightConstraint.firstItem
    let equalFirstAttribute = leftConstraint.firstAttribute == rightConstraint.firstAttribute
    let equalRelation = leftConstraint.relation == rightConstraint.relation
    let equalSecondItem = leftConstraint.secondItem === rightConstraint.secondItem
    let equalSecondAttribute = leftConstraint.secondAttribute == rightConstraint.secondAttribute
    let equalMultiplier = leftConstraint.multiplier == rightConstraint.multiplier
    let equalConstant = leftConstraint.constant == rightConstraint.constant
    
    return equalPriority && equalFirstItem && equalFirstAttribute && equalRelation && equalSecondItem && equalSecondAttribute && equalMultiplier && equalConstant
}
