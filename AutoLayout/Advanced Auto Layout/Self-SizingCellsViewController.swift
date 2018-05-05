//
//  Self-SizingCellsViewController.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/5.
//  Copyright © 2018年 leiguang. All rights reserved.
//

/*
 
 Working with Self-Sizing Table View Cells
 
 
 In iOS, you can use Auto Layout to define the height of a table view cell; however, the feature is not enabled by default.
 
 Normally, a cell’s height is determined by the table view delegate’s tableView:heightForRowAtIndexPath: method. To enable self-sizing table view cells, you must set the table view’s rowHeight property to UITableViewAutomaticDimension. You must also assign a value to the estimatedRowHeight property. As soon as both of these properties are set, the system uses Auto Layout to calculate the row’s actual height.
        1. tableView.estimatedRowHeight = 85.0
        2. tableView.rowHeight = UITableViewAutomaticDimension

 Next, lay out the table view cell’s content within the cell’s content view. To define the cell’s height, you need an unbroken chain of constraints and views (with defined heights) to fill the area between the content view’s top edge and its bottom edge. If your views have intrinsic content heights, the system uses those values. If not, you must add the appropriate height constraints, either to the views or to the content view itself.
 
 
 Additionally, try to make the estimated row height as accurate as possible. The system calculates items such as the scroll bar heights based on these estimates. The more accurate the estimates, the more seamless the user experience becomes.
 
 
     NOTE:
     When working with table view cells, you cannot change the layout of the predefined content (for example, the textLabel, detailTextLabel, and imageView properties).
     The following constraints are supported:
     1. Constraints that position your subview relative to the cell’s content view.
     2. Constraints that position your subview relative to the cell’s bounds.
     3. Constraints that position your subview relative to the predefined content.
 
 */


import UIKit

class Self_SizingCellsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
