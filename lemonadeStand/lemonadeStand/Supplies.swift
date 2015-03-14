//
//  Supplies.swift
//  lemonadeStand
//
//  Created by Fenkins on 14/03/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation

struct Supplies {
    var bank = 0
    var lemons = 0
    var iceCubes = 0
    
    init(mBank:Int, mLemons:Int, mIceCubes:Int) {
        bank = mBank
        lemons = mLemons
        iceCubes = mIceCubes
    }
}