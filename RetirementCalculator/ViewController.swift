//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Nermin Ramic on 26.12.2023.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    @IBOutlet weak var monthlyInvestmentsTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        let age = ageTextField.text ?? "NA"
        let retirementAge = retirementAgeTextField.text ?? "NA"
        
        let properties = ["age": age,
                          "retirement_age" : retirementAge
        ]
        
        Analytics.trackEvent("calculate_retirement", withProperties: properties)
    }
}

