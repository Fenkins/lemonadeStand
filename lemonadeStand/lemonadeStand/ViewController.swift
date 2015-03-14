//
//  ViewController.swift
//  lemonadeStand
//
//  Created by Fenkins on 14/03/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bankMoney: UILabel!
    
    @IBOutlet weak var storedLemons: UILabel!
    
    @IBOutlet weak var storedIceCubes: UILabel!
    
    @IBOutlet weak var purchaseMoreLemons: UILabel!
    
    @IBOutlet weak var purchaseMoreIceCubes: UILabel!
    
    @IBOutlet weak var mixMoreLemons: UILabel!
    
    @IBOutlet weak var mixMoreIceCubes: UILabel!
    
    var supply = Supplies(mBank: 10, mLemons: 1, mIceCubes: 1)
    var prices = Prices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseMoreLemonsButton(sender: AnyObject) {
    }
    @IBAction func purchaseLessLemonsButton(sender: AnyObject) {
    }
    @IBAction func purchaseMoreIceCubesButton(sender: AnyObject) {
    }
    @IBAction func purchaseLessIceCubesButton(sender: AnyObject) {
    }

    
    
    
    @IBAction func mixMoreLemonsButton(sender: AnyObject) {
    }
    @IBAction func mixLessLemonsButton(sender: AnyObject) {
    }
    @IBAction func mixMoreIceCubesButton(sender: AnyObject) {
    }
    @IBAction func mixLessIceCubesButton(sender: AnyObject) {
    }
    
    
    @IBAction func startTheDay(sender: AnyObject) {
    }
    
}

