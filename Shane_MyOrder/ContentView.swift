//
//  ContentView.swift
//  Shane_MyOrder
//
//  Created by Shane Guther on 2021-09-28. - Refactored for core data A2 - 10/26
//  Student ID: 991529673
//

import SwiftUI


//struct for dynamic list component
struct CoffeeOrder : Identifiable {
    var id = UUID()
    var type : String
    var size : String
    var quant : String
}

//function to close the keyboard on button click when user is finished entering quantity
extension UIApplication {
    func closeKeyboard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView: View {
    
    //Variables to temporarily hold information for array
    @State private var selectedQuantity: String = ""
    @State private var selectedType = "Dark Roast"
    @State private var selectedSize = "Small"
    
    //Array to be passed to 2nd view and used as List
    @State private var orderList : [CoffeeOrder] = []
    
    //function to change the selected type value
    func typeChange(_ pickerValue : String){
        selectedType = pickerValue
        print(selectedType)
    }
    
    //function to change the selected size value
    func sizeChange(_ pickerValue : String){
        selectedSize = pickerValue
        print(selectedSize)
    }
    
    //function to add the data to the list of orders
    func submitData(type : String, size : String, quant : String){
        let uuid = UUID()
        orderList.append(CoffeeOrder(id: uuid, type: type, size: size, quant: quant))
    }
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Shane's Coffee")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.5, green: 0.1, blue: 0.2))
                    .padding()
                
                
                //Coffee type picker
                ZStack{
                    Text("Coffee Type")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 415, height: 50, alignment: .center)
                        .background(Color(red: 0.5, green: 0.1, blue: 0.2))
                        .zIndex(1)
                        .padding()
                    
                    Spacer()
                    
                    Picker("Type", selection: $selectedType, content: {
                        Text("Dark Roast").tag("Dark Roast")
                        Text("Original").tag("Original")
                        Text("Vanilla").tag("Vanilla")
                    })
                    .frame(width: 100, height: 110, alignment: .top)
                    .foregroundColor(.blue)
                    .padding()
                    .onChange(of: selectedType, perform: { value in
                        typeChange(value)
                    })
                }
                
                //coffee size picker
                ZStack{
                    Text("Coffee Size")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 415, height: 50, alignment: .center)
                        .background(Color(red: 0.5, green: 0.1, blue: 0.2))
                        .zIndex(1)
                        .padding()
                    Picker("Size", selection: $selectedSize, content: {
                        Text("Small").tag("Small")
                        Text("Medium").tag("Medium")
                        Text("Large").tag("Large")
                        Text("Extra Large").tag("Extra Large")
                    })
                    .frame(width: 100, height: 110, alignment: .top)
                    .padding()
                    .onChange(of: selectedSize, perform: { value in
                        sizeChange(value)
                    })
                }
                
                Spacer()
                
                //quantity entry field
                VStack{
                    Text("Quantity")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 415, height: 50, alignment: .center)
                        .background(Color(red: 0.5, green: 0.1, blue: 0.2))
                    TextField("0", text: $selectedQuantity)
                        .font(Font.system(size:30, design: .default ))
                    //Button to close the keyboard
                    Button("Close KB"){
                        UIApplication.shared.closeKeyboard()
                    }
                }
                .padding()
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink("Place Order", destination: PastOrders(orderList: $orderList).onAppear{
                    submitData(type: selectedType, size: selectedSize, quant: selectedQuantity)
                })
                .foregroundColor(.white)
                .padding(10)
                .background(Color(red: 0.5, green: 0.1, blue: 0.2))
                .clipShape(Capsule())
                
            }
            
            Spacer()
        }
        .navigationBarTitle(Text("Menu"), displayMode: .inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}




