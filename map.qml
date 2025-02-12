import QtQuick 2.15
import QtQuick.Window 2.15
import QtLocation 5.15
import QtPositioning 5.15

Window {
    width: 800
    height: 600
    visible: true
    title: "Интерактивная карта"

    Plugin {
        id: mapPlugin
        name: "osm"

        PluginParameter {
            name: "osm.mapping.custom.host";
            value: "http://tile.thunderforest.com/landscape/%z/%x/%y.png?apikey=<your api>&fake=.png"
        }
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(59.2205, 39.8915)
        zoomLevel: 12
        activeMapType: supportedMapTypes[supportedMapTypes.length - 1]

        //Изменение zoom колесиком мыши
        WheelHandler {
            id: wheel
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                            ? PointerDevice.Mouse | PointerDevice.TouchPad
                            : PointerDevice.Mouse
                rotationScale: 1/120
                property: "zoomLevel"
        }
        //Перемещение с помощью зажима левой кнопки мыши
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }
    }
}

