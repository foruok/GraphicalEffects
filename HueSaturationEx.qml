import QtQuick 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

Rectangle {
    anchors.fill: parent;
    Image {
        id: opImage;
        x: 4;
        y: 4;
        width: 200;
        height: 200;
        source: "bug.jpg";
        sourceSize: Qt.size(250, 250);
        smooth: true;
        visible: false;
    }

    HueSaturation {
        anchors.fill: opImage;
        source: opImage;
        hue: hslider.value;
        lightness: lslider.value;
        saturation: sslider.value;
    }

    Grid {
        anchors.left: opImage.left;
        anchors.top: opImage.bottom;
        anchors.margins: 4;
        columns: 2;
        verticalItemAlignment: Grid.AlignVCenter;
        Text {
            text: "hue:";
            width: 120;
            horizontalAlignment: Text.AlignRight;
        }
        Slider {
            id: hslider;
            value: 0.5;
            width: 160;
            height: 30;
        }
        Text {
            text: "lightness:";
            width: 120;
            horizontalAlignment: Text.AlignRight;
        }
        Slider {
            id: lslider;
            minimumValue: -1.0;
            maximumValue: 1.0;
            value: 0.0;
            width: 160;
            height: 30;
        }
        Text {
            text: "saturation:";
            width: 120;
            horizontalAlignment: Text.AlignRight;
        }
        Slider {
            id: sslider;
            value: 0.5;
            width: 160;
            height: 30;
        }
    }
}
