import Foundation
import CoreLocation

struct NewsAPIEndpoint {
    
    static let baseUrl = "https://newsapi.org/v2/"
    static let apiKey = "5c02e2f1304c4262a8bf2d4a3b3863f4"
    
    enum QueryType: String {
      case topHeadlines = "top-headlines"
      case everything
    }
    
    static func path(queryType: QueryType, userInput: String?) -> String {
        let url = "\(baseUrl)/\(queryType.rawValue)"
        let key = "apiKey=\(apiKey)"
        var queryString = "country=us"
        if let userInput {
            queryString = "q=\(userInput)"
        }
        return "\(url)?\(key)&\(queryString)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Error"
    }
}

