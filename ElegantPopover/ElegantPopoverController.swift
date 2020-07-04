//
//  ElegantPopoverController.swift
//  ElegantPopover
//
//  Created by Prasad Shinde on 04/02/20.
//  Copyright © 2020 Prasad Shinde. All rights reserved.
//


import UIKit

/// An object that manages the **ElegantPopover**
public class ElegantPopoverController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    /// The view to be inserted inside the popover
    private var contentView: UIView!
    
    /// An object representing the arrow of the popover.
    private var arrow: PSArrow
    
    /// An object used for defining visual attributes of the popover.
    private var design: PSDesign!
    
    /// Popover presentation controller of the popover
    private var popover: UIPopoverPresentationController!
    
    public var popoverSize: CGSize {
        return CGSize(width: contentView.frame.width + design.insets.left + design.insets.right, height: contentView.frame.height + design.insets.top + design.insets.bottom)
    }
    
    /**
     A controller that manages the popover.
     - Parameter contentView: The view to be inserted inside the popover.
     - Parameter design: An object used for defining visual attributes of the popover.
     - Parameter arrow: An object representing the arrow in popover.
     - Parameter sourceView: The view containing the anchor rectangle for the popover.
     - Parameter sourceRect: The rectangle in the specified view in which to anchor the popover.
     - Parameter barButtonItem: The bar button item on which to anchor the popover.
     
     Assign a value to `barButton` to anchor the popover to the specified bar button item. When presented, the popover’s arrow points to the specified item. Alternatively, you may specify the anchor location for the popover using the `sourceView` and `sourceRect` properties.
     */
    public init(contentView: UIView, design: PSDesign, arrow: PSArrow, sourceView: UIView? = nil, sourceRect: CGRect? = nil, barButtonItem: UIBarButtonItem? = nil) {
        self.contentView = contentView
        self.arrow = arrow
        self.design = design
        super.init(nibName: nil, bundle: nil)
        setupPopover(sourceView, sourceRect, barButtonItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func viewDidLayoutSubviews() {
        
        switch arrow.direction {
        case .left:
            contentView.frame.origin = CGPoint(x: design.insets.left + arrow.height, y: design.insets.top)
        case .right, .down:
            contentView.frame.origin = CGPoint(x: design.insets.left, y: design.insets.top)
        case .up:
            contentView.frame.origin = CGPoint(x: design.insets.left, y: design.insets.top + arrow.height)
        default:
            break
        }
    }
    
    ///Sets up the Popover and starts the timer for its closing.
    private func setupPopover(_ sourceView: UIView?, _ sourceRect: CGRect?, _ barButtonItem: UIBarButtonItem?) {
        modalPresentationStyle = .popover
        switch design.shape {
        case .circle:
            
            let difference = popoverSize.width - popoverSize.height
            if difference < 0 {
                if design.insets.left <= design.insets.right {
                    let temp = equaliseInsets(design.insets.left, design.insets.right, difference)
                    design.insets.left = temp.first
                    design.insets.right = temp.second
                } else {
                    let temp = equaliseInsets(design.insets.right, design.insets.left, difference)
                    design.insets.right = temp.first
                    design.insets.left = temp.second
                }
            } else if difference > 0 {
                if design.insets.top <= design.insets.bottom {
                    let temp = equaliseInsets(design.insets.top, design.insets.bottom, difference)
                    design.insets.top = temp.first
                    design.insets.bottom = temp.second
                } else {
                    let temp = equaliseInsets(design.insets.top, design.insets.bottom, difference)
                    design.insets.bottom = temp.first
                    design.insets.top = temp.second
                }
            }
            self.design.cornerRadius = (design.insets.left + design.insets.right + contentView.frame.width)/2
        default: break
        }
        
        PSPopoverBackgroundView.currPopover = self
        self.modalPresentationStyle = .popover
        self.view.addSubview(contentView)
        
        
        let popOver = self.popoverPresentationController!
        popOver.popoverBackgroundViewClass = PSPopoverBackgroundView.self
        popOver.sourceView = sourceView
        
        if let sourceRect = sourceRect {
            popOver.sourceRect = sourceRect
        }
        
        popOver.barButtonItem = barButtonItem
        popOver.delegate = self
        popOver.permittedArrowDirections = arrow.direction
        popOver.backgroundColor = UIColor.clear
    }
    
    private func equaliseInsets( _ first: CGFloat, _ second: CGFloat, _ difference: CGFloat) -> (first: CGFloat, second: CGFloat) {
        var insets = (first: first, second: second)
        if insets.second - insets.first >= difference {
            insets.first += difference
        } else {
            insets.second += (difference - (insets.second - insets.first))/2
            insets.first = insets.second
        }
        return insets
    }
    
    func setArrowDirection(_ direction: UIPopoverArrowDirection) {
        arrow.direction = direction
        preferredContentSize = popoverSize
        
        switch direction {
        case .left, .right:
            preferredContentSize.width += arrow.height
        case .up, .down:
            preferredContentSize.height += arrow.height
        default:
            break
        }
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    // Returns design of the popover
    func getDesign() -> PSDesign {
        return design
    }
    
    // Returns arrow of the popover
    func getArrow() -> PSArrow {
        return arrow
    }
    
    // Returns presentation controller of the popover
    public func getPopoverPresentationController() -> UIPopoverPresentationController {
        return popover
    }
}
