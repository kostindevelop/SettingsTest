//
//  SettingsTableViewCell.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import Foundation
import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    private let containerView = UIView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    private let leftTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let rightTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        label.isHidden = true
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private let rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        containerView.backgroundColor = UIColor.systemBackground
        containerView.layer.cornerRadius = 16
        
        containerView.addSubview(leftImageView)
        leftImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.equalTo(leftImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
        
        stackView.addArrangedSubview(leftTitleLabel)
        stackView.addArrangedSubview(rightTitleLabel)
        stackView.addArrangedSubview(rightIcon)
        
        rightIcon.snp.makeConstraints {
            $0.width.height.equalTo(11)
        }
    }
    
    func setup(_ model: SettingsCellViewModel) {
        leftImageView.image = model.leftIcon
        leftTitleLabel.text = model.titleText
        rightTitleLabel.text = model.subtitleText
        rightTitleLabel.isHidden = model.subtitleText == nil
        
        rightIcon.image = model.rightIcon
        rightIcon.isHidden = model.rightIcon == nil
    }
    
    func configureRounding(_ type: CACornerMask = .allCorners) {
        containerView.withCornerRadius(corners: type)
    }
}

#if DEBUG
@available(iOS 17, *)
#Preview(traits: .fixedLayout(width: 343, height: 56)) {
    let cell = SettingsTableViewCell()
    cell.setup(.init(leftIcon: UIImage(named: "ic_email")!,
                     titleText: "Email",
                     subtitleText: "English",
                     rightIcon: .icChevron,
                     onSelect: {}))
    return cell
}
#endif
