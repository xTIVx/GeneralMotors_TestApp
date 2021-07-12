//
//  APIHandler.swift
//  GeneralMotors_Test_App
//
//  Created by Igor Chernobai on 7/12/21.
//

import Foundation


class APIHandler {


    /// - Parameter artistName: String from search field
    /// - Returns: Builded URL for request
    private func createURL(artistName: String) -> URL? {
        return URL(string: "https://itunes.apple.com/search?term=\(artistName)")
    }


    /// Fetching data using created URL and returning callback with array of artists
    /// - Parameters:
    ///   - artistName: String from search field
    ///   - completion: Array with artists
    func fetchArtists(by artistName: String, completion: @escaping ([Results]?) -> ()) {
        guard let url = createURL(artistName: artistName) else { completion(nil); return }
        URLSession.shared.dataTask(with: url) { data, resp, err in
            guard let data = data,
                  err == nil else {print(err!.localizedDescription); return}

            completion(self.decodeData(data: data))
        }.resume()
    }


    /// Decoding data into Results model
    /// - Parameter data: data from URLSession
    /// - Returns: Array with artists model
    func decodeData(data: Data) -> [Results]? {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(TrackModel.self, from: data)
            
            return response.results as? [Results]
        }
        catch {
            print(error)
            return nil
        }
    }
}
