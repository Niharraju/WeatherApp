//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by T-Mobile on 18/12/20.
//

import UIKit

protocol AddCityDelegate {
    func addSelectedCity(with cityID: Int)
}

class AddCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var searchCitiesTextField: UITextField!
    @IBOutlet weak var citiesTableView: UITableView!
    let addCityViewModel = AddCityViewModel()
    var progressHud: UIActivityIndicatorView?
    var delegate: AddCityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressHud = UIActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        progressHud?.center = view.center
        progressHud?.style = .large
        progressHud?.color = .white
        progressHud?.hidesWhenStopped = true
        progressHud?.startAnimating()
        self.view.addSubview(progressHud!)
        
        self.view.isUserInteractionEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.bringSubviewToFront(progressHud!)
        citiesTableView?.bringSubviewToFront(progressHud!)
        progressHud?.startAnimating()
        addCityViewModel.fetchCitiesListFromJson(oncompletion: { (isLoaded) in
            progressHud?.stopAnimating()
            self.view.isUserInteractionEnabled = true
        })
    }
    
    //Cancel navigation button callback action to dismiss current view
    @IBAction func cancelButtonDidClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension AddCityViewController {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCityViewModel.filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell", for: indexPath)
        
        cell.textLabel?.text = addCityViewModel.filteredCities[indexPath.row].name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            delegate?.addSelectedCity(with: addCityViewModel.filteredCities[indexPath.row].id)
            dismiss(animated: true, completion: nil)
        }
    }
    
}

extension AddCityViewController {
    // MARK: - TextView data source
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText  = textField.text! + string
        addCityViewModel.filterCities(withInput: searchText) { (filteredList) in
            self.citiesTableView.reloadData()
        }
        
        return true
        
    }
}
