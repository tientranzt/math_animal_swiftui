//
//  ZodiacAndPointInfo.swift(
//  math_animal
//
//  Created by tientran on 22/01/2021.
//

import SwiftUI

struct ZodiacAndPointInfo: View {
    
    var zodiacImageName : String
    var nameOfZodiac : String
    var score : Int
    
    var body: some View {
        HStack{
            Image(zodiacImageName)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(nameOfZodiac)
            Spacer()
            Text(String(score))
            
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 20)
    }
}

struct ZodiacAndPointInfo_Previews: PreviewProvider {
    static var previews: some View {
        ZodiacAndPointInfo(zodiacImageName: "suu", nameOfZodiac: "Trâu", score: 2)
            .previewLayout(.sizeThatFits)
    }
}
