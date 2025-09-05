Return-Path: <linuxppc-dev+bounces-11783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22215B45630
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 13:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJDRT69vwz3c4y;
	Fri,  5 Sep 2025 21:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757071237;
	cv=none; b=Y5Uj58Ko/sodxq9Zs4vr92Qyxb2uKebmo9QdQ+LMjKPd+d2hGmCd/s6aIhL/gCSU42romt0ueIBPdEQO/NdOmSW+jHJzLMTbT9szw2ROALoEpFq6H0GXuySAA3cMijR+f7IprcHji7LD+E1GPR9xuFNiHY32yy8lhplFTNN1t/3P0tow3y1MeLszOLR6cKq5FDTbgdx1W7jHbf2Xy2t1n6W/sVZE+lbeg83RdgUfx+JqJSjrKnLBbYydYyiwvlnBssBg+juFl6Xg0wgOwDfxIwLQ3r85FBa74OAQecGSRT2NXk2Cm3YzcxsJYR2WYYLaEdhOAUMQ8owHMUD5sIWNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757071237; c=relaxed/relaxed;
	bh=bLyLCuEUyK2k0G91YYQ9WCYspnnsWwQHa0g+X3q1yyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSz5DDvjpcHsI5GAFvr0EmC+hbkFGDFsQrVNGSpG66ATWQlaE4BivLdS3UwmOGYBnZTmJ7hYBFWhG9CP96vCaEiYNyHMF+i9ECTkw0CBlSFVyuxtPD1b5l1GftZTb2mWf7BXxsP1jk/X64MJaoDQ8ODFkx8x88HqSDaRTHJdqSIo13d6+Apjo0rIOGtPSOMFilXwW3VdZ0I8GoWDbFBHr4GVyolmcHtQSq+rfOBKeHwryVEf4rP0lof2VxTVKaEpsT93hcDu+shvUxc+Y1744HurAyV6NpeUOPu6bTF1F0BT1n90KF239bh5Kx2pHFFfSTWCyx95cyC6uaNfxeoLCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJDRT1N9kz3c3K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 21:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cJBQF6cZVz9sSh;
	Fri,  5 Sep 2025 11:49:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcDlpa8gf6Cl; Fri,  5 Sep 2025 11:49:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cJBQD56YSz9sSf;
	Fri,  5 Sep 2025 11:49:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 97D228B774;
	Fri,  5 Sep 2025 11:49:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RTrywvFHm_LN; Fri,  5 Sep 2025 11:49:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D74578B773;
	Fri,  5 Sep 2025 11:49:23 +0200 (CEST)
Message-ID: <d5bfa13f-379f-493a-a410-400dd3782207@csgroup.eu>
Date: Fri, 5 Sep 2025 11:49:23 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: remove redundant condition checks
To: Xichao Zhao <zhao.xichao@vivo.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250905091321.437476-1-zhao.xichao@vivo.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250905091321.437476-1-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/09/2025 à 11:13, Xichao Zhao a écrit :
> Remove redundant condition checks and replace else if with else.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/tty/hvc/hvc_console.c   | 2 +-
>   drivers/tty/serial/msm_serial.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
> index cd1f657f782d..fffc30b9ea54 100644
> --- a/drivers/tty/hvc/hvc_console.c
> +++ b/drivers/tty/hvc/hvc_console.c
> @@ -184,7 +184,7 @@ static void hvc_console_print(struct console *co, const char *b,
>   					hvc_console_flush(cons_ops[index],
>   						      vtermnos[index]);
>   				}
> -			} else if (r > 0) {
> +			} else {
>   				i -= r;
>   				if (i > 0)
>   					memmove(c, c+r, i);
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 3449945493ce..2e999cb9c974 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -1102,7 +1102,7 @@ msm_find_best_baud(struct uart_port *port, unsigned int baud,
>   
>   			if (result == baud)
>   				break;
> -		} else if (entry->divisor > divisor) {
> +		} else {
>   			old = target;
>   			target = clk_round_rate(msm_port->clk, old + 1);
>   			/*


