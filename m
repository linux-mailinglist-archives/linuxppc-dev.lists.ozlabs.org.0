Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C519D977
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:50:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2ss20V4zF09q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:50:25 +1100 (AEDT)
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
 header.s=mail header.b=F0CwCyYe; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v2m26b6czDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 01:45:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48v2lv1GPyz9vBTh;
 Fri,  3 Apr 2020 16:45:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=F0CwCyYe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id j5YELewr4bfA; Fri,  3 Apr 2020 16:45:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48v2lv09n8z9vBTg;
 Fri,  3 Apr 2020 16:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585925115; bh=fVm88ntKRh6iF8M0hVm8AudcP3LVPOOGs6P3z4XdTIY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F0CwCyYejhkcp8HErZ2Hkruv5SAPKmtCzTGe4IHosE9jaOyZ5KQvfoF7NLIMqrANc
 k5EeNXdZfikBD356hncvJMm8I+Njz84jx2gja2lTLoiUC1cItQkaFbOQ3lY97ns/sG
 4ftTnRElTUhOFzDbkx0R27qqh0t9bTXa6mFX6PsU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 658818B95A;
 Fri,  3 Apr 2020 16:45:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id inYiN-67PE7e; Fri,  3 Apr 2020 16:45:16 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C21B8B958;
 Fri,  3 Apr 2020 16:45:15 +0200 (CEST)
Subject: Re: [PATCH v2 13/14] powerpc/64s: system reset do not trace
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-14-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2c306b0a-eaac-c2c0-5fab-075398dc6b30@c-s.fr>
Date: Fri, 3 Apr 2020 16:45:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403132622.130394-14-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/04/2020 à 15:26, Nicholas Piggin a écrit :
> Similarly to the previous patch, do not trace system reset. This code
> is used when there is a crash or hang, and tracing disturbs the system
> more and has been known to crash in the crash handling path.
> 
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/traps.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 1845fd7e161a..ed7b7a6e2dc0 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -443,6 +443,9 @@ void system_reset_exception(struct pt_regs *regs)
>   	unsigned long hsrr0, hsrr1;
>   	bool nested = in_nmi();
>   	bool saved_hsrrs = false;
> +	u8 ftrace_enabled = local_paca->ftrace_enabled;
> +
> +	local_paca->ftrace_enabled = 0;

I predict a build failure here in the near future ...

See 
https://elixir.bootlin.com/linux/v5.6/source/arch/powerpc/kernel/head_8xx.S#L125

>   
>   	/*
>   	 * Avoid crashes in case of nested NMI exceptions. Recoverability
> @@ -524,6 +527,8 @@ void system_reset_exception(struct pt_regs *regs)
>   	if (!nested)
>   		nmi_exit();
>   
> +	local_paca->ftrace_enabled = ftrace_enabled;
> +
>   	/* What should we do here? We could issue a shutdown or hard reset. */
>   }
>   
> 

Christophe
