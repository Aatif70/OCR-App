//
//  ScanData.swift
//  Scan-Ocr
//
//  Created by Aatif Ahmed on 11/09/24.
//

import Foundation


struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
