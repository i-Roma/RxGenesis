//
//  ServerError.swift
//  MODsense
//
//  Created by Roman Romanenko on 11/24/19.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

struct ServerError: Codable {
    let message: String
    let status: AppServerErrorType
    let error: String?
    let code: Int?
}
