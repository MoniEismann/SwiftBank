//
//  BalanceView.swift
//  SwiftBank
//
//  Created by Ândriu F Coelho on 27/12/23.
//

import SwiftUI

struct BalanceView: View {
    
    // MARK: - Attributes
    
    let balanceResponse: BalanceResponse
    
    // MARK: - UI Components
    
    private let grayColor = Color(red: 243.0/255.0,
                                      green: 243.0/255.0,
                                      blue: 243.0/255.0)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 7)
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
            .overlay(
                VStack(alignment: .leading) {
                    balance
                        .padding(.horizontal)
                    mainActions
                }
            )
    }
    
    var balance: some View {
        VStack {
            HStack {
                Text("Conta")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 10))
            }
            
            HStack {
                Text(balanceResponse.amount.value.text)
                    .font(.system(size: CGFloat(balanceResponse.amount.value.fontSize)))
                    .fontWeight(.semibold)
                Spacer()
            }
        }
    }
    
    var mainActions: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 13) {
                ForEach(balanceResponse.items, id: \.id) { mainAction in
                    Button {
                        let routerHandler = RouterHandler()
                        guard let deeplink = URL(string: mainAction.deeplink ?? "") else { return }
                        Task {
                            if let route = await routerHandler.find(from: deeplink) {
                                let routerManager = NavigationRouter.shared
                                routerManager.push(to: route)
                            }
                        }
                        
                    } label: {
                        VStack {
                            Circle()
                                .fill(grayColor)
                                .frame(width: 55, height: 55)
                                .overlay {
                                    Image(mainAction.icon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                }
                            
                            
                            Text(mainAction.title.text)
                                .font(.system(size: CGFloat(mainAction.title.fontSize)))
                                .foregroundColor(.black)
                                .fontWeight(.light)
                        }
                    }
                    .frame(width: 80, height: 70)
                }
            }
            .frame(height: 85)
        }
    }
}

//struct BalanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        BalanceView(balanceResponse: <#BalanceResponse#>)
//            .previewLayout(.sizeThatFits)
//    }
//}
