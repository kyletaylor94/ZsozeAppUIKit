//
//  MainTabVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

enum MainTabVCSection: Int, Identifiable, CaseIterable{
    case safari
    case schedule
    case channels
    case marketplace
    case profile
    
    var imageName: String {
        switch self {
        case .safari:
            return "safari.fill"
        case .schedule:
            return "calendar"
        case .channels:
            return "play.fill"
        case .marketplace:
            return "bag.fill"
        case .profile:
            return "person.fill"
        }
    }
    var id: Int { return self.rawValue }
}

class MainTabVC: UITabBarController {
    //MARK: - Properties
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.tab
        view.layer.cornerRadius = 85 / 2
        return view
    }()
    
    private var buttons: [UIButton] = []
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.addSubview(container)
        container.anchor(bottom: view.bottomAnchor, paddingBottom: 40, width: UIScreen.main.bounds.width - 30, height: 85)
        
        container.centerX(inView: view)
        
        container.addSubview(stackView)
        
        generateControllers()
        
        stackView.anchor(top: container.safeAreaLayoutGuide.topAnchor, left: container.safeAreaLayoutGuide.leftAnchor, bottom: container.safeAreaLayoutGuide.bottomAnchor, right: container.safeAreaLayoutGuide.rightAnchor, paddingTop: 5,paddingLeft: 5, paddingBottom: 5 ,paddingRight: 5)
                
    }
    
    private func generateControllers() {
        let safari = SafariVC()
        let schedule = ScheduleVC()
        let channels = ChannelsVC()
        let marketPlace = MarkerPlaceVC()
        let profile = ProfileVC()
        
        viewControllers = [safari, schedule, channels, marketPlace, profile]
        
        for x in 0..<MainTabVCSection.allCases.count {
            let section = MainTabVCSection(rawValue: x)!
            let button = generateButton(image: section)
            button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            buttons.append(button)
        }
    }
    
    private func generateButton(image: MainTabVCSection) -> UIButton {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 32)
        button.setImage(UIImage(systemName: image.imageName, withConfiguration: config), for: .normal)
        button.tintColor = .black
        button.tag = image.rawValue
        
        let buttonSize: CGFloat = 70
        button.frame.size = CGSize(width: buttonSize, height: buttonSize)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = buttonSize / 2
        
        return button
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.selectedIndex = sender.tag
            for (index, button) in self.buttons.enumerated() {
                button.tintColor = index == self.selectedIndex ? .white : .black
                button.backgroundColor = index == self.selectedIndex ? .black : .tab
            }
        }
    }
}
