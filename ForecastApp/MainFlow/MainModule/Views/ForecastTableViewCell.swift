//
//  ForecastTableViewCell.swift
//  ForecastApp
//
//  Created by Shyngys Kuandyk on 15.08.2021.
//

import UIKit
import Kingfisher

class ForecastTableViewCell: UITableViewCell {

    private let forecastImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let forecastTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .primary
        return label
    }()
    
    private let timeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .primary

        return label
    }()
    
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .primary
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDay(day: Daily) {
        guard let weather = day.weather.first else { return }
        forecastTitle.text = weather.weatherDescription
        temperatureLabel.text = "\(day.temp.day) C"
        timeTitle.text = getTodayWeekDay(date: day.dt)
        let imgUrl = "https://openweathermap.org/img/w/\(weather.icon).png"
        forecastImageView.kf.setImage(with: URL(string: imgUrl))
    }
    
    private func setupInitialLayout() {
        addSubview(forecastImageView)
        addSubview(timeTitle)
        addSubview(forecastTitle)
        addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate(
            [
                forecastImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                forecastImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                forecastImageView.widthAnchor.constraint(equalToConstant: 64),
                forecastImageView.heightAnchor.constraint(equalToConstant: 64)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                timeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                timeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
                timeTitle.leadingAnchor.constraint(equalTo: forecastImageView.trailingAnchor, constant: 10),
                forecastTitle.topAnchor.constraint(equalTo: timeTitle.bottomAnchor, constant: 10),
                forecastTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
                forecastTitle.leadingAnchor.constraint(equalTo: forecastImageView.trailingAnchor, constant: 10),
                temperatureLabel.topAnchor.constraint(equalTo: forecastTitle.bottomAnchor, constant: 10),
                temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                temperatureLabel.leadingAnchor.constraint(equalTo: forecastImageView.trailingAnchor, constant: 10),
                temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ]
        )
    }
    
    private func configureView() {
        backgroundColor = .background
        selectionStyle = .none
    }
    
    private func getTodayWeekDay(date: Date)-> String{
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE"
           let weekDay = dateFormatter.string(from: date)
           return weekDay
     }
}
