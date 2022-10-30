//
//  ContentView.swift
//  DatePickerDemo
//
//  Created by JOYNAL ABEDIN on 30/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var birthday = Calendar.current.date(byAdding: DateComponents(year: -40), to: Date()) ?? Date()
    @State var currentDate = ""
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthday, displayedComponents: .date) {}
                .padding(10)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
            Text("\(currentDate)")
                .font(.title2)
                .onAppear {
                    donedatePicker()
                }
            Spacer()
                .frame(height: 50)
            Button("Done") {
                donedatePicker()
            }
        }
        .padding(.horizontal, 20)
    }
    
    func donedatePicker(){
        //For date formate
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        //dismiss date picker dialog
        currentDate = formatter.string(from: birthday)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//For Custom Use

//ZStack {
//    Color.black.edgesIgnoringSafeArea(.all)
//    VStack(alignment: .leading, spacing: 10) {
//        Text("Birthday")
//            .font(.largeTitle)
//            .foregroundColor(.gray)
//        DatePickerTextField(placeholder: "BirthDay", date: $birthday)
//            .font(.title)
//            .padding(.horizontal, 16)
//            .frame(height: 44)
//            .background(Color.white)
//            .cornerRadius(10)
//    }
//    .padding(.horizontal, 20)
//}
