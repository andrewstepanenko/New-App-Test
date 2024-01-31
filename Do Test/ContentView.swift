//
//  ContentView.swift
//  Do Test
//
//  Created by Степаненко Андрей on 30.01.2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            VStack(spacing: 30) {
                    VStack(spacing: 5) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 30, weight: .bold))
                        Text("Hello, user!")
                            .font(.system(size: 30, weight: .bold))
                    }
                    
                    Button {
                        checkForPermisson()
                    } label: {
                        requestNotificationsBtn()
                    }
                }
                .padding(20)
                .background(Color.black.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .frame(height: 200)
                .shadow(color: Color("shadowColor").opacity(0.25), radius: 0, x: 0, y: 0)
                
                //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct requestNotificationsBtn: View {
    var body: some View {
        VStack {
            Text("Receive notifications!")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
        }
        .frame(width: 250, height: 50)
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("shadowColor").opacity(0.1), radius: 7, x: 0, y: 12)
        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

func checkForPermisson() {
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.getNotificationSettings { settings in
        switch settings.authorizationStatus {
        case .authorized:
            dispatchNotifications()
        case .notDetermined:
            notificationCenter.requestAuthorization(options: [.alert, .sound]) {didAllow, error in
                if didAllow {
                    dispatchNotifications()
                }
            }
        case .denied:
            return

         default:
            return
        }
    }
}

func dispatchNotifications() {
    let identifier = "first-notification"
    let title = "Hello, it's your to-do App!"
    let body = "Time to manage some stuff..."
    let hour = 13
    let minute = 30
    let isDaily = true
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let calendar = Calendar.current
    var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
    dateComponents.hour = hour
    dateComponents.minute = minute
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    
    notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    notificationCenter.add(request)
}
