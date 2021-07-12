//
//  ViewController.swift
//  GeneralMotors_Test_App
//
//  Created by Igor Chernobai on 7/12/21.
//

import UIKit

class SearchArtistVC: UIViewController {

    // View Model
    var vm: SearchViewModel?

    @IBOutlet weak var tView: UITableView!
    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    override func viewDidLoad() {
        super.viewDidLoad()
        vm = SearchViewModel()
        setupTableView()

        searchBtn.layer.cornerRadius = 5
    }

    /// Using for register XIB cell and setup TableView UI
    func setupTableView() {
        let nib = UINib(nibName: "TrackTableViewCell", bundle: nil)
        tView.register(nib, forCellReuseIdentifier: "cell")

        tView.separatorStyle = .none
    }


    /// Requesting data for TableView and also clear existing data if searchField is empty
    /// - Parameter sender: Search Button
    @IBAction func ButtonPressed(_ sender: UIButton) {
        if !SearchField.text!.isEmpty {
            self.activityIndicator.startAnimating()
            vm?.fetchArtistData(artist: SearchField.text!, completion: {_ in 
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tView.reloadData()
                }
            })
        } else {
            vm?.clearData()
            self.tView.reloadData()
        }
    }

}


extension SearchArtistVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getNumberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TrackTableViewCell

        // Assigning Artist object for every cell
        cell?.trackData = vm?.getArtistDataForCell(for: indexPath.row)

        return cell ?? UITableViewCell()
    }


}



