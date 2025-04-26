# G6 Mic Fix 🐧🎧

Automatically sets the correct microphone input ("External Mic") for the Sound BlasterX G6 on Linux systems after boot.

This script solves the common problem where the G6 resets its capture source after reboots or system updates, ensuring your microphone works immediately every time.

---

## Features

✅ Automatically detects the correct sound card ID, even if it changes  
✅ No manual reconfiguration needed after updates or device reordering  
✅ Works with Pipewire and PulseAudio  
✅ Designed for systemd user services (starts automatically after login)

---

## Installation

1. Download the latest release from the [Releases](https://github.com/toffelwurst/g6-micfix/releases) page.

2. Extract the archive:

```bash
tar -xvzf g6-micfix-vX.Y.Z.tar.gz
# or if you downloaded a zip
unzip g6-micfix-vX.Y.Z.zip
```

3. Create a systemd user service (`~/.config/systemd/user/g6-micfix.service`):

```ini
[Unit]
Description=G6 Mic Fix
After=graphical-session.target pipewire.service pipewire-pulse.service
Requires=pipewire.service

[Service]
Type=oneshot
ExecStartPre=/bin/sleep 5
ExecStart=/path/to/g6-micfix.sh #CHANGE ME!
RemainAfterExit=true

[Install]
WantedBy=default.target
```

4. Enable and start the service:

```bash
systemctl --user daemon-reload
systemctl --user enable --now g6-micfix.service
```

---

## Requirements

- Linux distribution with systemd and Pipewire or PulseAudio
- `amixer` (provided by `alsa-utils` package)
- Sound BlasterX G6 connected via USB

---

## Why?

Linux sometimes resets or reorders USB sound devices.  
This script ensures that your Sound BlasterX G6 microphone is always set correctly to **"External Mic"** without manual intervention.

---

## License

This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.

---