//
//  MemoDao.swift
//  skillUpTest1216fin
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import Foundation

class MemoDao{
    static let daoHelper = RealmDaoHelper<MemoDto>()
    
//    メモの追加
    func addMemo(memo:MemoDto) {
//        空文字の場合は、保存しない。
        if (memo.memoText == ""){
            return
        }
        
        let newMemo = MemoDto()
        
        newMemo.memoId = MemoDao.daoHelper.newId()!
        newMemo.memoText = memo.memoText
        newMemo.updateDate = memo.updateDate
        
        MemoDao.daoHelper.add(object: newMemo)
    }
    
//    メモの全削除
    func deleteAllMemo(){
        MemoDao.daoHelper.deleteAll()
    }
//    メモの更新
    func updateMemo(memo:MemoDto) {
        MemoDao.daoHelper.update(object: memo)
    }
//    メモの1件削除
    func deleteMemo(memo:MemoDto){
        MemoDao.daoHelper.delete(object: memo)
    }
}
