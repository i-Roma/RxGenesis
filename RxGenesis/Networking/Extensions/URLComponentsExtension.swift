//
//  URLComponentsExtension.swift
//

import Foundation

extension URLComponents {
    
    init(apiService: APIServiceProtocol) {
        let url = apiService.baseURL.appendingPathComponent(apiService.path)
        
        print("")
        print("URLComponents apiService url:", url)
        print("")
        
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard case let .with(parameters) = apiService.requestType, apiService.parametersEncoding == .url else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
