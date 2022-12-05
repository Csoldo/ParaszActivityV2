//
//  RealEstate.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import CoreLocation
import SwiftUI
import MapKit

struct RealEstate: Identifiable {
    let id: Int
    let image: String
    let price: Int
    let bedrooms: Int
    let bathrooms: Int
    let size: Int
    let description: String
    let zip: String
    let city: String
    let address: String
    let distance: Double
    let location: CLLocationCoordinate2D
    let createdDate: Date
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.currencyGroupingSeparator = ""
        return formatter.string(from: NSNumber(value: price)) ?? "Error"
    }
    
    init(house: House, currentLocation: CLLocation) {
        self.id = house.id
        self.image = "https://intern.development.d-tt.dev" + house.image
        self.price = house.price
        self.bedrooms = house.bedrooms
        self.bathrooms = house.bathrooms
        self.size = house.size
        self.description = house.description
        self.zip = house.zip
        self.city = house.city
        self.address = house.zip + " " + house.city
        self.location = CLLocationCoordinate2D(latitude: CLLocationDegrees(house.latitude), longitude: CLLocationDegrees(house.longitude))
        self.distance = 54.3
        self.createdDate = Date.now
    }
}
