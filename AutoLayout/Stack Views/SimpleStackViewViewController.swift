//
//  SimpleStackViewViewController.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/1.
//  Copyright © 2018年 leiguang. All rights reserved.
//

/**
 
 [Auto Layout Guide] -> [Auto Layout Cookbook] -> [Stack Views] -> [Simple Stack View]
 
 Discussion
 
 You must pin the stack view to the superview, but otherwise, the stack view manages the entire layout without any other explicit constraints.
 
 In this recipe, the stack view fills its superview, with a small, standard margin. The arranged views are resized to fill the stack view’s bounds. Horizontally, each view is stretched to match the stack view’s width. Vertically, the views are stretched based on their CHCR priorities. The image view should always shrink and grow to fill the available space. Therefore, its vertical content hugging and compression resistance priorities must be lower than the label and button’s default priorities.
 
 Finally, set the image view’s mode to Aspect Fit. This setting forces the image view to resize the image so that it fits within the image view’s bounds, while maintaining the image’s aspect ratio. This lets the stack view arbitrarily resize the image view without distorting the image.
 
 
 */

import UIKit

class SimpleStackViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
