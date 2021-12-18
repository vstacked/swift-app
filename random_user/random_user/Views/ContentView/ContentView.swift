//
//  ContentView.swift
//  random_user
//
//  Created by vstacked on 18/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack{
            Button("Refresh Data"){viewModel.getData()}.onAppear{
                viewModel.getData()
            }
            if(viewModel.user != nil){
                HStack{
                    AsyncImage(
                        url: URL(string: viewModel.user!.avatar)
                    ){ image in image
                            .resizable()
                            .frame(width:100,height:100)
                            .cornerRadius(10)
                            .padding()
                    }placeholder: {
                        ProgressView()
                            .frame(width:100,height:100)
                    }
                    
                    VStack(alignment: .leading){
                        Text("\(viewModel.user!.firstName) \(viewModel.user!.lastName)")
                            .font(.body)
                        Text("\(viewModel.user!.email)")
                            .font(.caption)
                    }
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
