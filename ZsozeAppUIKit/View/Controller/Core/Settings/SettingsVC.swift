//
//  SettingsVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

enum SettingsSection: Int, Identifiable, CaseIterable {
    case notificationSettings
    case termsOfUse
    case privacy
    case prize
    
    var titleName: String {
        switch self {
        case .notificationSettings:
            return "Értesítési beállítások"
        case .termsOfUse:
            return "ÁSZF"
        case .privacy:
            return "Adatvédelem"
        case .prize:
            return "Nyereményjáték szabályzat"
        }
    }
    
    var imageName: String {
        switch self {
        case .notificationSettings:
            return "bell.fill"
        case .termsOfUse:
            return "person.fill"
        case .privacy:
            return "lock.fill"
        case .prize:
            return "shield.fill"
        }
    }
    
    var id: Int { return self.rawValue }
}

class SettingsVC: UIViewController {
    //MARK: - Properties
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "BEÁLLÍTÁSOK"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleDismissButton), for: .touchUpInside)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "arrow.left.circle.fill", withConfiguration: config )?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let tableView = UITableView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = UIColor.backGround
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingsCell")
        tableView.backgroundColor = .clear
        tableView.separatorColor = .white
        tableView.estimatedRowHeight = 50
                
        let stack = UIStackView(arrangedSubviews: [backButton, topLabel])
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .equalSpacing
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 5, paddingLeft: 15)
        
        view.addSubview(tableView)
        tableView.anchor(top: stack.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 15)
    }
    
    //MARK: - Action
    @objc func handleDismissButton(){
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = .clear
        
        guard let section = SettingsSection(rawValue: indexPath.row) else { return cell}
        cell.imageView?.image = UIImage(systemName: section.imageName)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        cell.textLabel?.text = section.titleName
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        let image = UIImage(systemName: "chevron.right")
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
        accessory.image = image
        accessory.tintColor = UIColor.white
        cell.accessoryView = accessory
        
        return cell
    }
    
    
}
