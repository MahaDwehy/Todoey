//
//  ViewController.swift
//  Todoey
//
//  Created by Maha AlDwehy on 19/09/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
      
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destory Demogorgon"
        itemArray.append(newItem3)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items  = defaults.array(forKey: "TodoListArray") as? [Item] {
         itemArray = items
            
        }
    }

   //Mark - TableView Datasource Methods
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.checked ? .checkmark : .none
      
        
        return cell
        
    }
    
    //Mark - table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].checked = !itemArray[indexPath.row].checked
     
     
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
       let alert = UIAlertController(title: "Add todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            // What will happen oce user click the Add Item button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
    
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
       alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "Create new item"
        textField = alertTextField
        }
      alert.addAction(action)
        present(alert, animated: true, completion: nil)
      
    }
 
    

}

