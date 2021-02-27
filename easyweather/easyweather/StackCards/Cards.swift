//
//  Cards.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI



struct Cards:View {
    @State var backViewSize : CGFloat = 80
    @State var size : CGSize = .zero
    @State var secoundCardSize : CGSize = .zero
    @State var show = false
    @State var showLocationDetailFromStackedCards = false
    var center = (UIScreen.main.bounds.width / 2) + 110
    @State  var weatherInformation:[CurrentLocationWeatherModel] // = WeatherDataManager.savedLocationsWeatherData
    @State var valueChanged:Binding<Bool>
    
    fileprivate func secoundCard(currentReader : GeometryProxy,data:CurrentLocationWeatherModel,valueChanged:Binding<Bool>) -> some View {
        return ZStack{
            Color.orange
            VStack(spacing: 5){
                HStack{
                    WebImage(url:URL(string: WeatherEndPoint.getWeatherIconUrl(data: data.weather[0].icon)))
                  //  loadImageFromResource(imageName: "wet.png")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding()
                    VStack{
                        Text( weatherInformation.count > 0 ? "\(data.main.temp.shortValue)°C":"NO DATA")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text( weatherInformation.count > 0 ? data.name:"NO DATA")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text(weatherInformation.count > 0 ? data.weather[0].description:"NO DATA")
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
    
    fileprivate func thirdCard(currentReader : GeometryProxy,data:CurrentLocationWeatherModel,valueChanged:Binding<Bool>) -> some View {
        return ZStack{
            Color.blue
            VStack(spacing: 5){
                HStack{
                    WebImage(url:URL(string: WeatherEndPoint.getWeatherIconUrl(data: data.weather[0].icon)))
                  //  loadImageFromResource(imageName: "wet.png")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding()
                    VStack{
                        Text( weatherInformation.count > 0 ? "\(data.main.temp.shortValue)°C":"NO DATA")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text( weatherInformation.count > 0 ? data.name:"NO DATA")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text(weatherInformation.count > 0 ? data.weather[0].description:"NO DATA")
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
    @State static var location = ""
    fileprivate func firstCard(currentReader: GeometryProxy,data:CurrentLocationWeatherModel,valueChanged:Binding<Bool>) -> some View {
        return ZStack{
            Color.red
            VStack(spacing: 5){
                HStack{
                    WebImage(url:URL(string: WeatherEndPoint.getWeatherIconUrl(data: data.weather[0].icon)))
                  //  loadImageFromResource(imageName: "wet.png")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding()
                    VStack{
                        Text( weatherInformation.count > 0 ? "\(data.main.temp.shortValue)°C":"NO DATA")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text( weatherInformation.count > 0 ? data.name:"NO DATA")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text(weatherInformation.count > 0 ? data.weather[0].description:"NO DATA")
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
                
                self.thirdCard(currentReader: reader,data: weatherInformation[2], valueChanged: valueChanged)
                
                self.secoundCard(currentReader: reader,data: weatherInformation[1], valueChanged: valueChanged)
                
                self.firstCard(currentReader: reader,data: weatherInformation[0], valueChanged: valueChanged)
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

//struct Cards_Previews: PreviewProvider {
//    static var previews: some View {
//        Cards( weatherInformation: WeatherDataManager.savedLocationsWeatherData, valueChanged: valueChanged)
//    }
//}
