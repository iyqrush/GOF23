//
//  Factory.swift
//  Chapter08
//
//  Created by zhengzhilin on 2020/8/13.
//  Copyright © 2020 IGG. All rights reserved.
//

import Cocoa

//工厂模式是在简单工厂模式的基础上做的修改，利用开放-封闭原则把原先需要在简单工厂模式中的判断代码改为通过扩展的方式来增加新类型
protocol IFactory {
    func createLeiFeng() -> LeiFeng
}

class UndergraduateFactory: IFactory {
    func createLeiFeng() -> LeiFeng {
        return Undergraduate()
    }
}

class VolunteerFactory: IFactory {
    func createLeiFeng() -> LeiFeng {
        return Volunteer()
    }
}
