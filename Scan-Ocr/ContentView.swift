//
//  ContentView.swift
//  Scan-Ocr
//
//  Created by Aatif Ahmed on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts){text in
                            NavigationLink(
                                destination:ScrollView{Text(text.content)},
                                label: {
                                    Text(text.content).lineLimit(1)
                                })
                        }
                    }
                }
                else{
                    Text("No scan yet").font(.title).fontWeight(.regular).foregroundColor(Color.gray).multilineTextAlignment(.center)
                    
                }
            }
                .navigationTitle("Scan Doc")
                .navigationBarItems(trailing: Button(action: {
                    self.showScannerSheet = true
                }, label: {
                    Image(systemName: "doc.text.viewfinder")
                        .font(.title2)
                })
                .sheet(isPresented: $showScannerSheet, content: {
                    self.makeScannerView()
                })
                )
        }
    }
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
