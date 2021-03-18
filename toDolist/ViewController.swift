//
//  ViewController.swift
//  toDolist
//
//  Created by 홍진영 on 2021/03/16.
//
import RealmSwift
import UIKit
/*
     - To show list of current to do list items
     - To enter new to do list items
     - to show previously entered to do list item
     
     - Item
     - Date
     */

class ToDoListItem:Object{
    
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet var table:UITableView!
    
    private var data = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        
    }
    
    //Mark: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = data[indexPath.row].item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Open the screen where we can see item info and delete
        
    }
    
    
    @IBAction func didTAbAddButton(){
        
        
        
    }
}
