//
//  ViewController.swift
//  YieldConverter
//
//  Created by Ryan Cosgrove on 20/09/22.
//

import UIKit




class ViewController: UIViewController {
    
    // Output Labels
    @IBOutlet weak var woolbaseOut: UILabel!
    @IBOutlet weak var sdryOut: UILabel!
    @IBOutlet weak var jcsyOut: UILabel!
    @IBOutlet weak var cwfpOut: UILabel!
    @IBOutlet weak var sixteenOut: UILabel!
    @IBOutlet weak var seventeenOut: UILabel!
    @IBOutlet weak var acyOut: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    //Picker Yield Goes here:
    
    
    //Retrieve user Input info
    
    @IBOutlet weak var yieldIn: UITextField!
    @IBOutlet weak var vmIn: UITextField!
    @IBOutlet weak var hhIn: UITextField!
    @IBOutlet weak var priceIn: UITextField!
    
    
   

    @IBOutlet weak var menu: UIMenu!
    
    @IBAction func menuButton(_ sender: Any) {
        print("hello")
    }
    
    
    
    let yieldPickerData: NSArray = ["","SDRY","IWTO16%","IWTO17%","JCSY","ACY"]
    var yieldSelection = ""
    
    
    //Globals
    var yieldInStore: Double = 00.00
    var vmInStore: Double = 00.00
    var hhInStore: Double = 00.00
    var priceInStore: Double = 00.00
    
    
    //Store the inputs as variables, make sure data is valid
    //TODO instead fo return out of error states, create popup
    func storeInputs () {
        if yieldIn.text != "" {
            yieldInStore = Double(yieldIn.text!)!
            //print(yieldInStore)
        } else {
            return
        }
        if vmIn.text != "" {
            vmInStore = Double(vmIn.text!)!
            //print(vmInStore)
        } else {
            return
        }
        if hhIn.text != "" {
            hhInStore = Double(hhIn.text!)!
            //print(hhInStore)
        } else {
            return
        }
        if priceIn.text != "" {
            priceInStore = Double(priceIn.text!)!
            //print(vmInStore)
        } else {
            return
        }
        //print(yieldInStore)
        //print(vmInStore)
        //print(hhInStore)
        //print(priceInStore)
    }
        
    // create 6 functions, one for each of the potential input yield types, to convert to woolbase
    
    
    
    //Create a function that, based on the input in the yield picker chose the right function and covert to woolbase
    
    //Use that woolbase to fill out the output yields, assign those values to the output variables
    
    
    @IBAction func updateButton(_ sender: Any) {
        
        
    }
    
    
    
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}


