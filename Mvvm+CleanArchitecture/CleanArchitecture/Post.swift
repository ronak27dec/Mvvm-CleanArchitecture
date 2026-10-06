//
//  Post.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

struct Post: Equatable, Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
}
