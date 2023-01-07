//
//  ViewController.swift
//  todo list
//
//  Created by kaito on 2022/12/25.
//

import UIKit

class TableViewController: UITableViewController{
    override func viewDidLoad() {
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.didTapAddItemButton(_:)))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        //予定を読み込む
        todo_list = UserDefaults.standard.object(forKey: "todo_list_key") as! [String]
        
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo_list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        TodoCell.textLabel!.text = todo_list[indexPath.row]
        return TodoCell
    }
    
    //予定を追加
    @IBAction func add_a_plan_button(_ sender: Any) {
        let alert = UIAlertController(title: "追加する項目", message: "ToDoリストに新しい内容を追加します。", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in
            if let title = alert.textFields?[0].text
            {
                if title == ""{
                    let al = UIAlertController(title: "エラー", message: "テキストを入力してください", preferredStyle: .alert)
                    al.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(al, animated: true, completion: nil)
                }else{
                    self.addNewTodoItem(title: title)
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //追加されたら更新
    func addNewTodoItem(title: String){
        let newIndex = todo_list.count
        todo_list.append(title)
        UserDefaults.standard.set(todo_list, forKey: "todo_list_key")
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
    
    //セルの消去
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        todo_list.remove(at: indexPath.row)
        UserDefaults.standard.set(todo_list, forKey: "todo_list_key")
        tableView.deleteRows(at: [indexPath], with: .top)
    }
}
