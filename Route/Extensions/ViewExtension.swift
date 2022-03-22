//
//  Extension.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { subView in
            addSubview(subView)
        }
    }

	///  Прицепить вью констрейнтами к супервью с одинаковым отступом от всех сторон
	///
	/// - Parameters:
	///     - inset: отступ
	///     - respectingSafeArea:  учитывать ли сейф эрию
	func pinToSuperView(inset: CGFloat = 0.0, respectingSafeArea: Bool = true) {
		pinToSuperView(insets: UIEdgeInsets(top: inset,
											left: inset,
											bottom: inset,
											right: inset),
					   respectingSafeArea: respectingSafeArea)
	}

	///  Прицепить вью констрейнтами к супервью с разным отступом от всех сторон
	///
	/// - Parameters:
	///     - insets:  отступы
	///     - respectingSafeArea:  учитывать ли сейф эрию
	func pinToSuperView(insets: UIEdgeInsets, respectingSafeArea: Bool = true) {

		guard let superview = superview else { return }
		let safeAreaLayoutGuide = superview.safeAreaLayoutGuide

		let top = respectingSafeArea ? safeAreaLayoutGuide.topAnchor : superview.topAnchor
		let leading = respectingSafeArea ? safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor
		let trailing = respectingSafeArea ? safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor
		let bottom = respectingSafeArea ? safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor

		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			topAnchor.constraint(equalTo: top, constant: insets.top),
			leadingAnchor.constraint(equalTo: leading, constant: insets.left),
			trailingAnchor.constraint(equalTo: trailing, constant: -insets.right),
			bottomAnchor.constraint(equalTo: bottom, constant: -insets.bottom)
		])
	}
}

extension UIViewController {
    @objc func topMostViewController() -> UIViewController {
        if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController()
        } else {
            for view in self.view.subviews {

                if let subViewController = view.next {
                    if subViewController is UIViewController {
                        let viewController = subViewController as! UIViewController
                        return viewController.topMostViewController()
                    }
                }
            }
            return self
        }
    }
}

extension UITabBarController {
    override func topMostViewController() -> UIViewController {
        return self.selectedViewController!.topMostViewController()
    }
}

extension UINavigationController {
    override func topMostViewController() -> UIViewController {
        return self.visibleViewController!.topMostViewController()
    }
}
