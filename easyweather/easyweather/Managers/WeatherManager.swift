//
//  WeatherManager.swift
//  easyweather
//
//  Created by Beni Ibeh on 02/05/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class WeatherDataManager {
    
    var results:[WeatherModel] = []
    @State var  weatherResults: HourlyWeatherModel!
    static var hourlyWeatherData:[HourlyWeatherModel] = []
    static var currentWeatherData:[CurrentLocationWeatherModel] = []
    static var savedLocationsWeatherData:[CurrentLocationWeatherModel] = []
    
    

    
    func getWeatherForLocations(locationName:String, completion:@escaping ()->()){
        WeatherDataManager.currentWeatherData.removeAll()
        let testUrl = "\(WeatherEndPoint.currentLocationWeatherUrl)?q=\(locationName)&appid=\(WeatherEndPoint.key)&units=metric"
        let urlString = testUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print(urlString as Any)
        guard let formatedUrl = URL(string: urlString ?? testUrl) else {
            print("invalid URL")
            return
        }
        
        let request = URLRequest(url: formatedUrl)
        URLSession.shared.dataTask(with: request){
            data,response,error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CurrentLocationWeatherModel.self, from:data){
                    DispatchQueue.main.async {
                        WeatherDataManager.self.currentWeatherData.append(decodedResponse)
                        completion()
                    }
                    print("decoded response = \(decodedResponse)")
                    return
                }
            }
            print("EMPTY++++++++++++++++++++++++++++++++++++++++++++++++++")
        }.resume()
    }
    
    // Mark:- This is breaking the DRY principle please refactor
    func getWeatherForSavedLocations(locationName:String, completion:@escaping ()->()){
        //WeatherDataManager.currentWeatherData.removeAll()
        let testUrl = "\(WeatherEndPoint.currentLocationWeatherUrl)?q=\(locationName)&appid=\(WeatherEndPoint.key)&units=metric"
        let urlString = testUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print(urlString as Any)
        guard let formatedUrl = URL(string: urlString ?? testUrl) else {
            print("invalid URL")
            return
        }
        
        let request = URLRequest(url: formatedUrl)
        URLSession.shared.dataTask(with: request){
            data,response,error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CurrentLocationWeatherModel.self, from:data){
                    DispatchQueue.main.async {
                        WeatherDataManager.self.savedLocationsWeatherData.append(decodedResponse)
                        completion()
                    }
                    print("decoded response = \(decodedResponse)")
                    return
                }
            }
            print("EMPTY++++++++++++++++++++++++++++++++++++++++++++++++++")
        }.resume()
    }
}
