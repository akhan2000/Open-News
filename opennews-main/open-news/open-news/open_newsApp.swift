//
//  open_newsApp.swift
//  open-news
//
//  Created by Asfandyar Khan on 3/2/23.
//

import SwiftUI

@main
struct open_newsApp: App {
    @StateObject var topHeadlinesLoader = TopHeadlinesLoader(apiClient: NewsAPIClient())
    @StateObject var searchableHeadlinesLoader = SearchableHeadlinesLoader(apiClient: NewsAPIClient())
    

       var body: some Scene {
           WindowGroup {
               TabContainer()
               .environmentObject(topHeadlinesLoader)
               .environmentObject(searchableHeadlinesLoader)
           }
       }
   }
