//
//  PSArrow.swift
//  ElegantPopover
//
//  Created by Prasad on 04/02/20.
//  Copyright © 2020 Prasad Shinde. All rights reserved.
//

import UIKit

/// An object representing the arrow in the popover.
public struct PSArrow {
    /// The height of the arrow from its base to the top.
    public var height: CGFloat
    
    /// The width of the base of the arrow
    public var base: CGFloat
    
    /// The radius of curve at the two sides meeting the popover.
    public var baseCornerRadius: CGFloat
    
    /**
     The direction of the arrow.
     
     Set value in this property as `UIPopoverArrowDirection.any` to automatically set any appropriate direction for the arrow.
    */
    public var direction: UIPopoverArrowDirection
    
    /**
     An object representing the arrow in the popover.
     
     - Parameter height: The height of the arrow from its base to the top.
     - Parameter base: The base width of the arrow.
     - Parameter baseCornerRadius: The radius of curve at the two sides meeting the popover.
     - Parameter direction: The direction of the arrow.
     */
    public init(height: CGFloat, base: CGFloat, baseCornerRadius: CGFloat, direction: UIPopoverArrowDirection) {
        self.height = height
        self.base = base
        self.baseCornerRadius = baseCornerRadius
        self.direction = direction
    }
}
