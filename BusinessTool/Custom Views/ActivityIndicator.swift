//
//  ActivityIndicator.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 15.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: View {
    @State var animateTrimPath = false
    @State var rotaeInfinity = false
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Path { path in
                    path.addLines([
                        .init(x: 2, y: 1),
                        .init(x: 1, y: 0),
                        .init(x: 0, y: 1),
                        .init(x: 1, y: 2),
                        .init(x: 3, y: 0),
                        .init(x: 4, y: 1),
                        .init(x: 3, y: 2),
                        .init(x: 2, y: 1)
                    ])
                }
                .trim(from: animateTrimPath ? 1/0.99 : 0, to: animateTrimPath ? 1/0.99 : 1)
                .scale(50, anchor: .topLeading)
                .stroke(Color.yellow, lineWidth: 20)
                .offset(x: 110, y: 350)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                .onAppear() {
                    self.animateTrimPath.toggle()
                }
            }
            .rotationEffect(.degrees(rotaeInfinity ? 0 : -360))
            .scaleEffect(0.3, anchor: .center)
            .animation(Animation.easeInOut(duration: 1.5)
            .repeatForever(autoreverses: false))
            .onAppear(){
                self.rotaeInfinity.toggle()
            }
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
