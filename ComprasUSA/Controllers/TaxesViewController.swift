//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Erick Borges on 27/04/21.
//

import UIKit

class TaxesViewController: UIViewController {
    
    @IBOutlet weak var stateTaxesLabel: UILabel!
    @IBOutlet weak var iofTaxesLabel: UILabel!
    @IBOutlet weak var totalUSS: UILabel!
    @IBOutlet weak var totalStateTaxes: UILabel!
    @IBOutlet weak var totalIOFTaxes: UILabel!
    @IBOutlet weak var totalRS: UILabel!
    
    let calculator = Calculator.shared
    var useCreditCard: Bool = false
    
    // é sempre carregada quando a view aparece. O viewDidLoad só é carregado uma vez, nao atualizando os valores.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    @IBAction func switchEvent(_ sender: UISwitch) {
        totalRS.text = sender.isOn ? "\(calculator.getFormattedValue(value: calculator.calculateTotalWithIOF(), withCurrency: ""))" : "\(calculator.getFormattedValue(value: calculator.calculateTotal(), withCurrency: ""))"
    }
    
    func calculateTaxes() {
        print("total US$: \(calculator.totalSpend) IMP EST: \(calculator.stateTaxes) calculo impEstado: \(calculator.calculateStateTaxes())")
        
        totalUSS.text = "\(calculator.getFormattedValue(value: calculator.totalSpend, withCurrency: ""))"
        stateTaxesLabel.text = "Imposto do Estado (\(calculator.stateTaxes)%)"
        totalStateTaxes.text = "\(calculator.getFormattedValue(value: calculator.calculateStateTaxes(), withCurrency: "US$ "))"
        iofTaxesLabel.text = "IOF (\(calculator.iofTaxes)%)"
        totalIOFTaxes.text = "\(calculator.getFormattedValue(value: calculator.calculateIofTaxes(), withCurrency: "US$ "))"
        print(calculator.calculateIofTaxes())
    }
}

