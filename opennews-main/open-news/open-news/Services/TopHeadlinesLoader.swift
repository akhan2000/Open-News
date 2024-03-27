import Foundation

class TopHeadlinesLoader: ObservableObject {
    let apiClient: NewsAPI
    
    @Published private(set) var state: LoadingState = .idle
    
    enum LoadingState {
        case idle
        case loading
        case success(data: [Article])
        case failed(error: Error)
    }
    
    init(apiClient: NewsAPI) {
        self.apiClient = apiClient
    }
    
    @MainActor
    func loadHeadlinesData() async {
        self.state = .loading
        do {
            let response = try await apiClient.fetchHeadlines()
            self.state = .success(data: response.articles)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
