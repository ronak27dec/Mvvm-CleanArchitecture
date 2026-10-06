//
//  PostsRepository.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

protocol PostsRepository {
    func fetchPosts() async throws -> [Post]
}

final class PostsRepositoryImpl: PostsRepository {
    private let remoteDataSource: PostDataSource

    init(remoteDataSource: PostDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchPosts() async throws -> [Post] {
        let dtos = try await remoteDataSource.fetchPosts()

        return dtos.map {
            Post(
                id: $0.id,
                title: $0.title,
                description: $0.body
            )
        }
    }
}
