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
    
    private func calculateRetirementAmount(current_age: Int, retirement_age : Int, monthly_investment: Float, current_savings: Float, interest_rate: Float) -> Double {
        let months_until_retirement = (retirement_age - current_age) * 12
        
        var retirement_amount = Double(current_savings) * pow(Double(1+interest_rate/100), Double(months_until_retirement))
        
        for i in 1...months_until_retirement {
            let monthly_rate = interest_rate / 100 / 12
            retirement_amount += Double(monthly_investment) * pow(Double(1+monthly_rate), Double(i))
        }
        
        return retirement_amount
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        let currentAge : Int? = Int(ageTextField.text!)
        let plannedRetirementAge : Int? = Int(retirementAgeTextField.text!)
        let monthlyInvestment : Float? = Float(monthlyInvestmentsTextField.text!)
        let currentSavings : Float? = Float(savingsTextField.text!)
        let interestRate: Float? = Float(interestRateTextField.text!)
        
        let retirementAmount = calculateRetirementAmount(current_age: currentAge!, retirement_age: plannedRetirementAge!, monthly_investment: monthlyInvestment!, current_savings: currentSavings!, interest_rate: interestRate!)
        
        resultLabel.text = "If you save $\(monthlyInvestment!) every month for \(plannedRetirementAge! - currentAge!) years, and invest that money plus your current investment of \(currentSavings!) at a \(interestRate!)% anual interest rate, you will have $\(retirementAmount) by the time you are \(currentAge!)"
        
        let properties = ["current_age": String(currentAge!),
                          "planned_retirement_age" : String(plannedRetirementAge!)
        ]
        
        Analytics.trackEvent("calculate_retirement", withProperties: properties)
    }
}

