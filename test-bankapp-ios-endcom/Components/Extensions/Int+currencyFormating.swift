//
//  Int+currencyFormating.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 03/10/21.
//

import Foundation

class CurrencyFormatter {
    static var outputFormatter = CurrencyFormatter.create()
    class func create(locale: Locale = Locale.current,
                      groupingSeparator: String? = nil,
                      decimalSeparator: String? = nil,
                      style: NumberFormatter.Style = NumberFormatter.Style.currency) -> NumberFormatter {
        let outputFormatter = NumberFormatter()
        outputFormatter.locale = locale
        outputFormatter.decimalSeparator = decimalSeparator ?? locale.decimalSeparator
        outputFormatter.groupingSeparator = groupingSeparator ?? locale.groupingSeparator
        outputFormatter.numberStyle = style
        return outputFormatter
    }
}

extension Numeric {
    func toCurrency(formatter: NumberFormatter = CurrencyFormatter.outputFormatter) -> String {
        guard let num = self as? NSNumber else { return "$0" }
        formatter.minimumFractionDigits = 0
        var formatedSting = formatter.string(from: NSNumber(value: num.int32Value ))
        guard let locale = formatter.locale else { return formatedSting ?? "$0" }
        if let separator = formatter.groupingSeparator, let localeValue = locale.groupingSeparator {
            formatedSting = formatedSting?.replacingOccurrences(of: localeValue, with: separator)
        }
        if let separator = formatter.decimalSeparator, let localeValue = locale.decimalSeparator {
            formatedSting = formatedSting?.replacingOccurrences(of: localeValue, with: separator)
        }
        return formatedSting ?? "$0"
    }
    
    func toCurrencyWithCents(formatter: NumberFormatter = CurrencyFormatter.outputFormatter) -> String {
            guard let num = self as? NSNumber else { return "$0" }
            formatter.minimumFractionDigits = 2
            var formatedSting = formatter.string(from: NSNumber(value: num.doubleValue ))
            guard let locale = formatter.locale else { return formatedSting ?? "$0" }
            if let separator = formatter.groupingSeparator, let localeValue = locale.groupingSeparator {
                formatedSting = formatedSting?.replacingOccurrences(of: localeValue, with: separator)
            }
            if let separator = formatter.decimalSeparator, let localeValue = locale.decimalSeparator {
                formatedSting = formatedSting?.replacingOccurrences(of: localeValue, with: separator)
            }
            return formatedSting ?? "$0"
        }
}
