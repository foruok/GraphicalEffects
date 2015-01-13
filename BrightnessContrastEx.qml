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

    BrightnessContrast {
        anchors.fill: opImage;
        source: opImage;
        brightness: bslider.value;
        contrast: cslider.value;
    }
    Text {
        id: blabel;
        text: "Brightness:";
        anchors.left: opImage.left;
        anchors.top: opImage.bottom;
        anchors.margins: 4;
    }

    Slider {
        id: bslider;
        anchors.left: blabel.right;
        anchors.leftMargin: 8;
        anchors.verticalCenter: blabel.verticalCenter;
        width: 200;
        height: 40;
        minimumValue: -1.0;
        value: 0.5;
    }
    Text {
        id: clabel;
        text: "Contrast:";
        anchors.left: blabel.left;
        anchors.top: bslider.bottom;
        anchors.topMargin: 4;
    }

    Slider {
        id: cslider;
        anchors.left: bslider.left;
        anchors.verticalCenter: clabel.verticalCenter;
        width: 200;
        height: 40;
        minimumValue: -1.0;
        value: 0.5;
    }
}
