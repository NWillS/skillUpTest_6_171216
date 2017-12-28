//
//  MemoDaoTests.swift
//  skillUpTest_6_171216Tests
//
//  Created by S N on 2017/12/28.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import XCTest
@testable import skillUpTest_6_171216

final class MemoDaoTests: XCTestCase {
    var moc = MocRealm()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moc = MocRealm()
        moc.mocRealm().deleteAll()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddMemo() {
        
        // MARK: 1.textが0文字の場合
        
        // setUp
        // テスト開始前のRealmのレコード数を確認
        XCTAssertEqual(moc.mocRealm().findAll().count, 0)
        
        let emptyString = ""
        let emptyMemoDto = MemoDto()
        emptyMemoDto.memoText = emptyString
        
        // exercise
        MemoDao.addMemo(memo: emptyMemoDto)
        
        // verify
        // レコード数が増えていないことを確認
        XCTAssertEqual(moc.mocRealm().findAll().count, 0)
        
        // MARK: 2.textが1文字以上の場合
        
        // setUp
        // テスト開始前のRealmのレコード数を確認
        XCTAssertEqual(moc.mocRealm().findAll().count, 0)
        
        let text = MocRealm.dummyTexts[0]
        let memoDto = MemoDto()
        memoDto.memoText = text
        
        // exercise
        MemoDao.addMemo(memo: memoDto)
        
        // verify
        // レコード数が増えていることを確認
        XCTAssertEqual(moc.mocRealm().findAll().count, 1)
        // 登録されているレコードのテキストを確認
        XCTAssertEqual(moc.mocRealm().findFirst(key: 1 as AnyObject)?.memoText, MocRealm.dummyTexts[0])
    }
    
    func testDeleteAllMemos() {
//        MARK: レコードの全件削除
//        setup
        let memo1 = MemoDto()
        memo1.memoText = MocRealm.dummyTexts[0]
        MemoDao.addMemo(memo: memo1)
        
        let memo2 = MemoDto()
        memo2.memoText = MocRealm.dummyTexts[1]
        MemoDao.addMemo(memo: memo2)
        
        XCTAssertEqual(moc.mocRealm().findAll().count, 2)
        
//        exercise
        MemoDao.deleteAllMemos()
        
//        verify
        XCTAssertEqual(moc.mocRealm().findAll().count, 0)
    }
    
    func testUpdateMemo(){
//        MARK: レコードの更新
//        setup
        let memo = MemoDto()
        memo.memoText = MocRealm.dummyTexts[0]
        MemoDao.addMemo(memo: memo)
        
        XCTAssertEqual(moc.mocRealm().findAll().count, 1)
        XCTAssertEqual(moc.mocRealm().findFirst(key: 1 as AnyObject)?.memoText, MocRealm.dummyTexts[0])
        
        let savedMemo = moc.mocRealm().findFirst()
        
        let updateMemo = MemoDto()
        updateMemo.memoId = (savedMemo?.memoId)!
        updateMemo.memoText = MocRealm.dummyTexts[1]
        
//        exercise
        MemoDao.updateMemo(memo: updateMemo)
        
//        verify
        XCTAssertEqual(moc.mocRealm().findAll().count, 1)
        XCTAssertEqual(moc.mocRealm().findFirst()?.memoText, MocRealm.dummyTexts[1])
    }
    func testDeleteMemo(){
//        MARK:レコードの1件削除
//        setup
        let memo = MemoDto()
        memo.memoText = MocRealm.dummyTexts[0]
        MemoDao.addMemo(memo: memo)
        
        XCTAssertEqual(moc.mocRealm().findAll().count, 1)
        
//         exercise
        MemoDao.deleteMemo(memoID: 1)
        
//         verify
        XCTAssertEqual(moc.mocRealm().findAll().count, 0)
        
    }
    
    func testGetAllMemos(){
//        MARK:updateDateの降順で、レコードを全件取得
//        setup
        XCTAssertEqual(moc.mocRealm().findAll().count, 0)
        
        let memo1 = MemoDto()
        memo1.memoText = MocRealm.dummyTexts[0]
        memo1.updateDate = Date(timeIntervalSinceNow: TimeInterval(0))//今日
        MemoDao.addMemo(memo: memo1)
        
        let memo2 = MemoDto()
        memo2.memoText = MocRealm.dummyTexts[1]
        memo2.updateDate = Date(timeIntervalSinceNow: TimeInterval(-2*60*60*24))//2日前
        MemoDao.addMemo(memo: memo2)
        
        let memo3 = MemoDto()
        memo3.memoText = MocRealm.dummyTexts[2]
        memo3.updateDate = Date(timeIntervalSinceNow: TimeInterval(-1*60*60*24))//1日前
        MemoDao.addMemo(memo: memo3)
        
//        exercise
        let results = MemoDao.getAllMemos()
        
//        verify
        XCTAssertEqual(moc.mocRealm().findAll().count, 3)
        XCTAssertEqual(results.count, 3)
        
        XCTAssertEqual(results[0].memoText, MocRealm.dummyTexts[0])
        XCTAssertEqual(results[1].memoText, MocRealm.dummyTexts[2])
        XCTAssertEqual(results[2].memoText, MocRealm.dummyTexts[1])
        
    }
    func testGetMemo(){
//        MARK:レコードの1件取得
//        setup
        let memo = MemoDto()
        memo.memoText = MocRealm.dummyTexts[0]
        MemoDao.addMemo(memo: memo)
        
        // exercise
        guard let gotMemo = MemoDao.getMemo(memoID: 1) else {
            return
        }
        
        // verify
        // 取得したレコードを確認
        XCTAssertEqual(gotMemo.memoText, memo.memoText)
        XCTAssertEqual(gotMemo.updateDate, memo.updateDate)
    }
}
