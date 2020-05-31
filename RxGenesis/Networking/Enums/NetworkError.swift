//
//  NetworkError.swift
//

import Foundation

enum NetworkError: String, Error {
    case unknown             = "Unexpected error"
    case decodingError       = "Swift.DecodingError keyNotFound"
    case alreadyExist        = "The device already registered"
    case authenticationError = "You must be Authenticated. Please login."
    case authErrorRefreshTokenExpired = "Refresh token expired."
    case badRequest          = "Bad Request"
    case serverSideError     = "Server error"
    case noJSONData          = "No JSON data"
}
