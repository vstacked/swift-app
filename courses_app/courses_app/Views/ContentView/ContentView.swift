//
//  ContentView.swift
//  courses_app
//
//  Created by vstacked on 17/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContenViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){ course in
                    HStack{
                        URLImage(urlString: course.image)
                        
                        Text(course.name).bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Courses")
            .onAppear{ viewModel.fetch()}
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
