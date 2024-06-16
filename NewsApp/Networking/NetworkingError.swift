//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 16/06/2024.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
