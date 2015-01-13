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

    Desaturate {
        anchors.fill: opImage;
        source: opImage;
        desaturation: dslider.value;
    }
    Text {
        id: dlabel;
        text: "desaturation:";
        anchors.left: opImage.left;
        anchors.top: opImage.bottom;
        anchors.margins: 4;
    }

    Slider {
        id: dslider;
        anchors.left: dlabel.right;
        anchors.leftMargin: 8;
        anchors.verticalCenter: dlabel.verticalCenter;
        width: 160;
        height: 40;
        value: 0.5;
    }
}
