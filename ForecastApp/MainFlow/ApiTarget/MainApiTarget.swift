import Foundation

enum MainApiTarget: RequestProtocol {
    
    case forecastByCoordinates(lat: Double, long: Double)
    case forecastByCityName(cityName: String)
    
    
    var path: String {
        switch self {
        case .forecastByCityName:
            return "weather"
        case .forecastByCoordinates:
            return "onecall"
        }
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var headers: ReaquestHeaders? {
        return nil
    }
    
    var parameters: RequestParameters {
        switch self {
        case .forecastByCityName(let cityName):
            return ["q": cityName, "appid": "3df4e416385b01d571338d294669d807", "lang": "ru","units":"metric"]
        case .forecastByCoordinates(let lat,let long):
            return ["appid": "3df4e416385b01d571338d294669d807", "exclude":"minutely,hourly,alerts","lang": "ru", "lon": long, "lat": lat, "units":"metric"]
        }
    }
    
    var requestType: RequestType {
        return .data
    }
    
    var responseType: ResponseType {
        return .json
    }
    
    var progressHandler: ProgressHandler? {
        return nil
    }
}
