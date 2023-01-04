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
        let currentAge : Int? = Int(ageTextField.text!)
        let plannedRetirementAge : Int? = Int(retirementAgeTextField.text!)
        let monthlyInvestment : Float? = Float(monthlyInvestmentsTextField.text!)
        let currentSavings : Float? = Float(savingsTextField.text!)
        let interestRate: Float? = Float(interestRateTextField.text!)
        
        resultLabel.text = "If you save $\(monthlyInvestment!) every month for \(plannedRetirementAge! - currentAge!) years, and invest that money plus your current investment of \(currentSavings!) at a \(interestRate!)% anual interest rate, you will have $X by the time you are \(currentAge!)"
        
        let properties = ["current_age": String(currentAge!),
                          "planned_retirement_age" : String(plannedRetirementAge!)
        ]
        
        Analytics.trackEvent("calculate_retirement", withProperties: properties)
    }
}

