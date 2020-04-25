//
//  LocationDetail.swift
//  easyweather
//
//  Created by Beni Ibeh on 18/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct LocationDetail: View {
    @State var searchedLocation:String = "Unkown Location"
    @State private var showDetail = false
    @State private var showAnimation = false
    var weatherSymbols = ["summer.png","winter.png","wet.png","stormyweather.png"]
    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                Button(action: {
                    self.showAnimation.toggle()
                }){
                    loadImageFromResource(imageName:"add.png")
                        .foregroundColor(.black)
                    }.padding()
                    .buttonStyle(GradientButtonStyle())
                Spacer()
                
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(weatherSymbols,id: \.self){ symbol in
                    CardShimmer(weatherSymbol: symbol)
                }
            }
        }
        .navigationBarTitle(searchedLocation)
        
    }
}

struct CardShimmer : View {
    
    @State var show = false
    @State var weatherSymbol:String
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    var body : some View{
        ZStack{
            VStack(alignment:.leading){
                HStack(spacing:24){
                    VStack{
                        Spacer()
                        Spacer()
                        loadImageFromResource(imageName: weatherSymbol)
                            .resizable()
                            .frame(width: 70, height: 70, alignment: .topTrailing)
                    }
                    VStack(alignment:.leading){
                        Spacer()
                        Text("2PM - 4PM").font(.headline).fontWeight(.heavy).foregroundColor(.blue)
                        Text("Partly Cloudy").font(.headline).fontWeight(.heavy).foregroundColor(.blue)
                        Text("High:21° Low:7°").font(.headline).fontWeight(.heavy).foregroundColor(.blue)
                    }
                    Text("14°C").fontWeight(.bold).foregroundColor(.purple).font(.largeTitle)
                }
                Divider().frame(width: 350, height: 4).background(Color.purple)
                Text("It will be a dry night across the region but with a brisk breeze at times. The skies will be clear to start with a little cloud building overnight ")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(.blue)
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
        .padding(.horizontal)
        .padding(.top)
        .onAppear {
            
            withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: false)){
                
                self.show.toggle()
            }
        }
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.green : Color.yellow).animation(.easeIn(duration:0.8))
            .cornerRadius(30)
            .scaleEffect(configuration.isPressed ? 3: 1).animation(.easeIn(duration:0.8))
    }
}

struct CPreviews: PreviewProvider {
    static var previews: some View {
        LocationDetail()
    }
}


