# Minitalk

Welcome to my "Minitalk" project from 42! 🚀

This repository contains my implementation of the "Minitalk" project, a networked application that allows communication between a client and a server using signals. The project focuses on signal handling, interprocess communication, and synchronization.

## Table of Contents

- [Introduction](#introduction)
- [Compile and Run](#compile-and-run)
- [Source Files](#source-files)
- [Dependencies](#dependencies)
- [Signal Handling](#signal-handling)
- [Client Implementation](#client-implementation)
- [Server Implementation](#server-implementation)
- [Clean Up](#clean-up)
- [Contributions](#contributions)
- [Feedback](#feedback)
- [Thank You](#thank-you)

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

## Signal Handling

Signal handling is a crucial aspect of the "Minitalk" project. The communication between the client and the server is established using SIGUSR1 and SIGUSR2 signals.

## Client Implementation

The client is responsible for sending messages to the server. The `send_char` function converts each character of the message into a series of bits and sends them to the server using signals.

## Server Implementation

The server is responsible for receiving and displaying messages from the client. The server uses signal handlers (`handle_sigusr1` and `handle_sigusr2`) to interpret the signals received from the client and reconstruct the original message.

## Clean Up

To clean up the compiled files and object files, use the following command:

```make clean```

To remove all compiled files, including libraries, use the following command:

```make fclean```


## Contributions

I completed this project as part of my coursework at 42 Coding School. While I don't actively maintain it, feel free to fork the repository, make improvements, and submit pull requests.

## Feedback

I'm open to feedback and suggestions for improving my implementation. If you have any ideas or spot any issues, please create an issue or reach out to me!

## Thank You

Thank you for visiting my repository and exploring the "Minitalk" project. I hope you find it informative and useful for your own coding journey. Happy coding! 🌟




