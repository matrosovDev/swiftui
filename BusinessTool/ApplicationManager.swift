//
//  ApplicationManager.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 14.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import Foundation

class ApplicationManager {
    
    let thirdPartyConfig: ThirdPartyConfig!
    
    init() {
        thirdPartyConfig = ThirdPartyConfig()
    }
    
    func initilize3rdPartyLibraries() {
        thirdPartyConfig.configurateBack4App()
    }
}
