import UIKit
import CoreLocation

class LocatinErrorViewController: UIViewController, ViewHolder {

    typealias RootViewType = LocationErrorView
    
    private let locationManager: CLLocationManager = Resolver.resolve()

    override func loadView() {
        view = LocationErrorView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        rootView.settingsButton.addTarget(self, action: #selector(openLocationSettings), for: .touchUpInside)
    }
    
    @objc private func openLocationSettings() {
        if let bundleId = Bundle.main.bundleIdentifier,
           let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension LocatinErrorViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways,.authorizedWhenInUse:
            dismiss(animated: true) {
                LocationStateProdiver.shared.update()
            }
        default:
            break
        }
    }
}
