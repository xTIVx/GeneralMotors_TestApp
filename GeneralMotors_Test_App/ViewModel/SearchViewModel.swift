//
//  MainViewModel.swift
//  GeneralMotors_Test_App
//
//  Created by Igor Chernobai on 7/12/21.
//

import Foundation


class SearchViewModel {

    var tracksData: [Results]?
    var apiHandler: APIHandler?


    /// Calling fetch data from APIHandler, assingning result to tracksData and letting know about success by send empty callBack
    /// - Parameters:
    ///   - artist: String from Search field
    ///   - completion: calling when fetching is finished successfully
    func fetchArtistData(artist: String, completion: @escaping ([Results]?) -> ()) {
        apiHandler = APIHandler()
        apiHandler?.fetchArtists(by: artist, completion: { tracksArr in
            if let tracks = tracksArr {
                self.tracksData = tracks
                completion(tracksArr)
            }
        })
    }

    /// Using to get number of rows for TableView
    /// - Returns: Count of elements from tracksData
    func getNumberOfRows() -> Int? {
        return tracksData?.count
    }


    /// Using to get artist object for every each cells
    /// - Parameter row: IndexPath.row
    /// - Returns: Artist object for cell
    func getArtistDataForCell(for row: Int) -> Results? {
        return tracksData?[row]
    }

    /// Using for reset data to clear TableView
    func clearData() {
        tracksData = nil
    }

}
