private class Node {
    let key: Int
    var value: Int
    var next: Node?
    var previous: Node?

    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

private let noValue = -1

class LRUCache {
    private let preHead = Node(key: noValue, value: noValue)
    private let postTail = Node(key: noValue, value: noValue)
    private var size = 0
    private var cache: [Int: Node] = [:]

    private let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity

        preHead.next = postTail
        postTail.previous = preHead
    }

    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveToHead(node: node)
            return node.value
        } else {
            return noValue
        }
    }

    func put(_ key: Int, _ value: Int) {
        if let cachedNode = cache[key] {
            cachedNode.value = value
            moveToHead(node: cachedNode)
        } else {
            let newNode = Node(key: key, value: value)
            cache[key] = newNode
            add(node: newNode)
            size += 1
            if size > capacity {
                cache[popTail().key] = nil
                size -= 1
            }
        }
    }
    
    private func moveToHead(node: Node) {
        remove(node: node)
        add(node: node)
    }

    private func popTail() -> Node {
        let tail = postTail.previous!
        remove(node: tail)
        return tail
    }

    private func remove(node: Node) {
        let oldPrevious = node.previous
        let oldNext = node.next
        oldPrevious?.next = oldNext
        oldNext?.previous = oldPrevious
    }
    
    private func add(node: Node) {
        node.previous = preHead
        node.next = preHead.next
        preHead.next?.previous = node
        preHead.next = node
    }
}
