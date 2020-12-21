//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by T-Mobile on 17/12/20.
//

import UIKit

class CitiesTableViewController: UITableViewController, AddCityDelegate {
    
    let citiesViewModel = CitiesViewModel()
    let pullToRefresh = UIRefreshControl()
    var progressHud: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        let bgImage = UIImageView(image: UIImage(named: "cloudsBG.jpg"))
        bgImage.contentMode = .scaleAspectFill
        self.tableView.backgroundView = bgImage
        
        progressHud = UIActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))//UIActivityIndicatorView(style: .large)
        progressHud?.center = view.center
        progressHud?.style = .large
        progressHud?.color = .white
        progressHud?.hidesWhenStopped = true
        self.view.addSubview(progressHud!)
        
        callToFetchWeather()
        
        pullToRefresh.tintColor = .white
        pullToRefresh.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(pullToRefresh)
    }
    
    func callToFetchWeather() {
        progressHud?.startAnimating()
        self.citiesViewModel.callService { result in
            self.pullToRefresh.endRefreshing()
            self.progressHud?.stopAnimating()
            switch result {
            case .success( _):
                self.tableView.reloadData()
            case .failure( _):
                    print("<====Error=====>")
            }
            
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        callToFetchWeather()
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "WeatherDetailViewController" {
            let topViewController  = segue.destination as! UINavigationController
            let addCityViewController = topViewController.viewControllers[0] as! AddCityViewController
            addCityViewController.delegate = self
        } else {
            let weatherDetailsViewController = segue.destination as! WeatherDetailViewController
            weatherDetailsViewController.weatherList = sender as? List
        }
    }
    

}

extension CitiesTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citiesViewModel.weathers?.list.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell", for: indexPath) as! CitiesTableViewCell
        
        cell.cityLabel.text = self.citiesViewModel.weatherList(atIndex: indexPath.row).city
        cell.temperatureLabel.text = self.citiesViewModel.weatherList(atIndex: indexPath.row).temprautre
        cell.weatherIconImageView.load(url: self.citiesViewModel.weatherList(atIndex: indexPath.row).imageUrl)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "WeatherDetailViewController", sender: self.citiesViewModel.weatherList(atIndex: indexPath.row))
    }
}

extension CitiesTableViewController {
    // MARK: - AddCityDelegate
    func addSelectedCity(with cityID: Int) {
        citiesViewModel.citiesId.append(cityID)
        callToFetchWeather()
    }
}
