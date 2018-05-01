//
//  Simple Constraints.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/1.
//  Copyright © 2018年 leiguang. All rights reserved.
//

// [Auto Layout Guide] -> [Auto Layout Cookbook] -> [Simple Constraints]

/**
 
 [Two Equal-Width Views]
 
    This recipe lays out two views, side by side. The views always have the same width, regardless of how the superview’s bounds change. Together, they fill the superview, with a fixed margin on all sides, and a standard-spaced margin between them.

 */

/**
 
 [Two Different-Width Views]
 
    This recipe is very similar to the Two Equal-Width Views recipe, with one significant difference. In this recipe, the orange view is always twice as wide as the purple view.

 */

/**

 [Two Views with Complex Widths]
 
    This recipe is almost identical to the one in Two Different-Width Views; however, here you use a pair of constraints to define a more complex behavior for the view widths. In this recipe, the system tries to make the red view twice as wide as the blue view, but the blue view has a 150-point minimum width. So, on iPhone in portrait the views are almost the same width, and in landscape both views are larger, but the red view is now twice as wide as the blue.

 */
