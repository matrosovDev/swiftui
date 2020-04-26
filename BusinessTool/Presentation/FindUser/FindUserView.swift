//
//  Login.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 15.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI

struct FindUserView: View {
    
    @State private var email = "negan@gmail.com"
    @State var showWelcomeView = false
    @State var showActivityIndicator = false
    @State private var showingAlert = false
    
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.customLightGray
                if self.showActivityIndicator {
                    VStack {
                        HStack {
                            Spacer()
                            LottieView(named: "19451-blue-preloader",
                                       loop: self.showActivityIndicator,
                                       size: 200
                            )
                            Spacer()
                        }
                    }
                } else {
                    VStack (alignment: .leading, spacing: 10) {
                        
                        HStack {
                            Spacer()
                            Image("Logo").resizable()
                                .frame(width: 160, height: 60, alignment: .center)
                            Spacer()
                        }.padding(.bottom, 40)
                        
                        Text("Email:")
                            .font(.headline)
                        
                        TextField("Enter your email", text: $email)
                            .padding(.all)
                            .font(Font.system(size: 18, weight: .medium, design: .rounded))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.customCorporateBlue, lineWidth: 1))
                            .foregroundColor(Color.customCorporateBlue)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        Button(action: {
                        }) {
                            Text("Forgot password?")
                                .fontWeight(.bold)
                                .font(.headline)
                                .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 0))
                                .foregroundColor(.customCorporateBlue)
                        }
                        
                        HStack {
                            Button(action: {
                            }) {
                                Text("Create account")
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                    .padding()
                                    .foregroundColor(.customCorporateBlue)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                self.showActivityIndicator.toggle()
                                self.fetchUser(with: self.email)
                            }) {
                                Text("Next")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
                                    .background(Color.customCorporateBlue)
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                            }.alert(isPresented: $showingAlert) {
                                Alert(title: Text("Error message"), message: Text("We have not found email."), dismissButton: .default(Text("OK")))
                            }
                            
                            NavigationLink(destination: WelcomeView(), isActive: $showWelcomeView) { EmptyView() }
                        }
                        
                    }.padding(.horizontal, 30)
                        .modifier(AdaptsToKeyboard())
                }
                
            }
            .navigationBarTitle(Text("Login"))
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func fetchUser(with email: String) {
        print(">>>>>FETCH USER IN BACKGROUND")
        userService.getUser(with: email) { (result) in
            print(">>>>>SHOW WELCOM VIEW OR ERROR")
            DispatchQueue.main.async {
                self.setPropertyInitialState()
                
                switch result {
                case .success(_):
                    self.showWelcomeView = true
                    break
                case .failure:
                    self.showingAlert = true
                    break
                }
                
            }
            
        }
    }
    
    func setPropertyInitialState() {
        showWelcomeView = false
        showActivityIndicator = false
        showingAlert = false
    }
    
}

struct FindUserView_Previews: PreviewProvider {
    static var previews: some View {
        FindUserView()
    }
}
