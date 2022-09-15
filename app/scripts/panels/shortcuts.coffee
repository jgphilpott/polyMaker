addShortcutsPanel = ->

    $("body").append "<div id='shortcuts' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>"

    panel = $("#shortcuts.panel")

    shapesPanel = $("#shapes.panel")
    shapesVisible = if shapesPanel.css("visibility") == "visible" then true else false

    panel.append "<img title='Box' id='box' class='shape' src='/app/imgs/icons/shapes/basic/box.png'>"
    panel.append "<img title='Cylinder' id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>"
    panel.append "<img title='Sphere' id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>"

    panel.append "<img title='Triangular Prism' id='triangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-3.png'>"
    panel.append "<img title='Rectangular Prism' id='rectangular-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-4.png'>"
    panel.append "<img title='Pentagonal Prism' id='pentagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-5.png'>"
    panel.append "<img title='Hexagonal Prism' id='hexagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-6.png'>"
    panel.append "<img title='Heptagonal Prism' id='heptagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-7.png'>"
    panel.append "<img title='Octagonal Prism' id='octagonal-prism' class='shape' src='/app/imgs/icons/shapes/prisms/prism-8.png'>"

    panel.append "<img title='Triangular Pyramid' id='triangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-3.png'>"
    panel.append "<img title='Rectangular Pyramid' id='rectangular-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-4.png'>"
    panel.append "<img title='Pentagonal Pyramid' id='pentagonal-pyramid' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-5.png'>"
    panel.append "<img title='Cone' id='cone' class='shape' src='/app/imgs/icons/shapes/pyramids/pyramid-x.png'>"

    panel.append "<img title='Torus' id='torus' class='shape' src='/app/imgs/icons/shapes/special/torus.png'>"

    panel.append "<img title='Toggle Shapes Panel' id='toggle' class='nav' src='/app/imgs/panels/nav/" + (if shapesVisible then "x" else "+") + ".png'>"

    panel.find("img.shape").toArray().forEach (shape) ->

        makeDragable $(shape)

        $(shape).clickSingleDouble (event) ->

            if shapesPanel.css("visibility") == "visible"

                toggleShortcut shape.id

        , (event) ->

            addMesh null, {name: shape.title, class: shape.id}

        $(shape).contextmenu (event) -> contextMenu "shape", $(this), event

        if settings.ui.shortcuts.includes shape.id

            $(shape).css "display", "block"

    panel.find("#toggle").click((event) ->

        shapesVisible = if shapesPanel.css("visibility") == "visible" then true else false

        updateSettings "panels", "shapes", !shapesVisible

    ).mousedown((event) -> event.stopPropagation()).mouseup((event) -> event.stopPropagation())

    return panel

toggleShortcut = (id) ->

    shortcut = $("#shortcuts.panel img#" + id + ".shape")
    shape = $("#shapes.panel img#" + id + ".shape")

    if shortcut.css("display") == "block"

        settings.ui.shortcuts.filterInPlace (item) -> item != id

        shortcut.css "display", "none"
        shape.css "opacity", 1

    else

        settings.ui.shortcuts.push id

        shortcut.css "display", "block"
        shape.css "opacity", 0.5

    updateSettings "ui", "shortcuts", settings.ui.shortcuts
