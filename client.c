/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nde-la-f <nde-la-f@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/22 11:53:59 by nde-la-f          #+#    #+#             */
/*   Updated: 2023/07/22 14:56:17 by nde-la-f         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	send_char(int server_pid, char c)
{
	int	i;
	int	bit;

	i = 0;
	while (i < 8)
	{
		bit = (c >> i) & 1;
		if (bit == 0)
			kill(server_pid, SIGUSR1);
		else
			kill(server_pid, SIGUSR2);
		usleep(100);
		i++;
	}
}

int	main(int argc, char *argv[])
{
	int		server_pid;
	char	*str;
	int		i;

	if (argc != 3)
	{
		ft_printf("usage: %s <server PID> <string to send>\n", argv[0]);
		return (1);
	}
	server_pid = ft_atoi(argv[1]);
	str = argv[2];
	i = 0;
	while (str[i] != '\0')
	{
		send_char(server_pid, str[i]);
		i++;
	}
	return (0);
}
