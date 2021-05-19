//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mickale Saturre on 3/18/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var recalculatePressed: UIButton!
    
    var totalBill: String?
    var numberOfPeople: Int?
    var tip: Double?
    
    override func viewDidLoad() {
        let converted = tip! * 100
        
        totalLabel.text = totalBill;
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(Int(converted))% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
