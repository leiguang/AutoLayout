//
//  NSLayoutConstraintViewController.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/2.
//  Copyright © 2018年 leiguang. All rights reserved.
//

/**
 除非需要支持iOS8或更早的版本，否则应当使用 layout anchor API来布局，而不是用 NSLayoutConstraint类的便利方法。
 Note:
    Unlike the approach taken by the layout anchor API, you must specify a value for each parameter, even if it doesn’t affect the layout. The end result is a considerable amount of boilerplate code, which is usually harder to read.
    Unlike the layout anchor API, the convenience method does not highlight the important features of a particular constraint. As a result, it is easier to miss important details when scanning over the code. Additionally, the compiler does not perform any static analysis of the constraint. You can freely create invalid constraints. These constraints then throw an exception at runtime. Therefore, unless you need to support iOS 8 or OS X v10.10 or earlier, consider migrating your code to the newer layout anchor API.
 */

import UIKit

class NSLayoutConstraintViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myView = UIView()
        myView.backgroundColor = #colorLiteral(red: 1, green: 0.6222836375, blue: 1, alpha: 1)
        view.addSubview(myView)
        
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 20.0).isActive = true
        
        NSLayoutConstraint(item: myView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: myView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: myView, attribute: .width, relatedBy: .equal, toItem: myView, attribute: .height, multiplier: 2.0, constant: 0.0).isActive = true
    }
    
}
