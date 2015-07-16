//
//  ViewController.swift
//  NavigationControllerDemo
//
//  Created by Ravi Shankar on 30/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView:UITableView!
    
    var data:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        data = Colours.getColours()
        addToolBarItems()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationItem.title = "Colours"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableViewDataSource methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
    //MARK:- PrepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Colour" {

            let colourViewController:ColourViewController = segue.destinationViewController as! ColourViewController
            let selectedRow = tableView.indexPathForSelectedRow()?.row
            colourViewController.colour = selectedRow
        }
    }
    
    //MARK:- Add toolbar items
    
    func addToolBarItems() {
        
        let segue = UIBarButtonItem(title: "Segue", style: .Plain, target: self, action: "segueCall")
        let nonSegue = UIBarButtonItem(title: "Non Segue", style: .Plain, target: self, action: "nonSegueCall")
        let seperator = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        var items = [segue,seperator,nonSegue]
        
        self.setToolbarItems(items as [AnyObject], animated: true)
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    //MARK:- Segue call
    
    func segueCall(){
        performSegueWithIdentifier("Colour", sender: self)
    }
    
    //MARK:- Non Segue call
    
    func nonSegueCall() {
        let childViewController = storyboard?.instantiateViewControllerWithIdentifier("ColourViewController") as! ColourViewController
        navigationController?.pushViewController(childViewController, animated: true)
    }
}

