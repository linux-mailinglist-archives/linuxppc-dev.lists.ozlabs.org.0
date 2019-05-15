Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A10451E846
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:28:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453l494p8dzDqDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:28:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ilcfnaXA"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453l2p6SPfzDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:27:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453l2k3nF8z9vDbW;
 Wed, 15 May 2019 08:27:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ilcfnaXA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tGRo05cAlE11; Wed, 15 May 2019 08:27:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453l2k2kMmz9vDbV;
 Wed, 15 May 2019 08:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557901630; bh=oiOPdFcuQLpNIQ5itc+Hx4Gajva91IikgcdHDGhvH0Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ilcfnaXAb8ca1Sa/fQbinOxRKCAQ7UeRq58BxxlR1zmVzfyEmxAR5xrvpSCj5xUex
 HV7Op3SM3c1yaWB0XBJiPDaO0sZ0Fm+ufMk987eORYAe3JyiaKkgOk1+sJPuKRKJDE
 KkF2F9iKW4phYDIuedkOJlYCu9GB0AR4UH+jMUdg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4927B8B7D0;
 Wed, 15 May 2019 08:27:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TM4sL3euXOya; Wed, 15 May 2019 08:27:11 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2261D8B756;
 Wed, 15 May 2019 08:27:11 +0200 (CEST)
Subject: Re: [v4 PATCH 1/2] [PowerPC] Add simd.h implementation
To: Shawn Landden <shawn@git.icu>
References: <20190513005104.20140-1-shawn@git.icu>
 <20190515013725.2198-1-shawn@git.icu>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <568f62f6-7810-7179-f9aa-03f9df198fb6@c-s.fr>
Date: Wed, 15 May 2019 08:27:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515013725.2198-1-shawn@git.icu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/05/2019 à 03:37, Shawn Landden a écrit :
> Based off the x86 one.
> 
> WireGuard really wants to be able to do SIMD in interrupts,
> so it can accelerate its in-bound path.
> 
> Signed-off-by: Shawn Landden <shawn@git.icu>
> ---

Could you please as usual list here the changes provided by each version 
to ease the review ?

Thanks
Christophe

>   arch/powerpc/include/asm/simd.h | 17 +++++++++++++++++
>   arch/powerpc/kernel/process.c   | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 47 insertions(+)
>   create mode 100644 arch/powerpc/include/asm/simd.h
> 
> diff --git a/arch/powerpc/include/asm/simd.h b/arch/powerpc/include/asm/simd.h
> new file mode 100644
> index 000000000..2fe26f258
> --- /dev/null
> +++ b/arch/powerpc/include/asm/simd.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * may_use_simd - whether it is allowable at this time to issue SIMD
> + *                instructions or access the SIMD register file
> + *
> + * It's always ok in process context (ie "not interrupt")
> + * but it is sometimes ok even from an irq.
> + */
> +#ifdef CONFIG_PPC_FPU
> +extern bool may_use_simd(void);
> +#else
> +static inline bool may_use_simd(void)
> +{
> +	return false;
> +}
> +#endif
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index dd9e0d538..ef534831f 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -345,6 +345,36 @@ static int restore_altivec(struct task_struct *tsk)
>   	}
>   	return 0;
>   }
> +
> +/*
> + * Were we in user mode when we were
> + * interrupted?
> + *
> + * Doing kernel_altivec/vsx_begin/end() is ok if we are running
> + * in an interrupt context from user mode - we'll just
> + * save the FPU state as required.
> + */
> +static bool interrupted_user_mode(void)
> +{
> +	struct pt_regs *regs = get_irq_regs();
> +
> +	return regs && user_mode(regs);
> +}
> +
> +/*
> + * Can we use FPU in kernel mode with the
> + * whole "kernel_fpu/altivec/vsx_begin/end()" sequence?
> + *
> + * It's always ok in process context (ie "not interrupt")
> + * but it is sometimes ok even from an irq.
> + */
> +bool may_use_simd(void)
> +{
> +	return !in_interrupt() ||
> +		interrupted_user_mode();
> +}
> +EXPORT_SYMBOL(may_use_simd);
> +
>   #else
>   #define loadvec(thr) 0
>   static inline int restore_altivec(struct task_struct *tsk) { return 0; }
> 
