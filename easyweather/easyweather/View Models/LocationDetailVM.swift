//
//  LocationDetailVM.swift
//  easyweather
//
//  Created by Beni Ibeh on 05/05/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import Foundation

class LocationDetailVM {
    var emptyArray = [HourlyWeatherData]()
    var todaysUnfilteredWeatherData = WeatherDataManager.hourlyWeatherData[0].hourly.prefix(23)
    
    init() {
        DisplayUniqueWeatherChanges()
        
    }
    func DisplayUniqueWeatherChanges()  {
        var currentId = -1
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        todaysUnfilteredWeatherData.forEach { value in
            let weatherId = value.weather[0].id
            if (weatherId != currentId && result.elementsEqual(ExtractDate(timeStamp: Double(value.dt)))){
                currentId = weatherId
                emptyArray.append(updateHourlyWeatherDataArrayValues(value: value))
            }
        }
        
    }
    
    
    fileprivate func updateHourlyWeatherDataArrayValues(value:HourlyWeatherData) -> HourlyWeatherData {
        var data = value
        data.weather[0].icon = "http://openweathermap.org/img/wn/\(value.weather[0].icon)@2x.png"
        data.temp = Float(value.temp.rounded(.awayFromZero))
        return data
    }
}

func getDateFromTimeStamp(timeStamp : Double) -> String {
    let date = NSDate(timeIntervalSince1970: timeStamp)
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "hh:mm a"
    let dateString = dayTimePeriodFormatter.string(from: date as Date)
    return dateString
}

func ExtractDate(timeStamp : Double) -> String {
    let date = NSDate(timeIntervalSince1970: timeStamp)
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "dd.MM.yyyy"
    let dateString = dayTimePeriodFormatter.string(from: date as Date)
    return dateString
}
