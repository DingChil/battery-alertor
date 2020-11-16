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
        // self.basic()
        // self.error()
        self.symbol()
    }
    func basic() {
        let binaryInteger = 0b10001, octalInteger = 0o21, hexadecimalInteger = 0x11
        print("binaryInteger:\(binaryInteger), octalInteger:\(octalInteger), hexadecimalInteger:\(hexadecimalInteger)")
        let decimalDouble = 12.18750000, exponentDouble = 1.21875e1, hexadecimalDouble = 0xC.3p0
        print("always Double no Float:\(decimalDouble), exponentDouble:\(exponentDouble), hexadecimalDouble:\(hexadecimalDouble)")
        let paddedDouble = 000123.456, oneMillion = 1_000_000, justOverOneMillion = 1_000_000.000_000_1
        print("paddedDouble:\(paddedDouble), oneMillion:\(oneMillion), justOverOneMillion:\(justOverOneMillion)")
        typealias AudioSample = UInt16
        let maxAmplitudeFound = AudioSample.min
        print("UInt16 min:\(maxAmplitudeFound), max:\(AudioSample.max)")
        let http404Error = (404, "Not Found")
        print("tuples http404Error.0:\(http404Error.0), http404Error.1:\(http404Error.1), http404Error:\(http404Error)")
        var serverResponseCode: String?
        print("optionals \(serverResponseCode as Optional)")
        serverResponseCode = "1234"
        if let actualNumber = Int(serverResponseCode!) {
            print("\(serverResponseCode!) & \(serverResponseCode as Optional) has an integer value of \(actualNumber)")
        } else {
            print("\(serverResponseCode!) & \(serverResponseCode as Optional) could not be converted to an integer")
        }
        let forcedString:String! = serverResponseCode
        print("implicitly unwrapped optionals \(forcedString!) \(forcedString as Optional)")
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
