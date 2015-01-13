import QtQuick 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.2

Rectangle {
    anchors.fill: parent;
    Image {
        id: opImage;
        x: 4;
        y: 4;
        width: 250;
        height: 250;
        source: "bug.jpg";
        sourceSize: Qt.size(250, 250);
        smooth: true;
        visible: false;
    }

    ColorOverlay {
        anchors.fill: opImage;
        source: opImage;
        color: colorPicker.color;
    }

    Text {
        id: colorLabel;
        text: "Color:";
        anchors.left: opImage.left;
        anchors.top: opImage.bottom;
        anchors.topMargin: 4;
    }

    ColorPicker {
        id: colorPicker;
        anchors.left: colorLabel.right;
        anchors.leftMargin: 8;
        anchors.top: colorLabel.top;
        width: 100;
        height: 40;
    }
}
