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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messageLabel.text = "Valor sem impostos (dólar: \(calculator.dolarExchange))"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ShoppingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //permitor que o valor seja tratado como número. Permitir virgulas como texto no TextField
        
        calculator.totalSpend = calculator.convertToDouble(textField.text!)
        messageLabel.text = "Valor sem impostos (dólar: \(calculator.dolarExchange))"
        totalWithNoTaxes.text = "R$ \(String(format: "%.2f", calculator.totalSpend * calculator.dolarExchange))"
        textField.resignFirstResponder()
        return true
    }
}

