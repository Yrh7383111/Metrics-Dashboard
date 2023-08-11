import Foundation


enum ATCNotificationType: String {
    case chatAppNewMessage = "chatAppNewMessage"
    case datingAppNewMatch = "datingAppNewMatch"
    
    var notiticationName: Notification.Name {
        switch self {
        case .chatAppNewMessage:
            return .didReceiveChatAppNewMessage
        case .datingAppNewMatch:
            return .didReceiveDatingAppNewMatch
        }
    }
}


extension Notification.Name {
    static let didReceiveChatAppNewMessage = Notification.Name("didReceiveChatAppNewMessage")
    static let didReceiveDatingAppNewMatch = Notification.Name("didReceiveDatingAppNewMatch")
}
