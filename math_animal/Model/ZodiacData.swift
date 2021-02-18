//
//  ZodiacData.swift
//  math_animal
//
//  Created by tientran on 25/01/2021.
//

import Foundation


struct ZodiacData {
    
    static func getListZodiac() -> [ZodiacModel] {
        
        let currentLanguage = Locale.preferredLanguages[0]
        
        let list =  Bundle.main.decode([ZodiacModel].self, from: currentLanguage == "vi" ? "vi.json" : "en.json")
        
        return list
    }
}
