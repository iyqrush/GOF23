//
//  PrototypeMode.swift
//  Chapter09
//
//  Created by zhengzhilin on 2020/8/13.
//  Copyright © 2020 IGG. All rights reserved.
//

import Cocoa

protocol ResumeProtocol {
    func clone() -> Self
}

class Resume: ResumeProtocol {
    
    let name: String
    var sex: String?
    var age: String?
    var work: WorkExperience?
    //let result = type(of: self).init(name: name) 要求把构造器改为必要构造器
    //在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器：
    required init(name: String) {
        self.name = name
        work = WorkExperience()
    }
    
    func setPersonalInfo(sex: String, age: String) {
        self.sex = sex
        self.age = age
    }
    
    func setWorkExperience(timeArea: String, company: String) {
        work?.workDate = timeArea
        work?.company = company
    }
    
    func display() {
        print("\(name) \(String(describing: sex!)) \(String(describing: age!))")
        print("工作经历：\(String(describing: work?.workDate!)) \(String(describing: work?.company!))")
    }
    
    func clone() -> Self {
        //这个原型模式应该是copywithzoon的实现方式
        let result = type(of: self).init(name: name)
        result.sex = sex
        result.age = age
        result.work = work //浅拷贝，是对象的引用
//        result.work = work?.copy() //深拷贝，是一个全新的对象
        return result
    }
    
    
}

protocol Copyable {
    func copy() -> Self
}

class WorkExperience: Copyable {
    var workDate: String?
    var company: String?
    
    required init() {
        
    }
    
    func copy() -> Self {
        let result = type(of: self).init()
        result.workDate = workDate
        result.company = company
        return result
    }
}
