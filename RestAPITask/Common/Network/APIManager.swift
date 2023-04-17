//
//  APIManager.swift
//  RestAPITask
//
//  Created by Khurshed Umarov on 17.04.2023.
//

import Foundation
import Alamofire

struct APIManager {
    let path: String
    let params: [String: String]?
    let httpMethod: HTTPMethod
//    let completion: () -> Void  completion: @escaping  () -> Void
    
    init(path: String, params: [String : String]? = nil, httpMethod: HTTPMethod = .get) {
        self.path = path
        self.params = params
        self.httpMethod = httpMethod
//        self.completion = completion
    }
    
    public func callAPI() async throws -> Data {
        
        guard let url = URLComponents(string: "\(APIConstants.baseUrl)\(path)") else {
            throw CustomError.urlRequestNull
        }
        
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        
        return try await withCheckedThrowingContinuation({ continuation in
            AF.request(url, method: httpMethod, parameters: params, headers: headers).responseData { response in
                switch(response.result) {
                case let .success(data):
                    continuation.resume(returning: data)
                case let .failure(error):
                    continuation.resume(throwing: self.handleError(error: error))
                }
            }
        })
    }
    
    private func handleError(error: AFError) -> Error {
        if let underlyingError = error.underlyingError {
            let nserror = underlyingError as NSError
            let code = nserror.code
            if code == NSURLErrorNotConnectedToInternet ||
                code == NSURLErrorTimedOut ||
                code == NSURLErrorInternationalRoamingOff ||
                code == NSURLErrorDataNotAllowed ||
                code == NSURLErrorCannotFindHost ||
                code == NSURLErrorCannotConnectToHost ||
                code == NSURLErrorNetworkConnectionLost
            {
                var userInfo = nserror.userInfo
                userInfo[NSLocalizedDescriptionKey] = "Unable to connect to the server"
                let currentError = NSError(
                    domain: nserror.domain,
                    code: code,
                    userInfo: userInfo
                )
                return currentError
            }
        }
        return error
    }
}


struct APIConstants {
    static let baseUrl: String = "https://randomuser.me/"
}
