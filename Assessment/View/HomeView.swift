//
//  HomeView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var baseData: BaseViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center){
                
                HStack {
                    Text("DTT REAL ESTATE")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(Color.strong)
                
                    Spacer()
                }
                .padding()
                
                
                SearchBarView()
                    .environmentObject(baseData)
                
                if (!baseData.filteredEstates.isEmpty) {
                    ForEach(baseData.filteredEstates) { realEstate in
                        HouseCardView(realEstate: realEstate)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .onTapGesture {
                                withAnimation{
                                    baseData.selectedRealEstate = realEstate
                                }
                            }
                    }
                } else {
                    Spacer()
                    Image.person
                        .resizable()
                        .scaledToFit()
                    
                    Text("No reseults found!\nPerhaps try another search?")
                        .font(.system(size: 24))
                        .foregroundColor(Color.medium)

                    Spacer()
                }
            }
            .padding(.bottom, 200)
        }
        .opacity(baseData.selectedRealEstate == nil ? 1 : 0)
        .overlay(
            SingleHouseView()
                .environmentObject(baseData)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
