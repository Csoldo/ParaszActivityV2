//
//  SingleHouseView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI
import CoreLocation
import MapKit

struct SingleHouseView: View {
    @EnvironmentObject var baseData: BaseViewModel
    
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        if let realEstate = baseData.selectedRealEstate {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack(alignment: .top) {
                    
                    AsyncImage(url: URL(string: realEstate.image), scale: 2) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    } placeholder: {
                        Color.gray
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom)
                    
                    VStack {
                        HStack {
                            Text("$ " + realEstate.formattedPrice)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color(StringKeys.strong))
                            
                            Spacer()
                            
                            IconListView(realEstate: realEstate)
                        }.padding()
                        
                        HStack {
                            Text("Description")
                                .padding()
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color(StringKeys.strong))
                            
                            Spacer()
                        }
                        
                        Text(realEstate.description)
                            .foregroundColor(.black)
                            .padding()
                        
                        HStack {
                            Text("Location")
                                .padding()
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color(StringKeys.strong))
                            
                            Spacer()
                        }
                        
                        MapView(location: realEstate.location)
                            .padding(22)
                            .padding(.bottom, 80)
                            .frame(maxWidth: .infinity)
                            .frame(height: 480)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(.white)
                    )
                    //.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .offset(y: 240)
                }
                .padding(.bottom, 300)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            .transition(.opacity)
            .toolbar(.hidden, for: .tabBar)
            .overlay (
                HStack {
                    VStack {
                        Button {
                            withAnimation{
                                baseData.selectedRealEstate = nil
                            }
                        } label: {
                            Image.leftArrow
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .padding(.top, 24)
                        .padding(.leading, 16)
                        
                        Spacer()
                    }
                    Spacer()
                }
            )
        }
    }
}

struct SingleHouseView_Previews: PreviewProvider {
    static let house = House(id: 2, image: "/uploads/house1.jpg", price: 285000, bedrooms: 5, bathrooms: 3, size: 275, description: "Prachtige monumentale", zip: "2034 ZH", city: "Amsterdam", latitude: 52, longitude: 5, createdDate: "2020-05-07")
    static var previews: some View {
        SingleHouseView()
    }
}

