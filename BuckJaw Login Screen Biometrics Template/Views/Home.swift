//
//  Home.swift
//  BuckJaw Login Screen Biometrics Template
//
//  Created by Joseph  DeWeese on 1/29/23.
//

import SwiftUI

struct Home: View {
    //MARK:   PROPERTIES
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            
            Spacer(minLength: 0)
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .padding(.vertical)
            
            HStack {
                
                VStack(alignment:  .leading, spacing: 12) {
                    
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Please login to continue")
                        .foregroundColor(Color.white.opacity(0.50))
                }
                
                Spacer(minLength: 0)
            }
            .padding()
            //MARK:  EMAIL/PASSWORD LOGIN
            HStack{
                
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("EMAIL",  text: $userName)
            }
            .padding()
            .background(Color.white.opacity(userName == "" ? 0  : 0.12))
            .cornerRadius(12)
            .padding(.horizontal)
            
            HStack{
                
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("PASSWORD",  text: $password)
            }
            .padding()
            .background(Color.white.opacity(password == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            //login button
            
            Button(action: {}, label: {
                Text("LOGIN")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("bg"))
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .background(Color("blue"))
                    .clipShape(Capsule( ))
            })
            .padding(.top)
            
            
            Button(action: {}, label: {
                Text("Forget Password?")
                    .foregroundColor(Color("blue"))
            })
            .padding(.top)
            
            Spacer(minLength: 0)
            //MARK:  SIGN UP
            
            
            
            
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
