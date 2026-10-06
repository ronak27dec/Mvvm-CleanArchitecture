//
//  PostsViewState.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

struct PostsViewState: Equatable {
    let isLoading: Bool
    let posts: [PostRowViewState]
    let errorMessage: String?
    let navigation: PostsNavigation?
}

extension PostsViewState {
    static let initial = PostsViewState(
        isLoading: false,
        posts: [],
        errorMessage: nil,
        navigation: nil
    )

    func copy(
        isLoading: Bool? = nil,
        posts: [PostRowViewState]? = nil,
        errorMessage: String? = nil,
        navigation: PostsNavigation? = nil
    ) -> PostsViewState {
        PostsViewState(
            isLoading: isLoading ?? self.isLoading,
            posts: posts ?? self.posts,
            errorMessage: errorMessage ?? self.errorMessage,
            navigation: navigation ?? self.navigation
        )
    }
}
