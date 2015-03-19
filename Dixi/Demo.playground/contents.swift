
import Dixi
import UIKit


let view1 = UIView()
let view2 = UIView()
let superview = UIView()
superview.addSubview(view1)


// Dixi operators are designed to closely imitate Apple's visual format syntax. The syntax is not identical, though.
// Unlike the visual format syntax, you can't create multiple constraints form a single Dixi expression.
let standardHorizontalSpacingConstraint = view1 - view2
// Dixi represents constraints as a custom opaque type. You can transform it to a NSLayoutConstraint or use the UIView
// extension convenience methods to add them directly to a view as NSLayoutConstraints.
superview.addConstraint(standardHorizontalSpacingConstraint)

let customHorizontalDistanceConstraint = view1 |- 10 -| view2
let flushViewsConstraint = view1 || view2

let widthGreaterThanConstraint = view1 >= 50
// By default Dixi constraints are declared for the horizontal axis.
// Use the ^ operator to use the vertical axis on any Dixi constraint.
let heightGreaterThanConstraint = ^(view1 >= 50)
// If you want to be explicit you can use the > operator to indicate you want to use the horizontal axis.
let explicitAxisConstraint = >(view1 >= 50)

let equalWidthsConstraint = view1 == view2

// With Dixi it's an error to create a constraint between a view and a superview if that view does not have a superview.
// This is why view1 was added to a superview beforehand.
let leadingSpaceToSuperviewConstraint = 50 |-| view1
let trailingSpaceToSuperviewConstraint = view1 |-| 50

let priorityConstraint = (view1 <= 50) ~ 20
