//
//  RealEstatesView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI
import CoreLocation

struct RealEstatesView: View {
    @State var realEstates = [RealEstate]()
    var body: some View {
        ForEach(realEstates) { realEstate in
            VStack {
                HouseCardView(realEstate: realEstate)
                Text("\(realEstate.id)")
            }
            
        }
    }
}

struct RealEstatesView_Previews: PreviewProvider {
    static var previews: some View {
        RealEstatesView()
    }
}
