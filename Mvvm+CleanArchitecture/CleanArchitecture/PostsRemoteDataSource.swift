//
//  PostsRemoteDataSource.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Foundation

protocol PostDataSource {
    func fetchPosts() async throws -> [PostDTO]
}

final class PostsRemoteDataSource: PostDataSource {
    func fetchPosts() async throws -> [PostDTO] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              200 ..< 300 ~= httpResponse.statusCode
        else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([PostDTO].self, from: data)
    }
}
