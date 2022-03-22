//
//  RouteCell.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import UIKit
import SnapKit
import Firebase

class RouteCell: UITableViewCell {

    var listViewController: ListViewController!

    var route: RouteInfo! {
        didSet {
            listViewController.observeStateHandler(route, self)
            timeLabel.text = CustomDateFormatter.formateDate(from: route.lastUpdate)
        }
    }

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 15
        stack.alignment = .leading
        stack.distribution = .fillEqually
        return stack
    }()

    private let cargoImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "shippingbox.fill")
        return image
    }()

    private var startTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        return label
    }()

    private let endTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        return label
    }()

    private(set) var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.addSubviews(stackView, cargoImage)
        stackView.addSubviews(startTitle, endTitle, timeLabel)
        startTitle.text = route.beginPoint.name
        endTitle.text = route.endPoint.name
    }

    func setupConstraints() {
        contentView.pinToSuperView()

        stackView.snp.makeConstraints({ make in
            make.top.equalTo(contentView.snp.top).offset(15.0)
            make.bottom.equalTo(contentView.snp.bottom).offset(15.0)
            make.leading.equalTo(contentView.snp.leading).offset(15.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15.0)
        })

        cargoImage.snp.makeConstraints({ make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(30.0)
            make.height.equalTo(30)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15.0)
        })
    }

}
