final class CurrentWeatherViewModel: ViewModel {
    typealias Input = userInput
    
    typealias Output = userOutput
    
    private let store = СurrentStore()
    @Observable private(set) var state: Output?

    enum userInput {
        case cityInput(city: String)
    }
    
    enum userOutput {
        case forecastOutput(result: CurrentWeather)
        case error(result: Error)
    }
    
    func makeTransform(_ input: userInput) {
        switch input {
        case .cityInput(let city):
            store.cityForecastRequest(city: city) { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.state = .error(result: error)
                case .success(let forecast):
                    print(forecast)
                    self?.state = .forecastOutput(result: forecast)
                }
            }
        }
    }
}
