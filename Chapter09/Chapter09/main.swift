//
//  main.swift
//  Chapter09
//
//  Created by zhengzhilin on 2020/8/13.
//  Copyright © 2020 IGG. All rights reserved.
//

import Foundation

print("Hello, World!")

let resume = Resume(name: "大鸟")
resume.setPersonalInfo(sex: "男", age: "29")
resume.setWorkExperience(timeArea: "1998-2000", company: "xx公司")

let resume1 = resume.clone()
resume1.setWorkExperience(timeArea: "1998-2006", company: "yy企业")

let resume2 = resume.clone()
resume2.setPersonalInfo(sex: "男", age: "24")

//print("work对象地址:\(String(format: "%p", resume))")
resume.display()
//print("work对象地址:\(String(format: "%p", resume1))")
resume1.display()
//print("work对象地址:\(String(format: "%p", resume2))")
resume2.display()
print("end")
