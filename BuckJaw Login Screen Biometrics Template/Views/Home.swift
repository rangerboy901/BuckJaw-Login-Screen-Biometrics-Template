//
//  Home.swift
//  BuckJaw Login Screen Biometrics Template
//
//  Created by Joseph  DeWeese on 1/29/23.
//

import SwiftUI
import LocalAuthentication



struct Home: View {
    //MARK:   PROPERTIES
    @State var userName = ""
    @State var password = ""
    //when user logs in via email, value will be stored for future biometric login.
    ///TODO:  coredata perhaps ??
    @AppStorage("stored_User") var user = "rangerboy901@icloud.com"
    @AppStorage("status") var logged = false
    
    var body: some View {
        VStack{
            Spacer(minLength: 0)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            //dynamic frame...
                .padding(.horizontal, 35)
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
            .padding(.leading, 15)
            //MARK:  EMAIL/PASSWORD LOGIN
            HStack{
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("EMAIL",  text: $userName)
                    .autocapitalization(.none)
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
                
                SecureField("PASSWORD",  text: $password)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(password == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            //login button
            HStack {
                Button(action: {}, label: {
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("blue"))
                        .clipShape(Capsule( ))
                })
                .opacity(userName != "" && password != "" ? 1 : 0.5)
                .disabled(userName != "" && password !=  ""  ? false : true )
                
                if getBioMetricStatus( ) {
                    
                    Button(action: authenticateUser, label: {
                        
                        //getting biometric type...
                        Image(systemName: LAContext( ).biometryType  ==  .faceID  ?  "faceid" : "touchid")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color("blue"))
                            .clipShape(Circle( ))
                    })
                }
            }
            .padding(.top)
           //MARK:  FORGET PASSWORD BUTTON
            Button(action: {}, label: {
                Text("Forget Password?")
                    .foregroundColor(.accentColor)
            })
            .padding(.top)
            //Signup process..
            Spacer(minLength: 0)
            
            HStack(spacing: 5)  {
                Text("Need an account? ")
                    .foregroundColor(Color.white.opacity(0.6))
               //MARK:  SIGNUP BUTTON
                Button(action: {}, label: {
                    Text("Signup")
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                })
            }
            .padding(.vertical)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }
    //MARK:  RETRIEVE BIOMETRIC TYPE
    func getBioMetricStatus( )-> Bool {
        let context = LAContext()
        if userName == user && context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            return true
        }
        return false
    }
    //MARK:  AUTHENTICATE USER
    func authenticateUser( ) {
        let context =  LAContext()
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To unlock \(userName)") { (status, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            //setting logged status as true...
            withAnimation(.easeOut) {logged = true}
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
