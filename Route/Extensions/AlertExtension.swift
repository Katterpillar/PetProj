//
//  AlertExtension.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

import Foundation
import UIKit

public enum ErrorHandle {
    case defaultError(Int)
}

class AlertHelper: NSObject {

    static func showAlertWithTitle(_ conroller: UIViewController,
                                   title: String, message: String = "" ,
                                   dismissButtonTitle: String,
                                   dismissAction:@escaping ()->Void) {

        let validationLinkAlert = UIAlertController(title:title, message:message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: dismissButtonTitle, style: .default) { (action) -> Void in
            dismissAction()
        }

        validationLinkAlert.addAction(dismissAction)
        conroller.present(validationLinkAlert, animated: true, completion: nil)
    }

    static func showALertWithTitleAndMessage(_ controller: UIViewController,
                                             title: String, message: String,
                                             dismissButtonTitle: String,
                                             okButtonTitle: String,
                                             dismissAction:@escaping ()-> Void, okAction:@escaping ()-> Void) {

        let validationLinkAlert = UIAlertController(title:title, message:message, preferredStyle: .alert)

        let dismissAction = UIAlertAction(title: dismissButtonTitle, style: UIAlertAction.Style.default) { (action) in
            dismissAction()
        }

        let okAction = UIAlertAction(title: okButtonTitle, style: UIAlertAction.Style.default) { (action) in
            okAction()
        }

        validationLinkAlert.addAction(dismissAction)
        validationLinkAlert.addAction(okAction)

        controller.present(validationLinkAlert, animated: true, completion: nil)

    }

    static func showAlertWithData(data: Data,
                                  dismissButtonTitle: String,
                                  dismissAction:@escaping ()->Void) {
        let message = String(data: data, encoding: String.Encoding.utf8)

        let validationLinkAlert = UIAlertController(title:"API Error", message:message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: dismissButtonTitle, style: .default) { (action) -> Void in
            dismissAction()
        }

        validationLinkAlert.addAction(dismissAction)
        let topController = UIApplication.shared.keyWindow!.rootViewController!.topMostViewController()
        topController.present(validationLinkAlert, animated: true, completion: nil)
    }
}
