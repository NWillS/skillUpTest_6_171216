//
//  MemoListViewController.swift
//  skillUpTest1216fin
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController,MemoListViewProviderDelegate {
    
    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var memoListTableView: MemoListTableViewProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem
        memoListTableView.dataSource = memoListTableView
        memoListTableView.delegate = self
        memoListTableView.memoListVPDelegate = self

        


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadTableView()
        setRightButtonTitle()
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
        if(memoListTableView.isEditing){
//            すべて削除
            showActionSheet()
        }else{
//            メモ追加
            let memoEditSB = UIStoryboard(name: "MemoEdit", bundle: nil)
            let memoEditVC = memoEditSB.instantiateInitialViewController() as! MemoEditViewController
            
            memoEditVC.memoId = 0
            navigationController?.pushViewController(memoEditVC, animated: true)
        }
    }
    func showActionSheet() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "すべて削除", style: .destructive) { [weak self] (action) in
            
            guard let `self` = self else { return }
            MemoDao.deleteAllMemos()
            self.reloadTableView()
            self.setRightButtonTitle()
            self.setEditing(false, animated: true)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    func reloadTableView(){
        memoListTableView.resetMemoList(memoList: MemoDao.getAllMemos())
        memoListTableView.reloadData()
    }
    func setRightButtonTitle(){
        let count = MemoDao.getAllMemos().count
        if(count == 0){
            rightBarButtonItem.title = "メモなし"
        }else{
            rightBarButtonItem.title = "\(count)件のメモ"
        }
    }
    
    func deletedMemo() {
        setRightButtonTitle()
    }
}
// MARK: - UITableViewDelegate
extension MemoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memoId:Int = memoListTableView.getMemoId(indexPath:indexPath)
        let memoEditSB = UIStoryboard(name: "MemoEdit", bundle: nil)
        let memoEditVC = memoEditSB.instantiateInitialViewController() as! MemoEditViewController
        
        memoEditVC.memoId = memoId
        navigationController?.pushViewController(memoEditVC, animated: true)
    }
}
