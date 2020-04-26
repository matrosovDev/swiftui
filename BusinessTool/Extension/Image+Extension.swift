//
//  Image+Extension.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 26.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI

extension Image {
    
    public init(data: Data?, placeholder: String) {
        guard let data = data,
            let uiImage = UIImage(data: data) else {
                self = Image(placeholder)
                return
        }
        self = Image(uiImage: uiImage)
    }
}
