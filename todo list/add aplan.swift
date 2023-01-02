//
//  add aplan.swift
//  todo list
//
//  Created by kaito on 2022/12/26.
//

import UIKit

class add_aplan: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //予定の追加内容
    @IBOutlet weak var add_plan_text: UITextField!
    
    //追加ボタンが押されたら
    @IBAction func add_click(_ sender: Any) {
        let add_plan_text_label = add_plan_text.text!

        if var Todo_list = UserDefaults.standard.array(forKey: "todo_text_key") as? [String] {
            Todo_list.append(add_plan_text_label)
            UserDefaults.standard.set(add_plan_text_label, forKey: "todo_text_key")
        }
        else{
            UserDefaults.standard.set([add_plan_text_label], forKey: "todo_text_key")
        }
    }
}
