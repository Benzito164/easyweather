//
//  WeatherModel.swift
//  easyweather
//
//  Created by Beni Ibeh on 02/05/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    var iid = UUID()
    var results : [HourlyWeatherModel]
    
}
struct CurrentLocationWeatherModel:Decodable {
    var weather:[WeatherInfo]
    let main:MainTemp
}

struct WeatherModel:Decodable {
    var id:Int
    var name:String
    var main:MainTemp
    var weather:[WeatherInfo]
    
}

struct CurrentWeatherModel: Decodable {
    var current: CurrentWeatherData
    var weather:[WeatherInfo]
}

struct HourlyWeatherModel:Decodable {
    var hourly:[HourlyWeatherData]
    
}

extension HourlyWeatherModel:Identifiable {
    var id:Int{
        return 5
    }
    
}


struct HourlyWeatherData:Decodable {
    var dt:Int
    var temp:Float
    var weather:[WeatherInfo]
}

extension HourlyWeatherData:Identifiable {
    var id:UUID {
       return UUID()
    }
}

struct WeatherInfo:Decodable {
    let id:Int
    let main:String
    let description:String
    var icon:String
   
}
struct CurrentWeatherData:Decodable {
    var dt:Int
}





struct CoOrdinates: Decodable {
    let lon:Float
    let lat:Float
}



struct MainTemp:Decodable {
    let temp:Float
    let humidity:Int
}



