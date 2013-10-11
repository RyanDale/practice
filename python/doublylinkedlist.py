class DoubleyLinkedList:

	def __init__(self, startnode):
		self.head = startnode

	def appendToTail(self, node):
		n = head

		while n.next:
			n = n.next

		n.next = node
		n.next.prev = n

	def deleteNode(node):
		n = head

		while not n.prev == node.prev and not n.data = node.data and not n.next = node.next:
			n = n.next
		
		n.next.prev = n.prev
		n.prev.next = n.next

class Node:
	def __init__(self, value):
		self.data = value



