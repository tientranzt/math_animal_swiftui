//
//  GuidanceViewModel.swift
//  math_animal
//
//  Created by tientran on 25/01/2021.
//

import SwiftUI

class GuidanceViewModel: ObservableObject {
    @Published var listOfZodiac : [ZodiacModel]  = []
   
    
    func getZodiacList() -> [ZodiacModel] {
        return listOfZodiac
    }
    
    func loadListZodiac()  {
        listOfZodiac = ZodiacData.getListZodiac()
    }
    
}
