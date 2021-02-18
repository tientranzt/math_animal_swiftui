//
//  AnswerButton.swift
//  math_animal
//
//  Created by tientran on 25/01/2021.
//

import SwiftUI

struct AnswerButton: View {

    @EnvironmentObject var playVM: PlayViewModel
    
    var score : Int
    var index : Int
    var body: some View {
        VStack{
            Button(action: {
                playVM.currentAnswerIndex = self.index
                playVM.currentAnswer =  score
                print("ScoreButton : \(score)")
            }, label: {
                Text(String(score))
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(index == playVM.currentAnswerIndex ? Color.white : Color.black)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(index == playVM.currentAnswerIndex ? Color("MainRed") : Color.white)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    )
            })
        }
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(score: 13, index: 0)
            .environmentObject(PlayViewModel())
            .previewLayout(.sizeThatFits)
    }
}
