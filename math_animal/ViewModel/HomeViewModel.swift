//
//  HomeViewModel.swift
//  math_animal
//
//  Created by tientran on 30/01/2021.
//

import SwiftUI

class  HomeViewModel: ObservableObject {
    
    @Published var activeSheet : ActiveSheet?
    @AppStorage("userImage") var userImage : Data?
    @AppStorage("username") var username : String = ""
    
}
