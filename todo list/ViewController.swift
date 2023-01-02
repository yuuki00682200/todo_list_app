//
//  ViewController.swift
//  todo list
//
//  Created by kaito on 2022/12/25.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        //todo_text_keyを読み込む
        if UserDefaults.standard.object(forKey: "todo_text_key") != nil {
            todo_list = UserDefaults.standard.object(forKey: "todo_text_key") as! [String]
            i_have_no_plans.text = ""
        }
        else{
            i_have_no_plans.text = "予定を追加しましょう"
        }
        
        //short_cut_keyを読み込む
        if UserDefaults.standard.object(forKey: "short_cut_key") != nil {
            shourt_cut_list = UserDefaults.standard.object(forKey: "short_cut_key") as! [String]
            shourt_cut_list.remove(at: 0)
        }
        else{
            shourt_cut_list.append("追加されていませんr")
            print(shourt_cut_list)
        }
    }
    @IBOutlet weak var i_have_no_plans: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shortcut_label: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo_list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = todo_list[indexPath.row]

        return cell
    }
    //ショートカットリストを変える
    var list_count = shourt_cut_list.count
    var count = 0
    var count2 = 1
    
    //右のボタン
    @IBAction func shortcut_right(_ sender: Any) {
        if list_count == 0{
            shortcut_label.text = shourt_cut_list[0]
        }
        else if list_count == count2{
            count = 0
            count2 = 1
            print("ok")
            shortcut_label.text = shourt_cut_list[count]
        }
        else{
            count += 1
            count2 += 1
            shortcut_label.text = shourt_cut_list[count]
        }
    }
    
    //左のボタン
    @IBAction func shortcut_left(_ sender: Any) {
        if list_count == 0{
            shortcut_label.text = shourt_cut_list[0]
        }
        else if count == 0 && count2 == 1{
            count = list_count - 1
            count2 = list_count
            shortcut_label.text = shourt_cut_list[count]
        }
        else{
            count -= 1
            count2 -= 1
            shortcut_label.text = shourt_cut_list[count]
        }
    }
    
}
