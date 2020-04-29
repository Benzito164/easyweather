//
//  TopSearchBar.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI



struct TopSearchBar : View {
     @State var show = false
     @State var text = ""
    @State var showSettingsScreen = false
    
    var body: some View {
        VStack(spacing:20){
            HStack {
                if !self.show {
                    Text("Search")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.purple)

                }
                Spacer(minLength: 0)
                HStack{
                    
                    if self.show {
                        VStack{
                            HStack{
                                loadImageFromResource(imageName: "search.png")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color.purple)
                                .scaledToFit()
                                .padding(.horizontal,8)

                                TextField("Search.....", text: self.$text)
                                Button(action: {
                                    withAnimation {
                    
                                         self.show.toggle()
                                         self.text = ""
                                    }
                                  
                                }){
                                    Image(systemName: "xmark").foregroundColor(.purple)
                                }
                                .padding(.horizontal,8)
                            }.padding()
                            
                            ResultTableview(searchText: text)
                        }

                    }
                    else {
                        Button(action: {
                            withAnimation {
                                 self.show.toggle()
                                
                            }
                         }){
                            loadImageFromResource(imageName: "search.png")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.purple)
                                .scaledToFit()
                                .padding(10)
                         }
                        
                    }
                }
                .padding(self.show ? 10 : 0)
                .cornerRadius(20)
                Button(action: {
                    self.showSettingsScreen.toggle()
                }){
                    loadImageFromResource(imageName:"SettingsIcon.png")
                        //.renderingMode(Image.TemplateRenderingMode.original)
                        .resizable()
                        .buttonStyle(GradientButtonStyle())
                        .frame(width: 30, height: 30)
                        .foregroundColor(.purple)
                }.sheet(isPresented: $showSettingsScreen){
                    MainSettingsScreen()
                }
            
            }
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)!+15)
            .padding(.horizontal)
            .padding(.bottom,10)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TopSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        TopSearchBar().previewDevice(PreviewDevice.init(rawValue: "iPhone SE"))
    }
}
