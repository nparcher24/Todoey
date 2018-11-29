//
//  ViewController.swift
//  Todoey
//
//  Created by Nicholas Parrish on 11/28/18.
//  Copyright © 2018 Nicholas Parrish. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike", "Buy Eggos", "Defeat Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        theCell.textLabel?.text = itemArray[indexPath.row]
        return theCell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        let theText = cell?.textLabel?.text
        print(theText!)
        tableView.deselectRow(at: indexPath, animated: true)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
        
    }
    
    
    
}

