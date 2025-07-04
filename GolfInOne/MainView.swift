//
//  MainView.swift
//  AllGolfApp
//
//  Created by William Chandler on 19.06.25.
//

import SwiftUI

struct MainView: View {
    // TODO - move this variable to environment?
    @StateObject var bleManager = BLEManager()
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    SwingView()
                } label: {
                    HStack {
                        Image("swing")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Golf Swing")
                                .font(.headline)
                            Text("All aspects of the golf swing explained")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    LearnView()
                } label: {
                    HStack {
                        Image("rules")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Golf Rules")
                                .font(.headline)
                            Text("Stay out of jail...")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    LearnView()
                } label: {
                    HStack {
                        Image(systemName:  "video")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Analyse Swing")
                                .font(.headline)
                            Text("Check important parameters of swing")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    LearnView()
                } label: {
                    HStack {
                        Image("fitness")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Fitness")
                                .font(.headline)
                            Text("Strength and flexibility training")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    LearnView()
                } label: {
                    HStack {
                        Image("practice")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Pitching Calibration")
                                .font(.headline)
                            Text("Shots within 100")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    LearnView()
                } label: {
                    HStack {
                        Image("driver")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Driving")
                                .font(.headline)
                            Text("Shots over 200 (hopefully)...")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    LearnView()
                } label: {
                    HStack {
                        Image("iron")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Chipping")
                                .font(.headline)
                            Text("Shots within 30")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    PuttingBlockListView(/*bleManager: bleManager*/)
                } label: {
                    HStack {
                        Image("putter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Putting")
                                .font(.headline)
                            Text("On the green")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                NavigationLink {
                    LearnView()
                } label: {
                    HStack {
                        Image("sand")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Sand")
                                .font(.headline)
                            Text("Life is a not a beach...")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: PreferencesView()) {
                            Image(systemName: "person.crop.circle")
                        }
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(
                            destination: SettingsView(bleManager: bleManager)
                        ) {
                            Image(systemName: "gearshape")
                        }
                    }
                    /* use to edit selections - will not be required here??
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                     */
                }
            }
            .navigationTitle("Topics")

        }
    }
    
    func delete() {
        print("@TODO implement delete item")
    }
}

#Preview {
    MainView()
}
