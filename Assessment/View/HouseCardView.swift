//
//  HouseCardView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI

struct HouseCardView: View {
    let realEstate: RealEstate
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: realEstate.image), scale: 2) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            } placeholder: {
                Color.gray
            }
            .padding(.leading)
            
            VStack(alignment: .leading) {
                Text("$ " + realEstate.formattedPrice)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(Color(StringKeys.strong))
                
                Text(realEstate.zip + " " + realEstate.city)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color(StringKeys.light))
                
                Spacer()
                
                IconListView(realEstate: realEstate)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white,in: RoundedRectangle(cornerRadius: 12))
    }
}
