//
//  LayoutAnchorsViewController.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/2.
//  Copyright © 2018年 leiguang. All rights reserved.
//

import UIKit

class LayoutAnchorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myView = UIView()
        myView.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        view.addSubview(myView)
        
        
        //  If you want to use Auto Layout to dynamically calculate the size and position of your view, you must set this property to false. By default, the property is set to true for any view you programmatically create. If you add views in Interface Builder, the system automatically sets this property to false.
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Get the superview's layout
        let margins = view.layoutMarginsGuide
        
        // Pin the top edge of myView to the margin's top edge + 20.0
        myView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20.0).isActive = true
        
        // Pin the leading edge of myView to the margin's leading edge
        myView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        myView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Give myView a 2:1 aspect ratio
        myView.widthAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 2.0).isActive = true
     
    }
    
}
