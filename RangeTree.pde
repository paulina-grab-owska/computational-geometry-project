import java.util.ArrayList;
import java.util.List;

class RangeTree1D<T extends Comparable<T>> {
    private class Node<T> {
        T data;
        Node<T> left;
        Node<T> right;

        Node(T data) {
            this.data = data;
            this.left = null;
            this.right = null;
        }
    }

    private Node<T> root;

    RangeTree1D() {
        root = null;
    }

    public void insert(T value) {
        root = insertRec(root, value);
       
    }

    private Node<T> insertRec(Node<T> node, T value) {
        if (node == null) {
            return new Node<T>(value);
        }

        if (value.compareTo(node.data) < 0) {
            node.left = insertRec(node.left, value);
        } else {
            node.right = insertRec(node.right, value);
        }

        return node;
    }

    public List<T> queryRange(T low, T high) {
        List<T> result = new ArrayList<>();
        queryRangeRec(root, low, high, result);
        return result;
    }

    private void queryRangeRec(Node<T> node, T low, T high, List<T> result) {
        if (node == null) {
            return;
        }

        if (low.compareTo(node.data) <= 0 && high.compareTo(node.data) >= 0) {
            result.add(node.data);
        }

        if (low.compareTo(node.data) < 0) {
            queryRangeRec(node.left, low, high, result);
        }

        if (high.compareTo(node.data) > 0) {
            queryRangeRec(node.right, low, high, result);
        }
    }
    public void remove(T value) {
    root = removeRec(root, value);
}

private Node<T> removeRec(Node<T> node, T value) {
    if (node == null) {
        return null;
    }

    if (value.compareTo(node.data) < 0) {
        node.left = removeRec(node.left, value);
    } else if (value.compareTo(node.data) > 0) {
        node.right = removeRec(node.right, value);
    } else {
        // Element znaleziony, usuwamy go
        if (node.left == null) {
            return node.right;
        } else if (node.right == null) {
            return node.left;
        }

        // Jeśli usuwany węzeł ma dwa dzieci
        node.data = minValue(node.right);
        node.right = removeRec(node.right, node.data);
    }

    return node;
}

private T minValue(Node<T> node) {
    T minv = node.data;
    while (node.left != null) {
        minv = node.left.data;
        node = node.left;
    }
    return minv;
}

}
