//
//  Views with Intrinsic Content Size.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/1.
//  Copyright © 2018年 leiguang. All rights reserved.
//

// [Auto Layout Guide] -> [Auto Layout Cookbook] -> [Views with Intrinsic Content Size]

/**
 
 [Simple Label and Text Field]
 
    To have the text field stretch to fill the available space, its content hugging must be lower than the label’s. By default, Interface Builder should set the label’s content hugging to 251, and the text field to 250. You can verify this in the Size inspector.
 
*/

/**
 
 [Dynamic Height Label and Text Field]
 
    This recipe dynamically sets the vertical spacing of the controls based on the tallest control at runtime. With the regular system font, this recipe appears to be identical to the Simple Label and Text Field recipe (see the screenshot). However, if you increase the label’s font size to 36.0 points, then the layout’s vertical spacing is calculated from the top of the label instead.

    NOTE:
     Be sure to set the priority of the optional constraints to a value that is lower than the default content hugging constraint (250). Otherwise, the system breaks the content hugging constraint and stretches the view instead of repositioning it.
     This can be particularly confusing when working with layouts that use baseline alignments, because the baseline alignments are only valid if the text views are displayed at their intrinsic content height. If the system resizes one of the views, the text may not line up properly, despite having a required baseline constraint.

 */

/**
 
 [Two Buttons with Equal Spacing]
 
     This recipe uses greater-than-or-equal constraints to set the minimum spacing around the buttons. Required constraints also guarantee that the buttons are always the same width, and the dummy views are also always the same width (though, they can be a different width than the buttons). The rest of the layout is largely managed by the button’s CHCR priorities. If there isn’t enough space, the dummy views collapse to a 0-point width, and the button’s divide the available space amongst themselves (with the standard spacing between them). As the available space increases, the buttons expand until they reach the larger button’s intrinsic width, then the dummy views begin to expand. The dummy views continue to expand to fill any remaining space.

 
    // 关于为了约束而使用的占位视图: 
    NOTE:
     Dummy views can add a significant cost to your layout, so you should use them judiciously. If these views are large, their graphic context can consume a considerable amount of memory, even though they don’t contain any meaningful information.
     Additionally, these views participate in the view hierarchy’s responder chain. This means they respond to messages, like hit testing, that are sent along the responder chain. If not handled carefully, these views can intercept and respond to these messages, creating hard-to-find bugs.

     Alternatively, you could use instances of the UILayoutGuide class to represent the white space. This lightweight class represents a rectangular frame that can participate in Auto Layout constraints. Layout guides do not have a graphic context, and they are not part of the view hierarchy. This makes layout guides ideal for grouping items or defining white space.
 
     Unfortunately, you cannot add layout guides to a scene in Interface Builder, and mixing programmatically created objects with a storyboard-based scene can become quite complex. As a general rule of thumb, it’s better to use storyboards and Interface Builder, than to use custom layout guides.
 */
