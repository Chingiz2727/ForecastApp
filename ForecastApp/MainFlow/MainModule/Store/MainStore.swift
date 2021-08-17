import Foundation

final class MainStore {
    private let apiDispatcher: RequestDispatcher = Resolver.resolve()
    
    func cityForecastRequest(lat: Double, long: Double, completion: @escaping(Result<Forecast,Error>)->()) {
        apiDispatcher.execute(request: MainApiTarget.forecastByCoordinates(lat: lat, long: long)) { result in
            switch result {
            case let.json(json, response):
                if let data = json as? Data {
                    do {
                        let decode = try JSONDecoder().decode(Forecast.self, from: data)
                        completion(.success(decode))
                    }
                    catch let error {
                        completion(.failure(error))
                    }
                }
            case .error(let error, let response):
                print(response!.url!)
                completion(.failure(error!))
            default:
                break
            }
        }
    }
}
