//
//  AddView.swift
//  TodoAppWithSwift
//
//  Created by Rakesh on 06/07/23.
//

import SwiftUI

struct AddView: View {
    
    //dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
    func validationText() -> Bool {
        if textFieldText.count < 3{
            alertTitle = "your todo item should contain 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func saveButtonTapped(){
        if validationText(){
            listViewModel.addItems(title: textFieldText)
            presentationMode.wrappedValue.dismiss();
        }
    }
    
    
    var body: some View {
        ScrollView{
            VStack(content: {
                TextField("Type something....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                    .cornerRadius(15.0)
                
                Spacer(minLength: 20)
                
                Button(action: saveButtonTapped, label: {
                    Text("Save").foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                }).cornerRadius(15.0)
                
            }).padding(.horizontal,20)
        
        }.navigationTitle("Add an item")
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            AddView()
        })
    }
}
