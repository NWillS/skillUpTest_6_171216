//
//  MocRealm.swift
//  skillUpTest_6_171216Tests
//
//  Created by S N on 2017/12/28.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import XCTest
@testable import skillUpTest_6_171216

final class MocRealm: XCTestCase {
    
    func mocRealm() -> RealmDaoHelper<MemoDto> {
        return RealmDaoHelper<MemoDto>.init()
    }
    
    // MARK: - テスト用テキスト
    
    static let dummyTexts = ["0", "1", "2", "3", "4"]
    
}
