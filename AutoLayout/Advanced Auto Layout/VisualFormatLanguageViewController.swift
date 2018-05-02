//
//  VisualFormatLanguageViewController.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/3.
//  Copyright © 2018年 leiguang. All rights reserved.
//

/**

 The Visual Formatting Language has the following advantages and disadvantages:
 
 1. Auto Layout prints constraints to the console using the visual format language; for this reason, the debugging messages look very similar to the code used to create the constraints.
 2. The visual format language lets you create multiple constraints at once, using a very compact expression.
 3. The visual format language lets you create only valid constraints.
 // 该符号强调完整性的良好可视化。 因此，使用视觉格式语言无法创建一些约束（例如宽高比）。
 4. The notation emphasizes good visualization over completeness. Therefore some constraints (for example, aspect ratios) cannot be created using the visual format language.
 5. The compiler does not validate the strings in any way. You can discover mistakes through runtime testing only.

 */

import UIKit

class VisualFormatLanguageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myView = UIView()
        myView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        view.addSubview(myView)
        
        myView.translatesAutoresizingMaskIntoConstraints = false 
        
        let views = ["myView": myView]
        let formatString = "|-[myView]-|"
        
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: formatString, options: .alignAllTop, metrics: nil, views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
