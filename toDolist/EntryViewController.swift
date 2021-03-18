//
//  EntryViewController.swift
//  toDolist
//
//  Created by 홍진영 on 2021/03/17.
//
import RealmSwift
import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var completionHnadler:(() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
        textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func didTapSaveButton(){
        
    }

}
