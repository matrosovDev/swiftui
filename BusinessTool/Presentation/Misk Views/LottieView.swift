//
//  LottieView.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 02.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI
import Lottie
struct LottieView: View {
    
    let named: String
    let loop: Bool
    let size: CGFloat
    
    var body: some View {
        VStack {
            LottieRepresentable(named: named, loop: loop)
                .frame(width: size, height: size)
        }
    }
}

struct LottieRepresentable: UIViewRepresentable {
    
    let named: String // name of your lottie file
    let loop: Bool
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(named)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        if loop { animationView.loopMode = .loop }
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}
