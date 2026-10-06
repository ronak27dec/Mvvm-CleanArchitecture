//
//  PostDetailsViewState.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

struct PostDetailsViewState: Identifiable, Equatable, Hashable {
    let id: Int
    let title: String
    let subtitle: String
}
