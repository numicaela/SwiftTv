//
//  StringManager.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 03/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    var htmlAtributtedString: String? {
        guard let data = data(using: .utf8) else {return nil}
        
        do {
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue] , documentAttributes: nil).string
        }catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    
}

