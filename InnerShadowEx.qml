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
        source: "butterfly.png";
        sourceSize: Qt.size(250, 250);
        smooth: true;
        visible: false;
    }

    InnerShadow {
        id: innershadow;
        anchors.fill: opImage;
        source: opImage;
    }

    Rectangle {
        anchors.left: opImage.right;
        anchors.top: opImage.top;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.margins: 2;
        color: "lightsteelblue";

        CheckBox {
            id: fast;
            anchors.top: parent.top;
            anchors.topMargin: 4;
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            checked: false;
            text: "fast";
        }

        Text {
            id: colorLabel;
            anchors.left: fast.left;
            anchors.top: fast.bottom;
            anchors.topMargin: 8;
            text: "shadow color:";
        }

        ColorPicker {
            id: shadowColor;
            anchors.left: colorLabel.right;
            anchors.leftMargin: 4;
            anchors.top: colorLabel.top;
            width: 90;
            height: 28;
            color: "#ff000000";
        }

        Text {
            id: sampleLabel;
            anchors.left: fast.left;
            anchors.top: shadowColor.bottom;
            anchors.topMargin: 8;
            text: "samples:";
        }

        Slider {
            id: sampleSlider;
            anchors.left: sampleLabel.right;
            anchors.leftMargin: 4;
            anchors.top: sampleLabel.top;
            minimumValue: 0;
            maximumValue: 32;
            value: 0.0;
            width: 160;
            height: 30;
            stepSize: 1.0;
        }

        Text {
            id: spreadLabel;
            anchors.left: fast.left;
            anchors.top: sampleSlider.bottom;
            anchors.topMargin: 8;
            text: "spread:";
        }

        Slider {
            id: spreadSlider;
            anchors.left: spreadLabel.right;
            anchors.leftMargin: 4;
            anchors.top: spreadLabel.top;
            value: 0.5;
            width: 160;
            height: 30;
        }

        Text {
            id: radiusLabel;
            anchors.left: fast.left;
            anchors.top: spreadSlider.bottom;
            anchors.topMargin: 8;
            text: "radius:";
        }

        Rectangle {
            id: radiusArea;
            anchors.left: radiusLabel.right;
            anchors.leftMargin: 4;
            anchors.top: radiusLabel.top;
            height: 30;
            width: 160;
            color: "lightgray";
            border.width: 1;
            border.color: "darkgray";
            TextInput {
                anchors.fill: parent;
                anchors.margins: 2;
                id: radiusEdit;
                font.pointSize: 18;
                text: "0.0";
                validator: DoubleValidator{bottom: 0;}
            }
        }


        Text {
            id: voffLabel;
            anchors.left: fast.left;
            anchors.top: radiusArea.bottom;
            anchors.topMargin: 8;
            text: "verticalOffset:";
        }

        Rectangle {
            id: voffArea;
            anchors.left: voffLabel.right;
            anchors.leftMargin: 4;
            anchors.top: voffLabel.top;
            height: 30;
            width: 160;
            color: "lightgray";
            border.width: 1;
            border.color: "darkgray";
            TextInput {
                anchors.fill: parent;
                anchors.margins: 2;
                id: voffEdit;
                font.pointSize: 18;
                text: "0.0";
                validator: DoubleValidator{}
            }
        }


        Text {
            id: hoffLabel;
            anchors.left: fast.left;
            anchors.top: voffArea.bottom;
            anchors.topMargin: 8;
            text: "verticalOffset:";
        }

        Rectangle {
            id: hoffArea;
            anchors.left: hoffLabel.right;
            anchors.leftMargin: 4;
            anchors.top: hoffLabel.top;
            height: 30;
            width: 160;
            color: "lightgray";
            border.width: 1;
            border.color: "darkgray";
            TextInput {
                anchors.fill: parent;
                anchors.margins: 2;
                id: hoffEdit;
                font.pointSize: 18;
                text: "0.0";
                validator: DoubleValidator{}
            }
        }

        Button {
            id: applyBtn;
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            anchors.top: hoffArea.bottom;
            anchors.topMargin: 12;
            text: "Apply";
            onClicked: {
                innershadow.color = shadowColor.color;
                innershadow.fast = fast.checked;
                innershadow.samples = sampleSlider.value;
                innershadow.radius = parseFloat(radiusEdit.text);
                innershadow.verticalOffset = voffEdit.text;
                innershadow.horizontalOffset = hoffEdit.text;
                innershadow.spread = spreadSlider.value;
            }
        }
    }
}
