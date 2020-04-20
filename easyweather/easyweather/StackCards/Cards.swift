//
//  Cards.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI



struct Cards:View {
    @State var backViewSize : CGFloat = 80
    @State var size : CGSize = .zero
    var body: some View {
        GeometryReader{reader in
            ZStack{
                ZStack{
                    Color.blue
                    VStack(spacing: 5){
                        HStack{
                            LottieView(animationName: "storm").frame(width: 100, height: 100)
                            Text("Rainy")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            Spacer()
                            Spacer()
                        }.padding()
                        Spacer()
                    }

                }.frame(width: reader.size.width - self.backViewSize - 10, height: 200)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -160)
                
                ZStack{
                    Color.orange
                    VStack(spacing: 5){
                        HStack{
                            LottieView(animationName: "storm").frame(width: 100, height: 100)
                            Text("Rainy")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            Spacer()
                            Spacer()
                        }.padding()
                        Spacer()
                    }

                }.frame(width: reader.size.width - self.backViewSize, height: 200)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -80)
                
              //  VStack{
                    ZStack{
                        Color.red
                        VStack(spacing: 5){
                            HStack{
                                LottieView(animationName: "storm").frame(width: 100, height: 100)
                                Text("Rainy")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.white)
                                Spacer()
                                Spacer()
                            }.padding()
                            Spacer()
                        }

                }.frame(width: reader.size.width - 74 , height: 200)
                .cornerRadius(20)
                .shadow(radius: 20)
                    .gesture(DragGesture().onChanged({ (value) in
                        self.size = value.translation
                        self.backViewSize = 50
                    })
                        .onEnded({ (value) in
                            self.size = .zero
                            self.backViewSize = 80
                        })
                )
                    .offset(self.size)
           }
            
        }
        .animation(.spring())
    }
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
          Cards()
    }
}
