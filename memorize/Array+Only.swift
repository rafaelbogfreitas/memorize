//
//  Array+Only.swift
//  memorize
//
//  Created by Rafael Freitas on 10/10/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
