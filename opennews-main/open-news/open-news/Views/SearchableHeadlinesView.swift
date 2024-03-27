import Foundation
import SwiftUI

struct SearchableHeadlinesView: View {
    @EnvironmentObject var loader: SearchableHeadlinesLoader
    @State var userInput: String = ""
    
    var body: some View {
        VStack {
            VStack {
                TextField("Search", text: $userInput)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(radius: 2)
                    .disableAutocorrection(true)
                    .onSubmit {
                        Task {
                            await loader.loadHeadlinesData(userInput: userInput)
                        }
                    }
                
                Button("Get Articles") {
                    Task {
                        await loader.loadHeadlinesData(userInput: userInput)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
                .shadow(radius: 2)
                .disabled(userInput.isEmpty)
            }
            .padding()
            
            switch loader.state {
            case .idle : Color.clear
            case .loading : ProgressView()
            case .failed(let error) : Text("Failed to load headlines: \(error.localizedDescription)")
            case .success(let articles):
                if articles.isEmpty {
                    Text("No headlines to show")
                }
                else {
                    List(articles) { article in
                        VStack(alignment: .leading) {
                            if let urlToImage = article.urlToImage {
                                AsyncImage(url: URL(string: urlToImage)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    case .failure:
                                        Image(systemName: "photo")
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(height: 200)
                            }
                            Text(article.title )
                                .font(.headline)
                            Text(article.description ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            Spacer()
            
        }
    }
}

struct SearchableHeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        let loader = SearchableHeadlinesLoader(apiClient: MockNewsAPIClient())
        return SearchableHeadlinesView(userInput: "userInput")
            .environmentObject(loader)
    }
}
