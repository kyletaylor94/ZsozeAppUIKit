//
//  ScheduleVC.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 14/04/2024.
//

import Foundation
import UIKit

class ScheduleVC: UIViewController {
    //MARK: - Properties
    let width = UIScreen.main.bounds.width - 32
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "ESEMÉNYEK"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.white
        return label
    }()
    
    private let actuallyButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleActuallyButton), for: .touchUpInside)
        return button
    }()
    
    private let scheduleButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleScheduleButton), for: .touchUpInside)
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
    }
    
    //MARK: - Actions
    @objc func handleActuallyButton(){
        print("handleActuallyButton")
    }
    
    @objc func handleScheduleButton() {
        print("handleScheduleButton")
    }
}
