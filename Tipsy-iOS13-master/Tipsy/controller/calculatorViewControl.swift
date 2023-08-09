//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class calculatorViewControl: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var noTipButton: UIButton!
    @IBOutlet weak var tenPercentageTip: UIButton!
    @IBOutlet weak var twentyPercentageTip: UIButton!
    @IBOutlet weak var splitNoLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var FinalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func tipChangerButton(_ sender: UIButton) {
        billTextField.endEditing(true)
        noTipButton.isSelected = false
        tenPercentageTip.isSelected = false
        twentyPercentageTip.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentageSign = String(buttonTitle.dropLast())
        let buttonTitleAsAnswer = Double(buttonTitleMinusPercentageSign)!
        
        tip = buttonTitleAsAnswer / 100

    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNoLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text
        if bill != "" {
            billTotal = Double(bill!)!
            let billResult = billTotal * (1 + tip) / Double(numberOfPeople)
            FinalResult = String(format: "%.2f", billResult)
        }
        self.performSegue(withIdentifier: "goToResult" , sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! resultViewControl
            destinationVC.result = FinalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
            
        }
    }
}

