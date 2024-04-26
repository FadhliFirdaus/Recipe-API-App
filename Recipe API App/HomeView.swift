    //
    //  HomeView.swift
    //  Recipe API App
    //
    //  Created by Fadhli Firdaus on 26/04/2024.
    //

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel:ViewModel
    @State var searchText = "What is your favourite?"
    @FocusState private var isTextFieldFocused: Bool
    
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
                        HStack{
                            Spacer()
                            NavigationLink {
                                PickerVCWrapper()
                                    .navigationTitle("Datasource Settings")
                            } label: {
                                
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(12)
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(Color(hex: 0xE8E6EC)))
                            }
                            .padding(12)
                            .buttonStyle(PlainButtonStyle())
                        }
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
                    
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(viewModel.datasource) { recipe in
                                VStack(spacing:0) {
                                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                        CardRecipeRow(recipe: recipe, size: 120)
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
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding([.top, .bottom], 12)
                    .padding(.bottom, 40)
                    Spacer()
                }
                .frame(width: sw, height: sh + reader.safeAreaInsets.top , alignment: .top)
                .background(Color(hex: 0xEFF0EF))
                .onAppear(perform: {
                    viewModel.fetchData {
                        DispatchQueue.main.async {
                            
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    HomeView(viewModel: ViewModel.shared)
}
