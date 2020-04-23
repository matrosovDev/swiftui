//
//  CircleImage.swift
//  TeamReport
//
//  Created by Alexander Matrosov on 26.02.2020.
//  Copyright © 2020 Alexander Matrosov. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .aspectRatio(contentMode: .fill)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("Logo"))
    }
}
