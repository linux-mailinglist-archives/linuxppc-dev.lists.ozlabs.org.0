Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E31A06FB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 08:06:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xH3K2J0lzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:06:21 +1000 (AEST)
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
 header.s=mail header.b=RV/AnNvw; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGbm1RMzzDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:45:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xGbh3PZcz9tyl1;
 Tue,  7 Apr 2020 07:45:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RV/AnNvw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mAu7Og9SAuQJ; Tue,  7 Apr 2020 07:45:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xGbh2FW8z9tyl0;
 Tue,  7 Apr 2020 07:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586238352; bh=HNw2WHYY2gIIf7RavdOP4MtJmjPeThrNR+wS8nmMrxk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RV/AnNvwS6odC6OkqPBWkzRQkrldn/KIm0hZW8+zht4LnezgGhK8r3PAdZMCQ1SwO
 B+MGpPMLzgJ5F14PQDj7HSerB5L/q6grHUQhNgdHFwdXnWCY1JA6Zp8XSr0dQL6ruj
 hOKyrZ4euYMY+jcdBTUA3rC43tCY/SJtC+PfPGIs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 218DC8B76E;
 Tue,  7 Apr 2020 07:45:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5y8qtML9Dq4A; Tue,  7 Apr 2020 07:45:53 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF6F98B75E;
 Tue,  7 Apr 2020 07:45:52 +0200 (CEST)
Subject: Re: [PATCH v3 14/15] powerpc/64s: system reset do not trace
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200407051636.648369-1-npiggin@gmail.com>
 <20200407051636.648369-15-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <87dea24e-e2b6-d890-0c8c-78b1a4040ff7@c-s.fr>
Date: Tue, 7 Apr 2020 07:45:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407051636.648369-15-npiggin@gmail.com>
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



Le 07/04/2020 à 07:16, Nicholas Piggin a écrit :
> Similarly to the previous patch, do not trace system reset. This code
> is used when there is a crash or hang, and tracing disturbs the system
> more and has been known to crash in the crash handling path.
> 
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/kernel/traps.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 9f221772eb73..1beae89bb871 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -443,6 +443,9 @@ void system_reset_exception(struct pt_regs *regs)
>   	unsigned long hsrr0, hsrr1;
>   	bool nested = in_nmi();
>   	bool saved_hsrrs = false;
> +	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
> +
> +	this_cpu_set_ftrace_enabled(0);
>   
>   	/*
>   	 * Avoid crashes in case of nested NMI exceptions. Recoverability
> @@ -524,6 +527,8 @@ void system_reset_exception(struct pt_regs *regs)
>   	if (!nested)
>   		nmi_exit();
>   
> +	this_cpu_set_ftrace_enabled(ftrace_enabled);
> +
>   	/* What should we do here? We could issue a shutdown or hard reset. */
>   }
>   
> 
