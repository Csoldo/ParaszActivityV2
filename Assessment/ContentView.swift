//
//  ContentView.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var baseData: BaseViewModel
    var body: some View {
        BaseView().environmentObject(baseData)
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
