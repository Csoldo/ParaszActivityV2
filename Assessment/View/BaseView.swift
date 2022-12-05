//
//  BaseView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 22..
//

import SwiftUI
import CoreLocation

struct BaseView: View {
    @EnvironmentObject var baseData: BaseViewModel
    
    /*init() {
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 8),
            colors: [
                UIColor.clear.cgColor,
                UIColor.black.withAlphaComponent(0.1).cgColor
            ]
        )

        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemGray6
                
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().barTintColor = UIColor(Color.blue)
        UITabBar.appearance().tintColor = UIColor(Color.red)
        //UITabBar.appearance().unselectedItemTintColor = UIColor(Color.customDarkGray)
    }
    
    init() {
        UITabBar.appearance().selectedItem?.badgeColor = UIColor(Color.red)
        UITabBar.appearance().tintColor = UIColor(Color.red)
    }*/
    
    var body: some View {
        TabView(selection: $baseData.currentTab) {
            HomeView()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.customLightGray)
                .tabItem {
                    Image.home
                        .padding(.top, 8)
                }
                .tag(Tab.Home)
            
            InformationView()
                .tabItem {
                    Image.info
                        .padding(.top, 8)
                }
                .tag(Tab.Info)
        }
        .onAppear {
            UITabBar.appearance().barTintColor = .white
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .accentColor(Color.red)
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
