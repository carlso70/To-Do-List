//
//  FirstViewController.swift
//  To Do List
//
//  Created by Jimmy Carlson on 10/21/15.
//  Copyright © 2015 Jimmy Carlson. All rights reserved.
//

import UIKit

var toDoList = [String]() //other controllers can reference this

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var toDoListTable: UITableView!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDoList.count

    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //this is the code to swipe left and delete an item from the table, but this is also the code to edit the item
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil) { //if this standard user default exists then run through the method, does check because if there wasnt it would be loading nil array
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        
        }
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

