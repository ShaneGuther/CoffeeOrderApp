//
//  PastOrders.swift
//  Shane_MyOrder
//
//  Created by Shane Guther on 2021-09-28. - Refactored for core data A2 - 10/26
//  Student ID: 991529673
//

import SwiftUI

struct PastOrders: View {
    
    //binding of order list from previous view
    @Binding public var orderList : [CoffeeOrder]
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                HStack{
                    Text("Type")
                        .fontWeight(.bold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .foregroundColor(Color(red: 0.5, green: 0.1, blue: 0.2))
                        .padding(40)
                    Text("Size")
                        .fontWeight(.bold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                        .foregroundColor(Color(red: 0.5, green: 0.1, blue: 0.2))
                    Text("Quantity")
                        .fontWeight(.bold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .foregroundColor(Color(red: 0.5, green: 0.1, blue: 0.2))
                        .padding(30)
                }
                List{
                    ForEach(orderList){ order in
                        HStack{
                            Text(order.type)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            Text(order.size)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                            Text(order.quant)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Orders"), displayMode: .inline)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
