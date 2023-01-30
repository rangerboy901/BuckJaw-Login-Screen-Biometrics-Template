//
//  ContentView.swift
//  BuckJaw Login Screen Biometrics Template
//
//  Created by Joseph  DeWeese on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationView {
            Home()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
