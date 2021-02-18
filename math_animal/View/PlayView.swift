//
//  PlayView.swift
//  math_animal
//
//  Created by tientran on 24/01/2021.
//

import SwiftUI

struct PlayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var playVM: PlayViewModel

    var body: some View {
        VStack{
            VStack{
                Text("\(playVM.indexScence)/100")
                HStack(alignment: .center){
                    ForEach(playVM.getListZodiac(), id: \.self) { zodiac in
                        ZodiacImageQuestion(zodiacName: zodiac.image)
                    }
                }
            }
            Spacer()
            VStack{
                ZStack {
                    Circle()
                        .stroke(lineWidth: 5.0)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(playVM.getProgressValue(), 1)))
                        .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color("MainGreen"))
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear(duration: 1))
                    Text("\(playVM.getCounterNumber())\"")
                        .font(.largeTitle)
                        .bold()
                }
            }
            .frame(width: 200, height: 200, alignment: .center)

            Spacer()
            
            HStack(spacing: 20){
                ForEach(playVM.getAnswerList(), id: \.self) { answerNumber in
                    AnswerButton(score: answerNumber, index: playVM.getAnswerList().firstIndex(of: answerNumber)!)
                }
            }
            .padding(.bottom, 50)
            
            HStack(spacing: 30){
                
                Button(action: {
                    playVM.stopGame()
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("MainGreen"))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        )
                })
                
                Button(action: {
                    playVM.isShowResult.toggle()
                    playVM.stopGame()
                  
                }, label: {
                    Image(systemName: "checkmark")
                        .resizable()
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("MainRed"))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        )
                })
                .alert(isPresented: $playVM.isShowResult) { () -> Alert in
                    Alert(title: Text("Kết quả"), message: Text(playVM.checkResult() ? "Chính xác" : "Hỏng đúng ùi"), dismissButton: .cancel(Text(playVM.checkResult() ? "Tiếp" : "Thoát"), action: {
                        if playVM.checkResult() {
                            playVM.nextScence()
                        }
                        else{
                            playVM.stopGame()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }))
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            playVM.loadZodiacListWith4Zodiac()
        })
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(PlayViewModel())
    }
}
