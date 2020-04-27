//
//  BluetoothController.swift
//  BatteryAlertor
//
//  Created by Chil on 26/4/20.
//  Copyright © 2020 Chil. All rights reserved.
//

import CoreBluetooth

class ServiceViewController: UIViewController,CBCentralManagerDelegate, CBPeripheralDelegate {
    var PeripheralToConncet : CBPeripheral!   //实例化外设
    var trCBCentralManager : CBCentralManager!  //实例化外设管理区
    self.PeripheralToConncet.delegate = self
    self.trCentralManager = CBCentralManager(delegate: self , queue: nil)
}
