//
//  GuidanceView.swift
//  math_animal
//
//  Created by tientran on 17/01/2021.
//

import SwiftUI

struct GuidanceView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var guidanceVM = GuidanceViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color("MainRed"))
                                .padding(.trailing, 10)
                        })
                    }
                    
                    Text("- Chọn 1 trong 4 đáp án")
                    Text("- Đáp án là tổng điểm các thần thú")
                    Text("Ví dụ: ")
                    HStack{
                        HStack{
                            Image("ti")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                            Text("(1)")
                        }
                        Text("+")
                        
                        HStack{
                            Image("mao")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                            Text("(4)")
                        }
                        Text("=")
                        Text("5")
                    }.padding(.top, 20)
                    
                }.foregroundColor(Color("MainGreen"))
                
                VStack{
                    ForEach(guidanceVM.getZodiacList(), id: \.self) { zodiac in
                        ZodiacAndPointInfo(zodiacImageName: zodiac.image, nameOfZodiac: zodiac.name, score: zodiac.score)
                    }
                }.padding(.top, 30)
            }
            .padding(.top, 20)
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                guidanceVM.loadListZodiac()
            })
        }
    }
}

struct GuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView(guidanceVM: GuidanceViewModel())
    }
}
