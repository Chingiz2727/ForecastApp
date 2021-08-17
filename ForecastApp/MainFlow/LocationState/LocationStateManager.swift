import UIKit
import Foundation

protocol LocationStateManager: AnyObject {
    func showLocationError()
    func onLocationManagerStateChanged()
}


final class LocationStateProdiver {
    static let shared = LocationStateProdiver()
    private var observers: NSHashTable<AnyObject> = NSHashTable.weakObjects()

    func update() {
        notifyObservers()
    }
    func register<Observer: LocationStateManager>(observer: Observer) {
        self.observers.add(observer)
    }
    
    private func notifyObservers() {
        DispatchQueue.main.async {
            self.observers.allObjects
                .compactMap({ $0 as? LocationStateManager })
                .forEach({ $0.onLocationManagerStateChanged() })
        }
    }
}
extension LocationStateManager where Self: UIViewController {
    func showLocationError() {
        if let navigationController = navigationController {
            navigationController.present(LocatinErrorViewController(), animated: true, completion: nil)
        }
        print("It's view Controller")
    }
}
