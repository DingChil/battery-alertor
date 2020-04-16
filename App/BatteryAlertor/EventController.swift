//
//  EventController.swift
//  BatteryAlertor
//
//  Created by Chil on 16/4/20.
//  Copyright © 2020 Chil. All rights reserved.
//

import Foundation
import IOKit.ps

enum BatteryError: Error { case error }

public class BatteryListener {
    public init() {
        do {
            // Take a snapshot of all the power source info
            guard let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue()
                else { throw BatteryError.error }

            // Pull out a list of power sources
            guard let sources: NSArray = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue()
                else { throw BatteryError.error }
            
            // print(snapshot)
            // print(type(of: sources[0]))
            // print(sources[0])

            // For each power source...
            for ps in sources {
                // Fetch the information for a given power source out of our snapshot
                guard let info: NSDictionary = IOPSGetPowerSourceDescription(snapshot, ps as CFTypeRef)?.takeUnretainedValue()
                    else { throw BatteryError.error }

                // Pull out the name and current capacity
                /* if let name = info[kIOPSNameKey] as? String,
                    let capacity = info[kIOPSCurrentCapacityKey] as? Int,
                    let max = info[kIOPSMaxCapacityKey] as? Int {
                    print("\(name): \(capacity) of \(max)")
                } */
                
                if let name = info[kIOPSCurrentCapacityKey] as? Int {
                    print("now is \(name)")
                }
            }
        } catch {
            fatalError()
        }
    }
}
