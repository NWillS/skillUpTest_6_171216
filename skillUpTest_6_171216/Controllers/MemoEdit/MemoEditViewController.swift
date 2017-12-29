//
//  MemoEditViewController.swift
//  skillUpTest_6_171216
//
//  Created by S N on 2017/12/29.
//  Copyright © 2017年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MemoEditViewController: UIViewController {
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var memoTextView: UITextView!
    var memoId:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MemoEditViewController.keyboardWillShow(_:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        
        // Do any additional setup after loading the view.
        setup(memoId: memoId)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if let userInfo = notification.userInfo{
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                let keyBoardRect = keyboard.cgRectValue
                
                self.bottom.constant = keyBoardRect.size.height;
            }
        }
    }
        
    func setup(memoId:Int){
        if (memoId != 0){
            memoTextView.text = MemoDao.getMemo(memoID: memoId)?.memoText
        }
        memoTextView.becomeFirstResponder()
    }

    @IBAction func tappedDoneButton(_ sender: Any) {
        if(memoTextView.text != ""){
            let memo = MemoDto()
            memo.memoText = memoTextView.text
            
            if (memoId == 0){
                MemoDao.addMemo(memo: memo)
            } else {
                memo.memoId = memoId
                MemoDao.updateMemo(memo: memo)
            }
            
        }
        navigationController?.popViewController(animated: true)
    }
}
