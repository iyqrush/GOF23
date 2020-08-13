//
//  main.swift
//  Chapter08
//
//  Created by zhengzhilin on 2020/8/13.
//  Copyright © 2020 IGG. All rights reserved.
//

import Foundation

print("Hello, World!")

//简单工厂模式
//客户端代码
let studentA = SimpleFactory.createLeiFeng(type: "大学生")
print("studentA:")
studentA.sweep()
studentA.buyRice()

let studentB = SimpleFactory.createLeiFeng(type: "大学生")
print("studentB:")
studentB.sweep()
studentB.buyRice()

let volunteer = SimpleFactory.createLeiFeng(type: "志愿者")
print("volunteer:")
volunteer.wash()



//工厂模式

let factory = UndergraduateFactory()
let studentC = factory.createLeiFeng()
print("studentC:")
studentC.sweep()
studentC.buyRice()

let studentD = factory.createLeiFeng()
print("studentD:")
studentD.sweep()
studentD.buyRice()

let volunteerFactory = VolunteerFactory()
let volunteerA = volunteerFactory.createLeiFeng()
print("volunteerA:")
volunteerA.wash()




