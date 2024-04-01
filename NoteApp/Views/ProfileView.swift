//
//  ProfileView.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack{
            if let user = viewModel.user {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .frame(width: 125,height: 125)
                VStack(alignment: .leading){
                    HStack{
                        Text("Name: ")
                        Text(user.name)
                    }
                    HStack{
                        Text("Email: ")
                        Text(user.email)
                    }
                    HStack{
                        Text("Member Since: ")
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }
                }
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Logout")
                }
            } else {
                Text("Loading Profile")
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
