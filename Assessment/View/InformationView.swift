//
//  InformationView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        VStack {
            HStack {
                Text("About".uppercased())
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
            
            Text(StringKeys.lorem)
                .padding()
                .foregroundColor(.black)
            
            HStack {
                Text("Design and Development")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
            
            HStack() {
                Image.logo
                    .resizable()
                    .padding()
                    .scaledToFit()
                    .frame(maxWidth: 200)
                
                VStack {
                    Text("by DTT")
                    
                    Link("d-tt.nl", destination: URL(string: "https://www.d-tt.nl")!)
                }
                
                Spacer()
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
