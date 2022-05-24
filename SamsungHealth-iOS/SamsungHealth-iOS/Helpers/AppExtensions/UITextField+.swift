//
//  UITextField+.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/21.
//

import UIKit

extension UITextField {
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor: placeholderColor, .font: font].compactMapValues { $0 })
    }
}
