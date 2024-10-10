//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Rohan Patel on 10/8/24.
//

import SwiftUI

struct ContentView: View {
   
    @State private var isNightMode: Bool = false
    
    var body: some View {
        
        ZStack{
            BackgroundView(topColor: isNightMode ? .gray : .blue,
                           bottomColor: Color("lightGrey"))
            
            VStack{
                CityTextView(city: "New York, NY")
                
                CurrentWeatherView(imageName: isNightMode ? "wind.snow" : "cloud.sun.fill",
                                   temperature: "65˚")
                
                HStack(spacing: 15) {
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "sun.max.fill",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "sun.rain.fill",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.fill",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "Sun",
                                   imageName: "snow",
                                   temperature: 70)
                    
                }
                
                Spacer()
                
                Button{
                    isNightMode.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}


struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 22, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)" + "˚")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color = .blue
    var bottomColor: Color = Color("lightGrey")
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 24, weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

struct CurrentWeatherView: View{
    
    var imageName: String = "cloud.sun.fill"
    var temperature: String = "65˚"
    
    var body: some View {
        
        VStack(){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    
                
                Text(temperature)
                    .font(.system(size: 70, weight: .medium))
                    .foregroundStyle(.white)
                
            }
            .padding(.bottom, 35)
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color = .blue
    var backgroundColor: Color = .white
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 24, weight: .semibold, design: .default))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
