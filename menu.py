import nuke
# access the main menu
toolbar = nuke.menu ("nodes")

# create a custom menu
menu = nuke.menu("Nuke").addMenu("My Tools")
# add a command (example:create a blur node)
#menu.addCommand("blur node", "nuke.message('blur from menu.py!')")
nuke.pluginAddPath('./gizmos')

#import nuke

#toolbar = nuke.menu("Nodes")
#my_menu = toolbar.addMenu("My Tools")

#my_menu.addCommand("My Gizmo", "nuke.createNode('MyGizmo')")

#import nuke

#nuke.pluginAddPath('./gizmos')

#toolbar = nuke.menu("Nodes")
#custom_menu = toolbar.addMenu("🔥 Nuke Gizmos")

#custom_menu.addCommand("Blur Advanced", "nuke.createNode('BlurAdvanced')")
#custom_menu.addCommand("Glow Pro", "nuke.createNode('GlowPro')")
#custom_menu.addCommand("My Nuke Tool", "nuke.createNode('MyGizmo')")

import os
import nuke

gizmo_path = os.path.join(os.path.dirname(__file__), "gizmos")
nuke.pluginAddPath(gizmo_path)

toolbar = nuke.menu("Nodes")
menu = menu.addMenu("Custom Gizmos")

for file in os.listdir(gizmo_path):
    if file.endswith(".gizmo"):
        name = file.replace(".gizmo", "")
        menu.addCommand(name, f"nuke.createNode('{name}')")
