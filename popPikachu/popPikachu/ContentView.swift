//
//  ContentView.swift
//  popPikachu
//
//  Created by Apple on 21/9/2022.
//
import AVKit
import SwiftUI

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var img = "pikachu1"
    @State var num = 0
    
    var body: some View {
        ZStack{
            Image(img)
                .resizable()
                .scaledToFit()
                
            VStack{
                Text("Pop Pikachu")
                    .font(.title)
                    .foregroundColor(Color.yellow)
                    .shadow(radius: /*@START_MENU_TOKEN@*/12/*@END_MENU_TOKEN@*/)
                
                Text(String(num))
                    .font(.title)
                    .foregroundColor(Color.yellow)
                    .padding()
                Spacer()
            }
            
        }
        /*.onTapGesture {
            if img == "pikachu1"{
                img = "pikachu2"
            }else{
                img = "pikachu1"
            }
            num = num + 1
        }*/
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    img = "pikachu2"
                    self.audioPlayer.play()
                        
                })
                .onEnded({ _ in
                    img = "pikachu1"
                    num = num + 1
                })
        )
        .onAppear {
                    let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: "/Users/apple/Documents/popPikachu/popPikachu/pop.mp3"))
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
