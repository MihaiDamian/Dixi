Dixi is a collection of Swift operators for creating autolayout constraints.

## Is Dixi ready for production?
Dixi is written in Swift 1.2. The compiler for this version of Swift is currently available only in beta Xcode releases. Do not use Dixi if you plan to publish on the AppStore before the beta period ends.

## Requirements
- Swift 1.2 (Xcode 6.3)
- iOS 8.0 or OS X 10.9

## Using Dixi
Dixi allows you to create autolayout constraints using a concise and type safe notation with the aid of some custom operators. The syntax is designed to resemble Apple's visual format language, though there are some differences.

Here's how to create a constraint that defines a 10 points horizontal distance between two views:
```swift
let horizontalDistanceConstraint = view1 |- 10 -| view2
```

Dixi operators create LayoutConstraint objects that can be transformed into NSLayoutConstraint objects or added directly to views:
```swift
superview.addConstraint(horizontalDistanceConstraint)
```

Unlike in visual format language where you can define multiple constraints with a single string, with Dixi you can only create constraints one at a time. Writing this is not valid and the compiler will complain:
```swift
let constraints = view1 |- 10 -| view2 |- 15 -| view3
```

By default Dixi operators construct constraints on the horizontal axis (widths, leading & trailing spacing). You can construct constraints on the vertical axis (heights, top & bottom spacing) by prefixing any LayoutConstraint with the vertical axis operator:
```swift
let heightGreaterThanConstraint = ^(view1 >= 50)
```

You can also use the horizontal axis operator if you want to make things explicit:
```swift
let explicitAxisConstraint = >(view1 >= 50)
```

Check out the Demo playground for more examples of Dixi in action.

## License
Dixi is licensed under MIT license.
