//
//  add_controller.swift
//  todo list
//
//  Created by kaito on 2023/01/07.
//

import UIKit

class add_controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //予定を追加する
    @IBAction func add_event(_ sender: Any) {
        let alert = UIAlertController(title: "予定を追加", message: "予定の内容を入力してください",preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
    
}
