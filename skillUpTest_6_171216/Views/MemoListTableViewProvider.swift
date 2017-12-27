//
//  MemoListTableViewProvider.swift
//  skillUpTest_6_171216
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import UIKit
import STV_Extensions

class MemoListTableViewProvider: UITableView,UITableViewDataSource {
    var memoList:[MemoDto] = MemoDao.getAllMemos()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell")as! MemoListTableViewCell
        cell.memoTitle.text = memoList[indexPath.row].getTitle()
        cell.memoText.text = memoList[indexPath.row].getText()
        cell.updateDate.text = memoList[indexPath.row].updateDate.dateStyle()
        return cell
    }
    
    

}
