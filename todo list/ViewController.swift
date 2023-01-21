//
//  ViewController.swift
//  todo list
//
//  Created by kaito on 2022/12/25.
//

import UIKit

class TableViewController: UITableViewController{
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        //ショートカット追加
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ショートカットを追加", style: .done, target: self, action: #selector(self.didTapAddItemButton(_:)))
        //予定を追加
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "予定を追加", style: .done, target: self, action: #selector(add_event(_:)))
        
        //予定を読み込む
        todo_list = UserDefaults.standard.object(forKey: "todo_list_key") as! [String]
        
        //ショートカットを読み込む
        segment.removeAllSegments()
        for (index, name) in segmentNames.enumerated() {
            segment.insertSegment(withTitle: name, at: index, animated: false)
        }
    }
    
    @IBAction func selectedSegment(_ sender: Any) {
        tableView.reloadData()
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
        
        //        let accessory = UITableViewCell.AccessoryType = todo_check[indexPath.row] ? .checkmark: .none
        //        TodoCell.accessoryType = accessory
        
        //更新
        let newIndex = todo_list.count
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
        
        return TodoCell
    }
    
    //予定を追加
    
    @IBAction func Additional_menu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //セルの消去
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        todo_list.remove(at: indexPath.row)
        UserDefaults.standard.set(todo_list, forKey: "todo_list_key")
        tableView.deleteRows(at: [indexPath], with: .top)
    }
    
    //ショートカットの追加
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem){
        let alert = UIAlertController(title: "追加する項目", message: "ショートカットに新しい内容を追加します。", preferredStyle: .alert)
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
                    self.addNewTodoItem1(title: title)
                    self.tableView.reloadData()
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: [IndexPath(row: self.todo_list.count-1, section: 0)], with: .top)
                    self.tableView.endUpdates()
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //追加されたら更新
    func addNewTodoItem1(title: String){
        segmentNames.append(title)
    }
    
    
    //予定を追加
    @objc func add_event(_ sender: UIBarButtonItem){
        let alert = UIAlertController(title: "追加する項目", message: "予定に新しい内容を追加します。", preferredStyle: .alert)
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
                    self.addNewTodoItem2(title: title)
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //追加されたら更新
    func addNewTodoItem2(title: String){
        todo_list.append(title)
        UserDefaults.standard.set(todo_list, forKey: "todo_list_key")
    }
}
