/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   testsignal.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nde-la-f <nde-la-f@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/22 10:03:11 by nde-la-f          #+#    #+#             */
/*   Updated: 2023/07/22 10:09:25 by nde-la-f         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <stdio.h>

void	handler(int sig)
{
	write(STDOUT_FILENO, "I won't die!", 13);
}

int	main(void)
{
	signal(SIGINT, handler);
	while (1)
	{
		printf("Hello World! %d\n", getpid());
		sleep(1);
	}
}
