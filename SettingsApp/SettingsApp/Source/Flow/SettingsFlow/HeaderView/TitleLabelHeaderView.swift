//
//  TitleLabelHeaderView.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import Foundation
import UIKit
import SnapKit

final class TitleLabelHeaderView: UITableViewHeaderFooterView {
    
    static let identifier: String = "TitleLabelHeaderView"
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ text: String) {
        titleLabel.text = text
    }
}

// MARK: - Private extension
private extension TitleLabelHeaderView {
    func setupView() {
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        containerView.backgroundColor = .init(.cellBackground)
        
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(16)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(22)
        }
        titleLabel.textColor = UIColor(ColorStyle.sectionHeaderText)
        titleLabel.font = .fManropeMedium(size: 14)
        
        containerView.withCornerRadius(corners: .topCorners)
    }
}

