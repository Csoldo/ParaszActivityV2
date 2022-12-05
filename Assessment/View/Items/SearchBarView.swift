//
//  SearchBarView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 22..
//

import SwiftUI

struct SearchBarView: View {
    @State var text: String = ""
    @State var searchPressed: Bool = false
    
    @EnvironmentObject var baseData: BaseViewModel
    
    var body: some View {
        ZStack {
            TextField("Search for a home", text: $text)
                .padding()
                .background(Color.customDarkGray)
                .cornerRadius(8)
                .foregroundColor(.black)
            
            HStack {
                Spacer()
                
                Button {
                    withAnimation {
                        buttonPressed()
                    }
                } label: {
                    if searchPressed {
                        Image.close
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.medium)
                            .padding(.trailing)
                    }else {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.medium)
                            .padding(.trailing)
                    }
                }
            }
        }
        .padding()
    }
    
    func buttonPressed() {
        if text != "" {
            baseData.searchFilter = text
            searchPressed = true
        } else {
            baseData.searchFilter = ""
            self.text = ""
            searchPressed = false
        }
        
    }
}
