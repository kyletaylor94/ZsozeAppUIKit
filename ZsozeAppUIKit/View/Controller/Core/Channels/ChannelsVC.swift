//
//  ChannelsVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

class ChannelsVC: UIViewController {
    //MARK: - Properties
    let width = UIScreen.main.bounds.width - 32
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "CSATORNÁIM"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private let zsozeChannelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage.zsozeChannelBackground, for: .normal)
        button.addTarget(self, action: #selector(handleZsozeChannel), for: .touchUpInside)
        return button
    }()
    
    private let vodChannelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage.vodChannelBackground, for: .normal)
        button.addTarget(self, action: #selector(handleVodChannel), for: .touchUpInside)
        return button
    }()
    
    private let shortsChannelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage.zsozeChannelBackground, for: .normal)
        button.addTarget(self, action: #selector(handleShortsChannel), for: .touchUpInside)
        return button
    }()
    
    private let artChannelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage.zsozeChannelBackground, for: .normal)
        button.addTarget(self, action: #selector(handleArtChannel), for: .touchUpInside)
        return button
    }()
    
    private let zsunboxingChannelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage.zsozeChannelBackground, for: .normal)
        button.addTarget(self, action: #selector(handleZsunboxingChannel), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "backGround")
        
        view.addSubview(topLabel)
        topLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leftAnchor, paddingLeft: 10)
        
        zsozeChannelButton.setDimensions(height: 110, width: width)
        vodChannelButton.setDimensions(height: 110, width: width)
        shortsChannelButton.setDimensions(height: 110, width: width)
        artChannelButton.setDimensions(height: 110, width: width)
        zsunboxingChannelButton.setDimensions(height: 110, width: width)
        
        zsozeChannelButton.layer.borderWidth = 1
        zsozeChannelButton.layer.borderColor = UIColor.black.cgColor
        zsozeChannelButton.layer.masksToBounds = true
        zsozeChannelButton.layer.cornerRadius = 110 / 4

        vodChannelButton.layer.borderWidth = 1
        vodChannelButton.layer.borderColor = UIColor.black.cgColor
        vodChannelButton.layer.masksToBounds = true
        vodChannelButton.layer.cornerRadius = 110 / 4
        
        shortsChannelButton.layer.borderWidth = 1
        shortsChannelButton.layer.borderColor = UIColor.black.cgColor
        shortsChannelButton.layer.masksToBounds = true
        shortsChannelButton.layer.cornerRadius = 110 / 4
        
        artChannelButton.layer.borderWidth = 1
        artChannelButton.layer.borderColor = UIColor.black.cgColor
        artChannelButton.layer.masksToBounds = true
        artChannelButton.layer.cornerRadius = 110 / 4
        
        zsunboxingChannelButton.layer.borderWidth = 1
        zsunboxingChannelButton.layer.borderColor = UIColor.black.cgColor
        zsunboxingChannelButton.layer.masksToBounds = true
        zsunboxingChannelButton.layer.cornerRadius = 110 / 4

        let stack = UIStackView(arrangedSubviews: [zsozeChannelButton, vodChannelButton, shortsChannelButton, artChannelButton, zsunboxingChannelButton])
        
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: topLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
    }
    
    //MARK: - Actions
    @objc func handleZsozeChannel() {
        print("handleZsozeChannel")
    }
    
    @objc func handleVodChannel() {
        print("handleVodChannel")
    }
    
    @objc func handleShortsChannel() {
        print("handleShortsChannel")
    }
    @objc func handleArtChannel() {
        print("handleArtChannel")
    }
    
    @objc func handleZsunboxingChannel(){
        print("handleZsunboxingChannel")
    }
}
