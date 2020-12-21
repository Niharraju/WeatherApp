//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by T-Mobile on 18/12/20.
//

import Foundation

class AddCityViewModel {
    
    var cities = [City]()
    var filteredCities = [City]()
    
    func fetchCitiesListFromJson(oncompletion:(_ success: Bool) -> Void) {
        if let localData = self.readLocalFile(forName: "cityList") {
            self.parse(jsonData: localData) { isSuccess in
                oncompletion(isSuccess)
            }
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
            do {
                if let bundlePath = Bundle.main.path(forResource: name,
                                                     ofType: "json"),
                    let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    return jsonData
                }
            } catch {
                print(error)
            }
            
            return nil
        }
    
    private func parse(jsonData: Data, oncompletion:(_ success: Bool) -> Void) {
            do {
                let decodedData = try JSONDecoder().decode([City].self,
                                                           from: jsonData)
                self.cities = decodedData
                oncompletion(true)
            } catch {
                print("decode error ==> \(error)")
                oncompletion(false)
            }
        }
    
    //Filter cities with search string and returns filtered cities lis
    func filterCities(withInput: String, oncompletion: ([City]) -> Void) {
        filteredCities = cities.filter({ $0.name.lowercased().contains(withInput.lowercased())})
        oncompletion(filteredCities)
    }
}
