//
//  AppServerErrorType.swift
//  MODsense
//
//  Created by Roman Romanenko on 11/24/19.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

enum AppServerErrorType: Int, Codable {
    case wrongLoginCrendentials = 401
    case alreadyExists = 409
    case invalidEmail = 422
}
