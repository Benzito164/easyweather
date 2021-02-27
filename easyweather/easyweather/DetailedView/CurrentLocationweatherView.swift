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
        Text("Swipe down to dismiss")
            .padding(.bottom, 80)
        HStack{
            Button(action: {
               _ = savedLocationsArray.popLast()
                savedLocationsArray.insert(searchedLocation, at: 0)
                
            }, label: {
                Text("Save")
                    .foregroundColor(.white)
            }).background(                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                            .fill(LinearGradient(gradient: Gradient(colors: [.blue, .gray, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50))
        }
        
        
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
                    Text("\(weatherInformation[0].main.temp.shortValue)°C")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                
                //loadImageFromResource(imageName: weatherInformation.count > 1 ? weatherInformation[0].weather[0].icon :"winter.png")
                // let urlString = "http://openweathermap.org/img/wn/\(weatherInformation[0].weather[0].icon)@4x.png"
                WebImage(url:URL(string: WeatherEndPoint.getWeatherIconUrl(data: weatherInformation[0].weather[0].icon)))
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .top)
                Text(weatherInformation.count > 0 ? weatherInformation[0].weather[0].main : "No Data")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.white)
                Text("--------------")
                Text(weatherInformation.count > 0 ? weatherInformation[0].weather[0].description : "No Data")
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
        
        
    }
}
}

struct CurrentLocationweatherView_Previews: PreviewProvider {
static var previews: some View {
    Group{
        CurrentLocationweatherView()
        
    }
    
}
}
