import CoreLocation


final class LocationManagerStore: NSObject, ViewModel {
    
    private let locationManager: CLLocationManager
    var locationState: LocationStateManager?
    
    enum LocationInput {
        case makeRequest
    }
    
    enum LocationOuput {
        case locationRestricted(error: String)
        case location(lat: Double, long: Double)
    }
    
    typealias Input = LocationInput
    
    typealias Output = LocationOuput
    
    @Observable private(set) var state: Output?

    init(locationManager: CLLocationManager) {
        self.locationManager = locationManager
    }
    
    func makeTransform(_ input: Input) {
        switch input {
        case .makeRequest:
            locationManager.delegate = self
            if let location =  locationManager.location?.coordinate {
                state = .location(lat: location.latitude, long: location.longitude)
            } else {
                locationManager.requestWhenInUseAuthorization()
            }
        }
    }
}

extension LocationManagerStore: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let coordinates = manager.location?.coordinate else {
                state = .locationRestricted(error: "Дайте доступ к локации")
                locationState?.showLocationError()
                return
            }
            print(coordinates.latitude,coordinates.longitude)
            state = .location(lat: coordinates.latitude.binade, long: coordinates.longitude.binade)
        default:
            state = .locationRestricted(error: "Дайте доступ к локации")
            locationState?.showLocationError()
        }
    }
}
