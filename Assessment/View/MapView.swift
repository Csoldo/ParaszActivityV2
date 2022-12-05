//
//  MapView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 12. 03..
//

import SwiftUI
import CoreLocation
import MapKit

struct MapView: View {
    let location: CLLocationCoordinate2D
    
    @State private var pointOfInterests = [AnnotatedItem]()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: pointOfInterests) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
            .onAppear {
                region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                pointOfInterests.append(AnnotatedItem(name: "Real Estate", coordinate: location))
            }
    }
}
