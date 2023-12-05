//
//  Double+.swift
//  TotalBanks_iOS
//
//  Created by Panagiotis Palamidas on 4/12/23.
//

import Foundation

extension Double {
    
    func convertToStringWith2Digits() -> String {
        String(format: "%.2f", self)
    }
    
}
