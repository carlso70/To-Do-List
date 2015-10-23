//
//  SecondViewController.swift
//  To Do List
//
//  Created by Jimmy Carlson on 10/21/15.
//  Copyright © 2015 Jimmy Carlson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(itemTextField.text!)
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        itemTextField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        itemTextField.resignFirstResponder()
        return true
    }
    
}

