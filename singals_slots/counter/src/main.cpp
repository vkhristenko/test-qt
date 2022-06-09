#include <iostream>

#include "QString"
#include "QDebug"
#include "QApplication"
#include "QLabel"
#include "QAbstractTableModel"

#include "counter.h"

int main(int argc, char **argv) {
    std::cout << "hello world!" << std::endl;

    Counter a{"a"}, b{"b"};
    QObject::connect(
        &a, &Counter::ValueChanged,
        &b, &Counter::SetValue);
    // wiill generate a cycle...
    //QObject::connect(
    //    &b, &Counter::ValueChanged,
    //    &a, &Counter::SetValue);

    a.SetValue(10);

    return 0;
}
