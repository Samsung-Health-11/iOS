//
//  KmWeightViewController+Extension.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/21.
//

import UIKit

extension KmWeightViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        buttonBackgroundViewBottomConstraint.constant = 0
        textField.resignFirstResponder()
    }
}

extension KmWeightViewController {
    @objc override func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            UIView.animate(withDuration: 1) {
                self.buttonBackgroundViewBottomConstraint.constant = keyboardHeight
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc override func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 1) {
            self.buttonBackgroundViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
