//
//  EventController.swift
//  BatteryAlertor
//
//  Created by Chil on 16/4/20.
//  Copyright © 2020 Chil. All rights reserved.
//

import IOKit.ps
import Foundation
import UserNotifications

enum BatteryError: Error { case error }

public class BatteryListener {
    // https://stackoverflow.com/questions/34571222
    // https://stackoverflow.com/questions/31633503
    public init() {
        MCGCDTimer.shared.scheduledDispatchTimer(WithTimerName: "GCDTimer", timeInterval: 60, queue: .main, repeats: true) {
            //需要执行的代码
            self.start()
        }
    }
    
    deinit{
        MCGCDTimer.shared.cancleTimer(WithTimerName: "GCDTimer")
    }
    
    func start() {
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
//                    self.showNotification(level:name)
                    if (name > 90)
                    {self.notificationAction(level:name)}
                }
            }
        } catch {
            fatalError()
        }
    }
    
    func showNotification(level:Int) -> Void {
        // https://gist.github.com/ericdke/fec20e6db9e0aa25e8ea
                let notification = NSUserNotification()
                notification.title = String(level)
                notification.subtitle = "Sub Test."+String(level)
                notification.soundName = NSUserNotificationDefaultSoundName
                 // NSUserNotificationCenter.default.delegate = self
                NSUserNotificationCenter.default.deliver(notification)
    }

    func userNotificationCenter(_ center: NSUserNotificationCenter,
                                             shouldPresent notification: NSUserNotification) -> Bool {
            return true
    }
    
    @IBAction func notificationAction(level:Int) {
        // https://zhuanlan.zhihu.com/p/59530670
        let content = UNMutableNotificationContent()
        content.title = String(level)
        content.body = String(level)

        content.userInfo = ["method": "new"]

        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "NOTIFICATION_DEMO"

        let acceptAction = UNNotificationAction(identifier: "SHOW_ACTION", title: "显示", options: .init(rawValue: 0))
        let declineAction = UNNotificationAction(identifier: "CLOSE_ACTION", title: "关闭", options: .init(rawValue: 0))
        let testCategory = UNNotificationCategory(identifier: "NOTIFICATION_DEMO",
                                                  actions: [acceptAction, declineAction],
                                                  intentIdentifiers: [],
                                                  hiddenPreviewsBodyPlaceholder: "",
                                                  options: .customDismissAction)

        let request = UNNotificationRequest(identifier: "NOTIFICATION_DEMO_REQUEST",
                                            content: content,
                                            trigger: nil)

        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        // notificationCenter.delegate = self
        notificationCenter.setNotificationCategories([testCategory])
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
            }
        }
    }
}

typealias ActionBlock = () -> ()

class MCGCDTimer {
    //单例 https://www.jianshu.com/p/e20a4aca2c3f
    static let shared = MCGCDTimer()
    
    lazy var timerContainer = [String: DispatchSourceTimer]()
    
    /// GCD定时器
    ///
    /// - Parameters:
    ///   - name: 定时器名字
    ///   - timeInterval: 时间间隔
    ///   - queue: 队列
    ///   - repeats: 是否重复
    ///   - action: 执行任务的闭包
    func scheduledDispatchTimer(WithTimerName name: String?, timeInterval: Double, queue: DispatchQueue, repeats: Bool, action: @escaping ActionBlock) {
        
        if name == nil {
            return
        }
        
        var timer = timerContainer[name!]
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
            timer?.resume()
            timerContainer[name!] = timer
        }
        //精度0.1秒
        timer?.schedule(deadline: .now(), repeating: timeInterval, leeway: DispatchTimeInterval.milliseconds(100))
        timer?.setEventHandler(handler: { [weak self] in
            action()
            if repeats == false {
                self?.cancleTimer(WithTimerName: name)
            }
        })
    }
    
    /// 取消定时器
    ///
    /// - Parameter name: 定时器名字
    func cancleTimer(WithTimerName name: String?) {
        let timer = timerContainer[name!]
        if timer == nil {
            return
        }
        timerContainer.removeValue(forKey: name!)
        timer?.cancel()
    }
    
    
    /// 检查定时器是否已存在
    ///
    /// - Parameter name: 定时器名字
    /// - Returns: 是否已经存在定时器
    func isExistTimer(WithTimerName name: String?) -> Bool {
        if timerContainer[name!] != nil {
            return true
        }
        return false
    }
    
}
