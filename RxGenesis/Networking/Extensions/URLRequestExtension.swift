//
//  URLRequestExtension.swift
//

import Foundation

extension URLRequest {
    
    init(apiService: APIServiceProtocol) {
        let urlComponents = URLComponents(apiService: apiService)
        
        self.init(url: urlComponents.url!)
        addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        httpMethod = apiService.method.rawValue
        apiService.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        guard case let .with(parameters) = apiService.requestType, apiService.parametersEncoding == .json else { return }
        
        #if DEBUG
        print("--- --- --- --- --- --- ---")
        print("")
        print("URLComponents apiService url:", url as Any, "method:", apiService.method.rawValue)
        print("")
        print("APIService parameters ->", parameters)
        print("")
        print("--- --- --- --- --- --- ---")
        #endif
        
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
    
}
