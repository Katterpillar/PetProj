//
//  ResponceHelper.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation

import Foundation
import Alamofire
import AVFoundation

struct EnvironmentInterceptor: RequestInterceptor {

    func retry(_ request: Request, for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        if let response = request.task?.response as? HTTPURLResponse {

            switch response.statusCode {
            case 200...201:
                completion(.doNotRetry)
            case 401:
                completion(.retry)
            default:
                print("Request Interceptor Error")
                completion(.doNotRetryWithError(error))
            }
        } else {
            completion(.doNotRetry)
        }
    }
}
