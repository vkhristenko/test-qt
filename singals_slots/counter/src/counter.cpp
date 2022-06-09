#include <iostream>

#include "counter.h"

Counter::Counter(std::string const& label)
    : label_{label}
    , value_{0}
{}

int Counter::value() const { return value_; }

void Counter::SetValue(int v) { 
    std::cout << __PRETTY_FUNCTION__ << " ... label = " << label_ << std::endl;
    value_ = v;
    emit ValueChanged(value_);
}
