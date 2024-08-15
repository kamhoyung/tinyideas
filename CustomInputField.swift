//
//  CustomInputField.swift
//  Motivation for creating this: https://x.com/kamhoyung/status/1817554116714872858
//  Let me know if this was helpful to you! :-D
//  Created by Kamho Yung on 28/07/2024.
//
import SwiftUI

struct CustomInputField: View {
    @Binding var text: String
    @State private var isEditing: Bool = false
    
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .fontWeight(isEditing ? .medium : .regular)
                .foregroundColor(isEditing ? .accentColor : .gray)
                .offset(y: isEditing || !text.isEmpty ? -14 : 0)
                .scaleEffect(isEditing || !text.isEmpty ? 0.75 : 1.0, anchor: .leading)
                .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.2), value: isEditing || !text.isEmpty)
            
            
            TextField("", text: $text, onEditingChanged: { editing in
                withAnimation {
                    isEditing = editing
                }
            })
            .foregroundColor(.primary)
            .offset(y: isEditing || !text.isEmpty ? 8 : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.2),value: isEditing || !text.isEmpty)
        }
        .padding(16)
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CustomInputField_Previews: PreviewProvider {
    @State static var previewText: String = ""
    
    static var previews: some View {
        CustomInputField(text: $previewText, placeholder: "Placeholder")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
