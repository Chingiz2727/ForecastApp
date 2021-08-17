import UIKit

protocol CurrentWeaherModule: Presentable { }

final class CurrentWeatherBuilder {
    static func build() -> CurrentWeaherModule {
        let controller = CurrentWeatherViewController()
        let viewModel = CurrentWeatherViewModel()
        controller.viewModel = viewModel
        return controller
    }
}

final class CurrentWeatherViewController: UIViewController, CurrentWeaherModule, ViewHolder {

    var viewModel: CurrentWeatherViewModel!
    typealias RootViewType = CurrentWeatherView
    
    override func loadView() {
        view = CurrentWeatherView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.makeTransform(.cityInput(city: "Almaty"))
        bindViewModel()
        rootView.cityTextField.delegate = self
    }
    
    private func bindViewModel() {
        viewModel.$state.observe(self) { vc, output in
            switch output {
            case .forecastOutput(let result):
                vc.rootView.configureWeather(weather: result)
            default:
                break
            }
        }
    }
}

extension CurrentWeatherViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.makeTransform(.cityInput(city: textField.text ?? ""))
    }
}
