//
//  ViewController.swift
//  AboutMe
//
//  Created by Диас Нургалиев on 13.02.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    private let images = ["photo1", "photo2", "photo3", "photo4"]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        
        return collectionView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nurgaliev Dias"
        
        return label
    } ()
    
    private lazy var hometownButton: UIButton = createButton(title: "Hometown", action: #selector(hometownTapped))
    private lazy var hobbiesButton: UIButton = createButton(title: "Hobbies", action: #selector(hobbiesTapped))
    private lazy var foodButton: UIButton = createButton(title: "Favorite Food", action: #selector(foodTapped))
        
        private lazy var buttonStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [hometownButton, hobbiesButton, foodButton])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 30
            return stackView
        }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - UI Setup
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(nameLabel)
        view.addSubview(buttonStackView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.size.equalTo(300)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
                    make.centerX.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(0.9)
            make.bottom.equalToSuperview().inset(30)
                }
    }
    
    // MARK: - Button Actions
        @objc private func hometownTapped() {
            let homeTownVC = CityViewController()
            navigationController?.show(homeTownVC, sender: self)
        }
        
        @objc private func hobbiesTapped() {
            showAlert(title: "Hobbies", message: "I love coding, reading, and playing games!")
        }
        
        @objc private func foodTapped() {
            showAlert(title: "Favorite Food", message: "I love pizza, sushi, and homemade dishes!")
        }
        
        private func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
        
        private func createButton(title: String, action: Selector) -> UIButton {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 10
            button.addTarget(self, action: action, for: .touchUpInside)
            return button
        }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.configure(with: images[indexPath.item])
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}

    // MARK: - Custom UICollectionViewCell
class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

