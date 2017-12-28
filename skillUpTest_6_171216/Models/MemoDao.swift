//
//  MemoDao.swift
//  skillUpTest1216fin
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import Foundation

final class MemoDao{
    static let daoHelper = RealmDaoHelper<MemoDto>()
    
//    メモの追加
    static func addMemo(memo:MemoDto) {
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
    static func deleteAllMemos(){
        MemoDao.daoHelper.deleteAll()
    }
//    メモの更新
    static func updateMemo(memo:MemoDto) {
        MemoDao.daoHelper.update(object: memo)
    }
//    メモの1件削除(memoID使用)
    static func deleteMemo(memoID: Int){
        guard let memo = daoHelper.findFirst(key: memoID as AnyObject) else{
            return
        }
        MemoDao.daoHelper.delete(object: memo)
    }
//    メモの全件取得
    static func getAllMemos() -> [MemoDto] {
        let memoList = MemoDao.daoHelper.findAll().sorted(byKeyPath: "updateDate", ascending: false)
        return memoList.map { MemoDto(value: $0) }
    }
//    メモの1件取得(memoID使用)
    static func getMemo(memoID: Int) -> MemoDto? {
        guard let memo = daoHelper.findFirst(key: memoID as AnyObject) else{
            return nil
        }
        return memo
    }
}
