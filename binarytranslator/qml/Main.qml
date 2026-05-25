
import QtQuick 2.7
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'binarytranslator.vboxuser'
    automaticOrientation: true
    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent
        header: PageHeader {
            title: i18n.tr('Binary Translator')
        }

        Column {
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                margins: units.gu(2)
            }
            spacing: units.gu(2)

            Label {
                text: "Enter Text:"
                font.bold: true
            }

            TextArea {
                id: textInput
                width: parent.width
                placeholderText: "Type text here..."
            }

            Button {
                text: "Convert to Binary"
                width: parent.width
                onClicked: {
                    var result = ""
                    for (var i = 0; i < textInput.text.length; i++) {
                        var bin = textInput.text.charCodeAt(i).toString(2)
                        while (bin.length < 8) bin = "0" + bin
                        result += bin + " "
                    }
                    binaryOutput.text = result.trim()
                }
            }

            Label {
                text: "Binary Output:"
                font.bold: true
            }

            TextArea {
                id: binaryOutput
                width: parent.width
                readOnly: true
                placeholderText: "Binary code will appear here..."
            }

            Button {
                text: "Convert to Text"
                width: parent.width
                onClicked: {
                    var bins = binaryOutput.text.split(" ")
                    var result = ""
                    for (var i = 0; i < bins.length; i++) {
                        result += String.fromCharCode(parseInt(bins[i], 2))
                    }
                    textInput.text = result
                }
            }
        }
    }
}
