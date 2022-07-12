//
//  TaskViewController.swift
//  ToDoListApp_Swift
//
//  Created by Cumulations Technologies Private Limited on 11/07/22.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var task : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = task
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        
        
        
    }
    

}
