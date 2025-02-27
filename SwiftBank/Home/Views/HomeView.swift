//
//  HomeView.swift
//  SwiftBank
//
//  Created by Ândriu F Coelho on 03/01/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Attributes
    
    @StateObject private var viewModel = HomeViewModel(service: HomeNetworkingService())
    
    @EnvironmentObject private var routerManager: NavigationRouter
    
    // MARK: - UI Components
    
    private let backgroundColor = Color(red: 240.0/255.0,
                                        green: 240.0/255.0,
                                        blue: 240.0/255.0)
    
    private let yellowColor = Color(red: 255.0/255.0,
                                    green: 186.0/255.0,
                                    blue: 5.0/255.0)
    
    var body: some View {
        NavigationStack(path: $routerManager.router) {
            ZStack(alignment: .top) {
                LinearGradient(gradient: Gradient(colors: [yellowColor, backgroundColor]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    List {
                        if let sections = try? viewModel.buildSections() {
                            ForEach(sections, id: \.identifier) { section in
                                section.build()
                                    .padding(.bottom, 15)
                                    .listRowInsets(EdgeInsets())
                                    .listRowBackground(Color.clear)
                            }
                        }
                        
                        ActivitiesView()
                            .padding(.bottom, 15)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    .listStyle(PlainListStyle())
                    .scrollIndicators(.hidden)
                    .refreshable {
                        Task {
                            try await viewModel.getHome()
                        }
                    }
                    .navigationDestination(for: Route.self, destination: { $0 })
                    
                    
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        if let screenModel = viewModel.screenModel {
                            Text(screenModel.header.title.text)
                                .font(.system(size: CGFloat(screenModel.header.title.fontSize)))
                                .foregroundColor(.white)
                                .fontWeight(.light)
                        }
                    }
                                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Image(systemName: "bell.badge")
                            .foregroundStyle(Color.red, Color.black)
                    }
                }
            }
        }
        .onAppear {
            Task {
                try await viewModel.getHome()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
