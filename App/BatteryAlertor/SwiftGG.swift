//
//  SwiftGG.swift
//  BatteryAlertor
//
//  Created by Chil on 28/10/20.
//  Copyright © 2020 Chil. All rights reserved.
//
//

class SwiftGG {
    init() {
//        self.basic()
//        self.error()
//        self.operators()
        self.characters()
         
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
        // 先决条件、断言和断言失败，用于断点，区别在于调试用、生产用和调试一定失败用
        let age = -3
        precondition(age <= 0, "Index must be less than or equal to zero.")
        // precondition(age > 0, "Index must be greater than zero.")
        assert(age <= 0, "Index must be less than or equal to zero.")
        // assert(age > 0, "Index must be greater than zero.")
        if age > 0 {
            assert(age > 0, "A person's age cannot be less than zero")
        } else {
            assertionFailure("A person's age can't be less than zero.")
        }
    }
    func operators() {
        let (x, y) = (1.0, 2)
        // 空合运算符
        var z:Int?, w = z ?? y
        let v = z != nil ? z! : y
        // 三元运算符
        z = Int(x) < y ? Int(-x) * 3 : -y * 2
        print("x \(x), y \(y), x<y?-x*3:-y*2 \(z as Int?), z??y \(w as Int), z!=nil?z!:y \(v as Int)")
        // 闭区间运算符
        for index in 1...9 {
            print("\(index) * 9 = \(index * 9)")
        }
        // 半开区间运算符
        let list = ["andrew", "chil", "alphonse", "george", "dc"]
        let count = list.count
        for i in list[2...] {
            print(i)
        }
        // 单侧区间，默认从零开始，但结尾一定要显式展示
        for i in 1..<count {
            print("\(i) \(list[i])")
        }
        for i in list[..<3] {
            print(i)
        }
        // 逻辑运算符
        let origin = true
        print("\(list.isEmpty) \(!list.isEmpty) \(origin&&list.isEmpty) \(list.isEmpty||origin)")
    }
    func characters() {
        // 多行字符串字面量
        let str1 = """
        let me
         test so
        """
        // 换行拼接
        let str4 = """
        me
        special characters
        
        """
        // 转义
        let str5 = """
            such as\
         the \\backslash, warp\n, and quotes \"\"\" or \' and
        Unicode \u{24} \u{2665} \u{1F496} \u{1F425}
        """
        print(str1 + str4 + str5)
        var str2 = String()
        // 扩展字符串分隔符
        str2 = #"""
        🧐"""3⃣️
        """#
        let str3 = ""
        // 追加和遍历字符串
        if str3.isEmpty {
            str2 += "?"
            str2.append("!")
            for character in str2 {
                print(character)
            }
        }
        let cha1: Character = "!"
        let cha2: [Character] = ["C", "a", "t", cha1, "🐱"]
        print(String(cha2))
        // 字符串插值
        let str6 = #"\(2) times\\n 2.5\t is\n \#(Double(3) * 2.5)"#
        let str7 = "4x1=\(1*4)"
        print(str6)
        print(str7, str7.count)
        // 可扩展的字形群集
        let eAcute: Character = "\u{E9}"
        let combinedEAcute: Character = "\u{65}\u{301}"
        let precomposed: Character = "\u{D55C}"
        let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
        let enclosedEAcute: Character = "\u{E9}\u{20DD}"
        let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
        print("\(eAcute) \(combinedEAcute) \(precomposed) \(decomposed) \(enclosedEAcute) \(regionalIndicatorForUS) ")
        // 字符串数量
        var word = "cafe"
        print("the number of characters in \(word) is \(word.count)")
        word += "\u{301}" // 拼接一个重音，U+0301
        print("the number of characters in \(word) is \(word.count)")
    }
}
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/03_strings_and_characters#accessing-and-modifying-a-string
