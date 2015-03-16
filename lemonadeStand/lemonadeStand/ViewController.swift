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
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateThoseLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseMoreLemonsButton(sender: AnyObject) {
        if supply.bank >= prices.lemon {
        lemonsToPurchase += 1
        supply.bank -= 2
        supply.lemons += 1
        updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "Not enough money in the bank")
        }
    }
    @IBAction func purchaseLessLemonsButton(sender: AnyObject) {
        if supply.lemons != 0 {
            lemonsToPurchase -= 1
            supply.bank += 2
            supply.lemons -= 1
            updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "You don't even have those lemons, mate")
        }
    }
    @IBAction func purchaseMoreIceCubesButton(sender: AnyObject) {
        if supply.bank >= prices.iceCubes {
            supply.iceCubes += 1
            iceCubesToPurchase += 1
            supply.bank -= 1
            updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "Not enough money in the bank")
        }
    }
    @IBAction func purchaseLessIceCubesButton(sender: AnyObject) {
        if supply.iceCubes != 0 {
            iceCubesToPurchase -= 1
            supply.iceCubes -= 1
            supply.bank -= 1
            updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "You don't even have those Ice Cubes, mate")
        }
    }

    
    
    
    @IBAction func mixMoreLemonsButton(sender: AnyObject) {
        if supply.lemons != 0 {
            supply.lemons -= 1
            lemonsToMix += 1
            updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "Go buy more lemons, mate")
        }
    }
    @IBAction func mixLessLemonsButton(sender: AnyObject) {
        if lemonsToMix != 0 {
            lemonsToMix -= 1
            supply.lemons += 1
            updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "You don't even have those lemons, mate")
        }
    }
    @IBAction func mixMoreIceCubesButton(sender: AnyObject) {
        if supply.iceCubes != 0 {
            supply.iceCubes -= 1
            iceCubesToMix += 1
            updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "Go buy more Ice Cubes, mate")
        }
    }
    @IBAction func mixLessIceCubesButton(sender: AnyObject) {
        if iceCubesToMix != 0 {
            iceCubesToMix -= 1
            supply.iceCubes += 1
            updateThoseLabels()
        }
        else {
            showAlertWithText(header: "Sorry", message: "You don't even have those lemons, mate")
        }
    }
    
    
    @IBAction func startTheDay(sender: AnyObject) {
        
        let customersCounter = Int(arc4random_uniform(UInt32(100)))
        let mixtureRatio = Double(lemonsToMix) / Double(iceCubesToMix)
        
        for x in 0...customersCounter {
        let customersPreferences = Double(arc4random_uniform(UInt32(100)))/100
            if mixtureRatio < 1 && customersPreferences < 0.4 {
                supply.bank += 1
                println("Customer has been paid off")
            }
            else if mixtureRatio > 1 && customersPreferences > 0.6 {
                supply.bank += 1
                println("Customer has been paid off")
            }
            else if mixtureRatio == 1 && customersPreferences <= 0.6 && customersPreferences >= 0.4 {
                supply.bank += 1
                println("Customer has been paid off")
            }
            else {
                println("No money for you")
            }
        }
        
        lemonsToPurchase = 0
        iceCubesToPurchase = 0
        lemonsToMix = 0
        iceCubesToMix = 0
        
        updateThoseLabels()
    }
    
    func updateThoseLabels() {
        bankMoney.text = "\(supply.bank)$"
        storedLemons.text = "\(supply.lemons) Lemon(s)"
        storedIceCubes.text = "\(supply.iceCubes) Ice Cube(s)"
        purchaseMoreLemons.text = "\(lemonsToPurchase)"
        purchaseMoreIceCubes.text = "\(iceCubesToPurchase)"
        mixMoreLemons.text = "\(lemonsToMix)"
        mixMoreIceCubes.text = "\(iceCubesToMix)"
    }
    
    func showAlertWithText (header : String = "Warning", message : String ) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

