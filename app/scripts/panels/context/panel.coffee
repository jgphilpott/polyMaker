addContextPanel = ->

    $("#navbar, #forkme, #canvas, #metabox, #help").mouseenter -> $("#context-menu.panel").remove()

contextMenu = (type, element, event) ->

    $("body").append "<div id='context-menu' class='panel'></div>"

    panel = $("#context-menu.panel")

    switch type

        when "axisCap"

            panel.append "<p id='look'>Look Here</p>"

            panel.find("#look").click ->

                if camera.focus element.position

                    $("#canvas").css "cursor", ""

            break

        when "mesh"

            meshPanel = $ "#mesh." + element.uuid + ""
            meshTableRow = $ "#meshes.table tr#" + element.uuid + ""

            panel.append "<h4>Basic</h4>"
            panel.append "<p id='panel'>" + (if meshPanel.length and meshPanel.css("visibility") is "visible" then "Close" else "Open") + " Panel</p>"
            panel.append "<p id='look'>Look Here</p>"

            if not element.getLock()

                panel.append "<h4>Ops</h4>"
                panel.append "<p id='join'>Join Mesh</p>"
                panel.append "<p id='cut'>Cut Mesh</p>"
                panel.append "<p id='intersect'>Intersect Mesh</p>"

            panel.append "<h4>Mesh</h4>"
            if not element.getLock() then panel.append("<p id='lock'>Lock Mesh</p>") else panel.append("<p id='lock'>Unlock Mesh</p>")
            if not element.getLock() then panel.append("<p id='wireframe'>Wireframe " + (if element.material.wireframe then "Off" else "On") + "</p>") else null
            if not element.getLock() then panel.append("<p id='remove'>Remove Mesh</p>") else null

            panel.find("#panel").click ->

                if meshPanel.length and meshPanel.css("visibility") is "visible"

                    meshTableRow.find(".settings").attr "src", "/app/imgs/panels/tools/toggle/off.png"

                    meshPanel.css "visibility", "hidden"

                else if meshPanel.length and meshPanel.css("visibility") is "hidden"

                    meshTableRow.find(".settings").attr "src", "/app/imgs/panels/tools/toggle/on.png"

                    meshPanel.css "z-index", events.zIndex += 1
                    meshPanel.css "visibility", "visible"

                else

                    meshTableRow.find(".settings").attr "src", "/app/imgs/panels/tools/toggle/on.png"

                    addMeshPanel element

            panel.find("#look").click -> if camera.focus element.position then $("#canvas").css "cursor", ""
            panel.find("#cut").click -> element.morph "cut", "setup"
            panel.find("#join").click -> element.morph "join", "setup"
            panel.find("#intersect").click -> element.morph "intersect", "setup"
            panel.find("#lock").click -> element.toggleLock()
            panel.find("#wireframe").click -> element.material.wireframe = !element.material.wireframe
            panel.find("#remove").click -> element.remove()

            break

        when "shape"

            shortcut = $ "#shortcuts.panel img#" + element.attr("id") + ".shape"

            panel.append "<p id='add'>Add Mesh</p>"
            if shortcut.css("display") is "none" then panel.append("<p id='show'>Show Shortcut</p>") else panel.append("<p id='hide'>Hide Shortcut</p>")

            panel.find("#add").click -> new Mesh(element.attr "id").add()
            panel.find("#show, #hide").click -> toggleShortcut element.attr "id"

            break

    panel.find("p").click ->

        panel.remove()

        composer.outlinePass.selectedObjects = []

    panel.css "z-index", events.zIndex + 1

    positionContextMenu panel, event

positionContextMenu = (panel, event) ->

    gapSize = 5

    if event.pageX >= window.innerWidth / 2
        panel.css "left", event.pageX - panel.outerWidth() + gapSize
    else if event.pageX < window.innerWidth / 2
        panel.css "left", event.pageX - gapSize

    if event.pageY >= window.innerHeight / 2
        panel.css "top", event.pageY - panel.outerHeight() + gapSize
    else if event.pageY < window.innerHeight / 2
        panel.css "top", event.pageY - gapSize
