import SwiftUI
import Foundation

struct TabContainer: View {
@EnvironmentObject var headlinesLoader: TopHeadlinesLoader
@EnvironmentObject var searchableHeadlinesLoader:SearchableHeadlinesLoader

    var body: some View {
        TabView {
            TopHeadlinesView()
            .tabItem {
                Label("Top Headlines", systemImage:
                        "newspaper")
            }
            SearchableHeadlinesView()
                .tabItem{
                    Label ("Search", systemImage:
                            "magnifyingglass")
                }
        }
    }
}
struct TabContainer_Previews: PreviewProvider {
static var previews: some View {
    TabContainer().environmentObject(TopHeadlinesLoader(apiClient:MockNewsAPIClient()))
        .environmentObject (SearchableHeadlinesLoader(apiClient:MockNewsAPIClient ()))
    }
}
