import UIKit

protocol MainModule: Presentable {
    
}

final class MainModuleBuilder {
    static func build() -> MainModule {
        let controller = MainViewController()
        let viewModel = MainViewModel()
        controller.viewModel = viewModel
        return controller
    }
}

final class MainViewController: UIViewController, MainModule, ViewHolder, LocationStateManager {
    typealias RootViewType = MainView
    var viewModel: MainViewModel!
    
    private let tableViewDataSource = MainTableViewDataSource()
    private let locationStore: LocationManagerStore = Resolver.resolve()
    
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.tableView.dataSource = tableViewDataSource
        bindLocationUsage()
        locationStore.makeTransform(.makeRequest)
        bindViewModel()
    }
    
    func onLocationManagerStateChanged() {
        locationStore.makeTransform(.makeRequest)
    }
    
    private func bindViewModel() {
        viewModel.$state.observe(self) { vc, output in
            switch output {
            case .forecastOutput(let result):
                vc.tableViewDataSource.days = result.daily
                vc.rootView.tableView.reloadData()
            default:
                break
            }
        }
        LocationStateProdiver.shared.register(observer: self)
    }
    
    private func bindLocationUsage() {
        locationStore.locationState = self
        locationStore.$state.observe(self) { vc, state in
            switch state {
            case let.location(lat, long):
                vc.viewModel.makeTransform(.locationInput(lat: lat, lon: long))
            case .locationRestricted(let error):
                print(error)
            case .none:
                break
            }
        }
    }
}
