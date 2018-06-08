//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Maha AlDwehy on 23/09/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
 var Categories = [Category]()
    
    
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }
    //Mark: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
       
        cell.textLabel?.text = Categories[indexPath.row].name
        
 
        return cell
        
    }
    //Mark: - Data Manipulation Methods
    func loadCategories() {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
        Categories = try context.fetch(request)
        } catch {
            print("Error loading catgories\(error)")
        }
        tableView.reloadData()
        
    }
    func saveCategories() {
        
        
        do {
            
            try context.save()
        } catch {
            print("Error here\(error)")
        }
      tableView.reloadData()
    }

    
        
   
     //Mark: - add New Categories


    @IBAction func addButtonpressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
       
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
          
            
            self.Categories.append(newCategory)
            
            self.saveCategories()
            
            
        }
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new Category "
        }
     
        present(alert, animated: true, completion: nil)
        
    }

    
//Mark: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinaionVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinaionVC.selectedCategory = Categories[indexPath.row]
        }
    }
}
