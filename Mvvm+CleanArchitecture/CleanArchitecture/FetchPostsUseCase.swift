//
//  FetchPostsUseCase.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

protocol FetchPostsUseCase {
    func execute() async throws -> [Post]
}

final class FetchPostsUseCaseImpl: FetchPostsUseCase {
    private let repository: PostsRepository

    init(repository: PostsRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Post] {
        try await self.repository.fetchPosts()
    }
}
