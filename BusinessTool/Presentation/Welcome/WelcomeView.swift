//
//  WelcomeView.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 15.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var password = ""
    @State var showWelcomeView = false
    @State var showActivityIndicator = false
    
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        
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
                VStack {
                    Image("MountainWelcomBackground").resizable().frame(height: 300).edgesIgnoringSafeArea(.top)
                    
                    CircleImage(image: userService.user.image!)
                        .offset(y: -220)
                        .frame(height: 140)
                        .frame(width: 140)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Spacer()
                            Text(userService.user.username)
                                .font(.headline)
                            Spacer()
                        }
                    }
                    .offset(y: -200)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        
                        Text("Password:")
                            .font(.headline)
                        
                        TextField("Enter your password", text: $password)
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
                                //self.showActivityIndicator.toggle()
                                //self.fetchUser(with: self.email)
                            }) {
                                Text("Next")
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
                                    .background(Color.customCorporateBlue)
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                            }
                            
                            //NavigationLink(destination: WelcomeView(), isActive: $showWelcomeView) { EmptyView() }
                        }
                        
                    }.padding(.horizontal, 30)
                        .modifier(AdaptsToKeyboard())
                        .offset(y: -180)
                    
                    Spacer()
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let userService = UserService()
        userService.user = User(username: "Alex Matrosov", email: "test.developer@gmail.com", avatar: nil, image: Image("ManPlaceholderAvatar"))
        
        return NavigationView { WelcomeView().environmentObject(userService)
        }
    }
}
