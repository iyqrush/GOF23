//
//  SimpleFactory.swift
//  Chapter08
//
//  Created by zhengzhilin on 2020/8/13.
//  Copyright © 2020 IGG. All rights reserved.
//

import Foundation

//简单工厂模式
class SimpleFactory: NSObject {
    class func createLeiFeng(type: String) -> LeiFeng {
        switch type {
        case "大学生":
            return Undergraduate()
        case "志愿者":
            return Volunteer()
        default:
            break
        }
        return LeiFeng()
    }
}

