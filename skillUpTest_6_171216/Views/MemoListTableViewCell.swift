//
//  MemoListTableViewCell.swift
//  skillUpTest_6_171216
//
//  Created by S N on 2017/12/27.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MemoListTableViewCell: UITableViewCell {
    @IBOutlet weak var memoTitle: UILabel!
    @IBOutlet weak var updateDate: UILabel!
    @IBOutlet weak var memoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
