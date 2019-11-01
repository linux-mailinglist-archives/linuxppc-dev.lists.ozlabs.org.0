Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C8EC6C3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:30:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474SN515cRzF7FZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 03:30:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="I/bqdNa5"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474SKQ2S70zF63L
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 03:27:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 474SKJ5Xpvz9v2ym;
 Fri,  1 Nov 2019 17:27:48 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=I/bqdNa5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PZ9U7nhZ3E8A; Fri,  1 Nov 2019 17:27:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 474SKJ4Hsnz9v2yl;
 Fri,  1 Nov 2019 17:27:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572625668; bh=MTbVnQzwmKfyCUtbhnjX0ZBzAO1vxqklEBZN4jVzQug=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I/bqdNa5IgpC1lJpLNjBWXiVPfYnORnOj+VKFKalooWvtzStcCsMQLEJfZSoI/tMs
 HPqq7+5xka9Xu6P9/Hxeu3LAFjSA7pTUex55mQCSnS5U37HLjLh/kbM029j+btyoBK
 migQZImU40zDGmpUVa+L/zu3hU/EMw1t2YbjdFlo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31C5F8B8F6;
 Fri,  1 Nov 2019 17:27:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WeeN6NS3i5l2; Fri,  1 Nov 2019 17:27:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 91D008B7C2;
 Fri,  1 Nov 2019 17:27:49 +0100 (CET)
Subject: Re: [PATCH v3 31/36] serial: ucc_uart: stub out soft_uart_init for
 !CONFIG_PPC32
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-32-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <53c1c463-53fc-2005-3b62-a6f430815b45@c-s.fr>
Date: Fri, 1 Nov 2019 17:27:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101124210.14510-32-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/11/2019 à 13:42, Rasmus Villemoes a écrit :
> The Soft UART hack is only needed for some PPC-based SOCs. To allow
> building this driver for non-PPC, guard soft_uart_init() and its
> helpers by CONFIG_PPC32, and use a no-op soft_uart_init() otherwise.

I don't like too much ifdefs in C files, especially arch specific ifdefs 
in generic drivers.

How do we get the QE version on ARM ?

Wouldn't it be cleaner to create a helper for getting the QE version, 
which would be defined in an arch specific header file, calling 
mfspr(SPRN_SVR) on powerpc and whatever needed on arm ?

Christophe

> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   drivers/tty/serial/ucc_uart.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
> index f286e91714cb..313697842e24 100644
> --- a/drivers/tty/serial/ucc_uart.c
> +++ b/drivers/tty/serial/ucc_uart.c
> @@ -33,7 +33,10 @@
>   
>   #include <linux/firmware.h>
>   #include <soc/fsl/cpm.h>
> -#include <asm/reg.h>
> +
> +#ifdef CONFIG_PPC32
> +#include <asm/reg.h> /* mfspr, SPRN_SVR */
> +#endif
>   
>   /*
>    * The GUMR flag for Soft UART.  This would normally be defined in qe.h,
> @@ -1096,6 +1099,8 @@ static const struct uart_ops qe_uart_pops = {
>   	.verify_port    = qe_uart_verify_port,
>   };
>   
> +
> +#ifdef CONFIG_PPC32
>   /*
>    * Obtain the SOC model number and revision level
>    *
> @@ -1238,6 +1243,16 @@ static int soft_uart_init(struct platform_device *ofdev)
>   	return 0;
>   }
>   
> +#else /* !CONFIG_PPC32 */
> +
> +static int soft_uart_init(struct platform_device *ofdev)
> +{
> +	return 0;
> +}
> +
> +#endif
> +
> +
>   static int ucc_uart_probe(struct platform_device *ofdev)
>   {
>   	struct device_node *np = ofdev->dev.of_node;
> 
