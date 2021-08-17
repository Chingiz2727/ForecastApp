import UIKit

final class LocationErrorView: UIView {
    private let locationErrorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ocean")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .trueBlue
        label.text = "Дайте доступ к вашей геолокации для определения вашего местоположения"
        return label
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.trueBlue, for: .normal)
        button.setTitle("Открыть настройки", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView = UIStackView(arrangedSubviews: [locationErrorImageView, errorLabel, settingsButton])
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupInitialLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 20
        backgroundColor = .background
    }
    
    private func setupInitialLayout() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            locationErrorImageView.widthAnchor.constraint(equalToConstant: 150),
            locationErrorImageView.heightAnchor.constraint(equalToConstant: 150),
            settingsButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

}
