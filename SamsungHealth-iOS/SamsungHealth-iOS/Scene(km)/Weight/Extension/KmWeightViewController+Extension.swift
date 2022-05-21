//
//  KmWeightViewController+Extension.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/21.
//

import UIKit

extension KmWeightViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc override func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            self.view.window?.frame.origin.y = (keyboardHeight * -1)
        }
    }
    
    @objc override func keyboardWillHide(notification: NSNotification) {
        if self.view.window?.frame.origin.y != 0 {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                self.view.window?.frame.origin.y = 0
            }
        }
    }
}
