//
//  EntryViewController.swift
//  ToDoListApp_Swift
//
//  Created by Cumulations Technologies Private Limited on 11/07/22.
//

import UIKit

class EntryViewController: UIViewController {

    var update :(() -> Void)?
    
    @IBOutlet var field : UITextField!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        field.delegate = self
    }
   
    @IBAction func saveTask(){
        
        //check if any tasks are available
        guard let text = field.text, !text.isEmpty else{
            return
        }
        
        //save task if user adds task
        guard var count = UserDefaults().value(forKey: "Count") as? Int else{
            return
        }
        //if any tasks are added it's incremented by 1
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "Count")
        
        //save new task
        UserDefaults().set(text, forKey: "Task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
        
    }


}

extension EntryViewController: UITextFieldDelegate{
    
    //this method is called to save whater typed in the textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
}
