//
//  HomeViewModel.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 22..
//

import Foundation

class BaseViewModel: ObservableObject {
    @Published var currentTab: Tab = .Home
    
    @Published var realEstates = [RealEstate]()
    
    @Published var homeTab = "Sneakers"
    
    @Published var selectedRealEstate: RealEstate?
    
    @Published var searchFilter = ""
    
    @Published var sortAscending = true
    
    var filteredEstates: [RealEstate] {
        var estates = [RealEstate]()
        if sortAscending {
            estates = realEstates.sorted(by: { $0.distance > $1.distance })
        } else {
            estates = realEstates.sorted(by: { $0.distance < $1.distance })
        }
        
        if searchFilter == "" {
            return estates
        }
        return estates.filter {
            $0.city.contains(searchFilter) ||
            $0.zip.contains(searchFilter)
        }
    }
}

//Enum for tabs
enum Tab: String {
    case Home = "home"
    case Info = "info-button"
}
