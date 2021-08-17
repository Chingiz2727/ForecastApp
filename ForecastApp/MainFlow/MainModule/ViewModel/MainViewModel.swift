protocol ViewModel: AnyObject {
    associatedtype Input
    associatedtype Output
    @discardableResult
    func makeTransform(_ input: Input)
}

final class MainViewModel: ViewModel {

    typealias Input = userInput
    
    typealias Output = userOutput

    private let locationStore: LocationManagerStore = Resolver.resolve()

    private let store = MainStore()
    
    @Observable private(set) var state: Output?

    enum userInput {
        case locationInput(lat: Double, lon: Double)
    }
    
    enum userOutput {
        case forecastOutput(result: Forecast)
        case error(result: Error)
    }
    
    func makeTransform(_ input: userInput) {
        switch input {
        case .locationInput(let lat, let long):
            store.cityForecastRequest(lat: lat, long: long) { [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                    self?.state = .error(result: error)
                case .success(let currentWeather):
                    self?.state = .forecastOutput(result: currentWeather)
                }
            }
        }
    }
}
