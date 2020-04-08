//
//  APIService.swift
//  GitHubSearcher
//
//  Created by Deepak Raman on 4/6/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct APIService: URLRequestConvertible {
   
    public let type: ServiceType
    
    init(type: ServiceType) {
        self.type = type
    }
    
    public var url: String {
        switch type {
        case .searchUsers(let searchText, let page):
            return "/search/users?q=\(searchText)&page=\(page)"
        case .getUser(let loginID):
            return "/users/\(loginID)"
        case .searchRepos(let searchText, let loginID):
            return "/search/repositories?q=\(searchText)+in:name+user:\(loginID)"
        }
    }
    
    public var httpMethod: String {
        switch type {
        case .searchUsers, .getUser, .searchRepos:
            return "GET"
        }
    }
    
    public var headers: [String : String] {
        return ["Authorization": "Bearer e77ad44bcc7798ee9205feee8ec7f92ef8b765c2"]
    }
}
