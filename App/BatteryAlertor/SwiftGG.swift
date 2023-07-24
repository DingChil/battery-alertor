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
//        self.characters()
//        self.strings()
//        self.arrays()
//        self.sets()
//        self.dicts()
        self.controls()
         
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
    func strings() {
        // 字符串插值
        let str6 = #"\(2) times\\n 2.5\t is\n \#(Double(3) * 2.5)"#
        var str7 = "3.1416x7=\(3.1416*7)"
        print(str6)
        // 字符串索引
        print("\(str7.count) \(str7[str7.startIndex]) \(str7[str7.index(before: str7.endIndex)])")
        // endIndex 是获取最后一个字符的后一个位置的索引
        print("\(str7[str7.index(after: str7.startIndex)]) \(str7[str7.index(str7.startIndex, offsetBy: 7)])")
        // terminator 用于控制 print 的打印结尾
        for index in str7.indices {
           print("\(str7[index]) ", terminator: "")
        }
        // 字符插入
        str7.insert("?", at: str7.endIndex)
        print("\(str7)")
        // 字符串插入
        str7.insert(contentsOf:"!!!", at: str7.index(before: str7.endIndex))
        print("\(str7)")
        // 字符删除
        str7.remove(at: str7.index(before: str7.endIndex))
        // 字符串删除
        let str8 = str7.index(str7.endIndex, offsetBy: -6)..<str7.endIndex
        // 根据区间删除
        str7.removeSubrange(str8)
        print("\(str7)")
        // 根据区间获取子串
        let firstIndex = str7.firstIndex(of: "=") ?? str7.endIndex
        print("\(firstIndex) \(str7[..<firstIndex])")
        let str9 = "\u{E9}\u{D55C}"
        let str0 = "\u{65}\u{301}\u{1112}\u{1161}\u{11AB}"
        // 字符相等
        if str0 == str9 {
            print("\(str0) \(str9) are considered equal")
        }
        print("\(str7.hasPrefix("3.14")) \(str7.hasSuffix("9"))")
        // 遍历 String 的 utf8 属性来获得 UInt8 值
        for code in str9.utf8 {
            print("\(code) ", terminator: "")
        }
        print("\n⬆️UInt8 UInt16⬇️")
        // UTF16View 是无符号16位（ UInt16 ）值的集合
        for code in str0.utf16 {
            print("\(code) ", terminator: "")
        }
        // 用 UInt32 来表示 Unicode 标量
        print("\nUnicodeScalarView⬇️")
        for code in str9.unicodeScalars {
            print("\(code.value) ", terminator: "")
        }
    }
    func arrays() {
        // 显式声明
        var arr1: [Double] = []
        arr1.append(3)
        // 带默认值声明
        let arr2 = Array(repeating: 1.0, count: 2)
        print("arr1 is of type [Double] with \(arr1.count) items, arr2 is of type [Double] : \(arr2)")
        // 数组相加
        print("arr1+2 is \(arr1 + arr2)")
        // 构造数组
        let arr3: [String] = ["see"]
        print("arr3: \(arr3), isEmpty: \(arr3.isEmpty)")
        // 追加，跟 append 同理
        arr1 += [5, 7, 9]
        // insert 可以指定在哪里前插
        arr1.insert(1, at: 2)
        // enumerated 会返回由索引和值组成的元组数组
        for (index, value) in arr1.enumerated() {
            print("Item \(String(index + 1)): \(value)")
        }
        // 指定下标删除
        arr1.remove(at: 1)
        // 指定删除最后一个
        arr1.removeLast()
        print("arr1: \(arr1)")
        var arr4: Set<String> = ["cc", "bb"]
        arr4.insert("aa")
        print("array is of type Set<String> with \(arr4.count) items, is means \(arr4.isEmpty) now")
        // 删除具体元素
        if let result = arr4.remove("bb") {
            print("\(result)? I'm over it.")
        } else {
            print("I never much cared for that.")
        }
        print("now array is \(arr4), and here have aa is \(arr4.contains("aa"))")
        // 排序
        for num in arr1.sorted() {
            print("Item \(num)")
        }
    }
    func sets() {
        let odd: Set = [1, 3, 5, 7, 9]
        let even: Set = [0, 2, 4, 6, 8]
        let prime: Set = [2, 3, 5, 7]
        // 并集 union 根据两个集合的所有值创建一个新的集合
        print("union: \(odd.union(even).sorted())")
        // 交集 intersection 根据两个集合的交集创建一个新的集合
        print("intersection: \(odd.intersection(even).sorted())")
        // 补集 subtracting 根据不在另一个集合中的值创建一个新的集合
        print("subtracting: \(odd.subtracting(prime).sorted())")
        // 对称差 symmetricDifference 根据两个集合不相交的值创建一个新的集合
        print("symmetric: \(odd.symmetricDifference(prime).sorted())")
        // 判断一个集合中的所有值是否也被包含在另外一个集合中
        print("subset: \(prime.isSubset(of: odd))")
        // 判断一个集合是否包含另一个集合中所有的值
        print("superset: \(odd.isSuperset(of: prime))")
        // 判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等
        print("strict subset: \(odd.isStrictSubset(of: even)) \(even.isStrictSuperset(of: odd))")
        // 判断两个集合是否不含有相同的值
        print("disjoint: \(odd.isDisjoint(with: even))")
    }
    func dicts() {
        var dic1: [Int: String] = [12: "twelve", 14: "Fourteen", 18: "Eighteen", 20: "Twenty"]
        dic1[16] = "sixteen"
        print("dic1 isEmpty? \(dic1.isEmpty), count \(dic1.count):")
        print(dic1)
        // 设置或者更新特定键对应的值，不存在对应值的时候会设置新值，或者在存在时更新已存在的值并返回更新值之前的原值
        if let oldValue = dic1.updateValue("ten", forKey: 10) {
            print("The old value for dic1 was \(oldValue).")
        } else {
            print("no ten: \(dic1)")
        }
        // 使用下标语法通过将某个键的对应值赋值为 nil 来从字典里移除一个键值对
        dic1[16] = nil
        if let removedValue = dic1.removeValue(forKey: 12) {
            print("delete 16 and \(removedValue): \(dic1)")
        }
        for (key, val) in dic1 {
            print("\(key): \(val)")
        }
        let dic1num = [Int](dic1.keys)
        print(dic1num)
        for data in dic1.keys {
            print(data)
        }
        let dic1txt = [String](dic1.values)
        print(dic1txt)
        for data in dic1.values {
            print(data)
        }
    }
    func controls() {
        let minutes = 60
        let minuteInterval = 5
        for tickMark in stride(from: 40, to: minutes, by: minuteInterval) {
            print("real \(tickMark) in minutes")
        }
        // to 是至到但不包含，through 是直到并包括
        let hours = 12
        let hourInterval = 3
        for tickMark in stride(from: 0, through: hours, by: hourInterval) {
            print("real \(tickMark) in hours")
        }
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        repeat {
            // 顺着梯子爬上去或者顺着蛇滑下去
            square += board[square]
            // 掷骰子
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            // 根据点数移动
            square += diceRoll
        } while square < finalSquare
        print("Game over!")
        let someCharacter: Character = "z"
        // switch 不允许隐式贯穿
        switch someCharacter {
        case "a":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        // 复合匹配
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
        case "a", "A":
            print("The letter A")
        default:
            print("Not the letter A")
        }
        // 区间匹配
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        let naturalCount: String
        switch approximateCount {
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        case 100..<1000:
            naturalCount = "hundreds of"
        default:
            naturalCount = "many"
        }
        print("There are \(naturalCount) \(countedThings).")
        // 匹配元组与值绑定
        let anotherPoint = (2, 3)
        switch anotherPoint {
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        case (1, let y):
            print("on the y-axis with a y value of \(y)")
        case (let x, 2):
            print("on the x-axis with an x value of \(x)")
        }
        // 额外条件
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        }
        // 多行复合匹配
        let oneCharacter: Character = "e"
        switch oneCharacter {
        case "a", "e", "i", "o", "u":
            print("\(oneCharacter) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(oneCharacter) is a consonant")
        default:
            print("\(oneCharacter) is not a vowel or a consonant")
        }
        // 立刻停止本次循环
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        for character in puzzleInput {
            switch character {
            case "a", "e", "i", "o", "u", " ":
                continue
            default:
                puzzleOutput.append(character)
            }
        }
        print(puzzleOutput)
        // 贯穿 fallthrough 会简单地使代码继续连接到下一个 case 中
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer!!!"
        }
        print(description)
        // 标签语句 Labeled Statements
        let finalSquare2 = 25
        let board2 = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square2 = 0
        var diceRoll2 = 0
        gameLoop: while square2 != finalSquare2 {
            diceRoll2 += 1
            if diceRoll2 == 7 { diceRoll2 = 1 }
            switch square2 + diceRoll2 {
            case finalSquare2:
                // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
                break gameLoop
            case let newSquare where newSquare > finalSquare2:
                // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
                continue gameLoop
            default:
                // 合法移动，做正常的处理
                square2 += diceRoll2
                square2 += board2[square2]
            }
        }
        print("Labeled Statements Game Over.")
    }
}
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/05_control_flow#early-exit
