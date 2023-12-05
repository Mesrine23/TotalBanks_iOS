//
//  ContentView.swift
//  TotalBanks_iOS
//
//  Created by Panagiotis Palamidas on 4/12/23.
//

import SwiftUI

struct TotalBanksView: View {
    @StateObject var viewModel = TotalBanksViewModel()
    
    var body: some View {
        NavigationView(content: {
            
            ZStack {
                backgroundColor
                VStack {
                    eachBankInfo
                    Spacer()
                    grandTotal
                    addNewBank
                }
            }
            .ignoresSafeArea()
            
        })
        
    }
    
    var backgroundColor: some View {
        Color("background")
    }
    
    var eachBankInfo: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.bankInfo.sorted(by: <), id: \.key) { bank, balance in
                HStack {
                    Text(bank)
                    Spacer()
                    Text("\(balance.convertToStringWith2Digits())€")
                }
            }
        }
        .padding(.top, 100)
        .padding(.horizontal, 16)
    }
    
    var grandTotal: some View {
        Text("Grand Total: \(viewModel.grandTotal.convertToStringWith2Digits())€")
            .bold()
            .padding(.bottom, 16)
    }
    
    var addNewBank: some View {
        VStack {
            separator
            plusButton
        }
        .padding(.bottom, 25)
    }
    
    var separator: some View {
        Color(.black)
            .frame(maxWidth: .infinity, maxHeight: 3)
    }
    
    var plusButton: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 75))
                .foregroundColor(.green)
        })
    }
    
}

#Preview {
    TotalBanksView()
}
