//
//  ContentView.swift
//  BuckJaw Login Screen Biometrics Template
//
//  Created by Joseph  DeWeese on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    //MARK:  PROPERTIES
    @AppStorage("status") var logged = false
    
    
    
    var body: some View {
        
        
        NavigationView {
            if logged {
                
                Text("user is logged in....")
                    .navigationBarHidden(false)
                
            }
            else {
                Home()
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
