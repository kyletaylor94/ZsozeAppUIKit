//
//  ProfileVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit
import NSAttributedStringBuilder

class ProfileVC: UIViewController {
    //MARK: - Properties
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "PROFILOM"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "gearshape.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage.settingsimage
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 50 / 2
        return iv
    }()
    
    private let signinToLabel: UILabel = {
        let label = UILabel()
        label.text = "Jelentkezz be, hogy részt vegyél a nyereményjátékokban!"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    private let youtubeSignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.tintColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.setDimensions(height: 60, width: UIScreen.main.bounds.width - 32)
        button.layer.cornerRadius = 50 / 2
        return button
    }()

    
    private let readTermsLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Olvasd el az ÁSZF-t és PP-t"
        label.textColor = .white
        return label
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureUI()
    }
    //MARK: - Helpers
    func horizontalImageAndText(image: UIImage, text: String, imageColor: UIColor, imageSize: CGSize) -> NSAttributedString {
        // Kép csatolása az attribútumokhoz
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image.withTintColor(imageColor)
        imageAttachment.bounds.size = imageSize
        
        // Szöveg létrehozása
        let attributedText = NSMutableAttributedString()
        
        // Kép hozzáadása az attribútumokhoz
        attributedText.append(NSAttributedString(attachment: imageAttachment))
        
        // Szöveg hozzáadása az attribútumokhoz
        attributedText.append(NSAttributedString(string: "  " + text))
        
        return attributedText
    }
    
    func configureUI(){
        view.backgroundColor = UIColor.backGround
        
        view.addSubview(topLabel)
        topLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leftAnchor, paddingLeft: 10)
        
        view.addSubview(settingsButton)
        settingsButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 10)
        
        view.addSubview(imageView)
        imageView.setDimensions(height: 200,width: 200)
        imageView.anchor(top: topLabel.safeAreaLayoutGuide.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        
    
        youtubeSignInButton.setAttributedTitle(horizontalImageAndText(image: UIImage(systemName: "play.circle.fill")!, text: "Bejelentkezés Youtube-ra", imageColor: .red, imageSize: CGSize(width: 30, height: 30)), for: .normal)

        
        let stack = UIStackView(arrangedSubviews: [signinToLabel, youtubeSignInButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .equalSpacing
        
        view.addSubview(stack)
        stack.anchor(top: imageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        
        view.addSubview(readTermsLabel)
        readTermsLabel.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 110)
        
    }
    
  
    
    //MARK: - Action
    @objc func settingsButtonTapped() {
        print("settingsbuttonTapped")
        let vc = SettingsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

