#include <iostream>

#include "QString"
#include "QDebug"
#include "QApplication"
#include "QLabel"

int main(int argc, char **argv) {
    std::cout << "hello world!" << std::endl;
    QString str{"qt5 string"};
    qDebug() << str;

    QApplication app{argc, argv};
    QLabel label{"hello from qt label"};
    label.show();

    return app.exec();
}
