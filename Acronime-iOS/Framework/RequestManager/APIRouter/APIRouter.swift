//
//  APIRouter.swift
//  Acronime-iOS
//
//  Created by Jorge Luis Rivera Ladino on 31/03/21.
//

import Foundation

enum APIRouter {
    
    case Dictionary([String: String])
    //case CreateDelay(parameters: [String: String], model: Codable?)
    
    private var method: HTTPMethod {
        switch self {
        case .Dictionary:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Dictionary(let parameters):
            return "dictionary.py".queryString(params: parameters)
        }
    }
    
    private var url: String {
        ApiManagerConstants.endpoint
    }
    
    private var urlRequest: URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    private var nsUrlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else {
            return nil
        }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        //urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    var request: URLRequest? {
        switch self {
        case .Dictionary:
            return nsUrlRequest
        }
    }
    
}
