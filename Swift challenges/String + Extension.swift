//
//  String + Extension.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 28.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public extension String {
    func fuzzyContains(_ string: String) -> Bool {
        return self.uppercased().range(of: string.uppercased()) != nil
    }
}
