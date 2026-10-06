#!/usr/bin/env python3
# requires i3ipc (pip install i3ipc)

import i3ipc
import subprocess
import time

def update_polybar(i3, e=None):
    # If triggered by a key binding, wait a tiny fraction of a second
    # for i3 to process the split layout change internally.
    if e and e.change == 'run':
        time.sleep(0.05)

    try:
        # Get the current layout tree state
        tree = i3.get_tree()
        focused = tree.find_focused()

        if focused and focused.parent:
            layout = focused.parent.layout
            orientation = focused.parent.orientation

            # Determine visual indicator and trigger Polybar hook
            if layout == 'splitv' or orientation == 'vertical':
                print("   ", flush=True)
                subprocess.run(["polybar-msg", "action", "#i3-split.hook.0"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
            elif layout == 'splith' or orientation == 'horizontal':
                print("   ", flush=True)
                subprocess.run(["polybar-msg", "action", "#i3-split.hook.1"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
            else:
                print(f"   {layout.upper()}", flush=True)
                subprocess.run(["polybar-msg", "action", "#i3-split.hook.2"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    except Exception:
        pass

i3 = i3ipc.Connection()

# Subscribe to both window focus changes AND keyboard shortcuts/bindings
i3.on(i3ipc.Event.WINDOW_FOCUS, update_polybar)
i3.on(i3ipc.Event.BINDING, update_polybar)

# Initialize on startup
update_polybar(i3)
i3.main()

