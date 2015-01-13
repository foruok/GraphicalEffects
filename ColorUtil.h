#ifndef COLORUTIL_H
#define COLORUTIL_H

#include <QObject>
#include <QColor>

class ColorUtil: public QObject
{
    Q_OBJECT
public:
    ColorUtil(QObject *parent = 0);
    ~ColorUtil();

    Q_INVOKABLE QString nameOfColor(QColor color);
    Q_INVOKABLE QColor invert(QColor color);

};

#endif // COLORUTIL_H
