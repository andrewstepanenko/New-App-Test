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
            VStack(alignment: .leading, spacing: 0) {
                Text("Welcome back,")
                    .font(.system(size: 30, weight: .light))
                
                Text("User")
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
            }
            .padding(20)
            
            List(tasks) { task in
                TaskRow(task: task)
            }
            .padding(.top, 100)
            
            Color.black.opacity(createNewTask ? 0.75 : 0).ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        createNewTask.toggle()
                    }
                }
            
            addTaskView(createNewTask: $createNewTask)
                .offset(x: 0, y: createNewTask ? 200 : 1000)
                .opacity(createNewTask ? 1 : 0)
            
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
                .foregroundColor(.primary)
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
    }
}

func addNewTask() {
    tasks.append(Task(name: "Hello, user!"))
}

struct addTaskView: View {
    @Binding var createNewTask: Bool
    
    var body: some View {
        VStack {
            
            VStack(spacing: 15) {
                Text("Create a new item")
                    .foregroundColor(.primary)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(25)
                
                addItemButton(createNewTask: $createNewTask)
                addItemButton(createNewTask: $createNewTask)
                addItemButton(createNewTask: $createNewTask)
                addItemButton(createNewTask: $createNewTask)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 750)
        .background(Color("bgColor"), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
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


struct addItemButton: View {
    @Binding var createNewTask: Bool
    var body: some View {
        
        Button {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                addNewTask()
                createNewTask.toggle()
            }
        } label: {
            HStack(spacing: 15) {
                Image(systemName: "list.clipboard.fill")
                    .font(.system(size: 25, weight: .medium))
                
                Color.black.opacity(0.25)
                    .frame(width: 1, height: 50)
                    .cornerRadius(10)
                
                Text("Add item")
                    .font(.system(size: 25, weight: .medium))
            }
            .foregroundColor(.primary)
            .frame(height: 80)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .background(Color.gray.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .padding(.horizontal, 20)
        }
    }
}
