//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Erick Borges on 26/04/21.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    let calculator = Calculator.shared
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var totalWithNoTaxes: UILabel!
    @IBOutlet weak var totalSpendTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messageLabel.text = "Valor sem impostos (dólar: \(calculator.dolarExchange))"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        setAmount()
    }
    
    func setAmount() {
        calculator.totalSpend = calculator.convertToDouble(totalSpendTextField.text!)
        messageLabel.text = "Valor sem impostos (dólar: \(calculator.dolarExchange))"
        totalWithNoTaxes.text = calculator.getFormattedValue(value: calculator.totalSpend * calculator.dolarExchange, withCurrency: "R$ ")
    }
}

