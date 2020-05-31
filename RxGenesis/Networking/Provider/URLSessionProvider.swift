//
//  URLSessionProvider.swift
//

import Foundation

final class URLSessionProvider: ProviderProtocol {
    
    // MARK: Dependency
    
    private var session: URLSessionProtocol
    
    // MARK: Properties
    
    private var request: URLRequest?
    private var task: URLSessionDataTask?
    private var dataTaskCompletion: ((Data?, URLResponse?, Error?) -> Void)?
    
    // MARK: Initialization
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    // MARK: Methods
    
    @discardableResult
    func request<ResponseModel>(from apiService: APIServiceProtocol, responseType: ResponseModel.Type,
                                completion: @escaping Server<ResponseModel>) -> URLSessionDataTask where ResponseModel: Decodable {
        
        request = URLRequest(apiService: apiService)
        
        dataTaskCompletion = { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            
            self.handleResponse(data: data, response: httpResponse, error: error, completion: completion)
            DispatchQueue.main.async {
            }
        }
        
        task = session.dataTask(request: request!, completionHandler: dataTaskCompletion!)
        task!.resume()
        
        return task!
    }
    
    private func handleResponse<ResponseModel: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?,
                                                          completion: @escaping Server<ResponseModel>) {
        
        #if DEBUG
            print("")
            print("--- --- --- data --- --- ---")
            print(data as Any)
            print("")
            
            let rawResponse = String(decoding: data!, as: UTF8.self)
            print("")
            print("--- --- --- Raw response for \(String(describing: request?.url)) --- --- ---")
            print("")
            print(rawResponse)
            print("")
            print("--- --- --- --- --- --- --- --- ---")
            print("")
        #endif
        
        guard error == nil else { return completion(.failure(.unknown)) }
        guard let response = response else { return completion(.failure(.noJSONData)) }
        guard let data = data else { return completion(.failure(.unknown)) }
        
        switch response.statusCode {
        case 200...299:

            do {
                let model = try JSONDecoder().decode(ResponseModel.self, from: data)
                completion(.success(model))
            } catch let error {
                print(error)
                completion(.failure(.decodingError))
            }
            
        case 401:
            
            NotificationCenter.default.post(name: .authenticationError, object: nil)

            do {
                let error = try JSONDecoder().decode(ServerError.self, from: data)
                return completion(.handledError(error))
            } catch _ {
                return completion(.failure(.authenticationError))
            }
            
        case 409:
            
            do {
                let error = try JSONDecoder().decode(ServerError.self, from: data)
                return completion(.handledError(error))
            } catch _ {
                return completion(.failure(.alreadyExist))
            }
            
        case 400...499:
            
            #if DEBUG
                let rawResponse = String(decoding: data, as: UTF8.self)
                print("")
                print("--- --- --- Raw response for \(String(describing: request?.url)) --- --- ---")
                print("")
                print(rawResponse)
                print("")
                print("--- --- --- --- --- --- --- --- ---")
                print("")
            #endif

            do {
                let error = try JSONDecoder().decode(ServerError.self, from: data)
                return completion(.handledError(error))
            } catch _ {
                return completion(.failure(.unknown))
            }
            
        case 500...599:
            
            return completion(.failure(.serverSideError))
            
        default:
            completion(.failure(.unknown))
        }
    }
    
}

extension Notification.Name {
    
    static let authenticationError = Notification.Name("\(appName).authenticationError")
    static let logout = Notification.Name("\(appName).logout")
    
}
