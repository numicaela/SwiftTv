//
//  StringManager.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 03/03/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import Foundation
import UIKit

class StringManager {
    
    static func htmlAtributtedString(_ str: String?) -> NSAttributedString? {
        
        guard let dataString = str else {return nil}
        var attStr = NSAttributedString.init(string: "")
        let data = Data(dataString.utf8)
        
       if let attributedStr = try? NSAttributedString(data: data,
                                                     options: [.documentType: NSAttributedString.DocumentType.html] , documentAttributes: nil) {
        attStr = attributedStr
        }
            return attStr
       
    }
    
    static func getStringFromArray(_ arrayStr: [String]?) -> String? {
        
        var returnable = ""

        guard let arrayString = arrayStr  else {return returnable}
            
            var arrayStringDuplicate =  arrayString
            guard !arrayStringDuplicate.isEmpty else {return returnable}
            
            returnable += arrayStringDuplicate[0]
            arrayStringDuplicate.removeFirst()
            arrayStringDuplicate.forEach(){
                returnable += ", \($0)"
            }
            return returnable
        
        
    }
    
    
    
}

