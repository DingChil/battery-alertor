//
//  SwiftGG.swift
//  BatteryAlertor
//
//  Created by Chil on 28/10/20.
//  Copyright © 2020 Chil. All rights reserved.
//
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/02_basic_operators#range-operators
//

class SwiftGG {
    init() {
         self.basic()
        // self.error()
        // self.symbol()
    }
    func basic() {
        // 可以直接用二进制、八进制和十六进制的整数类型
        let binaryInteger = 0b10001, octalInteger = 0o21, hexadecimalInteger = 0x11
        print("binaryInteger:\(binaryInteger), octalInteger:\(octalInteger), hexadecimalInteger:\(hexadecimalInteger)")
        // 十进制指数小数和十六进制浮点数
        let decimalDouble = 12.18750000, exponentDouble = 1.21875e1, hexadecimalDouble = 0xC.3p0
        print("always Double no Float:\(decimalDouble), exponentDouble:\(exponentDouble), hexadecimalDouble:\(hexadecimalDouble)")
        // 带格式的数值类字面量
        let paddedDouble = 000123.456, oneMillion = 1_000_000, justOverOneMillion = 1_000_000.000_000_1
        print("paddedDouble:\(paddedDouble), oneMillion:\(oneMillion), justOverOneMillion:\(justOverOneMillion)")
        // let 声明最好是注明类型和赋值，赋值后不能改。var 可以不写名类型，可以不赋值，赋值后可以改变内容
        typealias AudioSample = UInt16
        // 类型别名，最大最小安全数值
        let maxAmplitudeFound = AudioSample.min
        print("UInt16 min:\(maxAmplitudeFound), max:\(AudioSample.max)")
        // 元组，用下标读取具体值
        let http404Error = (404, "Not Found")
        print("tuples http404Error.0:\(http404Error.0), http404Error.1:\(http404Error.1), http404Error:\(http404Error)")
        // 可选类型，默认是 nil ，不能直接打印
        var serverResponseCode: String?
        print("optionals \(serverResponseCode as Optional)")
        serverResponseCode = "1234"
        // if 条件的可选绑定
        if let actualNumber = Int(serverResponseCode!) {
            print("\(serverResponseCode!) & \(serverResponseCode as Optional) has an integer value of \(actualNumber)")
        } else {
            print("\(serverResponseCode!) & \(serverResponseCode as Optional) could not be converted to an integer")
        }
        // 强制输出可选类型
        let forcedString:String! = serverResponseCode
        print("implicitly unwrapped optionals \(forcedString!) \(forcedString as Optional)")
        // 自定义错误提示
        func canThrowAnError() throws {
            print("error")
        }
        do {
            try canThrowAnError()
            print("done")
        } catch {
            print("catch")
        }
    }
    func error() {
        // 先决条件、断言和断言失败
        let age = -3
        precondition(age <= 0, "Index must be greater than zero.")
        if age > 0 {
            assert(age > 0, "A person's age cannot be less than zero")
        } else {
            assertionFailure("A person's age can't be less than zero.")
        }
    }
    func symbol() {
        let (x, y) = (1.0, 2)
        var z:Int?, nonnil = z ?? y
        z = 3
        print("x:\(x), y:\(-y), 'x!=nil?a!:b':\(nonnil)")
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }
    }
}
