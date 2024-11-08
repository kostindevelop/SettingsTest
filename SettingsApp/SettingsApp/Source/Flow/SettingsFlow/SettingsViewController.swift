//
//  SettingsViewController.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import Foundation
import UIKit
import SnapKit

final class SettingsViewController: BaseViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let viewModel: SettingsViewModelProtocol
    
    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationController()
    }
}

// MARK: - Private methods
private extension SettingsViewController {
    
    func setupView() {
        view.backgroundColor = UIColor(ColorStyle.mainBackground)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(55)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
                view.addSubview(tableView)
        tableView.register(TitleLabelHeaderView.self, forHeaderFooterViewReuseIdentifier: TitleLabelHeaderView.identifier)
    }
    
    func setupNavigationController() {
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SettingsTableViewCell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        let section = viewModel.sections[indexPath.section]
        let cellViewModel = section.cellViewModels[indexPath.row]
        cell.setup(cellViewModel)
        
        if section.cellViewModels.count == 1 {
            cell.configureRounding(.allCorners)
        } else if indexPath.row == 0 {
            cell.configureRounding(.topCorners)
        } else if indexPath.row > 0, indexPath.row != section.cellViewModels.count - 1 {
            cell.configureRounding(.none)
        } else if indexPath.row == section.cellViewModels.count - 1 {
            cell.configureRounding(.bottomCorners)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleLabelHeaderView.identifier) as? TitleLabelHeaderView else {
            return nil
        }
        let cellViewModel = viewModel.sections[section]
        headerView.setup(cellViewModel.title)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.sections[indexPath.section].cellViewModels[indexPath.row].onSelect()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46
    }
}

#if DEBUG
class SettingsModelMock: SettingsModelProtocol {
    var navigationHandler: (any SettingsModelNavigationHandler)?
    func actionHandler(_ action: SettingsActionType) {}
}

@available(iOS 17, *)
#Preview {
    let model = SettingsModelMock()
    let viewModel = SettingsViewModel(model: model)
    return SettingsViewController(viewModel: viewModel)
}
#endif
