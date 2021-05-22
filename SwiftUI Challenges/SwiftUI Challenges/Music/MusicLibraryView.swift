//
//  MusicLibraryView.swift
//  SwiftUI Challenges
//
//  Created by Vladislav Kondrashkov on 22.05.21.
//

import SwiftUI

extension Color {
    static var mirage = Color(
        red: 23 / 255.0,
        green: 28 / 255.0,
        blue: 28 / 255.0,
        opacity: 1
    )
    static var zircon = Color(
        red: 251 / 255.0,
        green: 253 / 255.0,
        blue: 255 / 255.0,
        opacity: 1
    )
    static var manatee = Color(
        red: 151 / 255.0,
        green: 156 / 255.0,
        blue: 168 / 255.0,
        opacity: 1
    )
    static var ebony = Color(
        red: 31 / 255.0,
        green: 38 / 255.0,
        blue: 51 / 255.0,
        opacity: 1
    )
}

struct Song {
    let id = UUID().uuidString
    let title: String
    let author: String
    let duration: TimeInterval
}

struct SongRow: View {
    var index: Int
    var song: Song

    var body: some View {
        HStack {
            Text(String(format: "%02d", index))
                .padding(20)
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(song.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                HStack {
                    Text(song.author)
                    Text("·")
                        .fontWeight(.bold)
                    Text(formatTime(song.duration))
                }
                .foregroundColor(.manatee)
            }
            Spacer()
            Button(action: { }) {
                Image("more")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.manatee)
                    .frame(width: 30, height: 30)
                    .padding(10)
            }
        }
        .background(Color.mirage)
    }

    func formatTime(_ timeInterval: TimeInterval) -> String {
        let seconds = Int(timeInterval)
        let minutes = seconds / 60
        let leftSeconds = seconds - (minutes * 60)
        return "\(minutes):\(leftSeconds)"
    }
}

var songs: [Song] = [
    .init(title: "Insects", author: "Mr. Kitty", duration: 236.0),
    .init(title: "Heaven", author: "Mr. Kitty", duration: 283),
    .init(title: "Unstable", author: "Mr. Kitty", duration: 172),
    .init(title: "Sacrifice", author: "Mr. Kitty", duration: 414),
    .init(title: "Holy Death", author: "Mr. Kitty", duration: 178)
]

struct MusicLibraryView: View {
    var body: some View {
        ZStack {
            Color.mirage
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image("album-cover")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: 130,
                            height: 130,
                            alignment: .center
                        )
                        .cornerRadius(20)
                        .shadow(color: Color.white.opacity(0.2), radius: 30, x: 0, y: 0)
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 3) {
                            Text("Album")
                            Text("·")
                                .fontWeight(.bold)
                            Text("17 songs")
                            Text("·")
                                .fontWeight(.bold)
                            Text("2013")
                        }
                        .foregroundColor(.manatee)
                        .font(.system(size: 12))
                        Text("Fragments")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                        Text("Mr. Kitty")
                            .foregroundColor(.manatee)
                            .font(.system(size: 17))
                            .overlay(
                                GeometryReader { geo in
                                    Path { path in
                                        path.move(
                                            to: CGPoint(
                                                x: 0,
                                                y: geo.size.height
                                            )
                                        )
                                        path.addLine(
                                            to: CGPoint(
                                                x: geo.size.width,
                                                y: geo.size.height
                                            )
                                        )
                                    }
                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2, 2]))
                                    .foregroundColor(.manatee)
                                    }
                                )
                        Spacer()
                        HStack(spacing: 20) {
                            Button(action: {}) {
                                Image("add-song")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.manatee)
                                    .frame(width: 25, height: 25)
                            }
                            Button(action: {}) {
                                Image("download")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.manatee)
                                    .frame(width: 25, height: 25)
                            }
                            Button(action: {}) {
                                Image("more")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.manatee)
                                    .frame(width: 25, height: 25)
                            }
                        }
                    }.padding(.leading)
                    .frame(maxHeight: 130)
                }.padding()
                HStack(spacing: 20) {
                    Button(action: {

                    }) {
                        Image("play")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)

                        Text("Play")
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.white.opacity(0.15), radius: 20, x: 0, y: 0)
                    Button(action: {

                    }) {
                        Image("shuffle")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                        Text("Shuffle")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.ebony)
                    .cornerRadius(10)
                }
                .frame(height: 55)
                .padding()
                ForEach(0..<songs.count) { index in
                    let song = songs[index]
                    SongRow(index: index + 1, song: song)
                }
                Spacer()
            }
        }
    }
}

struct MusicLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicLibraryView()
                .previewDevice("iPhone 12 Pro")
            MusicLibraryView()
                .previewDevice("iPhone 8")
            SongRow(index: 1, song: songs[0])
                .previewLayout(.fixed(width: 375, height: 70))
        }
    }
}
