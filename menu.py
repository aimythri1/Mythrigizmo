import os
import nuke

this_dir = os.path.dirname(__file__)
gizmo_path = os.path.join(this_dir, "gizmos")

nuke.pluginAddPath(gizmo_path)

toolbar = nuke.menu("Nodes")
custom_menu = toolbar.addMenu("Custom Gizmos")

if os.path.exists(gizmo_path):
    for file_name in sorted(os.listdir(gizmo_path)):
        if file_name.endswith(".gizmo"):
            gizmo_name = os.path.splitext(file_name)[0]
            custom_menu.addCommand(
                gizmo_name,
                "nuke.createNode('{}')".format(gizmo_name)
            )
