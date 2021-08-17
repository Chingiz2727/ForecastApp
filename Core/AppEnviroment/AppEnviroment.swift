import Foundation

public enum AppEnviroment {
    
    public static let isDebug: Bool = {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }()
    
    public static let bundleIdentifier = Bundle.main.bundleIdentifier ?? ""

    public static let baseURL: String = {
        return "https://api.openweathermap.org/data/2.5/"
    }()
    
    public static let googleServiceFileName: String = {
        guard let fileName = AppEnviroment.infoDictionary["GOOGLE_SERVICE_FILE_NAME"] as? String else {
            fatalError("googleServiceFileName not found")
        }
        return fileName
    }()
    
    private static let infoDictionary: [String: Any] = {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            fatalError("Info.plist file not found")
        }
        return infoDictionary
    }()
    
    public static let cloudPaymentId: String = {
        guard let baseURL = AppEnviroment.infoDictionary["CLOUD_ID"] as? String else {
            fatalError("baseURL not found")
        }
        return baseURL
    }()
    
    public static let appVersion: String = {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            fatalError("appVersion not found")
        }
        return appVersion
    }()
    
    public static let weatherApiKey: String = {
        return "01780cf5b88246439ec637f2c347c8e5"
    }()
}
