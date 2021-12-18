//
//  ContentView.swift
//  random_user
//
//  Created by vstacked on 18/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var user: UserData?
    
    func getData(){
        
        let urlString = "https://reqres.in/api/users?page=\(Int.random(in: 1..<3))"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!){data, _, error in
            DispatchQueue.main.async {
                if let data = data{
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(ResponseBody.self, from: data)
                        getUser(responseBody: decodedData)
                        
                    } catch {
                        print("Error! Something went wrong")
                    }
                }
            }
        }.resume()
        
    }
    
    func getUser(responseBody: ResponseBody){
        let randomIndex = Int.random(in: 1..<6)
        user =  responseBody.data[randomIndex]
    }
    
    var body: some View {
        VStack{
            Button("Refresh Data"){self.getData()}.onAppear{
                getData()
            }
            if(user != nil){
                HStack{
                    AsyncImage(
                        url: URL(string: user!.avatar)
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
                        Text("\(user!.firstName) \(user!.lastName)")
                            .font(.body)
                        Text("\(user!.email)")
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
