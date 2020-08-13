//
//  main.swift
//  Chapter02
//
//  Created by zhengzhilin on 2020/8/12.
//  Copyright © 2020 IGG. All rights reserved.
//

import Foundation

print("请输入商品单价")
let price = readLine()
print("请输入商品数量")
let num = readLine()
print("请输入优惠信息（正常收费/打8折/打7折/满500-200)")
let discount = readLine()
let cashDiscount = CashDiscountFactory.createCashDiscount(discount: discount!)
print("总价为\(cashDiscount.finalPrice(originalPrice: Int(price!)! * Int(num!)!))")

let context = CashContext(discount: discount!)
print("总价为\(context.finalPrice(totalPrice: Int(price!)! * Int(num!)!))")


//策略模式和工厂模式结合
class CashContext: NSObject {
    let discount: CashDiscount
    init(discount: String) {
        self.discount = CashDiscountFactory.createCashDiscount(discount: discount)
    }
    
    func finalPrice(totalPrice: Int) -> Float {
        return discount.finalPrice(originalPrice: totalPrice)
    }
}


//总结起来优惠分为三类，一种是正常模式，一种是打折，一种是满减

class CashDiscountFactory: NSObject {
    class func createCashDiscount(discount: String) -> CashDiscount {
        switch discount {
        case "正常收费":
            return CashNormal()
        case "打8折":
            return CashRebate(rebate: 0.8)
        case "打7折":
            return CashRebate(rebate: 0.7)
        case "满500-200":
            return CashReturn(condation: 500, moneyReturn: 200)
        default:
            break
        }
        return CashDiscount()
    }
}

class CashDiscount: NSObject {

    func finalPrice(originalPrice: Int) -> Float {
        return Float(originalPrice)
    }
}

//正常收费
class CashNormal: CashDiscount {
    override func finalPrice(originalPrice: Int) -> Float {
        return Float(originalPrice)
    }
}

//满减
class CashRebate: CashDiscount {
    let rebate: Float
    init( rebate: Float) {
        self.rebate = rebate
    }
    
    override func finalPrice(originalPrice: Int) -> Float {
        return Float(originalPrice) * rebate
    }
}

//打折
class CashReturn: CashDiscount {
    let moneyCondation: Int
    let moneyReturn: Int
    init(condation: Int, moneyReturn: Int) {
        self.moneyCondation = condation
        self.moneyReturn = moneyReturn
    }
    
    override func finalPrice(originalPrice: Int) -> Float {
        if originalPrice >= moneyCondation {
            return Float(originalPrice - (moneyCondation - moneyReturn))
        }
        return Float(originalPrice)
    }
}
