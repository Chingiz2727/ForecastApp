import UIKit

final class CurrentWeatherView: UIView {
    
    let cityTextField: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.font = UIFont.init(name: "Arial", size: 33)
        tf.textColor = UIColor.background
        tf.text = "Almaty"
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .background
        label.textAlignment = .center
        label.font = .init(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .background
        label.textAlignment = .center
        label.font = .init(name: "Arial", size: 33)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherTypeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .background
        label.textAlignment = .center
        label.font = .init(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minMaxLabel : UILabel = {
        let label = UILabel()
        label.textColor = .background
        label.font = .init(name: "Arial", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changeCityButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить город", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.background, for: .normal)
        button.titleLabel?.font = .init(name: "Arial", size: 20)
        button.addTarget(self, action: #selector(editCityPressed), for: .touchUpInside)
        return button
    }()
    
    private let backgroundImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialLayout()
        addToolBar(textField: cityTextField)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureWeather(weather: CurrentWeather) {
        guard let currentWeather = weather.weather.first else { return }
        let dayType = DayType.getDayType
        backgroundImageView.image = dayType.dayImg
        dateLabel.text = getTodayWeekDay(date: weather.dt)
        temperatureLabel.text = "\(weather.main.temp) C"
        weatherTypeLabel.text = currentWeather.weatherDescription
        minMaxLabel.text = "\(weather.main.tempMin) C / \(weather.main.tempMax) C"
    }
    
    private func setupInitialLayout() {
        addSubview(backgroundImageView)
        backgroundImageView.frame = bounds
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addoverlay()
        let stackView = UIStackView(arrangedSubviews: [cityTextField, dateLabel, temperatureLabel, weatherTypeLabel, minMaxLabel, changeCityButton])
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.isUserInteractionEnabled = true
        addSubview(stackView)
        NSLayoutConstraint.activate(
            [
                stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                cityTextField.heightAnchor.constraint(equalToConstant: 70)
            ]
        )
    }
    
    private func getTodayWeekDay(date: Date)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: date)
        return weekDay
    }
    
    private func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .systemBlue
        let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexibleSpace,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

//        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    @objc private func donePressed(){
        endEditing(true)
    }
    
    @objc private func editCityPressed() {
        cityTextField.becomeFirstResponder()
    }
}

extension UIView {
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
}
