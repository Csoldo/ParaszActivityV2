//
//  AssessmentApp.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI
import CoreLocation

@main
struct AssessmentApp: App {
    @StateObject var baseData = BaseViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(baseData)
                .environment(\.colorScheme, .light)
                .onAppear {
                    ApiCall().getHousesFromApi { (houses) in
                        for house in houses {
                            print(house.id)
                            baseData.realEstates.append(RealEstate(house: house, currentLocation: CLLocation()))
                        }
                    }
                }
        }
    }
}
