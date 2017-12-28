//
//  MemoDtoTests.swift
//  skillUpTest_6_171216Tests
//
//  Created by S N on 2017/12/28.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import XCTest
@testable import skillUpTest_6_171216

class MemoDtoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMemoDto(){
//        MARK: MemoDtoに値をセット
//        setup
        let memoId = 1
        let text = "タイトル\nテキストテキスト"
        let date = Date()
        
//        exercise
        let memo = MemoDto()
        memo.memoId = memoId
        memo.memoText = text
        memo.updateDate = date
        
//         verify
        XCTAssertEqual(memo.memoId, 1)
        XCTAssertEqual(memo.memoText, "タイトル\nテキストテキスト")
        XCTAssertEqual(memo.updateDate, date)
    }
    func testPrimaryKey() {
        
//         MARK: PrimaryKeyを設定
//         exercise
        let primaryKey = MemoDto.primaryKey()
        
//         verify
        XCTAssertNotNil(primaryKey)
        XCTAssertEqual(primaryKey, "memoId")
    }
    func testGetTitle(){
//        MARK:Textからタイトル取得
//        setup
        let memo = MemoDto()
        memo.memoText = "タイトル\nテキスト\nテキスト"
        
//        exercise
        let result = memo.getTitle()
        
//        verify
        XCTAssertEqual(result, "タイトル")
        
    }
    func testGetText(){
        //        MARK:Textからテキストを取得
        //        setup
        let memo = MemoDto()
        memo.memoText = "タイトル\nテキスト\nテキスト"
        
        //        exercise
        let result = memo.getText()
        
        //        verify
        XCTAssertEqual(result, "テキスト")
        
    }
}
