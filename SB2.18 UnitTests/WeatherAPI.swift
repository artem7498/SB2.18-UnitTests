//
//  WeatherAPI.swift
//  SB2.18 UnitTests
//
//  Created by Артём on 4/30/21.
//

import Foundation
import Magics

class API: MagicsAPI{
    static let shared = API()
}

class WeatherInteractor: NSObject, MagicsInteractor{
    static let shared = WeatherInteractor()
    
    var api: MagicsAPI {return API.shared}
    var relativeURL: String{ return "/api/weather"}
    var method: MagicsMethod {return .get}
    
    @objc dynamic var weathers: [WeatherModel] = []
    
    func process(key: String?, json: MagicsJSON, api: MagicsAPI) {
        weathers = api.arrayFrom(json: json)
    }
}

final class WeatherModel: NSObject, MagicsModel{
    @objc dynamic var weather: [WeatherDataModel] = []
}

final class WeatherDataModel: NSObject, MagicsModel{
    @objc dynamic var temp = 0.0
    @objc dynamic var rain = 0.0
    @objc dynamic var wind = 0.0
    @objc dynamic var time = ""
}

