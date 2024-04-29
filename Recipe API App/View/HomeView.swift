    //
    //  HomeView.swift
    //  Recipe API App
    //
    //  Created by Fadhli Firdaus on 26/04/2024.
    //

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject var viewModel:ViewModel
    
    @State var searchText = "What is your favourite?"
    @State private var rotationAngle = 0.0
    @State private var dotCount = 0

    @FocusState private var isTextFieldFocused: Bool
    
    @Environment(\.presentationMode) var presentationMode

    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let container: NSPersistentContainer = NSPersistentContainer(name: "FavouriteRecipes")

    
    var body: some View {
        NavigationView {
            GeometryReader{ reader in
                VStack{
                    ZStack{
                        HStack{
                            Spacer()
                            Text("Explore Food")
                                .customFont(.georgia, size: 24)
                            Spacer()
                        }
                        .padding(12)
                        
                        Button(action: {
                        }) {
                            HStack {
                                Spacer()
                                NavigationLink(destination: PickerVCWrapper(
                                    dismiss: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                )
                                    .navigationTitle("Datasource Type Settings")) {
                                    Image(systemName: "ellipsis")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(12)
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .background(RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(Color(hex: 0xE8E6EC)))
                                }
                            }
                            .padding(12)
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        HStack{
                            Button(action: {
                                viewModel.fetchDataWithCurrentSetting()
                            }, label: {
                                Image(systemName: "arrow.clockwise")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(12)
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .rotationEffect(.degrees(rotationAngle))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(Color(hex: 0xE8E6EC))
                                    }
                            })
                            Spacer()
                        }
                        .padding(12)
                    }
                    
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.gray)
                        VStack {
                            Spacer()
                            TextField("What is your favourite", text: $searchText)
                                .lineLimit(1)
                                .foregroundColor(isTextFieldFocused ? .black : .gray)
                                .focused($isTextFieldFocused)
                                .background(.clear)
                                .onChange(of: isTextFieldFocused, { oldValue, newValue in
                                    if newValue {
                                        searchText = ""
                                    } else {
                                        searchText = "What is your favourite?"
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                })
                                .onSubmit {
                                    viewModel.fetchFilteredData(filterString: searchText, completion: {})
                                    isTextFieldFocused = false
                                }
                                .submitLabel(.done)
                                .scrollContentBackground(.hidden)
                                .customFont(.georgia, size: 15)
                            Spacer()
                        }
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.gray)
                    }
                    .background(content: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(hex: 0xF7F7F9))
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color(hex: 0xE8E6EC))
                        }
                    })
                    .padding([.trailing, .leading], 12)
                    .frame(width: sw, height: 50, alignment: .center)
                    
                    if(viewModel.isFetchingData){
                        VStack (alignment: .center){
                            ProgressView()
                                .rotationEffect(.degrees(Double(dotCount) * 120))
                                .onReceive(timer) { _ in
                                    dotCount = (dotCount + 1) % 3
                                }
                            Text("Fetching data")
                        }
                        .frame(width: sw, height : sh - 150,   alignment: .center)
                    } else {
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(viewModel.datasource, id:\.self) { recipe in
                                    VStack(spacing:0) {
                                        NavigationLink(destination: RecipeDetailView(recipe: recipe, viewModel:viewModel)) {
                                            CardRecipeRow(recipe: recipe, viewModel: viewModel, size: 120)
                                                .frame(width: sw , height: 125, alignment: .center)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .padding([.leading, .trailing], 12)
                                                        .padding([.top, .bottom], 5)
                                                        .shadow(radius: 1,x:3, y:5)
                                                )
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                Spacer()
                                    .padding(.bottom, 24)
                            }
                        }
                        .scrollIndicators(.hidden)
                        .padding([.top, .bottom], 12)
                    }
                }
                .frame(width: sw, height: sh  , alignment: .top)
                .background(Color(hex: 0xEFF0EF))
                .onAppear(perform: {
                    viewModel.fetchDataWithCurrentSetting()
                })
            }
        }
    }
}

#Preview {
    HomeView(viewModel: ViewModel.shared)
}
