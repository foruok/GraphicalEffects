import QtQuick 2.2
import QtQuick.Dialogs 1.2

Rectangle {
    id: picker;
    border.width: 1;
    border.color: "black";
    width: 100;
    height: 62;
    color: "#80800000";
    property var colorDlg: null;
    MouseArea {
        anchors.fill: parent;
        onClicked: {
            colorDlg = clr.createObject(picker, { "currentColor" : picker.color});
            colorDlg.accepted.connect(picker.onAccepted);
            colorDlg.rejected.connect(picker.onRejected);
        }
    }

    Text {
        id: colorLabel;
        anchors.centerIn: parent;
        text: colorUtil.nameOfColor(picker.color);
        color: colorUtil.invert(picker.color);
    }

    /*
    Component.onCompleted: {
        colorLabel.color = colorUtil.invert(picker.color);
        console.log("ColorPicker orig color, ", colorUtil.nameOfColor(picker.color));
        console.log("ColorPicker label color, ", colorUtil.nameOfColor(colorLabel.color));
    }
    */

    function onAccepted() {
        color = colorDlg.currentColor;
        colorLabel.text = colorUtil.nameOfColor(color);
        colorLabel.color = colorUtil.invert(color);
        colorDlg.destroy();
    }

    function onRejected() {
        colorDlg.destroy();
    }

    Component {
        id: clr;
        ColorDialog {
            id: colorDlg;
            width: 400;
            height: 400;
            title: "Please choose a color";
            showAlphaChannel: true;
            visible: true;
        }
    }
}
