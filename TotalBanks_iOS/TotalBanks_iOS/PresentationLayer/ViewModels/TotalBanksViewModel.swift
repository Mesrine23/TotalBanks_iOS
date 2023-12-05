//
//  TotalBanksViewModel.swift
//  TotalBanks_iOS
//
//  Created by Panagiotis Palamidas on 4/12/23.
//

import Foundation

class TotalBanksViewModel: ObservableObject {
    
    @Published var bankInfo: [String: Double] = [:]
    @Published var grandTotal: Double = 0.0
    
    init() {
//        bankInfo = getBankInfoFromUserDefaults()
        bankInfo = [
            "AlphaBank": 209.99,
            "EuroBank": 892.63,
            "Revolut": 48.02,
            "Test": 0
        ]
        grandTotal = calculateGrandTotal()
    }
    
    public func updateBankInfo() {
        bankInfo = getBankInfoFromUserDefaults()
    }

}

extension TotalBanksViewModel {
    
    private func getBankInfoFromUserDefaults() -> [String: Double] {
        guard let storedBankInfo = UserDefaults.standard.dictionary(forKey: "bankInfo") as? [String: Double] else {
            return [:]
        }
        return storedBankInfo
    }
    
    private func calculateGrandTotal() -> Double {
        bankInfo.values.reduce(0, +)
    }
    
}
