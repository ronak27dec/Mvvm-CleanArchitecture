//
//  Mvvm_CleanArchitectureApp.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import SwiftUI

@main
struct Mvvm_CleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            let dataSource = PostsRemoteDataSource()
            let repository = PostsRepositoryImpl(remoteDataSource: dataSource)
            let fetchPostsUseCase = FetchPostsUseCaseImpl(repository: repository)
            let viewModel = PostsViewModel(fetchPostsUseCase: fetchPostsUseCase)
            PostView(viewModel: viewModel)
        }
    }
}
