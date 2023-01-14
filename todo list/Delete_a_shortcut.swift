//
//  Delete_a_shortcut.swift
//  todo list
//
//  Created by kaito on 2023/01/14.
//

import UIKit

class Delete_a_shortcut: UIViewController,UITableViewDataSource,UITableViewDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let segmentCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        segmentCell.textLabel!.text = segmentNames[indexPath.row]
        
        return segmentCell
    }

}
