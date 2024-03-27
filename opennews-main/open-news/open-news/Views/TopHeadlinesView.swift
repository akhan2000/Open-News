import SwiftUI

struct TopHeadlinesView: View {
    @EnvironmentObject var loader: TopHeadlinesLoader
    
    var body: some View {
        VStack {
            switch loader.state {
            case .idle, .loading:
                ProgressView()
            case .failed(let error):
                Text("Failed to load headlines: \(error.localizedDescription)")
                    .padding()
            case .success(let articles):
                if articles.isEmpty {
                    Text("No headlines to show")
                        .padding()
                } else {
                    List(articles) { article in
                        VStack(alignment: .leading) {
                            if let imageURL = article.urlToImage,
                               let url = URL(string: imageURL) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
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
               
        }.task { await loader.loadHeadlinesData() }
    }
}

struct TopHeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        let loader = TopHeadlinesLoader(apiClient: MockNewsAPIClient())
        return TopHeadlinesView()
            .environmentObject(loader)
    }
}
