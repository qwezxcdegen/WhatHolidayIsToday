//
//  ViewController.swift
//  WhatHolidayIsToday
//
//  Created by Степан Фоминцев on 18.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        let day = Date()
            .formatted(date: .numeric, time: Date.FormatStyle.TimeStyle.standard)
            .split(separator: ", ")[0]
            .split(separator: "/")[1]
        let month = Date()
            .formatted(date: .numeric, time: Date.FormatStyle.TimeStyle.standard)
            .split(separator: ", ")[0]
            .split(separator: "/")[0]
        let preferredLanguage = Locale.preferredLanguages[0].split(separator: "-")[0]
        let url = URL(string: "https://holidays.abstractapi.com/v1/?api_key=a753bd4b7bd3465dbe6fbf1601a26eac&country=\(preferredLanguage)&month=\(month)&day=\(day)")!
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            DispatchQueue.main.async {
                print(String(data: data, encoding: .utf8))
            }
        }.resume()
    }

}

