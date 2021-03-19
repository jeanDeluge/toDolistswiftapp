//
//  viewViewController.swift
//  toDolist
//
//  Created by 홍진영 on 2021/03/17.
//
import RealmSwift
import UIKit

class ViewViewController: UIViewController, UITextFieldDelegate {

    public var item: ToDoListItem?
    
    public var deletionHandler: (()->Void)?
    
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    private let realm = try! Realm()
    static let dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = item?.item
        dateLabel.text = Self.dateFormatter.string(from: item!.date)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
        // Do any additional setup after loading the view.
         
    }
    
    
    @objc private func didTapDelete(){
        
        guard let myItem = self.item else {
            return
        }
        
        realm.beginWrite()
        
        realm.delete(myItem)
        
        try! realm.commitWrite()
        
        deletionHandler?()
        navigationController?.popToRootViewController(animated: true)
    }
    
    

}
