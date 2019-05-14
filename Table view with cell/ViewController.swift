//
//  ViewController.swift
//  Table view with cell
//
//  Created by Shalika Lahiru on 5/13/19.
//  Copyright © 2019 Shalika Lahiru. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblMenu: UITableView!
    var sender = ["A","B","C","D","E","F","G","H","I","J"]

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        // Do any additional setup after loading the view, typically from a nib.
    }


//    class func instanceFromNib() -> UIView {
//        return UINib(nibName: "ViewController", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
//    }
    
    func registerCells() {
        let nib = UINib(nibName: "MessageCell", bundle: Bundle.main)
        tblMenu.register(nib, forCellReuseIdentifier: "MessageCell")
        tblMenu.delegate=self
        tblMenu.dataSource=self
        tblMenu.separatorStyle = UITableViewCell.SeparatorStyle.none
        tblMenu.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sender.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblMenu.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let archiveBtn = UITableViewRowAction(style: .normal, title: "ARCHIVE") { (rowAction, IndexPath) in
            // remove the item from the data model
            self.sender.remove(at: indexPath.row)
            
            // delete the table view row
            self.tblMenu.deleteRows(at: [indexPath], with: .fade)
        }
        archiveBtn.backgroundColor = .blue
        
        let blockBtn = UITableViewRowAction(style: .normal, title: "BLOCK") { (rowAction, IndexPath) in
            // remove the item from the data model
            print("blocked")
        }
        blockBtn.backgroundColor = .red
        
        return [archiveBtn,blockBtn]
    }
    
}

