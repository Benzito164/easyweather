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
    
    init() {
        //  getHourlyWeatherForLocation(locationName: "London")
        //  getWeatherForLocations(locationName: "London")
    }
    
    func getWeatherForLocations(locationName:String, completion:@escaping ()->()){
        WeatherDataManager.currentWeatherData.removeAll()
        let testUrl = "\(WeatherEndPoint.currentLocationWeatherUrl)?q=\(locationName)&appid=\(WeatherEndPoint.key)&units=metric"
        print(testUrl)
        guard let formatedUrl = URL(string: testUrl) else {
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
    
    func getHourlyWeatherForLocation(locationName:String){
        
        let testUrl = "http://api.openweathermap.org/data/2.5/onecall?lat=60.99&lon=30.9&exclude=current,daily&appid=11e8d41a7e77f4d31a06ef452a9de726&units=metric"
        //"\(WeatherEndPoint.currentLocationWeatherUrl)?q=\(locationName)&appid=\(WeatherEndPoint.key)"
        
        guard let formatedUrl = URL(string: testUrl) else {
            print("invalid URL")
            return
        }
        
        let request = URLRequest(url: formatedUrl)
        
        URLSession.shared.dataTask(with: request){
            data,response,error in
            
            //                       guard let data = data else { return }
            //
            //                       let hour = try! JSONDecoder().decode(HourlyWeatherModel.self, from: data)
            //
            //                       DispatchQueue.main.async {
            //                        WeatherDataManager.hourlyWeatherData.append(hour)
            //                       }
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(HourlyWeatherModel.self, from:data){
                    DispatchQueue.main.async {
                        WeatherDataManager.hourlyWeatherData.append(decodedResponse)
                        self.weatherResults = decodedResponse
                    }
                    print("decoded response = \(decodedResponse)")
                    print("weather response = \(String(describing: self.weatherResults))")
                    return
                }
            }
            print(WeatherDataManager.hourlyWeatherData)
            
        }.resume()
        
        
    }
    
    
    static func getweather(locationName:String, completion:@escaping ([WeatherModel])->()){
        
        let testUrl = "\(WeatherEndPoint.currentLocationWeatherUrl)?q=\(locationName)&appid=\(WeatherEndPoint.key)"
        let session = URLSession.shared
        let url = URL(string: testUrl)!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
                DispatchQueue.main.async {
                    completion(json as! [WeatherModel])
                }
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
