import QtQuick 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.2

Rectangle {
    id: example;
    signal back();
    anchors.fill: parent;
    Text {
        id: origLabel;
        x: 10;
        y: 4;
        font.pointSize: 20;
        text: "Original Images";
    }

    Button {
        anchors.right: parent.right;
        anchors.top: parent.top;
        anchors.margins: 4;
        text: "Back";
        onClicked: example.back();
    }

    Row {
        id: origImages;
        width: 500;
        height: 260;
        anchors.left: parent.left;
        anchors.top: origLabel.bottom;
        anchors.margins: 4;
        spacing: 10;
        Image {
            source: "bug.jpg";
            sourceSize: Qt.size(240, 240);
            smooth: true;
        }
        Image {
            source: "butterfly.png";
            sourceSize: Qt.size(240, 240);
            smooth: true;
        }
    }
    Rectangle{
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.top: origImages.bottom;
        height: 2;
        border.width: 1;
        border.color: "darkgray";
    }

    Text {
        id: blendLabel;
        anchors.top: origImages.bottom;
        anchors.margins: 4;
        anchors.left: parent.left;
        font.pointSize: 20;
        font.bold: true;
        text: "Blend Modes && Effects";
        color: "blue";
    }

    Rectangle {
        id: blendModes;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.top: blendLabel.bottom;
        anchors.topMargin: 10;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        width: 160;
        color: "gray";

        ListView {
            anchors.fill: parent;
            clip: true;
            focus: true;
            delegate: Text {
                id: wrapper;
                text: name;
                width: parent.width;
                height: 36;
                font.pointSize: 20;
                Keys.onEnterPressed: {
                    blender.mode = name;
                    event.accepted = true;
                }

                Keys.onReturnPressed: {
                    blender.mode = name;
                    event.accepted = true;
                }

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        wrapper.ListView.view.currentIndex = index;
                        blender.mode = name;
                    }
                }
            }
            highlight: Rectangle {
                width: parent.width;
                color: "lightblue";
            }

            model: modesModel;
        }
    }

    Image {
        id: bug;
        anchors.top: blendLabel.bottom;
        anchors.topMargin: 10;
        anchors.left: blendModes.right;
        anchors.leftMargin: 10;
        source: "bug.jpg";
        sourceSize: Qt.size(300, 300);
        smooth: true;
        visible: false;
    }

    Image {
        id: butterfly;
        source: "butterfly.png";
        sourceSize: Qt.size(300, 300);
        smooth: true;
        visible: false;
    }

    Blend {
        id: blender;
        source: bug;
        anchors.fill: bug;
        foregroundSource: butterfly;
        mode: "subtract";
    }

    ListModel {
        id: modesModel;
        ListElement {
            name: "subtract";
        }
        ListElement {
            name: "normal";
        }
        ListElement {
            name: "addition";
        }
        ListElement {
            name: "average";
        }
        ListElement {
            name: "colorBurn";
        }
        ListElement {
            name: "color";
        }
        ListElement {
            name: "colorDodge";
        }
        ListElement {
            name: "darken";
        }
        ListElement {
            name: "darkerColor";
        }
        ListElement {
            name: "difference";
        }
        ListElement {
            name: "divide";
        }
        ListElement {
            name: "exclusion";
        }
        ListElement {
            name: "hardLight";
        }
        ListElement {
            name: "hue";
        }
        ListElement {
            name: "lighten";
        }
        ListElement {
            name: "lighterColor";
        }
        ListElement {
            name: "lightness";
        }
        ListElement {
            name: "multiply";
        }
        ListElement {
            name: "negation";
        }
        ListElement {
            name: "saturation";
        }
        ListElement {
            name: "screen";
        }
        ListElement {
            name: "softLight";
        }
    }
}
