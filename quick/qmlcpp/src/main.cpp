#include <iostream>

#include "QQuickStyle"
#include "QtQml"
#include "QString"

#include "data_entry_model.h"

std::ostream& operator<<(std::ostream& out, QString const& s) {
    out << s.toStdString();
    return out;
}

int main(int argc, char **argv) {
    std::cout << "hello world!" << std::endl;
    std::cout << QString{"hello Qt!"} << std::endl;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Fusion");
    QGuiApplication app{argc, argv};

    qmlRegisterType<DataEntryModel>("org.testqt", 1, 0, "DataEntryModel");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
