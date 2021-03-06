//
//  ViewController.swift
//  Todoey
//
//  Created by Nicholas Parrish on 11/28/18.
//  Copyright © 2018 Nicholas Parrish. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item(startingTitle: "Find Mike"), Item(startingTitle: "Buy Eggos"), Item(startingTitle: "Defeat Demogorgon")]
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "List Array") as? [Item] {
            itemArray = items
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        theCell.textLabel?.text = item.title
        
        //Ternary Operator!!!
        // value = condition ? valueIfTrue : valueIfFalse
        
        theCell.accessoryType = item.isChecked ? .checkmark : .none
        
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
        
        itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked
        tableView.reloadData()
        
    }
    
    
    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // UIAlert popup and request info
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        var textField = UITextField()  //Changing the scope of the alert text field  
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action)
            in
            //What will happen when the user clicks the add item
            
            //print("Success \(textField.text!)")
            self.itemArray.append(Item(startingTitle:  textField.text!))
            self.tableView.reloadData()
            self.defaults.set(self.itemArray, forKey: "List Array")
            //self.defaults.set
            
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

