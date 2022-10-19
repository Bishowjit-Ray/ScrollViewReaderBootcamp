//
//  ContentView.swift
//  ScrollViewReaderBootcamp
//
//  Created by Bishowjit Ray on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""
  
    var body: some View {
        VStack {
             TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
            
                 Button("Scroll Now"){
                     withAnimation(.spring()){
                         if    let index = Int(textFieldText){
                             scrollToIndex = index
                         }
                     
                 }
                 
             }
            
            ScrollView {
                ScrollViewReader { proxy in
                   
               
                    ForEach (0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex, perform: { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                       
                    })
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
