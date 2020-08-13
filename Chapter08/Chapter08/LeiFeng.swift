//
//  LeiFeng.swift
//  Chapter08
//
//  Created by zhengzhilin on 2020/8/13.
//  Copyright © 2020 IGG. All rights reserved.
//

import Cocoa

class LeiFeng: NSObject {
    func sweep() {
        print("扫地")
    }
    
    func wash() {
        print("洗衣")
    }
    
    func buyRice() {
        print("买米")
    }
}

class Undergraduate: LeiFeng {
    
}

class Volunteer: LeiFeng {
    
}
