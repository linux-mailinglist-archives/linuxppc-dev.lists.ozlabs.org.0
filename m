Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB172D87B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 06:59:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tKpZ4XZBzDqkX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 15:59:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fNSVq1FB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tKmj67khzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 15:57:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46tKmX5gXcz9v04Q;
 Wed, 16 Oct 2019 06:57:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fNSVq1FB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EyIffbDFq4DK; Wed, 16 Oct 2019 06:57:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46tKmX4c9Gz9v04P;
 Wed, 16 Oct 2019 06:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571201868; bh=WcrWX5qIsyzBaUSqOCznfmSp4X0kJ50l49JIS7ShEs0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fNSVq1FBCpaoU2z6LyJxHgHAHyhr3tYNNlck/NyX9Ska5Upma4QucQAJWCLMVliQD
 qnh5loE8VUquD92wiSEvXHzF6A65fuNiLR/2DahJjI3hImI4SS+ViieQ3Z5AeLLfB+
 PeX7oDmo1KiowuO2ac2L9xfNG2yGCt1c05Uh5LSg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DBC68B8B0;
 Wed, 16 Oct 2019 06:57:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 52SVVMmInz53; Wed, 16 Oct 2019 06:57:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEEA18B7C9;
 Wed, 16 Oct 2019 06:57:48 +0200 (CEST)
Subject: Re: [PATCH 03/34] powerpc: Use CONFIG_PREEMPTION
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-4-bigeasy@linutronix.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <156db456-af80-1f5e-6234-2e78283569b6@c-s.fr>
Date: Wed, 16 Oct 2019 06:57:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015191821.11479-4-bigeasy@linutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/10/2019 à 21:17, Sebastian Andrzej Siewior a écrit :
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
> Both PREEMPT and PREEMPT_RT require the same functionality which today
> depends on CONFIG_PREEMPT.
> 
> Switch the entry code over to use CONFIG_PREEMPTION. Add PREEMPT_RT
> output in __die().

powerpc doesn't select ARCH_SUPPORTS_RT, so this change is useless as 
CONFIG_PREEMPT_RT cannot be selected.

> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> [bigeasy: +traps.c, Kconfig]
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   arch/powerpc/Kconfig           | 2 +-
>   arch/powerpc/kernel/entry_32.S | 4 ++--
>   arch/powerpc/kernel/entry_64.S | 4 ++--
>   arch/powerpc/kernel/traps.c    | 7 ++++++-
>   4 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 3e56c9c2f16ee..8ead8d6e1cbc8 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -106,7 +106,7 @@ config LOCKDEP_SUPPORT
>   config GENERIC_LOCKBREAK
>   	bool
>   	default y
> -	depends on SMP && PREEMPT
> +	depends on SMP && PREEMPTION
>   
>   config GENERIC_HWEIGHT
>   	bool
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index d60908ea37fb9..e1a4c39b83b86 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -897,7 +897,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
>   	bne-	0b
>   1:
>   
> -#ifdef CONFIG_PREEMPT
> +#ifdef CONFIG_PREEMPTION
>   	/* check current_thread_info->preempt_count */
>   	lwz	r0,TI_PREEMPT(r2)
>   	cmpwi	0,r0,0		/* if non-zero, just restore regs and return */
> @@ -921,7 +921,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
>   	 */
>   	bl	trace_hardirqs_on
>   #endif
> -#endif /* CONFIG_PREEMPT */
> +#endif /* CONFIG_PREEMPTION */
>   restore_kuap:
>   	kuap_restore r1, r2, r9, r10, r0
>   
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 6467bdab8d405..83733376533e8 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -840,7 +840,7 @@ _GLOBAL(ret_from_except_lite)
>   	bne-	0b
>   1:
>   
> -#ifdef CONFIG_PREEMPT
> +#ifdef CONFIG_PREEMPTION
>   	/* Check if we need to preempt */
>   	andi.	r0,r4,_TIF_NEED_RESCHED
>   	beq+	restore
> @@ -871,7 +871,7 @@ _GLOBAL(ret_from_except_lite)
>   	li	r10,MSR_RI
>   	mtmsrd	r10,1		  /* Update machine state */
>   #endif /* CONFIG_PPC_BOOK3E */
> -#endif /* CONFIG_PREEMPT */
> +#endif /* CONFIG_PREEMPTION */
>   
>   	.globl	fast_exc_return_irq
>   fast_exc_return_irq:
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 82f43535e6867..23d2f20be4f2e 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -252,14 +252,19 @@ NOKPROBE_SYMBOL(oops_end);
>   
>   static int __die(const char *str, struct pt_regs *regs, long err)
>   {
> +	const char *pr = "";
> +

Please follow the same approach as already existing. Don't add a local 
var for that.

>   	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>   
> +	if (IS_ENABLED(CONFIG_PREEMPTION))
> +		pr = IS_ENABLED(CONFIG_PREEMPT_RT) ? " PREEMPT_RT" : " PREEMPT";
> +

drop

>   	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s%s %s\n",

Add one %s

>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>   	       PAGE_SIZE / 1024,
>   	       early_radix_enabled() ? " MMU=Radix" : "",
>   	       early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ? " MMU=Hash" : "",
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",

Replace by: 	IS_ENABLED(CONFIG_PREEMPTION) ? " PREEMPT" : ""

> +	       pr,

add something like: IS_ENABLED(CONFIG_PREEMPT_RT) ? "_RT" : ""

>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>   	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
> 

Christophe
