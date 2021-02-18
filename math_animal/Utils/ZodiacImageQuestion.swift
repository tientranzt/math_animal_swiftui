//
//  ZodiacImageQuestion.swift
//  math_animal
//
//  Created by tientran on 25/01/2021.
//

import SwiftUI

struct ZodiacImageQuestion: View {
    var zodiacName : String
    var body: some View {
        Image(zodiacName)
            .resizable()
            .frame(width: 70, height: 70, alignment: .center)
            .background(Color("MainGreen"))
            .clipShape(Circle())
            .padding(.all, 5)    }
}

struct ZodiacImageQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ZodiacImageQuestion(zodiacName: "ti")
    }
}
