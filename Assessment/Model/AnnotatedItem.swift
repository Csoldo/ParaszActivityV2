//
//  AnnotatedItem.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 12. 03..
//

import Foundation
import CoreLocation

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
