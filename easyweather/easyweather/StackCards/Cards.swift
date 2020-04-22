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
    @State var secoundCardSize : CGSize = .zero
    
    fileprivate func secoundCard(currentReader : GeometryProxy) -> some View {
        return ZStack{
            Color.orange
            VStack(spacing: 5){
                HStack{
                    Image("wet")
                        .scaledToFit()
                        .padding(.horizontal,-100)
                    VStack{
                        Text("0°C")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text("London")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Wet")
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }
                Divider()
                Text("It will be a dry night across the region but with a brisk breeze at times. The skies will be clear to start with a little cloud building overnight ")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 9)
                    .padding(.trailing,10)
                
            }
        }
        .frame(width: currentReader.size.width - self.backViewSize, height: 200)
        .cornerRadius(20)
        .shadow(radius: 20)
        .gesture(DragGesture().onChanged({ (value) in
            self.size = value.translation
        })
            .onEnded({ (value) in
                self.size = .zero
            })
        )
            .offset(y:self.size.height > 1 ? -150 : -80)
    }
    
    fileprivate func thirdCard(currentReader : GeometryProxy) -> some View {
        return ZStack{
            Color.blue
            VStack(spacing: 5){
                HStack{
                    Image("summer")
                        .scaledToFit()
                        .padding(.horizontal,-100)
                    VStack{
                        Text("10°C")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Liverpool")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Sunny")
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }
                Text("It will be a dry night across the region but with a brisk breeze at times. The skies will be clear to start with a little cloud building overnight")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 9)
                    .padding(.trailing,10)
            }
            
        }.frame(width: currentReader.size.width - self.backViewSize - 10, height: 200)
            .cornerRadius(20)
            .shadow(radius: 20)
            .gesture(DragGesture().onChanged({ (value) in
                self.size = value.translation
            })
                .onEnded({ (value) in
                    self.size = .zero
                })
        )
            .offset(y:self.size.height > 1 ? -370 : -160)
    }
    
    fileprivate func firstCard(currentReader: GeometryProxy) -> some View {
        return ZStack{
            Color.red
            VStack(spacing: 5){
                HStack{
                    Image("winter")
                        .scaledToFit()
                        .padding(.horizontal,-100)
                    VStack{
                        Text("4°C")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Exeter")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Snowy")
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }
                Divider()
                Text("It will be a dry night across the region but with a brisk breeze at times. The skies will be clear to start with a little cloud building overnight")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 9)
                    .padding(.trailing,10)
            }
            
        }
        .frame(width: currentReader.size.width - 74 , height: 200)
            
        .cornerRadius(20)
        .shadow(radius: 20)
        .gesture(DragGesture().onChanged({ (value) in
            self.size = value.translation
        })
            .onEnded({ (value) in
                self.size = .zero
            })
        )
            .offset(self.size)
    }
    
    var body: some View {
        GeometryReader{reader in
            
            ZStack{
                self.thirdCard(currentReader: reader)
                
                self.secoundCard(currentReader: reader)
                
                self.firstCard(currentReader: reader)
            }
     .animation(.spring())
        }
       .animation(
        .easeIn(duration: 0.4)
        )
    }
}
    
//    struct Cards_Previews: PreviewProvider {
//        static var previews: some View {
//            Cards()
//        }
//}
