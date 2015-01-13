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

    LinearGradient {
        id: linear;
        anchors.fill: opImage;
        visible: false;
        start: Qt.point(0, 0);
        end: Qt.point(250, 0);
        gradient: Gradient {
            GradientStop { position: 0.2; color: "#ffffffff" }
            GradientStop { position: 0.7; color: "#00ffffff" }
        }
    }

    MaskedBlur {
        id: masked;
        anchors.fill: opImage;
        source: opImage;
        samples: 8;
        radius: 5;
        maskSource: linear;
        fast: false;
        transparentBorder: true;
    }

    Rectangle {
        anchors.left: opImage.right;
        anchors.top: opImage.top;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.margins: 2;
        color: "lightsteelblue";

        CheckBox {
            id: transparentBorder;
            anchors.top: parent.top;
            anchors.topMargin: 4;
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            checked: true;
            text: "transparentBorder";
        }

        CheckBox {
            id: fast;
            anchors.left: transparentBorder.right;
            anchors.leftMargin: 8;
            anchors.top: transparentBorder.top;
            checked: false;
            text: "fast";
        }

        Text {
            id: radiusLabel;
            anchors.left: transparentBorder.left;
            anchors.top: transparentBorder.bottom;
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
                text: "5.0";
                validator: DoubleValidator{bottom: 0;}
            }
        }

        Text {
            id: stop1Label;
            anchors.left: transparentBorder.left;
            anchors.top: radiusArea.bottom;
            anchors.topMargin: 4;
            text: "gradient stop1:";
        }

        ColorPicker {
            id: stop1;
            anchors.left: stop1Label.right;
            anchors.leftMargin: 2;
            anchors.top: stop1Label.top;
            width: 80;
            height: 30;
        }

        Text {
            id: stop2Label;
            anchors.left: stop1.right;
            anchors.leftMargin: 4;
            anchors.top: stop1.top;
            text: "stop2:";
        }

        ColorPicker {
            id: stop2;
            anchors.left: stop2Label.right;
            anchors.leftMargin: 2;
            anchors.top: stop1Label.top;
            width: 80;
            height: 30;
        }

        Text {
            id: sampleLabel;
            anchors.left: transparentBorder.left;
            anchors.top: stop1.bottom;
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
            value: 8.0;
            width: 160;
            height: 30;
            stepSize: 1.0;
        }

        Button {
            id: applyBtn;
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            anchors.top: sampleSlider.bottom;
            anchors.topMargin: 12;
            text: "Apply";
            onClicked: {
                masked.fast = fast.checked;
                masked.transparentBorder = transparentBorder.checked;
                masked.radius = parseFloat(radiusEdit.text);
                masked.samples = sampleSlider.value;
                linear.gradient.stops[0].color = stop1.color;
                linear.gradient.stops[1].color = stop2.color;
            }
        }
    }
}
