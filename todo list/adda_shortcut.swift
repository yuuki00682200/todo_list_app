//
//  adda_shortcut.swift
//  todo list
//
//  Created by kaito on 2022/12/31.
//

import UIKit

class adda_shortcut: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //ショートカットの名前
    @IBOutlet weak var shortcut_name: UITextField!
    
    //追加ボタン
    @IBAction func shortcut_add(_ sender: Any) {
        let add_shortcut_name = shortcut_name.text!
        
        if var Short_cut_list = UserDefaults.standard.array(forKey: "short_cut_key") as? [String] {
            Short_cut_list.append(add_shortcut_name)
            UserDefaults.standard.set(add_shortcut_name, forKey: "short_cut_key")
        }
        else{
            UserDefaults.standard.set([add_shortcut_name], forKey: "short_cut_key")
        }
    }
}
