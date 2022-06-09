#ifndef counter_h
#define counter_h

#include <string>

#include "QObject"

class Counter : public QObject
{
    Q_OBJECT

public:
    Counter(std::string const& label);

    int value() const;

public slots:
    void SetValue(int value);

signals:
    void ValueChanged(int newValue);

private:
    std::string label_;
    int value_;
};

#endif
