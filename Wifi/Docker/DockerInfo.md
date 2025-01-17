# **Docker Information**

## 1. What is Happening?

```bash
docker pull ghcr.io/yinnis97/pynq-z2:main	
```

This command pulls a prebuilt Docker image (pynq-z2:main) from the GitHub Container Registry to your Pynq board.	
- The image is essentially a "snapshot" of an environment that includes:	
	- A specific version of Python.
	- Any required dependencies (like pynq, numpy, etc.).
	- Files or scripts (like your example_script.py and base.bit).
	
```bash
docker run --rm ghcr.io/yinnis97/pynq-z2:main
```	

This command creates and runs a container from the pynq-z2:main Docker image on your Pynq board.	
- A container is an isolated runtime environment, meaning:
	- It doesn't interfere with the Pynq board's system files or Python installation.
	- All the libraries, scripts, and configurations required for your project exist within this container.
	- When the container runs, it executes the CMD specified in the Dockerfile (in your case, python example_script.py).
	
- The --rm flag means the container will automatically delete itself once the command finishes or the container stops.


## 2. Are You Inside a Container?	

Yes, when you run docker run, the script executes inside the container, not directly on the Pynq board's main system. However:	

- You don't "see" the container like a terminal session unless you explicitly ask for it (e.g., by running it interactively with -it).	
- If your script has output (e.g., print() statements), you'll see the output in the terminal where you ran the docker run command.		

## 3. How Does a Docker Container Work?

Think of a Docker container as a lightweight virtual machine:

- It shares the host system's kernel (your Pynq's Linux OS) but runs in isolation.
- It contains all the dependencies, libraries, and files needed for your program to work.

For example:

- If your Pynq has Python 3.10 installed but your script requires Python 3.8, the container can run with Python 3.8 without affecting the Pynq's native system.
- Your base.bit file and Python script are part of the container, so you don't need to worry about managing them directly on the Pynq board.	

## 4. Persistence and Cleanup

The --rm flag:

- When you use --rm, the container is deleted after it finishes running. This means:	
	- Any files created inside the container during execution will be lost unless you explicitly save them (e.g., by mounting volumes).	
	- If you need persistent changes, don't use --rm.	
Files on the Pynq:	

- The container runs in isolation, so files in the container won't appear on the Pynq unless you explicitly copy them out or mount a directory.	

## 5. Interactive Mode

If you want to interact with the container (e.g., open a terminal in it), you can use:

```bash
docker run -it ghcr.io/yinnis97/pynq-z2:main /bin/bash
```

This will:

- Start the container.
- Open an interactive terminal (bash) inside the container.
- Let you explore the container’s file system or manually run commands.

Conclusion
- The container is an isolated environment that doesn't affect the Pynq's native system.
- To keep the container persistent or interact with it, you'll need to modify how you run it (e.g., avoid --rm, use -it, or mount directories).