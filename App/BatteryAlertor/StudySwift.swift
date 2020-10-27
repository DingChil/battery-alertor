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
        self.basic()
        // self.word()
        self.logic()
    }
    
    func basic() {
        var usr:String, par = "321"
        usr = "George"
        let num:Double, tmp=0b10001, str = """
        \(usr) is a good person.
        He is working very \
        hard.
        """
        usr = "Andrew"
        num = 0.0
        print("Sting&Double",usr, str, num, Int(num))
        print("UInt8:\(UInt8.min)~\(UInt8.max), Int:\(Int.min)~\(Int.max), UInt:\(UInt.min)~\(UInt.max)")
        print("Transfer UInt16:\(UInt16(tmp)), UInt:\(UInt(tmp)), Double:\(Double(tmp)), Float:\(Float(tmp))")
        print("Bool:\(0o21==0x11) \(tmp==0x12)")
        typealias Content = String
        var txt:Content = "Tuple: \((404, "Not Found"))", not:Int? = 404
        if not != nil {
            print("typealias:\(txt), optional Int:\(not!)")
        }
        not = nil
        if  not == nil, let exp = Int(par) {
            print("Force expand:\(exp)")
        }
        
        for val in 1...6 {print(val)
        }
        let arr:Array = ["Coco", "Alex"]
        for tmp in arr {
            print(tmp)}
        let group = (1,"2")
        print(group)
    }
    
    func word() {
        let str = "A rolling stone gathers no moss."
        print("count \(str.count) isEmpty \(str.isEmpty) split \(str.split(separator: " "))")
        print("contains \(str.contains("stone")) \(str.contains("stomp"))")
        //        print("startIndex \(str.startIndex) index \(str.index(str.startIndex, offsetBy: 3))")
        let ran:Range = str.range(of: "no")!
        //        print("range \(str.range(of: "no")) range \(ran)")
        print("distance \(str.distance(from: str.startIndex, to: ran.lowerBound)) lowerBound \(ran.lowerBound)")
    }
    
    func logic() {
        let age = -3
        assert(age >= 0, "🌞🌚")
        func throwError() throws {
            print("try")
        }
        do {
            try throwError()
        } catch {
            print("catch")
        }
    }
}
