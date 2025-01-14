# Running Your First Python Code on the PYNQ-Z2
Before you start, ensure you're logged into your PYNQ board using SSH.	
While UART can work, SSH is generally recommended for all operations.


## 1.  Verify Your Login.

Once you're logged into the PYNQ, 	
execute the following command to list the contents of the home directory:
```bash
ls
```
You should see the following directories and files:
```bash
jupyter_notebooks pynq REVISION
```

## 2. Create a Python Script.

To create a new Python program, use the following command:
```bash
sudo nano led.py
```

## 3. Add the LED Control Code.

Paste the following Python code into the led.py file:
```python
import time
from pynq.overlays.base import BaseOverlay

# Load the overlay
base = BaseOverlay("base.bit")

# Define the LEDs
leds = [base.leds[i] for i in range(4)]

# Function to run the LED sequence continuously
def led_sequence_continuous():
    try:
        while True:
            # Turn LEDs on one by one
            for i in range(len(leds)):
                leds[i].on()
                time.sleep(0.5)  # Wait for 0.5 seconds between each LED

            # Turn LEDs off one by one
            for i in range(len(leds)):
                leds[i].off()
                time.sleep(0.5)  # Wait for 0.5 seconds between each LED

    except KeyboardInterrupt:
        # Clean up when the program is interrupted
        for i in range(len(leds)):
```

## 4. Save and Exit.

To save the file and exit the editor:

- Press Ctrl + X.
- Press Y to confirm saving the changes.
- Press Enter to finalize.

## 5. Now you can run the code :

You can now run the program with the following command:
```bash
sudo -E python3 led.py
```

Note: The script may take some time to execute. 	
Be patient and wait for it to start before deciding to cancel.