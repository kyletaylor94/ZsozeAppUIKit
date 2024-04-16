//
//  SafariVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

enum SafariTopHorizontalSection: Int, Identifiable, CaseIterable {
    case instagram
    case zsoze
    case vod
    case shorts
    case art
    case zsunboxing
    
    var titleName: String {
        switch self {
        case .instagram:
            return "Instagram".uppercased()
        case .zsoze:
            return "Zsozéatya".uppercased()
        case .vod:
            return "Zsozeatya Vod".uppercased()
        case .shorts:
            return "Zsozeatya Shorts".uppercased()
        case .art:
            return "ZsozeArt".uppercased()
        case .zsunboxing:
            return "Zsunboxing".uppercased()
        }
    }
    var id: Int { return self.rawValue }
}


class SafariVC: UIViewController {
    //MARK: - Properties
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "ÚJDONSÁGOK"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "bell.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleNotificationsButton), for: .touchUpInside)
        return button
    }()
    
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    
    private let scrollView = UIScrollView()
    private let tableView = UITableView()
    private var selectedSections = Set<SafariTopHorizontalSection>()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureUI()
    }
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = UIColor.backGround
        scrollView.showsHorizontalScrollIndicator = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SafariCell.self, forCellReuseIdentifier: "safariCell")
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor.backGround
        tableView.rowHeight = 300
        
        view.addSubview(topLabel)
        topLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 5, paddingLeft: 15)
        
        view.addSubview(notificationButton)
        notificationButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 5, paddingRight: 15)
        
        view.addSubview(scrollView)
        scrollView.anchor(top: notificationButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, height: 55)

        
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingLeft: 20, paddingRight: 20)
        
        
        for section in SafariTopHorizontalSection.allCases {
            let button = UIButton(type: .system)
            button.setTitle(section.titleName, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
            button.setTitleColor(UIColor(.primary), for: .normal)
            button.addTarget(self, action: #selector(sectionButtonTapped), for: .touchUpInside)
            button.tag = section.rawValue
            button.setDimensions(height: 40, width: 120)
            stackView.addArrangedSubview(button)
            
            // Initially select all sections
            selectedSections.insert(section)
            
            button.layer.cornerRadius = 8 / 2
            button.layer.borderWidth = 0.5
        }
        
        view.addSubview(tableView)
        tableView.anchor(top: scrollView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
    }
    
    //MARK: - Action
    @objc func handleNotificationsButton(){
        let vc = NotificationsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func sectionButtonTapped(_ sender: UIButton){
        guard let section = SafariTopHorizontalSection(rawValue: sender.tag) else { return }
        
        if selectedSections.contains(section) {
            sender.setTitleColor(UIColor(.white), for: .normal)
            sender.layer.borderColor = UIColor.white.cgColor
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        } else {
            selectedSections.insert(section)
            sender.setTitleColor(UIColor(.gray), for: .normal)
            sender.layer.borderColor = UIColor.black.cgColor
            sender.backgroundColor = UIColor(.black)
        }
        print(selectedSections)
    }
}

extension SafariVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "safariCell", for: indexPath) as! SafariCell
        cell.selectionStyle = .none
        return cell
    }
    
    
}
