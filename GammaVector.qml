import QtQuick 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.2

Rectangle {
    id: gammaCreator;
    width: 250;
    height: 30;
    property vector3d gamma: Qt.vector3d(1.0, 1.0, 1.0);
    signal selected();
    color: "lightgray";
    border.width: 1;
    border.color: "darkgray";

    Text {
        id: gammaLabel;
        anchors.centerIn: parent;
        text: "Qt.vector3d(1.0, 1.0, 1.0)";
        color: "darkblue";
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: vectorDlg.visible = true;
    }

    Dialog {
        id: vectorDlg;
        visible: false;
        width: 300;
        height: 200;
        standardButtons: StandardButton.Ok | StandardButton.Cancel;

        onAccepted: {
            gammaCreator.gamma = Qt.vector3d(one.value, two.value, three.value);
            gammaLabel.text = "Qt.vector3d(%1,%2,%3)".arg(one.value.toFixed(1)).arg(two.value.toFixed(1)).arg(three.value.toFixed(1));
            gammaCreator.selected();
        }

        Grid {
            x: 0;
            y: 4;
            width: 300;
            height: 120;
            verticalItemAlignment: Grid.AlignVCenter;
            columns: 3;
            Text {
                text: "0.0";
                width: 50;
                horizontalAlignment: Text.AlignRight;
            }
            Slider {
                id: one;
                minimumValue: 0.0;
                maximumValue: 10.0;
                value: 1.0;
                width: 180;
                height: 30;
            }
            Text {
                text: "10.0";
                width: 50;
            }

            Text {
                text: "0.0";
                width: 50;
                horizontalAlignment: Text.AlignRight;
            }
            Slider {
                id: two;
                minimumValue: 0.0;
                maximumValue: 10.0;
                value: 1.0;
                width: 180;
                height: 30;
            }
            Text {
                text: "10.0";
                width: 50;
            }

            Text {
                text: "0.0";
                width: 50;
                horizontalAlignment: Text.AlignRight;
            }
            Slider {
                id: three;
                minimumValue: 0.0;
                maximumValue: 10.0;
                value: 1.0;
                width: 180;
                height: 30;
            }
            Text {
                text: "10.0";
                width: 50;
            }
        }
    }
}
