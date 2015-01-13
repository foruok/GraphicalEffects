#include "ColorUtil.h"

ColorUtil::ColorUtil(QObject *parent)
    : QObject(parent)
{}

ColorUtil::~ColorUtil()
{}

QString ColorUtil::nameOfColor(QColor color)
{
    return color.name(QColor::HexArgb);
}

QColor ColorUtil::invert(QColor color)
{
    QColor clr(255-color.red(), 255 - color.green(),
               255 - color.blue());
    return clr;
}
