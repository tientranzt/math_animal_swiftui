//
//  HomeView.swift
//  math_animal
//
//  Created by tientran on 17/01/2021.
//

import SwiftUI
import ImagePickerView

enum ActiveSheet : Identifiable {
    case guidanceView, imagePickerView
    
    var id : Int {
        hashValue
    }
}

struct HomeView: View {
    
    @ObservedObject var homeVM = HomeViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView{
                
                ScrollView{
                    
                    VStack{
                        
                        VStack{
                        
                            VStack{
                                ZStack{
                                    Image(uiImage: ((homeVM.userImage == nil) ? UIImage(named: "user") : UIImage(data: homeVM.userImage!))!)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color("MainYellow"), lineWidth: 2))
                                    
                                    Button(action: {
                                        homeVM.activeSheet = .imagePickerView
                                    }, label: {
                                        Image(systemName: "pencil.circle")
                                    })
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(x: 40, y: 30)
                                }
                                
                                HStack(alignment: .center){
                                    TextField("YOUR NAME", text: $homeVM.username)
                                        .foregroundColor(.white)
                                        .accentColor(.white)
                                        .multilineTextAlignment(.center)
                                    
                                }.padding(.horizontal, 30)
                            }
                            .padding(.top, 50
                            )
                            
                            Divider()
                                .background(Color.white)
                                .padding(.horizontal, 30)
                            
                            VStack{
                                
                                Text("Good For brain")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.bottom, 10)
                                
                                HStack(spacing: 50){
                                    
                                    CircleTextIcon(imageName: "lightbulb", textTitle: "Smater")
                                    CircleTextIcon(imageName: "staroflife", textTitle: "Reflex")
                                    CircleTextIcon(imageName: "face.smiling", textTitle: "Fun")
                                    
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.bottom, 15)
                            
                        }
                        .background(LinearGradient(gradient: Gradient(colors: [Color("SubGreen"), Color("MainGreen")]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                        .edgesIgnoringSafeArea(.all)
                        
                        VStack(alignment: .center, spacing:50){
                            Text("Brain Traning")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(Color("MainGreen"))
                            
                            NavigationLink(
                                destination: PlayView(),
                                label: {
                                    Text("START")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 40)
                                        .padding(.vertical, 22)
                                        .background(Color("MainGreen"))
                                        .cornerRadius(35)
                                        .shadow(radius: 3)
                                })
                            
                            Button(action: {
                                homeVM.activeSheet = .guidanceView
                            }, label: {
                                HStack{
                                    Image(systemName: "questionmark.circle")
                                        .foregroundColor(.white)
                                    
                                    Text("Guidance")
                                        .bold()
                                        .foregroundColor(.white)
                                }
                            })
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(Color("MainRed"))
                            .cornerRadius(25)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity )
                        
                    }
                    .sheet(item: $homeVM.activeSheet, content: { item in
                        switch item {
                        case .imagePickerView :
                            ImagePickerView(sourceType: .savedPhotosAlbum) { image in
                                if let data = image.pngData(){
                                    homeVM.userImage = data
                                }
                            }
                        case .guidanceView :
                            GuidanceView(guidanceVM: GuidanceViewModel())
                        }
                    })
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
