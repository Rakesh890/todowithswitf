//
//  NoListView.swift
//  TodoAppWithSwift
//
//  Created by Rakesh on 06/07/23.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate: Bool = false
    
    
    var body: some View {
        ScrollView{
            Spacer()
            VStack(alignment: .center, spacing:10){
            
                Text("There are no items")
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                    .padding(.bottom,10)
                Text("Be more productive and add some todos to finish them on tile")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(.bottom,10)
                
                ///Navigation on another screen
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .bold()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            animate ? Color.blue
                            : Color.pink
                        ).cornerRadius(15.0)
                        .shadow(color:     animate ? Color.blue.opacity(0.7)
                                : Color.pink.opacity(0.7), radius: animate ? 30 :50,
                                x: 0,y: animate ? 30 :50)
                        .offset(y: animate ?  -7 : 0)
                    
                }).padding(.horizontal, animate ? 50: 30)
            
            }
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
                .background(.white)
            Spacer()
                
        }.frame(
            width: .infinity, height: .infinity)
        
    }
    
    func addAnimation(){
        guard !animate else{
            return
        }
        DispatchQueue.main.asyncAfter(deadline:.now() + 2, execute: {
            withAnimation(Animation.easeIn(duration: 2.0)
                .repeatForever()){
                    animate.toggle() 
                }
        })
    }
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
