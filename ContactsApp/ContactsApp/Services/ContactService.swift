//
//  ContactService.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import Foundation

enum ContactError: Error {
    case invalidUrl
}

protocol ContactServiceProtocol {
    func fetchContactsWithAsyncURLSession() async throws -> [Contact]
}

struct ContactService: ContactServiceProtocol {
    
    static let shared = ContactService()
    
    enum HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    
    enum Request {
        case fetchContactsWithAsyncURLSession
        
        var basePath: String {
            switch self {
            case .fetchContactsWithAsyncURLSession: return "/users"
            }
        }
        
        var baseUrl: String { return "https://gorest.co.in/public/v2" }
        
        var url: String { return baseUrl + basePath }
    }
    
    func fetchContactsWithAsyncURLSession() async throws -> [Contact] {

        guard let url = URL(string: Request.fetchContactsWithAsyncURLSession.url) else {
            throw ContactError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching data") }
        let orders = try JSONDecoder().decode([Contact].self, from: data)
        return orders
    }
}
