//
//  DayModel.swift
//  WhatHolidayIsToday
//
//  Created by Степан Фоминцев on 18.03.2023.
//

import Foundation

struct DayElement: Codable {
    let name: String
}

typealias Day = [DayElement]
