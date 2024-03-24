//
//  Genenic.swift
//  Flux
//
//  Created by Thanh on 6/28/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

/* Dynamic */
import Foundation

@propertyWrapper
public
class Object<T> {
    
    public var wrappedValue: T {
        get { self.value }
        set{ self.value = newValue }
    }
    
    public var projectedValue: Object<T> {
        return self
    }
    
    private var value: T {
        didSet {
            for (index, eventPool) in self.eventPools.enumerated() {
                guard let event = eventPool.event else {
                    self.eventPools.remove(at: index)
                    return
                }
                event.listener(value)
            }
        }
    }
    
    fileprivate var eventPools: [EventPool<T>] = []
    
    public func sink(_ completion: @escaping (T) -> Void) -> any Cancelable {
        let event = Event<T>({ v in
            completion(v)
        })
        event.bind(self.projectedValue)
        return EventCancelable(event: event)
    }
    
    public init(wrappedValue: T) {
        self.value = wrappedValue
    }
}

/* React */
public
protocol Cancelable: Hashable {
    var id: UUID { get }
    associatedtype Value
    func cancel()
}

public
extension Cancelable {
    
    static func == (lhs: any Cancelable, rhs: any Cancelable) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

fileprivate class EventCancelable<E>: Cancelable {
    static func == (lhs: EventCancelable<E>, rhs: EventCancelable<E>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    fileprivate let id: UUID = UUID()
    typealias Value = E
    var event: Event<Value>?
    func cancel() {
        self.event = nil
    }
    required init(event: Event<Value>) {
        self.event = event
    }
    
    deinit {print("cancelable deinit")}
}

public
class Event<T> {
    
    typealias Listener = (T) -> ()
    
    fileprivate var listener: Listener
    
    init(_ listener: @escaping Listener) {
        self.listener = listener
    }
    
    fileprivate func bind(_ object: Object<T>) {
        object.eventPools.append(EventPool(self))
    }
    
    deinit {print("event deinit")}
    
}

fileprivate class EventPool<T> {
    fileprivate weak var event: Event<T>?
    fileprivate init(_ event: Event<T>) {
        self.event = event
    }
    deinit {print("event pool deinit")}
}

