#include <iostream>

#include "QString"
#include "QDebug"
#include "QApplication"
#include "QLabel"
#include "QMainWindow"

int main(int argc, char **argv) {
    std::cout << "hello world!" << std::endl;

    QApplication app{argc, argv};
    QMainWindow window{nullptr};
    window.show();
    return app.exec();
}
