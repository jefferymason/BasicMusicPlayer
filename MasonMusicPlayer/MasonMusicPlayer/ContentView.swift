//
//  ContentView.swift
//  MasonMusicPlayer
//
//  Created by Jeffery Mason on 1/30/21.
//

import SwiftUI
import AVKit

struct ContentView: View {

    
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    
    var body: some View {
        VStack {
            HStack {
                Text("Music Player")
                    .font(.system(size: 45))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                    .foregroundColor(.black)

            }
            
            HStack {
                HStack {
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Text("Play")
                            .font(.system(size: 25))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Text("Pause")
                            .font(.system(size: 25))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        if self.count < 3 {
                            self.count += 1
                        } else {
                            self.count = 1
                        }
                        let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()

                    }) {
                        Text("Next")
                            .font(.system(size: 25))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    }
                }

            }
            
        }
        
        .onAppear {
            let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
