//
//  SafariCell.swift
//  ZsozeAppUIKit
//
//  Created by Turdesan Csaba on 15/04/2024.
//

import Foundation
import UIKit
import SwiftLayoutKit

class SafariCell: UITableViewCell {
    //MARK: Properties
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.safaricellBackground
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 250 / 16
        view.layer.borderWidth = 1.3
        return view
    }()
    
    private let zsozeImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .green
        iv.layer.cornerRadius = 150 / 16
        return iv
    }()
    
    private let profileImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage.channels4Profile
        iv.contentMode = .scaleAspectFit
        iv.setDimensions(height: 35, width: 35)
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 35 / 2
        return iv
    }()
    
    private let channelName: UILabel = {
        let label = UILabel()
        label.text = "Zsozeatya".uppercased()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.text = "7 napja"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .green
        return label
    }()
    
    private let subTitle: UILabel = {
       let label = UILabel()
        label.text = "Horrorsz VLOGZ !app !!LINK !NBER !ART".uppercased()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    //MARK: - Lifecylce
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK - Helpers
    func configureUI(){
        backgroundColor = UIColor.backGround
        
        addSubview(container)
        container.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 25, paddingRight: 25, height: 280)
        
        container.addSubview(zsozeImage)
        zsozeImage.anchor(top: container.safeAreaLayoutGuide.topAnchor, left: container.leftAnchor, right: container.rightAnchor,paddingTop: 3, height: 160)
        
        container.addSubview(profileImage)
        profileImage.anchor(top: zsozeImage.bottomAnchor, left: container.leftAnchor ,paddingTop: 15, paddingLeft: 15)
        
        let stack = UIStackView(arrangedSubviews: [channelName, dateLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        
        container.addSubview(stack)
        stack.anchor(top: zsozeImage.bottomAnchor, left: profileImage.rightAnchor, paddingTop: 10, paddingLeft: 10)
        
        container.addSubview(subTitle)
        subTitle.anchor(top: profileImage.bottomAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right: container.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
}
