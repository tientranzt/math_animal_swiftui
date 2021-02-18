//
//  CircleTextIcon.swift
//  math_animal
//
//  Created by tientran on 18/01/2021.
//

import SwiftUI

struct CircleTextIcon : View {
    let imageName : String
    let textTitle : String
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .frame(width: 50, height: 50)
                .background(Color("MainYellow"))
                .clipShape(Circle())
                .shadow(radius: 2 )
                .foregroundColor(.white)
            Text(textTitle)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
    }
}


struct CircleTextIcon_Previews: PreviewProvider {
    static var previews: some View {
        CircleTextIcon(imageName: "circle", textTitle: "Smarter")
            .previewLayout(.sizeThatFits)
    }
}
