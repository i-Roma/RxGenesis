//
//  ServiceProtocol.swift
//

import Foundation

typealias Headers = [String: String]

protocol APIServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var headers: Headers? { get }
    var method: HTTPMethod { get }
    var requestType: RequestType { get }
    var parametersEncoding: ParametersEncoding { get }
}

extension APIServiceProtocol {
    
    var headers: Headers? {
        return nil
    }
    
    /*var headers: Headers? {
        return ["x-access-token": <token>]
    }*/
    
    var baseURL: URL {
        return URL(string: NosmicAPI.domain)!
    }

}
