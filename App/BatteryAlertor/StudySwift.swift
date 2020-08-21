//
//  StudySwift.swift
//  BatteryAlertor
//
//  Created by Chil on 16/4/20.
//  Copyright © 2020 Chil. All rights reserved.
//
class BatteryLearning {
    init() {
        self.data()
    }
    
    func data() {
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
        for cur in 1...6 {
            print(cur)
        }
        let arr:Array = ["Coco", "Alex"]
        for val in arr {
            print(val)
        }
        for val in stride(from: 0, through: 12, by: 4) {
            print(val)
        }
    }
}
