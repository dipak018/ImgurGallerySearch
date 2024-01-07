//
//  UIViewToast+Extension.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 07/01/24.
//

import UIKit

extension UIView {
    
    // MARK: - Public
    func show(toastMessage: String, image: UIImage? = nil, position: ToastPosition = .center,
              duration: TimeInterval = 2.0) {
        hideAllToasts()
        ToastManager.shared.isTapToDismissEnabled = true
        
        var messageAlignment: NSTextAlignment = .center
        if image != nil {
            messageAlignment = .left
        }
        
        if let img = image {
            makeToast(toastMessage, duration: duration, position: position, image: img,
                      style: toastStyle(messageAlignment: messageAlignment))
        } else {
            makeToast(toastMessage, duration: duration, position: position,
                      style: toastStyle(messageAlignment: messageAlignment))
        }
    }
}

// MARK: - Private
private extension UIView {
    
    func toastStyle(messageAlignment: NSTextAlignment) -> ToastStyle {
        var style = ToastStyle()
        style.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        style.messageFont = .systemFont(ofSize: 15.0, weight: .medium)
        style.messageAlignment = messageAlignment
        style.messageColor = .white
        style.horizontalPadding = 32.0
        style.verticalPadding = 16.0
        style.imageSize = CGSize(width: 24, height: 24)
        style.cornerRadius = 5.0
        
        return style
    }
    
}
