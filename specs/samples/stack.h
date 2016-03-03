#include <string>
#include <vector>
using std::string;
using std::vector;

template <typename T>
class Stack<T>
{
protected:
    vector<T> _stack;
public:
    void push(const T& t)
    {
        _stack.push_front(t);
    }

    T pop()
    {
        T t = _stack.back();
        t.pop_back();
        return t;
    }
}

