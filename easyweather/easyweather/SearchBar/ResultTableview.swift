//
//  ResultTableview.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI
import GooglePlaces

struct ResultTableview: View {
    var searchText : String = ""
    var body: some View {
        tableView(searchText: searchText)
    }
}

var tappedLocation = ""
struct tableView : View {
    var searchText:String = ""
    @State var isCurrentLocationViewPresented = false

    var names : [String]=[]
    @State var show = false
    
 
    
    var body: some View {
        VStack{
            if searchText.isEmpty{        
                List{
                    Text("No Results found")
                        .padding()
                        .cornerRadius(13).listRowBackground(Color.red.opacity(0.2))
                }
            } else if searchText.count > 2{
                List(PlacesAutoComplete(locationName: searchText),id:\.self){ name in
                    Button(name){
                        self.isCurrentLocationViewPresented = true
                        tappedLocation = name
                        WeatherDataManager().getWeatherForLocations(locationName: name)
                    }
                }.sheet(isPresented: $isCurrentLocationViewPresented){
                     CurrentLocationweatherView(searchedLocation: tappedLocation)
                }
            }
            
        }
    }
    
}

func generateRandomArrayFromSingleParameter (string:String)->[String]{
    var emptyArray: [String] = []
    for value in 1...6 {
        emptyArray.append(string+String(value))
    }
    return emptyArray
}



let placesClient = GMSPlacesClient()
var locationResultArray:[String] = []
var placeID:String = ""
func PlacesAutoComplete(locationName:String) ->[String]{
    let filter = GMSAutocompleteFilter()
    
    filter.type = .city
    
    placesClient.autocompleteQuery(locationName, bounds: nil, filter: filter, callback: {(results, error) -> Void in
        if let error = error {
            print("Autocomplete error \(error)")
            return
        }
        locationResultArray.removeAll()
        if let results = results{
            for result in results {
                print(result.placeID)
                DispatchQueue.main.async {
                    if !locationResultArray.contains(result.attributedPrimaryText.string){
                        print("location array inside closure \(locationResultArray)")
                        placeID = result.placeID
                        return  locationResultArray.append(result.attributedPrimaryText.string)
                    }
                }
            }
            
        }
        
    })
    let lat = GetLatLonFromPlaceId(placeId: placeID)
    print("LAT = \(lat)")
    print("location array outside \(locationResultArray)")
    return locationResultArray
}

func GetLatLonFromPlaceId(placeId:String) -> [Double] {
    var placeIdArray = [Double]()
    //"ChIJmb1k2ko-eUgRqdwTAv26rVE"
    let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.coordinate.rawValue))!
    placesClient.fetchPlace(fromPlaceID:placeId , placeFields:fields, sessionToken: .none) { (placeDetail, error) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        
        print("place id array inside beforche\(placeIdArray)")
        placeIdArray.append((placeDetail?.coordinate.longitude)!)
        placeIdArray.append((placeDetail?.coordinate.latitude)!)
        // return ["lat":"\(String(describing: placeDetail?.coordinate.latitude))","lon":"\(String(describing: placeDetail?.coordinate.longitude))"]
        print("place id array inside after\(placeIdArray)")
    }
   print("outcome below")
    return placeIdArray
}
