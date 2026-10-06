//
//  PostDTO.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

struct PostDTO: Decodable {
    let id: Int
    let title: String
    let body: String
}
