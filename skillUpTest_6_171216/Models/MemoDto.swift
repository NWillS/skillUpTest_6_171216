//
//  MemoDto.swift
//  skillUpTest1216fin
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import Foundation
import RealmSwift

final class MemoDto: Object {
    
    @objc dynamic var memoId = 0
    @objc dynamic var memoText = ""
    @objc dynamic var updateDate = Date()
    
    override static func primaryKey() -> String? {
        return "memoId"
    }
}
