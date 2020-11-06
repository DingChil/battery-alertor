//
//  SwiftGG.swift
//  BatteryAlertor
//
//  Created by Chil on 28/10/20.
//  Copyright © 2020 Chil. All rights reserved.
//
//  https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics
//

class SwiftGG {
    init() {
        self.basic()
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
        var serverResponseCode: String? = "456"
        print("optionals \(serverResponseCode as Optional) \(serverResponseCode!)")
        serverResponseCode = "123"
        if let actualNumber = Int(serverResponseCode!) {
            print("\'\(serverResponseCode!)\' has an integer value of \(actualNumber)")
        } else {
            print("\'\(serverResponseCode!)\' could not be converted to an integer")
        }
    }
}
