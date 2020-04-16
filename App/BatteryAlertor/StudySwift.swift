//
//  StudySwift.swift
//  BatteryAlertor
//
//  Created by Chil on 16/4/20.
//  Copyright © 2020 Chil. All rights reserved.
//

import Cocoa

class StudySwift: NSAlert {

}

public class OutputFunction {
    private var context: Any?
    private let alert: String
    private let count: Int
    private let group: Array<String>
    
    public init() {
        self.context = "Hello"
        self.alert = "World"
        self.count = 886
        self.group = ["There", "is", "Battery Alertor"]
        self.start()
    }
    
    public func start() {
        print(self.context as! String)
        print(alert)
        print("\(self.count)")
        print(group)
    }
}
