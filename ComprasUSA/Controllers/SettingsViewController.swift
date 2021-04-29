//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Erick Borges on 27/04/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let calculator = Calculator.shared
    
    @IBOutlet weak var dollarExchange: UITextField!
    @IBOutlet weak var iofTaxes: UITextField!
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        calculator.dolarExchange = Double(dollarExchange.text ?? "") ?? 0.0
        calculator.iofTaxes = Double(iofTaxes.text ?? "") ?? 0.0
        calculator.stateTaxes = Double(textField.text ?? "") ?? 0.0
        print("\(calculator.dolarExchange) totalSpend: \(calculator.totalSpend)")
        textField.resignFirstResponder()
        return true
    }
}
