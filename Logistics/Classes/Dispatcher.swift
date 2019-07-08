//
//  Dispatcher.swift
//  Logistics
//
//  Created by Dmytro Shulzhenko on 5/15/19.
//

import Foundation
import RxSwift

public protocol Dispatcher {
    // To declare manually
    
    associatedtype State
    associatedtype Action
    
    var bag: DisposeBag { get }
    var state: State { get }
    var action: Action { get }
    
    // Will be generated
    
    associatedtype ActionDispatcher
    associatedtype StateDispatcher
    
    var actionDispatcher: ActionDispatcher { get }
    var stateDispatcher: StateDispatcher { get }
}

public extension Dispatcher {
    typealias Reducer = (ActionDispatcher, DisposeBag) -> Void
    
    func binded(with reducer: Reducer) -> Self {
        reducer(actionDispatcher, bag)
        return self
    }
    
    typealias Middleware = (StateDispatcher, DisposeBag) -> Void
    
    func binded(with middleware: Middleware) -> Self {
        middleware(stateDispatcher, bag)
        return self
    }
}
