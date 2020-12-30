//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.0
    var splitNumber = 2
    var billTotal = 0.0
    var result2DecimalPlace = "0.0"
    
    

    @IBOutlet weak var billTextFileld: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
   
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected =  false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPersentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPersentSign)!
        tip = buttonTitleAsANumber / 100
        
       
        
        billTextFileld.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        sender.maximumValue = 12
        sender.minimumValue = 2
        splitNumberLabel.text = String(Int(sender.value))
        
        splitNumber = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextFileld.text!
        if bill != "" {
            billTotal = Double(bill) ?? 0.0
           
            let result = ((billTotal * tip) + billTotal) / Double(splitNumber)
            result2DecimalPlace = String(format: "%.2f", result)
           
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let dectinationVC = segue.destination as! ResultViewController
            dectinationVC.result = result2DecimalPlace
            dectinationVC.splitValue = splitNumber
            dectinationVC.tipValue = tip
        }
        // Pass the selected object to the new view controller.
    }
    

}

