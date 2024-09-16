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
    
    var data:[Colour] = [Colour]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        data = Colour.allCases
        addToolBarItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationItem.title = "Colours"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].displayName
        return cell
    }
    
    
    
    //MARK:- PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Colour" {
            let colourViewController = segue.destination as! ColourViewController
            let selectedRow = tableView.indexPathForSelectedRow?.row
            colourViewController.colourIndex = selectedRow ?? 0
        }

    }

    //MARK:- Add toolbar items
    
    func addToolBarItems() {
        
        let segue = UIBarButtonItem(title: "Segue", style: .plain, target: self, action: Selector(("segueCall")))
        let nonSegue = UIBarButtonItem(title: "Non Segue", style: .plain, target: self, action: Selector(("nonSegueCall")))
        let seperator = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let items = [segue,seperator,nonSegue]
        
        self.setToolbarItems(items as [UIBarButtonItem], animated: true)
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    //MARK:- Segue call
    
    @objc func segueCall(){
        performSegue(withIdentifier: "Colour", sender: self)
    }
    
    //MARK:- Non Segue call
    
    @objc func nonSegueCall() {
        let childViewController = storyboard?.instantiateViewController(withIdentifier: "ColourViewController") as! ColourViewController
        let index = tableView.indexPathForSelectedRow?.row ?? 0
        childViewController.colourIndex = index
        navigationController?.pushViewController(childViewController, animated: true)
    }
}

