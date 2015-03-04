// Playground - noun: a place where people can play

import UIKit


struct LayoutConstraint {
}

struct PartialConstraint {
}


// Distance from view operator
infix operator |- { associativity left }
func |- (view: UIView, measure: CGFloat) -> PartialConstraint {
    return PartialConstraint()
}

// Distance to view operator
infix operator -| { associativity left}
func -| (constraint: PartialConstraint, view: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}

// Measure greater than operator
func >= (view: UIView, measure: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

// Measure less than operator
func <= (view: UIView, measure: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

// Measure equal to operator
func == (view: UIView, measure: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

// Equal measure operator
func == (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}

// Vertical axis operator
prefix operator ^ {}
prefix func ^ (constraint: LayoutConstraint) -> LayoutConstraint {
    return LayoutConstraint()
}
prefix func ^ (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return [LayoutConstraint()]
}

// Horizontal axis operator
prefix operator > {}
prefix func > (constraint: LayoutConstraint) -> LayoutConstraint {
    return LayoutConstraint()
}
prefix func > (constraint: [LayoutConstraint]) -> [LayoutConstraint] {
    return [LayoutConstraint()]
}

// Distance from superview operator
infix operator |-| {}
func |-| (measure: CGFloat, view: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}

// Distance to superview operator
func |-| (view: UIView, measure: CGFloat) -> LayoutConstraint {
    return LayoutConstraint()
}

// Flush views operator
func || (leftView: UIView, rightView: UIView) -> LayoutConstraint {
    return LayoutConstraint()
}

// Priority operator
infix operator ~ {}
func ~ (constraint: LayoutConstraint, priority: Int) -> LayoutConstraint {
    return LayoutConstraint()
}


//==========================================================================
let view1 = UIView()
let view2 = UIView()

let con1 = view1 |- 50 -| view2
let con2 = view1 >= 10
let con3 = ^(view1 |- 50 -| view2)
let con4 = >(view1 |- 50 -| view2)
let con5 = 50 |-| view1
let con6 = view1 |-| 50
let con7 = view1 || view2
let con8 = view1 <= 10
let con9 = view1 == 50
let con10 = view1 == view2
let con11 = view1 >= 10 ~ 10

let constraints = ^[view1 |- 50 -| view2, view1 >= 10]
