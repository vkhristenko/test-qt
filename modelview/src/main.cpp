#include <iostream>

#include "QString"
#include "QDebug"
#include "QApplication"
#include "QLabel"
#include "QAbstractTableModel"
#include "string_list_model.h"
#include "simple_table_model.h"

int main(int argc, char **argv) {
    std::cout << "hello world!" << std::endl;
    QString str{"qt5 string"};
    qDebug() << str;

    std::vector<QString> column_names = {
        QString{"x"}, QString{"y"}, QString{"z"}
    };
    std::vector<std::vector<QVariant>> data = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9},
        {10, 11, 12},
        {13, 14, 15}
    };
    SimpleTableModel table_model{column_names, data, nullptr};
    auto index = table_model.index(1, 1);
    std::cout << table_model.data(index, Qt::DisplayRole).toInt() << std::endl;

    QApplication app{argc, argv};
    QLabel label{"hello from qt label"};
    label.show();

    return app.exec();
}
