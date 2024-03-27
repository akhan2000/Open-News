import Foundation
import CoreLocation

protocol NewsAPI {
    func fetchSearchableHeadlines(userInput : String) async throws -> NewsResponse
    func fetchHeadlines() async throws -> NewsResponse
}

struct NewsAPIClient: NewsAPI, APIClient {
    let session: URLSession = .shared
    
    func fetchHeadlines() async throws -> NewsResponse {
        let path = NewsAPIEndpoint.path (queryType: .topHeadlines, userInput: nil)
    dump (path)
    let response: NewsResponse = try await performRequest (url: path)
    return response
    }
    
    func fetchSearchableHeadlines(userInput : String) async throws -> NewsResponse {
        let path = NewsAPIEndpoint.path (queryType: .everything, userInput : userInput)//queryString?
    dump (path)
        let response: NewsResponse = try await performRequest (url: path)
    return response
    }
}

struct MockNewsAPIClient: NewsAPI {
    func fetchSearchableHeadlines(userInput : String) async throws -> NewsResponse{
        NewsResponse.mock()
    }
    func fetchHeadlines() async throws -> NewsResponse {
        NewsResponse.mock()
    }
}

