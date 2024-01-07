//
//  Date.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 07/01/24.
//

import Foundation

extension Date {
    func getTime(timestamp: Int) -> String? {
        let timeInterval = TimeInterval(timestamp)
        // Create a DateFormatter instance
        let dateFormatter = DateFormatter()
        
        // Set the desired date and time format
        dateFormatter.dateFormat = "dd/MM/yy hh:mm aa"
        
        // Convert the timestamp to a Date object
        let date = Date(timeIntervalSince1970: timeInterval)
        
        // Use the date formatter to get the string representation of the date
        let dateString = dateFormatter.string(from: date)

        return dateString
    }
}
