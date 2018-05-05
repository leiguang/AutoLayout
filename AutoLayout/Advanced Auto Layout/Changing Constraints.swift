//
//  Changing Constraints.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/5.
//  Copyright © 2018年 leiguang. All rights reserved.
//

/**
 
 Changing Constraints
 
 A constraint change is anything that alters the underlying mathematical expression of a constraint (see Figure 17-1). You can learn more about constraint equations in Anatomy of a Constraint.
 
 All of the following actions change one or more constraints:
    1. Activating or deactivating a constraint
    2. Changing the constraint’s constant value
    3. Changing the constraint’s priority
    4. Removing a view from the view hierarchy
 Other changes, like setting a control’s property, or modifying the view hierarchy, can also change constraints. When a change occurs, the system schedules a deferred layout pass (see The Deferred Layout Pass).
 
 In general, you can make these changes at any time. Ideally, most constraints should be set up in Interface Builder, or programatically created by the view controller during the controller’s initial setup (for example, in viewDidLoad). If you need to dynamically change constraints at runtime, it’s usually best to change them when the application’s state changes. For example, if you want to change a constraint in response to a button tap, make that change directly in the button’s action method.
 
 Occasionally, you may need to batch a set of changes for performance reasons. For more information, see Batching Changes.
 

 
 The Deferred Layout Pass
 
 Instead of immediately updating the affected views’ frames, Auto Layout schedules a layout pass for the near future. This deferred pass updates the layout’s constraints and then calculates the frames for all the views in the view hierarchy.
 
 You can schedule your own deferred layout pass by calling the setNeedsLayout method or the setNeedsUpdateConstraints method.
 
 The deferred layout pass actually involves two passes through the view hierarchy:
 
 The update pass updates the constraints, as necessary
 The layout pass repositions the view’s frames, as necessary

 ...
 
 */
