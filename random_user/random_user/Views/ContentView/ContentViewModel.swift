//
//  ContentViewModel.swift
//  random_user
//
//  Created by vstacked on 18/12/21.
//

import Foundation

final class ContentViewModel: ObservableObject{
    
    @Published var user: UserData?
    
    func getData(){
        let urlString = "https://reqres.in/api/users?page=\(Int.random(in: 1..<3))"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!){data, _, error in
            DispatchQueue.main.async {
                if let data = data{
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(ResponseBody.self, from: data)
                        self.getUser(responseBody: decodedData)
                        
                    } catch {
                        print("Error! Something went wrong")
                    }
                }
            }
        }.resume()
        
    }
    
    private func getUser(responseBody: ResponseBody){
        let randomIndex = Int.random(in: 1..<6)
        user =  responseBody.data[randomIndex]
    }
}
