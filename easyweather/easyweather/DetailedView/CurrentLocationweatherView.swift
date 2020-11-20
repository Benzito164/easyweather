//
//  CurrentLocationweatherView.swift
//  easyweather
//
//  Created by Beni Ibeh on 27/05/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CurrentLocationweatherView: View {
    @State var searchedLocation:String = "Unkown Location"
    @State  var weatherInformation:[CurrentLocationWeatherModel] = WeatherDataManager.currentWeatherData
    

    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [.blue, .gray, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 330, height: 450)
                    .padding()
                
                VStack{
                    Text(searchedLocation)
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 22)
                    HStack{
                        Text("10°C")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    
                    loadImageFromResource(imageName: weatherInformation.count > 1 ? weatherInformation[0].weather[0].icon :"winter.png")
                       // WebImage(url:URL(string: weatherInformation[0].weather[0].icon))
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .top)
                    Text("Clear Sky")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("--------------")
                    Text(weatherInformation.count > 1 ? weatherInformation[0].weather[0].description : "Humidity 100")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
            }
            
            //            Text("Add as favourite")
            //            .frame(width: 200, height: 10)
            //            .padding()
            //                    .foregroundColor(.white)
            //                .background(LinearGradient(gradient: Gradient(colors: [.blue, .gray, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
            //                    .cornerRadius(40)
            //                    .font(.title)
            
            
        }.preferredColorScheme(.dark)
    }
}

struct CurrentLocationweatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CurrentLocationweatherView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
            
            CurrentLocationweatherView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
        }
        
    }
}
