import Foundation

final class СurrentStore {
    
    private let apiDispatcher: RequestDispatcher = Resolver.resolve()
    
    func cityForecastRequest(city: String,completion: @escaping(Result<CurrentWeather,Error>)->()) {
        apiDispatcher.execute(request: MainApiTarget.forecastByCityName(cityName: city)) { result in
            switch result {
            case let.json(json, _):
                if let data = json as? Data {
                    do {
                        print(data)
                        let decode = try JSONDecoder().decode(CurrentWeather.self, from: data)
                        completion(.success(decode))
                    }
                    catch let error {
                        completion(.failure(error))
                    }
                }
            case .error(let error, let response):
                print(response?.url!)
                completion(.failure(error as! Error))
            default:
                break
            }
        }
    }
}
