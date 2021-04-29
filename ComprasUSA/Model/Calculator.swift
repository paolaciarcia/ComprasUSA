//
//  Calculator.swift
//  ComprasUSA
//
//  Created by Erick Borges on 27/04/21.
//

import UIKit

// é uma classe porque servirá como referencia e nao cópia
class Calculator {
    var totalSpend = 0.0
    var dolarExchange = 5.40
    var iofTaxes = 6.38
    var stateTaxes = 10.0
    
    //padrão singleton p/ garantir que sempre a mesma instancia sera acessada
    static var shared = Calculator()
    let formatter = NumberFormatter()
    
    //private para impedir que outras instancias sejam criadas
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
    func calculateStateTaxes() -> Double {
        let stateTax = (stateTaxes / 100) * totalSpend
        return stateTax
    }
    
    func calculateIofTaxes() -> Double {
        let sum = totalSpend + calculateStateTaxes()
        let iofTax = (iofTaxes / 100) * sum
        print("iofTax \(iofTax)")
        return iofTax
    }
    
    func calculateTotal() -> Double {
        let total = (totalSpend + calculateStateTaxes()) * dolarExchange
        return total
    }
    
    func calculateTotalWithIOF() -> Double {
        let total = (totalSpend + calculateStateTaxes() + calculateIofTaxes()) * dolarExchange
        return total
    }

    // converter um TextField para Double
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    //converter um Double para String, ja formatando com a moeda desejada
    func getFormattedValue(value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
}


