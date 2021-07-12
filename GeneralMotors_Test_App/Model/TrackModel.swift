//
//  TrackModel.swift
//  GeneralMotors_Test_App
//
//  Created by Igor Chernobai on 7/12/21.
//

import Foundation


struct TrackModel: Codable {
    let results: [Results?]?
}

struct Results: Codable {
    let artistName: String?
    let trackName: String?
    let releaseDate: String?
    let primaryGenreName: String?
    let trackPrice: Double?
}

