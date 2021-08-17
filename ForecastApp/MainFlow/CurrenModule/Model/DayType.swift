import UIKit
import Foundation

enum DayType: String {
    case moorning
    case noon
    case afternoon
    case evening
    case night
    
    static var getDayType: DayType {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12:
            return .moorning
        case 12:
            return .noon
        case 13..<17:
            return .afternoon
        case 17..<22:
            return .evening
        default:
            return .night
        }
    }
    
    var dayImg: UIImage? {
        switch self {
        case .afternoon, .noon:
            return UIImage.init(named: "day")
        default:
            return UIImage.init(named: rawValue)
        }
    }
    
}
