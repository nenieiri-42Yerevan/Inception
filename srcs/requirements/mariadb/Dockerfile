# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vismaily <nenie_iri@mail.ru>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/26 15:24:41 by vismaily          #+#    #+#              #
#    Updated: 2023/01/01 17:13:04 by vismaily         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt update; \
			apt install -y mariadb-server mariadb-client; \
			rm -rf /var/lib/apt/lists/*;

COPY		./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY		./tools/entrypoint-script.sh /tmp/
RUN			chmod 766 /tmp/entrypoint-script.sh; \
			chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf; 

EXPOSE		3306

ENTRYPOINT	["/tmp/entrypoint-script.sh"]

CMD			["mysqld"]
