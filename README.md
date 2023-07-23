# Minitalk

Welcome to my "Minitalk" project from 42! 🚀

This repository contains my implementation of the "Minitalk" project, a networked application that allows communication between a client and a server using signals. The project focuses on signal handling, interprocess communication, and synchronization.

## Table of Contents
|              CONTENTS                |
|-----------------------------------------------------| 
| [Introduction](#introduction)|
| [Compile and Run](#compile-and-run)|
| [Source Files](#source-files)|
| [Dependencies](#dependencies)|
| [Signal Handling & Bitwise Operations](#Signal-Handling-and-Bitwise-Operations)|
| [Clean Up](#clean-up)|
| [Contributions](#contributions)|
| [Feedback](#feedback) |
| [Thank You](#thank-you) |

![-42-_-nde-la-f](https://user-images.githubusercontent.com/87651732/235460785-6127a6ab-9f43-4b99-a43e-ea90040dab67.svg)
[![forthebadge](https://forthebadge.com/images/badges/made-with-c.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)


## Introduction

The **Minitalk** project aims to create a simple networked application using signals for interprocess communication. The client sends a string message to the server, and the server displays the received message. Signal handling and synchronization are crucial aspects of this project.

## Compile and Run

To compile the **Minitalk** project, you can use the provided Makefile. The project requires the "libft" and "ft_printf" libraries, which are also compiled using their respective Makefiles.

To compile both the client and the server, run the following command:

```make```

To run the server, execute the following command in one terminal:

```./server```

To send a message from the client to the server, use the following command in another terminal:

```./client <server_pid> <"message">```



Replace `<server_pid>` with the process ID of the server and `<"message">` with the string you want to send.

## Source Files

The "Minitalk" project consists of the following source files:

- `server.c`: Implementation of the server that receives and displays messages from the client.
- `client.c`: Implementation of the client that sends messages to the server.

## Dependencies

The "Minitalk" project relies on the following libraries:

- `libft`: A custom library developed during the "libft" project, providing essential functions for memory manipulation and string handling.
- `ft_printf`: A custom implementation of the printf function for formatted printing.

## Signal Handling and Bitwise Operations

In the **Minitalk** project, communication between the client and the server is established using signals `SIGUSR1` and `SIGUSR2`. To send a message from the client to the server, each character of the message is converted into a series of bits and then sent using these signals.

### Client Implementation

In the `client.c` file, the function `send_char` is responsible for sending each character of the message to the server. Here's how it works:

1. The `send_char` function receives the server's process ID and the character `c` that needs to be sent.
2. For each character `c`, it goes through a loop of 8 iterations (since a character is 8 bits long).
3. During each iteration, it extracts the current bit of the character `c` using bitwise operations.
4. If the bit is `0`, it sends a `SIGUSR1` signal to the server. If the bit is `1`, it sends a `SIGUSR2` signal.
5. After sending the signal, the client waits for a short time using `usleep` to ensure proper synchronization between the client and the server.

### Server Implementation

In the `server.c` file, the server needs to interpret the signals received from the client and reconstruct the original message. Here's how it does that:

1. The server uses two signal handlers: `handle_sigusr1` and `handle_sigusr2`.
2. Whenever a `SIGUSR1` signal is received, the `handle_sigusr1` function is called.
3. Similarly, when a `SIGUSR2` signal is received, the `handle_sigusr2` function is called.
4. In both signal handlers, the server keeps track of the received bits and reconstructs the character by combining the received bits.
5. After receiving 8 bits (representing a complete character), the server prints the character using `ft_putchar` from the `libft` library.

Bitwise operations are used to extract individual bits from the character `c` in the client and to combine the received bits into a complete character in the server. This method ensures efficient communication between the client and the server using just two signals.

By using `SIGUSR1` to represent 0 and `SIGUSR2` to represent 1, the client and server create a binary encoding scheme to transmit characters effectively. The use of bitwise operations is crucial for this binary encoding and decoding process.

With these bitwise operations and signal handling in place, the "Minitalk" project achieves efficient and reliable communication between the client and the server.

Remember that the `server.c` and `client.c` files work together as a pair, enabling the communication between the two processes. Understanding how the bitwise operations and signal handling operate in this context is fundamental to comprehending the project's core functionality.

## Clean Up

To clean up the compiled files and object files, use the following command:

```make clean```

To remove all compiled files, including libraries, use the following command:

```make fclean```


## Contributions

I completed this project as part of my coursework at 42. While I don't actively maintain it, feel free to fork the repository, make improvements, and submit pull requests.

## Feedback

I'm open to feedback and suggestions for improving my implementation. If you have any ideas or spot any issues, please create an issue or reach out to me!

## Thank You

Thank you for visiting my repository and exploring the "Minitalk" project. I hope you find it informative and useful for your own coding journey, if so you can give me a 🌟. Happy coding! 😄




