//
//  StudySwift.swift
//  BatteryAlertor
//
//  Created by Chil on 16/4/20.
//  Copyright © 2020 Chil. All rights reserved.
//
//  https://zhuanlan.zhihu.com/p/68675071
//  https://www.cnswift.org/the-basics
//

class BatteryLearning {
    init() {
//        self.basic()
        self.word()
//        self.logic()
    }
    
    func basic() {
        var usr:String
        usr = "George"
        let num:Double, str = """
        \(usr) is a good person.
        He is working very \
        hard.
        """
        usr = "Andrew"
        num = 0.0
        print(usr, num, str)
        for val in 1...6 {
            print(val)
        }
        let arr:Array = ["Coco", "Alex"]
        for val in arr {
            print(String(format: "Name: %f", val))
        }
    }
    
    func word() {
        let str = "A rolling stone gathers no moss."
        print(str.count)
    }
    
    func logic() {
//        print(stride(from: 0, through: 12, by: 4))
//        var ref:Int = 0
//        let arr:Array = stride(from: 0, through: 12, by: 4)
//        while ref < 5 {
//            print(arr[ref])
//        }
    }
}
