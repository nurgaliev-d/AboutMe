//
//  CityViewController.swift
//  AboutMe
//
//  Created by Диас Нургалиев on 13.02.2025.
//

import UIKit
import SnapKit

class CityViewController: UIViewController {
    
    //MARK: -Properties
    private let cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cityImage")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "My Hometown: Qyzylorda"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Qyzylorda (Қызылорда) is a city in southern Kazakhstan, located along the Syr Darya River. It serves as the administrative center of the Qyzylorda Region and has a rich history connected to the Silk Road, as well as Kazakhstan's space program."
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Qyzylorda"
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(cityImageView)
        view.addSubview(cityLabel)
        view.addSubview(descriptionLabel)
        
        cityImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(250)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(cityImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
