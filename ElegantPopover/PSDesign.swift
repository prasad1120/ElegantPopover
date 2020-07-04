//
//  PSDesign.swift
//  ElegantPopover
//
//  Created by prasad-shinde on 04/02/20.
//  Copyright © 2020 prasadshinde. All rights reserved.
//

import UIKit

/// An object representing the design of the popover.
public struct PSDesign {
    
    /** An enum value representing the shape of the popover.
    
    # Cases #
    - `circle`: A circular shape.
    - `rectangle`: A rectangular shape.
    */
    public enum PSShape {
        /**
         A circular shape.
         
         In this case, `ElegantPopoverController` would adjust the values of `insets` and `cornerRadius`
         */
        case circle
        
        /**
        A rectangular shape.
        */
        case rectangle
    }
    
    /**
     Array consisting of objects of `PSBorder` for setting borders of the popover.
     
     Values in the array of this property start from outermost border and end at the innermost border. Widths values should not be negative.
    */
    public var borders = [PSBorder]()
    
    /**
     The popover's background color.
     
     The default value of this property is `UIColor.clear`, which results in a transparent background color.
     */
    public var backGroundColor: UIColor = .clear
    
    /**
     The radius to use when drawing rounded corners of the popover.
     
     If `shape` property is set as `Shape.circle` then the value in this property is redundant.
     
     The default value of this property is `0`.
     */
    public var cornerRadius: CGFloat = 0
    
    /**
     The shape of the popover.
     
     The default value of this property is `Shape.rectangle`.
     */
    public var shape: PSShape = .rectangle
    
    /**
     The index of border required to be solid for the popover.
     
     The value in this property is the index of border required to take the shape of the arrow and not outline it. If `nil`, all the borders will outline the arrow and none will be solid.
     
     The default value of this property is `nil`.
     */
    public var solidArrowBorderIndex: Int?
    
    ///An object representing the offsets between popover boundary and the contentView.
    public var insets: UIEdgeInsets = .zero
    
    /**
     Creates an object representing the design of the popover.
     */
    public init() { }
}
