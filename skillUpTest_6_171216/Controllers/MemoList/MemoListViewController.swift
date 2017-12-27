//
//  MemoListViewController.swift
//  skillUpTest1216fin
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController {
    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var memoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        memoListTableView.isEditing = !memoListTableView.isEditing
        if(memoListTableView.isEditing){
            leftBarButtonItem.title = "すべて削除"
        }else{
            leftBarButtonItem.title = "メモ追加"
        }
    }
    @IBAction func tappedLeftBarButtonItem(_ sender: UIBarButtonItem) {
    }
    
}
