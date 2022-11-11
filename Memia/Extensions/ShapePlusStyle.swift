//
//  ShapePlusStyle.swift
//  lessonOne
//
//  Created by Porter Dover on 10/31/22.
//

import SwiftUI


extension Shape {
    func style <Stroke: ShapeStyle, Fill: ShapeStyle> (
        strokeColor: Stroke,
        strokeWidth: CGFloat,
        fill fillContent: Fill
    ) -> some View {
        self
            .stroke(strokeColor, lineWidth: strokeWidth)
            .background(fill(fillContent))
    }
}
