//
//  UIFont+.swift
//  SamsungHealth-iOS
//
//  Created by 이경민 on 2022/05/14.
//

import UIKit

extension UIFont {
    public enum NotoSansType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
    }
    
    static func NotoSans(_ type: NotoSansType, size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSans-\(type.rawValue)", size: size)!
    }
}

extension UIFont {

  class var SshFontH1: UIFont {
    return UIFont(name: "NotoSans-Bold", size: 24.0)!
  }

  class var SshFontH2: UIFont {
    return UIFont(name: "NotoSans-Bold", size: 21.0)!
  }

  class var SshFontB1: UIFont {
    return UIFont(name: "NotoSans-Medium", size: 18.0)!
  }

  class var SshFontH3: UIFont {
    return UIFont(name: "NotoSans-Medium", size: 15.0)!
  }

  class var SshFontB2: UIFont {
    return UIFont(name: "NotoSans-Medium", size: 14.0)!
  }

  class var SshFontB3: UIFont {
    return UIFont(name: "NotoSans-Medium", size: 13.0)!
  }

  class var SshFontC2: UIFont {
    return UIFont(name: "NotoSans-Medium", size: 12.0)!
  }

  class var SshFontC1: UIFont {
    return UIFont(name: "NotoSans-Regular", size: 11.0)!
  }
}
