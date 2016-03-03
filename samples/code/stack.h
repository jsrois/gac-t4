#include <string>
#include <list>
using std::string;
using std::list;

template <typename T>
class Stack
{
protected:
    list<T> _stack;
public:
    void push(const T& t)
    {
        _stack.push_front(t);
    }

    T pop()
    {
        T t = _stack.front();
        _stack.pop_front();
        return t;
    }

    bool isEmpty() const
    {
        return _stack.empty();
    }
};

