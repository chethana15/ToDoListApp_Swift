//
//  ViewController.swift
//  ToDoListApp_Swift
//
//  Created by Cumulations Technologies Private Limited on 11/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "To Do List"
        
        //setup
        if !UserDefaults().bool(forKey: "SetUp"){
            UserDefaults().set(true, forKey: "SetUp")
            UserDefaults().set(0, forKey: "Count")
            
        }
        updateTask()
    }

    func updateTask(){
        
        arrayData.removeAll()
        
        guard let count = UserDefaults().value(forKey: "Count") as? Int else{
            return
        }
        
        for c in 0..<count{
            if let task = UserDefaults().value(forKey: "Task_\(c+1)") as? String{
                arrayData.append(task)
            }
        }
        tableView.reloadData()
        
    }
    
    @IBAction func addTapBarButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "Add Task"
        vc.update = {
            DispatchQueue.main.async{
                self.updateTask()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "View Task"
        vc.task = arrayData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
}

