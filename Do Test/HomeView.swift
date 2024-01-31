//
//  HomeView.swift
//  Do Test
//
//  Created by Степаненко Андрей on 31.01.2024.
//

import SwiftUI

struct HomeView: View {
    @State var createNewTask = false

    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            Text("Your tasks")
                .font(.system(size: 35, weight: .bold))
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 20)
            
            List(tasks) { task in
                TaskRow(task: task)
            }
            .padding(.top, 50)
            
            Group {
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        createNewTask.toggle()
                    }
                } label: {
                    plusBtn(createNewTask: $createNewTask)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
            addTaskView(createNewTask: $createNewTask)
                .scaleEffect(createNewTask ? 1 : 0)
                .opacity(createNewTask ? 1 : 0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct plusBtn: View {
    @Binding var createNewTask: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "plus")
                .font(.system(size: 25, weight: .bold))
                .rotationEffect(Angle.degrees(createNewTask ? -45 : 0))
        }
        .clipShape(
            Circle()
        )
        .padding(15)
        .background(.thinMaterial, in: Circle())
        .shadow(color: Color("shadowColor").opacity(1), radius: 50, x: 0, y: 0)
        .shadow(color: Color("shadowColor").opacity(0.1), radius: 1, x: 1, y: -1)
        .padding(.trailing, 20)
        .padding(.bottom, 30)
        .scaleEffect(createNewTask ? 1.5 : 1)
        //.frame(maxWidth: .infinity, alignment: .trailing)
    }
}

func addNewTask() {
    tasks.append(Task(name: "Hello, user!"))
}

struct addTaskView: View {
    @Binding var createNewTask: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Add new task")
                    .font(.system(size: 25, weight: .bold))
                
                Image(systemName: "pencil")
                    .font(.system(size: 25, weight: .bold))
            }
            .padding(.top, 20)
            Spacer()
            
            HStack(spacing: 50) {
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        createNewTask.toggle()
                    }
                } label: {
                    Text("Cancel")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 30)
                        .background(Color.gray.opacity(0.75), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                
                
                Button {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.1)) {
                        addNewTask()
                    }
                    
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        createNewTask.toggle()
                    }
                } label: {
                    Text("Add")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 30)
                        .background(Color.blue, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                
            }
            .padding(.bottom, 20)
            
        }
        .frame(width: 350, height: 250)
        .background(.gray.opacity(0.75), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct Task: Identifiable {
    let id = UUID()
    let name: String
}

struct TaskRow: View {
    var task: Task

    var body: some View {
        Text(task.name)
    }
}

var tasks = [
        Task(name: "First task"),
        Task(name: "Second task"),
        Task(name: "Third task")
    ]

