Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB9E73F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:04:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t8bj1znPzDqQX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 02:04:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="TCJfhTf+"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t8Qr1KpBzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:56:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t8Qg1H7zz9vD3T;
 Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TCJfhTf+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id e4zvibUn7XuO; Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t8Qg01MLz9vD3G;
 Mon, 29 Apr 2019 17:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556553371; bh=MAsrBDvhnJttPasnsN8gBilzLEIc1tXHx2VDi8YmxeA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TCJfhTf+GtIv6E3INZukOMu5Yh2lbbCEwQPfE+Jza9vNBWj1fGcVlvS9y5bh8WQEf
 A7u5vGY3+mSGrzSQnBl5pVv9YKko+vqC2/RZ1Df503Iz9uiAHImnTg5AE5lZEFW3ho
 5D0sxY1tKt7QvFSa0C7DrgwII8Apaq2alR/vHwLs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 325D98B8B4;
 Mon, 29 Apr 2019 17:56:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lnR_i6xj-pyv; Mon, 29 Apr 2019 17:56:16 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D48808B8B3;
 Mon, 29 Apr 2019 17:56:15 +0200 (CEST)
Subject: Re: [PATCH 23/41] drivers: tty: serial: cpm_uart: fix styling issues
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-24-git-send-email-info@metux.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <df50792f-88bc-379a-d9e1-4f2dc1f4965a@c-s.fr>
Date: Mon, 29 Apr 2019 17:56:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-24-git-send-email-info@metux.net>
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/04/2019 à 14:52, Enrico Weigelt, metux IT consult a écrit :
> Fix checkpatch errors:

What the main purpose of this change ?

If we apply this, any fix to stable will be a nightmare to backport. Is 
it really worth it ?

Anyway, a couple of comments in the patch below

[...]

> 
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>   drivers/tty/serial/cpm_uart/cpm_uart.h      | 10 +--
>   drivers/tty/serial/cpm_uart/cpm_uart_core.c | 95 ++++++++++++++++-------------
>   drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h |  4 +-
>   drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c |  6 +-
>   4 files changed, 64 insertions(+), 51 deletions(-)

[...]

> 
> @@ -1048,9 +1058,10 @@ static void cpm_uart_early_write(struct uart_cpm_port *pinfo,
>   static int poll_wait_key(char *obuf, struct uart_cpm_port *pinfo)
>   {
>   	u_char		c, *cp;
> -	volatile cbd_t	*bdp;
>   	int		i;
>   
> +	volatile cbd_t	*bdp;
> +

This was likely a false positive from checkpatch. The formatting was 
good, and now it is wrong as it adds an unnecessary blank line.

>   	/* Get the address of the host memory buffer.
>   	 */
>   	bdp = pinfo->rx_cur;

[...]

> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> index a0fccda..154ac19 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> @@ -117,8 +117,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
>   	if (is_con) {
>   		mem_addr = kzalloc(memsz, GFP_NOWAIT);
>   		dma_addr = virt_to_bus(mem_addr);
> -	}
> -	else
> +	} else
>   		mem_addr = dma_alloc_coherent(pinfo->port.dev, memsz, &dma_addr,
>   					      GFP_KERNEL);

Checkpatch should have told you that in case first leg has braces, 
second leg must have braces too even if it's a single line.

Christophe


>   
> @@ -148,7 +147,8 @@ void cpm_uart_freebuf(struct uart_cpm_port *pinfo)
>   	dma_free_coherent(pinfo->port.dev, L1_CACHE_ALIGN(pinfo->rx_nrfifos *
>   							  pinfo->rx_fifosize) +
>   			  L1_CACHE_ALIGN(pinfo->tx_nrfifos *
> -					 pinfo->tx_fifosize), (void __force *)pinfo->mem_addr,
> +					 pinfo->tx_fifosize),
> +			  (void __force *)pinfo->mem_addr,
>   			  pinfo->dma_addr);
>   
>   	cpm_dpfree(pinfo->dp_addr);
> 
