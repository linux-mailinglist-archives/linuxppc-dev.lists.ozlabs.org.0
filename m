Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC015BE14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 12:58:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JFQ91jR3zDqT6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 22:58:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=KJWXfYPu; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JFMC4zMhzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 22:55:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48JFM44nsvz9vC11;
 Thu, 13 Feb 2020 12:55:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KJWXfYPu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wAM0AcDhPoiW; Thu, 13 Feb 2020 12:55:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48JFM43T1Qz9vC10;
 Thu, 13 Feb 2020 12:55:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581594928; bh=Rrbw8RVt/xSUKxa7Q0zKFqi6LP7mXV3jDI44d43PGuA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KJWXfYPuarHKovP9WzhGQjgpCzoGk0NZtnunr96zCcG0tIm4aC70u27tLnrfoqIIl
 ZVLTktzaHpTVXLBrGoYCQ8wU6Dzowxs+jBXlG8+cTU/Cgxpc/9WRlPaiIn31H8XwtV
 b/Jw5mDFUdWEqvhfmeWoyQc6/yilYcmI1ECXbxqc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B47338B845;
 Thu, 13 Feb 2020 12:55:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4iZciwIiPN-4; Thu, 13 Feb 2020 12:55:29 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD85D8B842;
 Thu, 13 Feb 2020 12:55:28 +0100 (CET)
Subject: Re: [PATCH] serial: cpm_uart: call cpm_muram_init before registering
 console
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Timur Tabi <timur@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
References: <20200213114342.21712-1-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d8d006d1-dff9-251e-acde-f02f66205d7d@c-s.fr>
Date: Thu, 13 Feb 2020 12:55:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213114342.21712-1-linux@rasmusvillemoes.dk>
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
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/02/2020 à 12:43, Rasmus Villemoes a écrit :
> Christophe reports that powerpc 8xx silently fails to 5.6-rc1. It turns
> out I was wrong about nobody relying on the lazy initialization of the
> cpm/qe muram in commit b6231ea2b3c6 (soc: fsl: qe: drop broken lazy
> call of cpm_muram_init()).
> 
> Rather than reinstating the somewhat dubious lazy call (initializing a
> currently held spinlock, and implicitly doing a GFP_KERNEL under that
> spinlock), make sure that cpm_muram_init() is called early enough - I
> thought the calls from the subsys_initcalls were good enough, but when
> used by console drivers, that's obviously not the
> case. cpm_muram_init() is safe to call twice (there's an early return
> if it is already initialized), so keep the call from cpm_init() - in
> case SERIAL_CPM_CONSOLE=n.
> 
> Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Fixes: b6231ea2b3c6 (soc: fsl: qe: drop broken lazy call of cpm_muram_init())
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
> 
> Christophe, can I get you to add a formal Tested-by?
> 
> I'm not sure which tree this should go through.
> 
>   drivers/tty/serial/cpm_uart/cpm_uart_core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> index 19d5a4cf29a6..d4b81b06e0cb 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> @@ -1373,6 +1373,7 @@ static struct console cpm_scc_uart_console = {
>   
>   static int __init cpm_uart_console_init(void)
>   {
> +	cpm_muram_init();
>   	register_console(&cpm_scc_uart_console);
>   	return 0;
>   }
> 
