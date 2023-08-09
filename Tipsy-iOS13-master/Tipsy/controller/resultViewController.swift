//
//  resultViewController.swift
//  Tipsy
//
//  Created by Funnmedia 2 on 07/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class resultViewControl: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}




