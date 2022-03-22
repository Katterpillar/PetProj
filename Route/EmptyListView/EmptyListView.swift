//
//  EmptyView.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import UIKit
import SnapKit

class EmptyListView: UIView {

    weak var listViewController: ListViewController?
    var controller: UIViewController

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let emptyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor  = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()

    init(_ listView: ListViewController) {
        controller = listView

        super.init(frame: .zero)

        listViewController = listView
        listViewController?.view.addSubview(self)

        setupEmptyLabel()
        setupGoToUserListButton()

        emptyLabel.text = "It looks like you have not added any friends yet"
        emptyButton.setTitle("Add Friends", for: .normal)
        emptyButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupEmptyLabel() {
        addSubview(emptyLabel)

        emptyLabel.snp.makeConstraints({ make in
            make.centerX.equalTo(controller.view.snp.centerX)
            make.top.equalTo(controller.view.snp.bottom).offset(8.0)
            make.leading.equalTo(controller.view.snp.leading).offset(32.0)
            make.trailing.equalTo(controller.view.snp.trailing).offset(-32.0)
        })
    }

    private func setupGoToUserListButton() {
        controller.view.addSubview(emptyButton)

        emptyButton.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emptyLabel.snp.bottom).offset(8.0)
            make.width.equalTo(200.0)
            make.height.equalTo(35.0)
        })
    }

    @objc private func actionButtonPressed() {
        listViewController?.newShareTapped()
    }
}
