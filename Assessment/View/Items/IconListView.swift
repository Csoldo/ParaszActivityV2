//
//  IconListView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 12. 03..
//

import SwiftUI

struct IconListView: View {
    let realEstate: RealEstate
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 5) {
                Image.bed
                    .iconModifier()
                
                Text("\(realEstate.bedrooms)")
                    .iconModifier()
            }
            
            HStack(spacing: 5) {
                Image(StringKeys.shower)
                    .iconModifier()
                
                Text("\(realEstate.bathrooms)")
                    .iconModifier()
            }
            
            HStack(spacing: 5) {
                //Image("square.stack.3d.up")
                Image(StringKeys.dimensions)
                    .iconModifier()
                
                Text("\(realEstate.size)")
                    .iconModifier()
            }
            
            HStack(spacing: 5) {
                Image(StringKeys.pin)
                    .iconModifier()
                
                Text("52.4 km")
                    .iconModifier()
            }
        }
    }
}
