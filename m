Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBCA1BD41B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 07:41:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BnSN2Q8pzDqxs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 15:41:24 +1000 (AEST)
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
 header.s=mail header.b=OxzIg0xd; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BnPy6RPPzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 15:39:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49BnPq24Frz9tyh6;
 Wed, 29 Apr 2020 07:39:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OxzIg0xd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bQagFJ5hYzV4; Wed, 29 Apr 2020 07:39:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49BnPp6m76z9tyh5;
 Wed, 29 Apr 2020 07:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588138750; bh=5hagxaECXJQ4NmR5uou0YGXeO/RuGiNbj80BTnlT8MU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=OxzIg0xd0nv+nCQAGdqw4pR4fyVJcV3T0EeG3o+K0nzfeeyc+m1q7tjK7apXn4VsX
 mYSj/HBy2YF9LbnerHl+PaZBaYOOqNDPWOOLxDC3lxWe32dDlDOmFbVtl9K77k1UMP
 3itl3za2AYgxSME3CjqxMxVAeK4sIc2w0UBIIGXA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAF828B86C;
 Wed, 29 Apr 2020 07:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id At8r6Km4Mzs3; Wed, 29 Apr 2020 07:39:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 776518B771;
 Wed, 29 Apr 2020 07:39:11 +0200 (CEST)
Subject: Re: [RFC PATCH v2 1/5] powerpc/mm: Introduce temporary mm
To: "Christopher M. Riedl" <cmr@informatik.wtf>,
 linuxppc-dev@lists.ozlabs.org, kernel-hardening@lists.openwall.com
References: <20200429020531.20684-1-cmr@informatik.wtf>
 <20200429020531.20684-2-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <df3d65fe-0c13-10dc-8508-b59b6daa3fdc@c-s.fr>
Date: Wed, 29 Apr 2020 07:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429020531.20684-2-cmr@informatik.wtf>
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



Le 29/04/2020 à 04:05, Christopher M. Riedl a écrit :
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
>   arch/powerpc/include/asm/mmu_context.h | 54 ++++++++++++++++++++++++++
>   arch/powerpc/kernel/process.c          |  5 +++
>   3 files changed, 60 insertions(+)
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
> index 360367c579de..57a8695fe63f 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -10,6 +10,7 @@
>   #include <asm/mmu.h>	
>   #include <asm/cputable.h>
>   #include <asm/cputhreads.h>
> +#include <asm/debug.h>
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

Not sure "unuse" is a best naming, allthought I don't have a better 
suggestion a the moment. If not using temporary_mm anymore, what are we 
using now ?

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
> index 9c21288f8645..ec4cf890d92c 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -800,6 +800,11 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
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
