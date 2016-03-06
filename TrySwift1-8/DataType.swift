//
//  DataType.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import Foundation

protocol DataType {
    var numberOfItems: Int { get }
    func addNewItemAtIndex(index: Int) -> Self
    func deleteItemAtIndex(index: Int) -> Self
    func moveItem(fromIndex: Int, toIndex: Int) -> Self
}