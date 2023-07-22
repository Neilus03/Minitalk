/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nde-la-f <nde-la-f@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/22 11:51:19 by nde-la-f          #+#    #+#             */
/*   Updated: 2023/07/22 14:59:11 by nde-la-f         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int		g_bit_position = 0;
char	g_current_char = 0;

void	handle_sigusr1(int signum)
{
	g_current_char &= ~(1 << g_bit_position);
	g_bit_position++;
	if (g_bit_position == 8)
	{
		ft_putchar(g_current_char);
		g_current_char = 0;
		g_bit_position = 0;
	}
	(void)signum;
}

void	handle_sigusr2(int signum)
{
	g_current_char |= (1 << g_bit_position);
	g_bit_position++;
	if (g_bit_position == 8)
	{
		ft_putchar(g_current_char);
		g_current_char = 0;
		g_bit_position = 0;
	}
	(void)signum;
}

int	main(void)
{
	struct sigaction	sa_usr1;
	struct sigaction	sa_usr2;

	ft_printf("Server PID: %d\n", getpid());
	sa_usr1.sa_handler = &handle_sigusr1;
	sigemptyset(&sa_usr1.sa_mask);
	sa_usr1.sa_flags = 0;
	sa_usr2.sa_handler = &handle_sigusr2;
	sigemptyset(&sa_usr2.sa_mask);
	sa_usr2.sa_flags = 0;
	sigaction(SIGUSR1, &sa_usr1, NULL);
	sigaction(SIGUSR2, &sa_usr2, NULL);
	while (1)
	{
		pause();
	}
	return (0);
}
