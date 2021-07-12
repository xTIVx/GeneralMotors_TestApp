//
//  TackTableViewCell.swift
//  GeneralMotors_Test_App
//
//  Created by Igor Chernobai on 7/12/21.
//

import UIKit

class TrackTableViewCell: UITableViewCell {


    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var trackLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var customView: UIView!


    /// Artist object, parsing when avaliable
    var trackData: Results? {
        didSet {
            if let trackData = trackData {
                artistLbl.text = trackData.artistName  ?? "none"
                trackLbl.text = trackData.trackName ?? "none"
                genreLbl.text = trackData.primaryGenreName  ?? "none"
                releaseLbl.text = trackData.releaseDate?.getDateString()  ?? "none"
                priceLbl.text = "\(trackData.trackPrice?.description ?? "-")$"
            }
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()

        // Setup cell UI
        customView.layer.cornerRadius = 5

        customView.layer.shadowColor = UIColor.gray.cgColor
        customView.layer.shadowOpacity = 0.6
        customView.layer.shadowOffset = .zero
        customView.layer.shadowRadius = 5

    }
}
