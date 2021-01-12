Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF02F38CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 19:27:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFfF52g3szDqS8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 05:27:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFfC85Y9WzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 05:25:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DFfBz0Pnyz9tyLw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 19:25:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Fvqg_1vNs4ft for <linuxppc-dev@lists.ozlabs.org>;
 Tue, 12 Jan 2021 19:25:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DFfBy66zmz9tyLb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 19:25:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D9668B7D3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 19:25:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LD4SopIqvY20 for <linuxppc-dev@lists.ozlabs.org>;
 Tue, 12 Jan 2021 19:25:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F0ECF8B7CD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 19:25:31 +0100 (CET)
Subject: Re: [PATCH] tty: serial: cpm_uart: Add udbg support for enabling xmon
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linuxppc-dev@lists.ozlabs.org
References: <e4471bf81089252470efb3eed735d71a5b32adbd.1608716197.git.christophe.leroy@csgroup.eu>
Message-ID: <6619e42e-38ca-8fa0-b154-8550b14c41d6@csgroup.eu>
Date: Tue, 12 Jan 2021 19:25:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e4471bf81089252470efb3eed735d71a5b32adbd.1608716197.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/12/2020 à 10:38, Christophe Leroy a écrit :
> In order to use xmon with powerpc 8xx, the serial driver
> must provide udbg_putc() and udpb_getc().
> 
> Provide them via cpm_put_poll_char() and cpm_get_poll_char().
> 
> This requires CONFIG_CONSOLE_POLL.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

This patch has been merged in tty-next, it is visible in linux-next

Christophe

> ---
>   drivers/tty/serial/cpm_uart/cpm_uart_core.c | 40 ++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> index ba14ec5b9bc4..2920b9b602b3 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> @@ -1145,6 +1145,32 @@ static void cpm_put_poll_char(struct uart_port *port,
>   	ch[0] = (char)c;
>   	cpm_uart_early_write(pinfo, ch, 1, false);
>   }
> +
> +static struct uart_port *udbg_port;
> +
> +static void udbg_cpm_putc(char c)
> +{
> +	if (c == '\n')
> +		cpm_put_poll_char(udbg_port, '\r');
> +	cpm_put_poll_char(udbg_port, c);
> +}
> +
> +static int udbg_cpm_getc_poll(void)
> +{
> +	int c = cpm_get_poll_char(udbg_port);
> +
> +	return c == NO_POLL_CHAR ? -1 : c;
> +}
> +
> +static int udbg_cpm_getc(void)
> +{
> +	int c;
> +
> +	while ((c = udbg_cpm_getc_poll()) == -1)
> +		cpu_relax();
> +	return c;
> +}
> +
>   #endif /* CONFIG_CONSOLE_POLL */
>   
>   static const struct uart_ops cpm_uart_pops = {
> @@ -1251,7 +1277,10 @@ static int cpm_uart_init_port(struct device_node *np,
>   		pinfo->gpios[i] = NULL;
>   
>   #ifdef CONFIG_PPC_EARLY_DEBUG_CPM
> -	udbg_putc = NULL;
> +#ifdef CONFIG_CONSOLE_POLL
> +	if (!udbg_port)
> +#endif
> +		udbg_putc = NULL;
>   #endif
>   
>   	return cpm_uart_request_port(&pinfo->port);
> @@ -1370,6 +1399,15 @@ static int __init cpm_uart_console_setup(struct console *co, char *options)
>   	uart_set_options(port, co, baud, parity, bits, flow);
>   	cpm_line_cr_cmd(pinfo, CPM_CR_RESTART_TX);
>   
> +#ifdef CONFIG_CONSOLE_POLL
> +	if (!udbg_port) {
> +		udbg_port = &pinfo->port;
> +		udbg_putc = udbg_cpm_putc;
> +		udbg_getc = udbg_cpm_getc;
> +		udbg_getc_poll = udbg_cpm_getc_poll;
> +	}
> +#endif
> +
>   	return 0;
>   }
>   
> 
