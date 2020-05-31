//
//  ProviderProtocol.swift
//

import Foundation

enum NetworkResponse<ResponseModel> {
    case success(ResponseModel)
    case accessTokenUpdated
    case handledError(ServerError)
    case failure(NetworkError)
}

typealias Server<ResponseModel> = (NetworkResponse<ResponseModel>) -> ()

protocol ProviderProtocol {
    func request<ResponseModel>(from apiService: APIServiceProtocol, responseType: ResponseModel.Type,
                                completion: @escaping Server<ResponseModel>) -> URLSessionDataTask where ResponseModel: Decodable
}

