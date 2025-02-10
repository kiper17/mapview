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

        parameters: [
            PluginParameter {
                name: "osm.mapping.custom.host"
                value: "https://tile.thunderforest.com/cycle/"
            },
            PluginParameter {
                name: "osm.mapping.custom.apikey"
                value: "6cbc7a5bdc0d40a89f44cc597d617a1b"
            }
        ]
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(59.2205, 39.8915)
        zoomLevel: 12
    }
}
