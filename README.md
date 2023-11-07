# USTC-TK2016

This repository is a toolkit called "USTC-TK2016", which is used to parse network traffic (`.pcap` file). Besides, the dataset is "USTC-TFC2016".

* The [`master`](https://github.com/yungshenglu/USTC-TK2016/tree/master) branch can only run on Windows environment.
* The [`ubuntu`](https://github.com/yungshenglu/USTC-TK2016/tree/ubuntu) branch can run on Ubuntu Linux 16.04 LTS environment.
* The [`docker`](https://github.com/hsiangjenli/USTC-TK2016/tree/docker) branch can run on Docker.

> **NOTICE:** This repository credits to [echowei/DeepTraffic](https://github.com/echowei/DeepTraffic)

---
## Installation

1. Clone this repository on your machine
    ```bash
    # Clone the repository on "docker" branch
    $ git clone -b docker https://github.com/hsiangjenli/USTC-TK2016
    ```

1. Pull docker image from docker hub
    ```bash
    $ docker pull hsiangjenli/ntust:pcap2img
    ```
---
## Execution

> **NOTICE:** You are on the `docker` branch now!

1. Download the traffic dataset **USTC-TFC2016** and put it into the directory [`1_Pcap/`](1_Pcap/)
    * You can download the traffic dataset **USTC-TFC2016** from my another [repository](https://github.com/yungshenglu/USTC-TFC2016).
1. Open the terminal and run `make exec` to enter docker container
1. And run `1_Pcap2Session.ps1` (take a few minutes)
    * To split the PCAP file by each **session**, please make sure the line 10 and 14 in `1_Pcap2Session.ps1` is uncommented and make line 11 and 15 is in comment.
    * To split the PCAp file by each **flow**, please make sure the line 11 and 15 in `1_Pcap2Session.ps1` is uncommented and make line 10 and 14 is in comment.
    * Run [`1_Pcap2Session.ps1`](1_Pcap2Session.ps1)
        ```bash
        # Make sure your current directory is correct
        # Split the PCAP files by flow
        $ pwsh 1_Pcap2Session.ps1 -f
        # Split the PCAP files by session
        $ pwsh 1_Pcap2Session.ps1 -s
        ```
    * If succeed, you will see the following files (folders) in folder [`2_Session/`](2_Session/)
        * `AllLayers/`
        * `L7/`
1. Run [`2_ProcessSession.ps1`](2_ProcessSession.ps1) (take a few minutes)
    ```bash
    # Make sure your current directory is correct
    # Process the PCAP file with all layers (ALL) (for unsorting or sorting)
    $ pwsh 2_ProcessSession.ps1 -a [-u | -s]
    # Process the PCAP file only with layer 7 (L7) (for unsorting or sorting)
    $ pwsh 2_ProcessSession.ps1 -l [-u | -s]
    ```
    * If succeed, you will see the following files (folders) in folder [`3_ProcessedSession/`](3_ProcessedSession/)
        * `FilteredSession/` - Get the top 60000 large PCAP files
        * `TrimedSession/` - Trim the filtered PCAP files into size 784 bytes (28 x 28) and append `0x00` if the PCAP file is shorter than 784 bytes
        * The files in subdirectory `Test/` and `Train/` is random picked from dataset.
1. Run [`3_Session2Png.py`](3_Session2Png.py) (take a few minutes)
    ```bash
    # Make sure your current directory is correct
    $ python 3_Session2png.py
    [INFO] Saving image in: 4_Png/Train/0
    ...
    [INFO] Saving image in: 4_Png/Test/0
    ...
    ```
    * If succeed, you will see the following files (folders) in folder [`4_Png/`](4_Png/)
        * `Test/` - For testing
        * `Train/` - For training
5. Run [`4_Png2Mnist.py`](4_Png2Mnist.py) (take a few minutes)
    ```bash
    # Make sure your current directory is correct
    $ python 4_Png2Mnist.py
    [INFO] Generated file: 5_Mnist/train-images-idx1-ubyte
    [INFO] Generated file: 5_Mnist/train-images-idx3-ubyte
    [INFO] Compressed file: 5_Mnist/train-images-idx1-ubyte.gz
    [INFO] Compressed file: 5_Mnist/train-images-idx3-ubyte.gz
    ```
    * If succeed, you will see the the following training datasets in folder [`5_Mnist/`](5_Mnist/)
        * `train-images-idx1-ubyte`
        * `train-images-idx3-ubyte`
        * `train-images-idx1-ubyte.gz`
        * `train-images-idx3-ubyte.gz`

---
## Contributor

> **NOTICE:** You can follow the contributing process [CONTRIBUTING.md](CONTRIBUTING.md) to join me. I am very welcome any issue!

* Author
    * [Wei Wang](https://github.com/echowei) - ww8137@mail.ustc.edu.cn
* Contributor
    * [David Lu](https://github.com/yungshenglu)
    * [Hsiang-Jen Li](https://github.com/hsiangjenli)
---
## License

[Mozilla Public License Version 2.0](LICENSE)