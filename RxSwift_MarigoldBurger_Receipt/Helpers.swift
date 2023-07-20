//
//  Helpers.swift
//  RxSwift_MarigoldBurger_Receipt
//
//  Created by 황홍필 on 2023/07/18.
//

import Foundation


extension Int {
    func currencyKR() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}



