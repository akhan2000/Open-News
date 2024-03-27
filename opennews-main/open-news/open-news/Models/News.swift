//
//  News.swift
//  open-news
//
//  Created by Asfandyar Khan on 3/6/23.
//

import Foundation
import CoreLocation

struct NewsResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    static func mock() -> NewsResponse {
    NewsResponse (status: "ok", totalResults: 2, articles:
    [Article (source: Source(id: "the-times-of-india", name: "The Times of India"), author: "Reuters", title: "Asian stocks up on hopes Fed will adopt slow approach to more hikes", description: "The Dow Jones Industrial Average rose around 1%, while the S&P 500 and Nasdaq Composite both gained around 0.75%, even as Tesla Inc fell nearly 6% after the company failed to impress investors with few details on its plan to unveil an affordable electric vehi..", url: "https://economictimes.indiatimes.com/markets/stocks/news/asian-stocks-up-on-hopes-fed-will-adopt-slow-approach-to-more-hikes/articleshow/98378192.cms", urlToImage:
    "https://img.etimg.com/thumb/msid-98378246,width-1070,height-580,imgsize-93902,overlay-etmarkets/photo.jpg", publishedAt: "2023-03-0302:54:59Z", content: "Asian shares rose on Friday after Wall Street reversed losses on signals of a measured policy tightening approach from the U.S. Federal Reserve as well as on prospects of a solid economic recovery in... [+3025 chars]"),
    Article(source: Source(id: nil, name: "Motley Fool Australia"), author: "Tristan Harrison", title: "Is the BetaShares NASDAQ 100 ETF (NDQ) worth buying for dividend income?", description: "Are US tech shares actually good dividend payers?\nThe post Is the BetaShares NASDAQ 100 ETF (NDQ) worth buying for dividend income? appeared first on The Motley Fool Australia.", url:
    "https://www.fool.com.au/2023/03/03/is-the-betashares-nasdaq-100-etf-ndq-worth-buying-for-dividend-income/", urlToImage:
    "https://www.fool.com.au/w-content/uploads/2021/09/GettyImages-667652105-1-1200x675.jpg", publishedAt:
    "2023-03-0302:43:25Z", content: "The BetaShares NASDAQ 100 ETF (ASX: NDQ) is one of the most popular exchange-traded funds (ETFs) on the AX, with net assets of $2.6 billion. It has managed to achieve good capital growth, though inv... [+2526 chars]")
     ])
    }
}
struct TopHeadlinesResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    public var id: String {
        self.url
        }
    static func mockCollection() -> [Article] {
        [Article(source: Source(id: "engadget",
                            name: "Engadget"), author: "Will Shanklin", title: "Movies Anywhere will soon shut down its Screen Pass content-sharing feature", description: "Movies Anywhere announced Wednesday that it's soon shutting down Screen Pass, its movie-sharing feature launched during COVID-19 lockdowns. The Disney-owned platform didn't provide a reason for the closure.'As the experience continues to evolve, we want to no...'" ,  url:"https://www.engadget.com/movies-anywhere-will-soon-shut-down-its-screen-pass-content-sharing-feature-181855250.html",
             urlToImage: "https://s.yimg.com/uu/api/res/1.2/Yjt943fjtfdorSwYWM84kg--~B/Zmk9ZmlsbDtoPTYZMDtweW9mZj0w03c9MTIwMDthcHBpZD15dGFjaH1vbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2023-02/76d85150-b925-11ed-b4f7-67997bec7d85.cf.jpg", publishedAt: "2023-03-0218:18:55Z", content: "Movies Anywhere announced Wednesday that its soon shutting down Screen Pass, its movie-sharing feature launched during COVID-19 lockdowns. The Disney-owned platform didnt provide a reason for the clo...[+1117 chars]")
        ]
    }
}
         
struct Source: Decodable {
    var id: String?
    var name: String
}

extension NewsResponse {
static let previewData = NewsResponse(status: "ok", totalResults: 2, articles:                            [Article (source: Source(id: "the-times-of-india", name: "The Times of India"), author: "Reuters", title: "Asian stocks up on hopes Fed will adopt slow approach to more hikes", description: "The Dow Jones Industrial Average rose around 1%, while the S&P 500 and Nasdaq Composite both gained around 0.75%, even as Tesla Inc fell nearly 6% after the company failed to impress investors with few details on its plan to unveil an affordable electric vehi..", url: "https://economictimes.indiatimes.com/markets/stocks/news/asian-stocks-up-on-hopes-fed-will-adopt-slow-approach-to-more-hikes/articleshow/98378192.cms", urlToImage:"https://img.etimg.com/thumb/msid-98378246,width-1070,height-580,imgsize-93902,overlay-etmarkets/photo.jpg", publishedAt: "2023-03-0302:54:59Z", content: "Asian shares rose on Friday after Wall Street reversed losses on signals of a measured policy tightening approach from the U.S. Federal Reserve as well as on prospects of a solid economic recovery in... [+3025 chars]"),Article(source: Source(id: nil, name: "Motley Fool Australia"), author: "Tristan Harrison", title: "Is the BetaShares NASDAQ 100 ETF (NDQ) worth buying for dividend income?", description: "Are US tech shares actually good dividend payers?\nThe post Is the BetaShares NASDAQ 100 ETF (NDQ) worth buying for dividend income? appeared first on The Motley Fool Australia.", url:
"https://www.fool.com.au/2023/03/03/is-the-betashares-nasdaq-100-etf-ndq-worth-buying-for-dividend-income/", urlToImage:
  "https://www.fool.com.au/w-content/uploads/2021/09/GettyImages-667652105-1-1200x675.jpg", publishedAt:
 "2023-03-0302:43:25Z", content: "The BetaShares NASDAQ 100 ETF (ASX: NDQ) is one of the most popular exchange-traded funds (ETFs) on the AX, with net assets of $2.6 billion. It has managed to achieve good capital growth, though inv... [+2526 chars]")
 ])
}
