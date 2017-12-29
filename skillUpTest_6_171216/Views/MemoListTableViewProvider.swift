//
//  MemoListTableViewProvider.swift
//  skillUpTest_6_171216
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import UIKit
import STV_Extensions

protocol MemoListViewProviderDelegate {
    func deletedMemo()
}

class MemoListTableViewProvider: UITableView,UITableViewDataSource {
    var memoList:[MemoDto] = []
    var memoListVPDelegate:MemoListViewProviderDelegate!
    
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
    
    func resetMemoList(memoList:[MemoDto]){
        self.memoList = memoList
    }
    func getMemoId(indexPath:IndexPath) -> Int{
        return memoList[indexPath.row].memoId
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let memoId = memoList[indexPath.row].memoId
        MemoDao.deleteMemo(memoID: memoId)
        memoList.remove(at: indexPath.row)
        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)],
                             with: .fade)
        memoListVPDelegate.deletedMemo()
    }
}
