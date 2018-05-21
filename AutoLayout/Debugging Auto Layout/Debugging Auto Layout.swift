//
//  Debugging Auto Layout.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/1.
//  Copyright © 2018年 leiguang. All rights reserved.
//

// [Auto Layout Guide] -> [Debugging Auto Layout]


// MARK: - [Types of Errors]

/**
 
 Errors in Auto Layout can be divided into three main categories:
 
 1. Unsatisfiable Layouts. Your layout has no valid solution. For more information, see Unsatisfiable Layouts.
 2. Ambiguous Layouts. Your layout has two or more possible solutions. For more information, see Ambiguous Layouts.
 3. Logical Errors. There is a bug in your layout logic. For more information, see Logical Errors.
 
 */


// Swift 可使用 “expr -l objc++ -o -- [[UIWindow keyWindow] _autolayoutTrace]” 来在控制台debug。
// > [Auto Layout Debugging In Swift](https://medium.com/ios-os-x-development/auto-layout-debugging-in-swift-93bcd21a4abf)


// MARK: - [Unsatisfiable Layouts]

/**
 
 NOTE
 // Interface Builder 虽然会提示出不满足、模糊的约束，但它是根据当前界面元素的尺寸来监测的，无法找出运行时可能导致的约束错误.
 Although the instant feedback provided by Interface Builder makes it much easier to create valid layouts, it cannot find all possible layout errors.
 
 For example, Interface Builder detects conflicts only at the canvas’s current size; however, some conflicts occur only when the root view is stretched or shrunk beyond a certain point (or when the content expands or shrinks beyond a certain point). Interface Builder cannot detect these errors.
 
 // 一旦发现有不满足的约束错误时，总应该修复它们，即使界面看起来运行正常。
 It is often tempting to ignore errors when they don’t have an obvious effect—after all, they don’t change the app’s behavior. However, any change to the view hierarchy or SDK could also alter the set of broken constraints, suddenly producing an obviously broken layout.
 Therefore, always fix unsatisfiable constraint errors when you detect them. To help ensure that you catch nonobvious errors during testing, set a symbolic breakpoint for UIViewAlertForUnsatisfiableConstraints.
 

 // 用代码布局时，经常发生由于属性“translatesAutoresizingMaskIntoConstraints”未设置为false导致的不满足约束。
 Unsatisfiable constraints often occur when programmatically adding views to the view hierarchy.
 By default, new views have their translatesAutoresizingMaskIntoConstraints property set to YES. Interface Builder automatically sets this property to NO when you begin drawing constraints to a view in the canvas. However, when you’re programmatically creating and laying out your views, you need to set the property to NO before adding your own, custom constraints.
 
 */


// MARK: - [Ambiguous Layouts]

/**
 
 When an ambiguous layout occurs at runtime, Auto Layout chooses one of the possible solutions to use. This means the layout may or may not appear as you expect. Furthermore, there are no warnings written to the console, and there is no way to set a breakpoint for ambiguous layouts.
 As a result, ambiguous layouts are often harder to detect and identify than unsatisfiable layouts. Even if the ambiguity does have an obvious, visible effect, it can be hard to determine whether the error is due to ambiguity or to an error in your layout logic.

 
 
 // 几个帮助识别、找出模糊约束的方法:
 Fortunately, there are a few methods you can call to help identify ambiguous layouts. All of these methods should be used only for debugging. Set a breakpoint somewhere where you can access the view hierarchy, and then call one of the following methods from the console:
 
 1. hasAmbiguousLayout. Available for both iOS and OS X. Call this method on a misplaced view. It returns YES if the view’s frame is ambiguous. Otherwise, it returns NO.
 2. exerciseAmbiguityInLayout. Available for both iOS and OS X. Call this method on a view with ambiguous layout. This will toggle the system between the possible valid solutions.
 3. constraintsAffectingLayoutForAxis:. Available for iOS. Call this method on a view. It returns an array of all the constraints affecting that view along the specified axis.
 4. constraintsAffectingLayoutForOrientation:. Available for OS X. Call this method on a view. It returns an array of all the constraints affecting that view along the specified orientation.
 5. _autolayoutTrace. Available as a private method in iOS. Call this method on a view. It returns a string with diagnostic information about the entire view hierarchy containing that view. Ambiguous views are labeled, and so are views that have translatesAutoresizingMaskIntoConstraints set to YES.
 
 You may need to use Objective-C syntax when running these commands in the console. For example, after the breakpoint halts execution, type call [self.myView exerciseAmbiguityInLayout]into the console window to call the exerciseAmbiguityInLayout method on the myView object. Similarly, type po [self.myView autolayoutTrace] to print out diagnostic information about the view hierarchy containing myView.
 
    // 注意：在运行上面列出的诊断方法之前，务必解决Interface Builder发现的任何问题。 Interface Builder尝试修复它找到的任何错误。 这意味着如果它发现一个不明确的布局，它会添加约束，以便布局不再含糊不清。否则导致的结果是，hasAmbiguousLayout返回NO。 exerciseAmbiguityInLayout似乎没有任何效果，而constraintsAffectingLayoutForAxis：可能会返回额外的意外约束。
    NOTE:
     Be sure to fix any issues found by Interface Builder before running the diagnostic methods listed above. Interface Builder attempts to repair any errors it finds. This means that if it finds an ambiguous layout, it adds constraints so that the layout is no longer ambiguous.
     As a result, hasAmbiguousLayout returns NO. exerciseAmbiguityInLayout does not appear to have any effect, and constraintsAffectingLayoutForAxis: may return additional, unexpected constraints.
 
 */



// MARK: - [Debugging Tricks and Tips]

/**
 
 // Understanding the Logs
 For example, consider the log message:
 <NSAutoresizingMaskLayoutConstraint:0x7ff28252e480 h=--& v=--& H:[UIView:0x7ff282617cc0(50)]>"
 This message consists of the following parts:
 NSAutoresizingMaskLayoutConstraint:0x7ff28252e480: The constraint’s class and address. In this example, the class tells you that it is based on the view’s autoresizing mask.
 h=--& v=-—&: The view’s autoresizing mask. This is the default mask. Horizontally it has a fixed left margin, a fixed width, and a flexible right margin. Vertically it has a fixed top margin, a fixed height, and a flexible bottom margin. In other words, the view’s top left corner and size remain constant when the superview’s size changes.
 H:[UIView:0x7ff282617cc0(50)]: The visual format language description of the constraint. In this example, it defines a single view with a constant width of 50 points. This description also contains the class and address of any views affected by the constraint.
 

 
 // Adding Identifiers to the Logs
 If the view has an obvious textual component, Xcode uses that as an identifier. For example, Xcode uses a label’s text, a button’s title, or a text field’s placeholder to identify these views. Otherwise, set the view’s Xcode specific label in the Identity inspector. Interface Builder uses these identifiers throughout its interface. Many of them are also displayed in the console logs.
 For the constraints, set their identifier property, either programmatically or using the Attribute inspector. Auto Layout then uses these identifiers when it prints information to the console.
 
 
 
 
 // Visualizing Views and Constraints
 Xcode provides tools that help you visualize the views and the constraints in your view hierarchy.
 To see the views in the simulator:
 Run the app in the simulator.
 Switch back to Xcode.
 click the Debug View Hierarchy button in Xcode debug bar.
 (Xcode then displays an interactive view debugger, giving you a number of tools for exploring and interacting with the view hierarchy. When debugging Auto Layout issues, the “Show clipped content” and “Show constraints” options are particularly useful.)
 
 
 
 
 
 // Understanding Edge Cases
 Here are a few edge cases that can cause Auto Layout to behave in unexpected ways:
 
 1. Auto Layout positions views based on their alignment rectangles, not their frame. Most of the time, these values are identical. However, some views may set a custom alignment rectangle to exclude parts of the view (for example, badges) from the layout calculations.
    For more information, see Aligning Views with Auto Layout in UIView Class Reference.
 
 // “transform”属性不影响布局计算。
 2. In iOS, you can use a view’s transform property to resize, rotate, or move the view; however, these transformations do not affect Auto Layout’s calculations in any way. Auto layout calculates a view’s alignment rectangle based on its untransformed frame.
 3. A view can display content outside its bounds. Most of the time, views behave properly and limit their content to their bounds. For performance reasons, however, this is not enforced by the graphics engine. This means that views (and especially views with custom drawing) may be drawn at a different size than their frames.
 4. You can identify these bugs by setting the view’s clipsToBounds property to YES or by verifying the size of the view’s frame.
 
 // 仅当所有视图都显示在其内容高度时，这些"baseline"属性才有效。
 5. The NSLayoutAttributeBaseline, NSLayoutAttributeFirstBaseline, and NSLayoutAttributeLastBaseline attributes correctly align the text only when all the views are displayed at their intrinsic content height. If one of the views is stretched or shrunk vertically, its text may appear in the wrong position.
 
 // 约束优先级在整个视图层次结构中充当全局属性。 您通常可以通过a stack view，a layout guide或a dummy view来对视图进行分组来简化布局; 然而，这种方法并没有包含所包含的观点的优先事项。 自动布局继续比较组内的优先级和组外的优先级（甚至是其他组内的优先级）。
 6. Constraint priorities act as global properties across the entire view hierarchy. You can often simplify your layout by grouping views inside a stack view, a layout guide, or a dummy view; however, this approach does not encapsulate the contained views’ priorities. Auto Layout continues to compare priorities inside the group with priorities outside the group (or even priorities inside other groups).
 
 7. Aspect ratio constraints allow horizontal and vertical constraints to interact. Normally, the horizontal and vertical layouts are calculated separately. However, if you constrain a view’s height relative to its width, you’ve created a connection between the vertical and horizontal constraints: They can now affect and conflict with each other. These interactions greatly increase the complexity of your layout and can lead to unexpected conflicts between unrelated parts of your layout.
 */
