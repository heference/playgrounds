//
//  APIService.swift
//  HFProjectPlayground
//
//  Created by Heference on 26/08/2019.
//  Copyright © 2019 sfp. All rights reserved.
//

import Foundation
import RxSwift

class APIService {
//    let keyword = "etners"
//    let req = URLRequest(url: URL(string: "https://itunes.apple.com/search?term=\(keyword)&country=us&entity=software")!)
//    func request<T: Codable>(request: URLRequest) -> Observable<T> {
//        return Observable<T>.create { observable in
//            return Disposable.create()
//        }
//    }
    
}

struct APIResult: Decodable {
    let resultCount: Int?
    let results: [ITunesSearchAPI]?
}

struct ITunesSearchAPI: Decodable {
    let screenshotUrls: [String]?
    let ipadScreenshotUrls: [String]?
    let appletvScreenshotUrls: [String]?
    let artworkUrl60: String?
    let artworkUrl512: String?
    let artworkUrl100: String?
    let artistViewUrl: String?
    let isGameCenterEnabled: Bool?
    let supportedDevices: [String]?
    let advisories: [String]?
    let kind: String?
    let features: [String]?
    let averageUserRatingForCurrentVersion: Double?
    let trackCensoredName: String?
    let languageCodesISO2A: [String]?
    let fileSizeBytes: String?
    let sellerUrl: String?
    let contentAdvisoryRating: String?
    let userRatingCountForCurrentVersion: Int?
    let trackViewUrl: String?
    let trackContentRating: String?
    let trackId: Int?
    let isVppDeviceBasedLicensingEnabled: Bool?
    let minimumOsVersion: String?
    let releaseDate: String?
    let sellerName: String?
    let primaryGenreName: String?
    let genreIds: [String]?
    let releaseNotes: String?
    let primaryGenreId: Int?
    let currency: String?
    let wrapperType: String?
    let version: String?
    let currentVersionReleaseDate: String?
    let artistId: Int?
    let artistName: String?
    let genres: [String]?
    let price: Int?
    let description: String?
    let trackName: String?
    let bundleId: String?
    let formattedPrice: String?
    let averageUserRating: Int?
    let userRatingCount: Int?
}
