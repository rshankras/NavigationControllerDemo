//
//  ColourViewController.swift
//  NavigationControllerDemo
//
//  Created by Ravi Shankar on 30/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class ColourViewController: UIViewController {
    
    var colour: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let colour = colour {
            let hex:Colours = Colours.getEnumFromSelectedValue(colour)
            view.backgroundColor = Colours.getUIColorFromHex(hex.rawValue, alpha: 1.0)
            
            navigationItem.title = hex.getDisplayName()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        addToolBarItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Add toolbar items
    
    func addToolBarItems() {
        
        let nonSegue = UIBarButtonItem(title: "Non Segue", style: .Plain, target: self, action: "nonSegueCall")
        let items = [nonSegue]
        
        self.setToolbarItems(items as [UIBarButtonItem], animated: true)
    }
    
    func nonSegueCall() {
        navigationController?.popViewControllerAnimated(true)
    }
}
