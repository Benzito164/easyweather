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
    @State var show = false
    @State var showLocationDetailFromStackedCards = false
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    fileprivate func secoundCard(currentReader : GeometryProxy) -> some View {
        return ZStack{
            Color.orange
            VStack(spacing: 5){
                HStack{
                    loadImageFromResource(imageName: "wet.png")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding()
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
            .offset(y:self.size.height > 1 ? -120 : -80)
    }
    
    fileprivate func thirdCard(currentReader : GeometryProxy) -> some View {
        return ZStack{
            Color.blue
            VStack(spacing: 5){
                HStack{
                    loadImageFromResource(imageName: "summer.png")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding()
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
            
        }.frame(width: currentReader.size.width - self.backViewSize - 1, height: 200)
            .cornerRadius(20)
            .shadow(radius: 20)
            .gesture(DragGesture().onChanged({ (value) in
                self.size = value.translation
            })
                .onEnded({ (value) in
                    self.size = .zero
                })
        )
            .offset(y:self.size.height > 1 ? -(self.size.height+250) : -160)
    }
    
    fileprivate func firstCard(currentReader: GeometryProxy) -> some View {
        return ZStack{
            Color.red
            VStack(spacing: 5){
                HStack{
                    loadImageFromResource(imageName: "winter.png")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding()
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
            Color.black.opacity(0.09)
            .frame(height: 200)
            .cornerRadius(10)
            
            Color.white
            .frame(height: 200)
            .cornerRadius(10)
            .mask(
            
                Rectangle()
                .fill(
                
                    LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: 70))
                .offset(x: self.show ? center : -center)
            
            )
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
                
            ZStack(){
                
                self.thirdCard(currentReader: reader)
                
                self.secoundCard(currentReader: reader)
                
                self.firstCard(currentReader: reader)
            }
            .padding(.horizontal,35)
                .animation(.spring())
                
            
        }
        .onAppear{
        withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: true)){
       //     self.show.toggle()
        }
        }

    }
}

struct LabelShimmer : View {
    
    @State var show = true
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    var body : some View{
        
        ZStack{
            Text("Swipe down on cards \n       to reveal more!")
                .foregroundColor(Color.purple.opacity(0.9))
                .font(.system(size: 20))
            Color.white
                .frame(width: 310, height: 100)
            .cornerRadius(10)
            .mask(
            
                Rectangle()
                .fill(
                
                    LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: 70))
                .offset(x: self.show ? center : -center)
            
            )
        }
        .padding(.horizontal)
        .padding(.top)
        .onAppear {

            withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: false)){

//                self.show.toggle()
            }
        }
    }
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
       Cards()
    }
}
