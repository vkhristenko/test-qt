#include <iostream>

#include "QString"
#include "QDebug"
#include "QApplication"
#include "QLabel"
#include "QMainWindow"
#include "QFile"

int main(int argc, char **argv) {
    std::cout << "hello world!" << std::endl;

    QString str{":/png/file.png"};
    QFile f{str};
    if (f.exists()) {
        std::cout << "file " << str.toStdString() << " exists" << std::endl;
    } else {
        std::cout << "file " << str.toStdString() << " does not exist!!!" << std::endl;
    }

    return 0;
}
