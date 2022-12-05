//
//  Extensions.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI
import CoreLocation
import MapKit

extension View {
    func iconModifier() -> some View {
        modifier(CustomIconModifier())
    }
}

extension MKCoordinateRegion {
    
    static func goldenGateRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.819527098978355, longitude:  -122.47854602016669), latitudinalMeters: 5000, longitudinalMeters: 5000)
    }
    
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}

extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

//MARK: - Colors
extension Color {
    static let customRed = Color("CustomRed")
    static let customDarkGray = Color("CustomDarkGray")
    static let customLightGray = Color("CustomLightGray")
    static let strong = Color("Strong")
    static let medium = Color("Medium")
    static let light = Color("Light")
}

//MARK: - Images
extension Image {
    static let bed = Image("bed-2")
    static let close = Image("close-2")
    static let logo = Image("dtt_logo")
    static let finish = Image("finish")
    static let home = Image("home")
    static let homeLight = Image("home-2")
    static let info = Image("info-button")
    static let infoLight = Image("info-button-2")
    static let leftArrow = Image("left-arrow-2")
    static let pin = Image("pin")
    static let search = Image("search")
    static let shower = Image("shower")
    static let dimensions = Image("square-measurement")
    static let person = Image("undraw_empty_xct9-2")
}
