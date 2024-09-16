//
//  ColourViewController.swift
//  NavigationControllerDemo
//
//  Created by Ravi Shankar on 30/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class ColourViewController: UIViewController {
    
    var colourIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let colourIndex = colourIndex {
            if let colour = Colour.colour(at: colourIndex) {
                view.backgroundColor = colour.uiColor()
                navigationItem.title = colour.displayName
            } else {
                print("Invalid colour index")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        addToolBarItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Add toolbar items
    
    func addToolBarItems() {
        
        let nonSegue = UIBarButtonItem(title: "Non Segue", style: .plain, target: self, action: Selector(("nonSegueCall")))
        let items = [nonSegue]
        
        self.setToolbarItems(items as [UIBarButtonItem], animated: true)
    }
    
    func nonSegueCall() {
        navigationController?.popViewController(animated: true)
    }
}
