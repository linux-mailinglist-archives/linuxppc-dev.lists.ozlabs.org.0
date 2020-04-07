Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A01A06FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 08:08:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xH5S638lzDr3G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:08:12 +1000 (AEST)
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
 header.s=mail header.b=OmU34Qg+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGcC1wx9zDr0V
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:46:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xGc65304z9tyl1;
 Tue,  7 Apr 2020 07:46:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OmU34Qg+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 17mXHAxamq5Y; Tue,  7 Apr 2020 07:46:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xGc641b1z9tyl0;
 Tue,  7 Apr 2020 07:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586238374; bh=TyEJOiShpONMdB1wLrKHaoLsZ49J+qEhWLbY95WGlsY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OmU34Qg+tWdML8Kkc1fC3/Tj1RhDaottMduHm1ZammtGKi8k8QZC6CNNlK/8/qTPx
 uhE+//XjjVM4I6ihZjOp693lUkIqOzcKuhIx31YZ1n3jgNrt7Z2UZm+mwExQk3PKTI
 JzMvoDr/NfInyPX6QP7DHlhc2QenY8meRYus72I8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 415878B76E;
 Tue,  7 Apr 2020 07:46:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NHlAwM9hPUe6; Tue,  7 Apr 2020 07:46:15 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CAEEE8B75E;
 Tue,  7 Apr 2020 07:46:14 +0200 (CEST)
Subject: Re: [PATCH v3 15/15] powerpc: make unrecoverable NMIs die instead of
 panic
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200407051636.648369-1-npiggin@gmail.com>
 <20200407051636.648369-16-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fd939820-2496-8525-0fb8-67b62673f879@c-s.fr>
Date: Tue, 7 Apr 2020 07:46:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407051636.648369-16-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/04/2020 à 07:16, Nicholas Piggin a écrit :
> System Reset and Machine Check interrupts that are not recoverable due
> to being nested or interrupting when RI=0 currently panic. This is
> not necessary, and can often just kill the current context and recover.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/kernel/traps.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 1beae89bb871..afed3de33a9a 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -513,11 +513,11 @@ void system_reset_exception(struct pt_regs *regs)
>   #ifdef CONFIG_PPC_BOOK3S_64
>   	BUG_ON(get_paca()->in_nmi == 0);
>   	if (get_paca()->in_nmi > 1)
> -		nmi_panic(regs, "Unrecoverable nested System Reset");
> +		die("Unrecoverable nested System Reset", regs, SIGABRT);
>   #endif
>   	/* Must die if the interrupt is not recoverable */
>   	if (!(regs->msr & MSR_RI))
> -		nmi_panic(regs, "Unrecoverable System Reset");
> +		die("Unrecoverable System Reset", regs, SIGABRT);
>   
>   	if (saved_hsrrs) {
>   		mtspr(SPRN_HSRR0, hsrr0);
> @@ -858,7 +858,7 @@ void machine_check_exception(struct pt_regs *regs)
>   bail:
>   	/* Must die if the interrupt is not recoverable */
>   	if (!(regs->msr & MSR_RI))
> -		nmi_panic(regs, "Unrecoverable Machine check");
> +		die("Unrecoverable Machine check", regs, SIGBUS);
>   }
>   
>   void SMIException(struct pt_regs *regs)
> 
