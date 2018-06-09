//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Maha AlDwehy on 23/09/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//
import UIKit
import RealmSwift


class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    var categories : Results<Category>?
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }
    //Mark: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
       
        cell.textLabel?.text = categories?[indexPath.row].name ?? "NO Categories Added Yet"
        
 
        return cell
        
    }
    //Mark: - Data Manipulation Methods
   
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error here category \(error)")
        }
        
      tableView.reloadData()
    }

    
    func loadCategories() {
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
        
    }
   
     //Mark: - add New Categories


    @IBAction func addButtonpressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
       
            let newCategory = Category()
            newCategory.name = textField.text!
            self.save(category: newCategory)
            
            
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
            destinaionVC.selectedCategory = categories?[indexPath.row]
        }
    }
}
