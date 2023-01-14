//
//  Add_event.swift
//  todo list
//
//  Created by kaito on 2023/01/14.
//

import UIKit

class Add_event: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //予定を追加
    @IBAction func Add_button(_ sender: Any) {
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
        todo_list.append(title)
        UserDefaults.standard.set(todo_list, forKey: "todo_list_key")
    }
    
    //ショートカットを追加
    @IBAction func Add_shortut(_ sender: Any) {
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
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //追加されたら更新
    func addNewTodoItem1(title: String){
        segmentNames.append(title)
        UserDefaults.standard.set(segmentNames, forKey: "segmentname_key")
    }
    
}
