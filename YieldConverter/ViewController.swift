//
//  ViewController.swift
//  YieldConverter
//
//  Created by Ryan Cosgrove on 20/09/22.
//

import UIKit

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}



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
    @IBOutlet weak var menu: UIMenu!
    
    @IBAction func menuButton(_ sender: Any) {
        print("hello")
    }
    
    let yieldPickerData: NSArray = ["","SDRY","IWTO16%","IWTO17%","JCSY","ACY"]
    var yieldSelection = "SDRY" //unitl i make the menu work this is fixed to allow running the calculations!
    
    
    //Price/Yields Toggle switch TODO
    //Set as fixed for now
    let toggle: String = "prices"
    
    //Retrieve user Input info
    
    @IBOutlet weak var yieldIn: UITextField!
    @IBOutlet weak var vmIn: UITextField!
    @IBOutlet weak var hhIn: UITextField!
    @IBOutlet weak var priceIn: UITextField!
    
    
   
    
  
    
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
            //rint(yieldInStore)
        } else {
            return
        }
        if vmIn.text != "" {
            vmInStore = Double(vmIn.text!)!
            //print(vmInStore)
        } else {
            vmInStore = 00.00
        }
        if hhIn.text != "" {
            hhInStore = Double(hhIn.text!)!
            //print(hhInStore)
        } else {
            hhInStore = 00.00
        }
        if priceIn.text != "" {
            priceInStore = Double(priceIn.text!)!
           // rint(priceInStore)
        } else {
            priceInStore = 00.00
        }

    }
        
    // create 6 functions, one for each of the potential input yield types, to convert to woolbase
    
    func calculateYields () {
        let vmDbl: Double = vmInStore
        let yieldDbl: Double = yieldInStore
        let hhDbl: Double = hhInStore
        let pa: Double = 7.7 - (40.6 / (7.8 + vmDbl - hhDbl))
        var yieldDifference: Double = 0.00
        var newPrice: Double = 0.00
        
        if yieldSelection == "SDRY" {
            var wbFinal: Double = (yieldDbl + pa) / 1.207
            wbFinal = wbFinal.roundToDecimal((2))
            yieldDifference = 1 - (yieldDbl - wbFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                woolbaseOut.text! = "$" + "\(newPrice)"
            } else {
                woolbaseOut.text! = "\(wbFinal)" + "%"
            }
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - sdryFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sdryOut.text! = "$" + "\(newPrice)"
            } else {
                sdryOut.text! = "\(sdryFinal)" + "%"
            }
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSixFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sixteenOut.text! = "$" + "\(newPrice)"
            } else {
                sixteenOut.text! = "\(iwtoSixFinal)" + "%"
            }
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSevenFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                seventeenOut.text! = "$" + "\(newPrice)"
            } else {
                seventeenOut.text! = "\(iwtoSevenFinal)" + "%"
            }
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - jcsyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                jcsyOut.text! = "$" + "\(newPrice)"
            } else {
                jcsyOut.text! = "\(jcsyFinal)" + "%"
            }
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - acyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                acyOut.text! = "$" + "\(newPrice)"
            } else {
                acyOut.text! = "\(acyFinal)" + "%"
            }
            
        } else if yieldSelection == "IWTO16%" {
            var wbFinal: Double = (yieldDbl / 1.1869 - vmDbl)
            wbFinal = wbFinal.roundToDecimal((2))
            yieldDifference = 1 - (yieldDbl - wbFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                woolbaseOut.text! = "$" + "\(newPrice)"
            } else {
                woolbaseOut.text! = "\(wbFinal)" + "%"
            }
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - sdryFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sdryOut.text! = "$" + "\(newPrice)"
            } else {
                sdryOut.text! = "\(sdryFinal)" + "%"
            }
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSixFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sixteenOut.text! = "$" + "\(newPrice)"
            } else {
                sixteenOut.text! = "\(iwtoSixFinal)" + "%"
            }
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSevenFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                seventeenOut.text! = "$" + "\(newPrice)"
            } else {
                seventeenOut.text! = "\(iwtoSevenFinal)" + "%"
            }
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - jcsyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                jcsyOut.text! = "$" + "\(newPrice)"
            } else {
                jcsyOut.text! = "\(jcsyFinal)" + "%"
            }
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - acyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                acyOut.text! = "$" + "\(newPrice)"
            } else {
                acyOut.text! = "\(acyFinal)" + "%"
            }
        } else if yieldSelection == "IWTO17%" {
            var wbFinal: Double = (yieldDbl / 1.1972 - vmDbl)
            wbFinal = wbFinal.roundToDecimal((2))
            yieldDifference = 1 - (yieldDbl - wbFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                woolbaseOut.text! = "$" + "\(newPrice)"
            } else {
                woolbaseOut.text! = "\(wbFinal)" + "%"
            }
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - sdryFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sdryOut.text! = "$" + "\(newPrice)"
            } else {
                sdryOut.text! = "\(sdryFinal)" + "%"
            }
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSixFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sixteenOut.text! = "$" + "\(newPrice)"
            } else {
                sixteenOut.text! = "\(iwtoSixFinal)" + "%"
            }
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSevenFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                seventeenOut.text! = "$" + "\(newPrice)"
            } else {
                seventeenOut.text! = "\(iwtoSevenFinal)" + "%"
            }
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - jcsyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                jcsyOut.text! = "$" + "\(newPrice)"
            } else {
                jcsyOut.text! = "\(jcsyFinal)" + "%"
            }
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - acyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                acyOut.text! = "$" + "\(newPrice)"
            } else {
                acyOut.text! = "\(acyFinal)" + "%"
            }
            
        } else if yieldSelection == "JCSY" {
            var wbFinal: Double = (yieldDbl / 1.177)
            wbFinal = wbFinal.roundToDecimal((2))
            yieldDifference = 1 - (yieldDbl - wbFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                woolbaseOut.text! = "$" + "\(newPrice)"
            } else {
                woolbaseOut.text! = "\(wbFinal)" + "%"
            }
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - sdryFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sdryOut.text! = "$" + "\(newPrice)"
            } else {
                sdryOut.text! = "\(sdryFinal)" + "%"
            }
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSixFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sixteenOut.text! = "$" + "\(newPrice)"
            } else {
                sixteenOut.text! = "\(iwtoSixFinal)" + "%"
            }
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSevenFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                seventeenOut.text! = "$" + "\(newPrice)"
            } else {
                seventeenOut.text! = "\(iwtoSevenFinal)" + "%"
            }
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - jcsyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                jcsyOut.text! = "$" + "\(newPrice)"
            } else {
                jcsyOut.text! = "\(jcsyFinal)" + "%"
            }
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - acyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                acyOut.text! = "$" + "\(newPrice)"
            } else {
                acyOut.text! = "\(acyFinal)" + "%"
            }
        } else if yieldSelection == "ACY" {
            var wbFinal: Double = (yieldDbl + 5.12 - (0.1616 * vmDbl)) / 1.1972
            wbFinal = wbFinal.roundToDecimal((2))
            yieldDifference = 1 - (yieldDbl - wbFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                woolbaseOut.text! = "$" + "\(newPrice)"
            } else {
                woolbaseOut.text! = "\(wbFinal)" + "%"
            }
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - sdryFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sdryOut.text! = "$" + "\(newPrice)"
            } else {
                sdryOut.text! = "\(sdryFinal)" + "%"
            }
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSixFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                sixteenOut.text! = "$" + "\(newPrice)"
            } else {
                sixteenOut.text! = "\(iwtoSixFinal)" + "%"
            }
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - iwtoSevenFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                seventeenOut.text! = "$" + "\(newPrice)"
            } else {
                seventeenOut.text! = "\(iwtoSevenFinal)" + "%"
            }
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - jcsyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                jcsyOut.text! = "$" + "\(newPrice)"
            } else {
                jcsyOut.text! = "\(jcsyFinal)" + "%"
            }
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            yieldDifference = 1 - (yieldDbl - acyFinal)/yieldDbl
            newPrice = priceInStore / yieldDifference
            newPrice = newPrice.roundToDecimal((2))
            if toggle == "prices" {
                acyOut.text! = "$" + "\(newPrice)"
            } else {
                acyOut.text! = "\(acyFinal)" + "%"
            }
        } else {

            woolbaseOut.text! = "--" + "%"
            

            sdryOut.text! = "--" + "%"
            

            sixteenOut.text! = "--" + "%"
            

            seventeenOut.text! = "--" + "%"
            

            jcsyOut.text! = "--" + "%"
            

            acyOut.text! = "--" + "%"
        }
    }
    
    
    
 
 // Update Button calls the fucntions
    
    @IBAction func updateButton(_ sender: Any) {
        storeInputs()
        calculateYields()
    }
    
    
    
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}


//Hi Paloma <3
