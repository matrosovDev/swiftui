//
//  3rdPartyConfig.swift
//  BusinessTool
//
//  Created by Alexander Matrosov on 14.04.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import Foundation
import Parse

class ThirdPartyConfig {
    
    func configurateBack4App() {
        let configuration = ParseClientConfiguration {
            $0.applicationId = "rIWVPPJC8Y7WvGxM6qXmH51ddIraQv0ah1c6UNND"
            $0.clientKey = "oZZGo0Co07ZwXU6fNe4e85kKcmsoCPRtJInnNxEG"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        saveInstallationObject()
    }
    
    func saveInstallationObject() {
        if let installation = PFInstallation.current(){
            installation.saveInBackground {
                (success: Bool, error: Error?) in
                if (success) {
                    print("You have successfully connected your app to Back4App!")
                } else {
                    if let myError = error{
                        print(myError.localizedDescription)
                    }else{
                        print("Uknown error")
                    }
                }
            }
        }
    }
    
}
