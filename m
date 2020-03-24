Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 041FB1915B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 17:11:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mx7b0lGyzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mx38620rzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:07:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LH0reDIK; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mx384qVDz8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:07:16 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mx3803Sjz9sRf; Wed, 25 Mar 2020 03:07:16 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LH0reDIK; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mx365jGgz9sQt
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Mar 2020 03:07:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mx2y6TBNz9tyl9;
 Tue, 24 Mar 2020 17:07:06 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LH0reDIK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SLE582mjIDvi; Tue, 24 Mar 2020 17:07:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mx2y49JYz9tyl8;
 Tue, 24 Mar 2020 17:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585066026; bh=f0U0piYC5yV6Wg9+VPwomaX4V+0IwFuWZmBXKdtQPj4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=LH0reDIKmn9mbOehyq1WAFeU5IS2kMLGlESG4LNN5AVTRLr5OHxCSjrNbPqu+izzD
 ZXFK20gZko1Hq4FbBr1K1hFWtnkZkMkmUNP0n1uKwakz00ieIdC/tdIoVVjJbPb2x6
 FTjrtrAwl6Z7580Whlt1xNQeUEEl4ieeDkICVrTI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D6968B7A8;
 Tue, 24 Mar 2020 17:07:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j4Uakaac4ho0; Tue, 24 Mar 2020 17:07:07 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4ACA8B786;
 Tue, 24 Mar 2020 17:07:07 +0100 (CET)
Subject: Re: [RFC PATCH 1/3] powerpc/mm: Introduce temporary mm
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-2-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2057834a-01d3-958a-1674-cb264029505f@c-s.fr>
Date: Tue, 24 Mar 2020 17:07:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323045205.20314-2-cmr@informatik.wtf>
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



Le 23/03/2020 à 05:52, Christopher M. Riedl a écrit :
> x86 supports the notion of a temporary mm which restricts access to
> temporary PTEs to a single CPU. A temporary mm is useful for situations
> where a CPU needs to perform sensitive operations (such as patching a
> STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> said mappings to other CPUs. A side benefit is that other CPU TLBs do
> not need to be flushed when the temporary mm is torn down.
> 
> Mappings in the temporary mm can be set in the userspace portion of the
> address-space.
> 
> Interrupts must be disabled while the temporary mm is in use. HW
> breakpoints, which may have been set by userspace as watchpoints on
> addresses now within the temporary mm, are saved and disabled when
> loading the temporary mm. The HW breakpoints are restored when unloading
> the temporary mm. All HW breakpoints are indiscriminately disabled while
> the temporary mm is in use.
> 
> Based on x86 implementation:
> 
> commit cefa929c034e
> ("x86/mm: Introduce temporary mm structs")
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>   arch/powerpc/include/asm/debug.h       |  1 +
>   arch/powerpc/include/asm/mmu_context.h | 56 +++++++++++++++++++++++++-
>   arch/powerpc/kernel/process.c          |  5 +++
>   3 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
> index 7756026b95ca..b945bc16c932 100644
> --- a/arch/powerpc/include/asm/debug.h
> +++ b/arch/powerpc/include/asm/debug.h
> @@ -45,6 +45,7 @@ static inline int debugger_break_match(struct pt_regs *regs) { return 0; }
>   static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
>   #endif
>   
> +void __get_breakpoint(struct arch_hw_breakpoint *brk);
>   void __set_breakpoint(struct arch_hw_breakpoint *brk);
>   bool ppc_breakpoint_available(void);
>   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index 360367c579de..3e6381d04c28 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -7,9 +7,10 @@
>   #include <linux/mm.h>
>   #include <linux/sched.h>
>   #include <linux/spinlock.h>
> -#include <asm/mmu.h>	
> +#include <asm/mmu.h>

What's this change ?
I see you are removing a space at the end of the line, but it shouldn't 
be part of this patch.

>   #include <asm/cputable.h>
>   #include <asm/cputhreads.h>
> +#include <asm/hw_breakpoint.h>
>   
>   /*
>    * Most if the context management is out of line
> @@ -270,5 +271,58 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
>   	return 0;
>   }
>   
> +struct temp_mm {
> +	struct mm_struct *temp;
> +	struct mm_struct *prev;
> +	bool is_kernel_thread;
> +	struct arch_hw_breakpoint brk;
> +};
> +
> +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
> +{
> +	temp_mm->temp = mm;
> +	temp_mm->prev = NULL;
> +	temp_mm->is_kernel_thread = false;
> +	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> +}
> +
> +static inline void use_temporary_mm(struct temp_mm *temp_mm)
> +{
> +	lockdep_assert_irqs_disabled();
> +
> +	temp_mm->is_kernel_thread = current->mm == NULL;
> +	if (temp_mm->is_kernel_thread)
> +		temp_mm->prev = current->active_mm;
> +	else
> +		temp_mm->prev = current->mm;
> +
> +	/*
> +	 * Hash requires a non-NULL current->mm to allocate a userspace address
> +	 * when handling a page fault. Does not appear to hurt in Radix either.
> +	 */
> +	current->mm = temp_mm->temp;
> +	switch_mm_irqs_off(NULL, temp_mm->temp, current);
> +
> +	if (ppc_breakpoint_available()) {
> +		__get_breakpoint(&temp_mm->brk);
> +		if (temp_mm->brk.type != 0)
> +			hw_breakpoint_disable();
> +	}
> +}
> +
> +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
> +{
> +	lockdep_assert_irqs_disabled();
> +
> +	if (temp_mm->is_kernel_thread)
> +		current->mm = NULL;
> +	else
> +		current->mm = temp_mm->prev;
> +	switch_mm_irqs_off(NULL, temp_mm->prev, current);
> +
> +	if (ppc_breakpoint_available() && temp_mm->brk.type != 0)
> +		__set_breakpoint(&temp_mm->brk);
> +}
> +
>   #endif /* __KERNEL__ */
>   #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index fad50db9dcf2..5e5cf33fc358 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -793,6 +793,11 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
>   	return 0;
>   }
>   
> +void __get_breakpoint(struct arch_hw_breakpoint *brk)
> +{
> +	memcpy(brk, this_cpu_ptr(&current_brk), sizeof(*brk));
> +}
> +
>   void __set_breakpoint(struct arch_hw_breakpoint *brk)
>   {
>   	memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
> 


Christophe
