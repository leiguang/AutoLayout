//
//  DynamicStackViewViewController.swift
//  AutoLayout
//
//  Created by 雷广 on 2018/5/1.
//  Copyright © 2018年 leiguang. All rights reserved.
//

/**
 
 [Auto Layout Guide] -> [Auto Layout Cookbook] -> [Stack Views] -> [Dynamic Stack View]
 
 Discussion
 
 As this recipe demonstrates, views can be added or removed from stack views during runtime. The stack’s layout automatically adjusts to compensate for changes to its array of arranged views. There are, however, a couple of important points worth remembering:
 
 1. Hidden views are still inside stack’s array of arranged views. However, they are not displayed and do not affect the layout of the other arranged views.
 
 2. Adding a view to the stack’s array of arranged views automatically adds it to the view hierarchy.
 
 3. Removing a view from the stack’s array of arranged views does not automatically remove it from the view hierarchy; however, removing the view from the view hierarchy does removes it from the arranged views array.
 
 4. In iOS, the view’s hidden property is normally not animatable. However, this property becomes animatable for views as soon as they are placed in a stack’s arranged views array. The actual animation is managed by the stack, not the view. Use the hidden property to animate adding views to or removing them from the stack.
 
 
 This recipe also introduces the idea of using Auto Layout with scroll views. Here, the constraints between the stack and the scroll view set the size of the scroll view’s content area. An equal width constraint explicitly sets the stack (and thus the content size) to fill the scroll view horizontally. Vertically, the content size is based on the stack’s fitting size. The stack view grows longer as the user adds more entries. Scrolling is automatically enabled as soon as there is too much content to fit on the screen.
 
 */

import UIKit

class DynamicStackViewViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup scrollview
        let insets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }

    // MARK: - Action Methods
    @IBAction func addEntry(_ sender: Any) {
        let index = stackView.arrangedSubviews.count - 1
        let addView = stackView.arrangedSubviews[index]
        
        let offset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + addView.frame.height)
        
        let newView = createEntry()
        newView.isHidden = true
        stackView.insertArrangedSubview(newView, at: index)
        
        UIView.animate(withDuration: 0.25) {
            newView.isHidden = false
            self.scrollView.contentOffset = offset
        }
    }
    
    @objc func deleteStackView(sender: UIButton) {
        guard let entryView = sender.superview else { return }
        UIView.animate(withDuration: 0.25, animations: {
            entryView.isHidden = true
        }) { (_) in
            entryView.removeFromSuperview()
        }
    }
    

    // MARK: - Private Methods
    private func createEntry() -> UIView {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        let number = "\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())"
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteStackView), for: .touchUpInside)
        
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
    
    private func randomHexQuad() -> String {
        return NSString(format: "%X%X%X%X",
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16
            ) as String
    }
    
    private func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1)
    }
}
