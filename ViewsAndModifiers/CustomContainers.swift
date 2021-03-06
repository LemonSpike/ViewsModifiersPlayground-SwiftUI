//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by Pranav Kasetti on 03/04/2021.
//

import SwiftUI

struct CustomContainers<Content: View>: View {
  let rows: Int
  let columns: Int
  let content: (Int, Int) -> Content

  init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
    self.rows = rows
    self.columns = columns
    self.content = content
  }

  var body: some View {
    VStack {
      ForEach(0..<rows, id: \.self) { row in
        HStack {
          ForEach(0..<self.columns, id: \.self) { column in
            self.content(row, column)
          }
        }
      }
    }
  }
}

struct ContentGridView: View {
  var body: some View {
    CustomContainers(rows: 4, columns: 4) { row, col in
      Image(systemName: "\(row * 4 + col).circle")
      Text("R\(row) C\(col)")
    }
  }
}


struct CustomContainers_Previews: PreviewProvider {
    static var previews: some View {
        ContentGridView()
    }
}
