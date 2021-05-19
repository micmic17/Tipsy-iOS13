//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var bill = 0.0
    var numberOfPeople = 2
    var total: String?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        billTextField.endEditing(true)
        sender.isSelected = true
        
        let button = sender.currentTitle!
        let selected = String(button.dropLast())
        
        tip = Double(selected)! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill = Double(billTextField.text!)!
        let result = bill * (1 + tip) / Double(numberOfPeople)
        total = String(format: "%.2f", result)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destination = segue.destination as! ResultsViewController
            destination.numberOfPeople = numberOfPeople
            destination.tip = tip
            destination.totalBill = total
        }
    }
}

