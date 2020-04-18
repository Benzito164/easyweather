//
//  ResultTableview.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct ResultTableview: View {
    var searchText : String = ""
    var body: some View {
       tableView(searchText: searchText)
    }
}


struct tableView : View {
    var searchText:String = ""
    var names : [String]=[]
    var body: some View {
        VStack{
            if searchText.isEmpty{
                List{
                    Text("No Results found").listRowBackground(Color.blue.opacity(0.2))
                                            .padding(.bottom)
                }.frame(height: UIScreen.main.bounds.height / 20).cornerRadius(13)

            } else {
                List{
                    ForEach(generateRandomArrayFromSingleParameter(string: searchText),id:\.self){ name in
                        Text(name).listRowBackground(Color.blue.opacity(0.2)).cornerRadius(13).padding(.bottom)
                    }
                }.frame(height: UIScreen.main.bounds.height / 5).cornerRadius(13)
            }
           
        }
    }
    
}

    func generateRandomArrayFromSingleParameter (string:String)->[String]{
        var emptyArray: [String] = []
        for value in 1...4 {
            emptyArray.append(string+String(6))
        }
    return emptyArray
}


