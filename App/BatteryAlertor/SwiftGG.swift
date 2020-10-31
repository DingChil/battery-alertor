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
    }
}
