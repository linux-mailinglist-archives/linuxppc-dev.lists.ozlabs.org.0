Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A695D1C2A7F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 09:12:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FHHd5ClqzDqpf
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 17:12:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FHFQ1qTCzDqRm
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 17:10:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EslSMXxJ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49FHFP5qsxz9CMZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 17:10:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49FHFP5MDRz9sSs; Sun,  3 May 2020 17:10:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=hughd@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EslSMXxJ; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49FHFP0MLpz9sSd
 for <linuxppc-dev@ozlabs.org>; Sun,  3 May 2020 17:10:32 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id t199so3772600oif.7
 for <linuxppc-dev@ozlabs.org>; Sun, 03 May 2020 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zDTd4iVwHYdnyuwn+hjV5Gqm3bWQLuWNB2bqju7cVRI=;
 b=EslSMXxJfk8Ql0oSieHCmbU95ZsB/WeSz6NOt+CM4cy61D00JdbQlF7dXap2b6nsa/
 Er5GK4r0ymvDbQjXpVTAdnXFBmjuB0Ij3SrNw2ZU00UA4b3i94qu5cHjMaIUru74GXpd
 0ryIClBzTPkUC0R3asEFOZrs8mWSQo2T3B6jW2iZVIUglXETHE9FRC8L/BPgjdmOb5H+
 PEqGKUMWRDv9C/FJIv2Pr0i2yFfRd1iIWY3R8F1emD11M97IhYBtFXI2uGV925yHxb+Y
 aOmaT3EWHbb2r/mgoDY4HAPxdZMOsH3TwIG27CkPrJvCElKt3FjwFyncEhoxtNmk3ttR
 PEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zDTd4iVwHYdnyuwn+hjV5Gqm3bWQLuWNB2bqju7cVRI=;
 b=a7NQcXyPSQfPcY4mVJNkRLuBIZgtS9onM8vwu86icGsvtjVUk9mJuEfzSVm9Tu5IFu
 lhnwIKFRbF4tIh1P/uV3zNPF6Y8H/xyxEqWs5bP485zkG8De0EltmTPkb20LVZTsuBAP
 JAEBp6Yi60xaUJkKe/Z6W+U3w4Ho/CrnAQNnZp49beEoB7RtT9+YmH6HA3tC9wEJDTjx
 aSix6s2PTb2xDhspdESuWfNPGFgW8/cWY8lHjwHk7Rpxr3z795FqbS7e3dNMXhiyPTna
 6tm7w2nR3vmykdVn5PP0T6lbQIG9kex4qSc1hDprGyZ/lBz46NTeo53P4moBYRbhdMCA
 K07g==
X-Gm-Message-State: AGi0Pua6eI1cCLWlH262tiWss/bcMAbkMc53OObbbYl5RAEcNKVyQHJl
 7Blo0J6wjjUtd6TcwwTV+G0bqA==
X-Google-Smtp-Source: APiQypLsa7TisTIx840PoEkgwSV0Ii6tXThapFjScFm4N+RNbARzKvZY0YMddKrWccxBG0KRbzUpSg==
X-Received: by 2002:aca:bc83:: with SMTP id m125mr4868635oif.144.1588489828731; 
 Sun, 03 May 2020 00:10:28 -0700 (PDT)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id 69sm2240149otm.60.2020.05.03.00.10.27
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sun, 03 May 2020 00:10:27 -0700 (PDT)
Date: Sun, 3 May 2020 00:10:10 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Fix unrecoverable SLB crashes due to
 preemption check
In-Reply-To: <20200502143316.929341-1-mpe@ellerman.id.au>
Message-ID: <alpine.LSU.2.11.2005030008400.1557@eggly.anvils>
References: <20200502143316.929341-1-mpe@ellerman.id.au>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
Cc: linuxppc-dev@ozlabs.org, hughd@google.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 3 May 2020, Michael Ellerman wrote:

> Hugh reported that his trusty G5 crashed after a few hours under load
> with an "Unrecoverable exception 380".
> 
> The crash is in interrupt_return() where we check lazy_irq_pending(),
> which calls get_paca() and with CONFIG_DEBUG_PREEMPT=y that goes to
> check_preemption_disabled() via debug_smp_processor_id().
> 
> As Nick explained on the list:
> 
>   Problem is MSR[RI] is cleared here, ready to do the last few things
>   for interrupt return where we're not allowed to take any other
>   interrupts.
> 
>   SLB interrupts can happen just about anywhere aside from kernel
>   text, global variables, and stack. When that hits, it appears to be
>   unrecoverable due to RI=0.
> 
> The problematic access is in preempt_count() which is:
> 
> 	return READ_ONCE(current_thread_info()->preempt_count);
> 
> Because of THREAD_INFO_IN_TASK, current_thread_info() just points to
> current, so the access is to somewhere in kernel memory, but not on
> the stack or in .data, which means it can cause an SLB miss. If we
> take an SLB miss with RI=0 it is fatal.
> 
> The easiest solution is to add a version of lazy_irq_pending() that
> doesn't do the preemption check and call it from the interrupt return
> path.
> 
> Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
> Reported-by: Hugh Dickins <hughd@google.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thank you, Michael and Nick: this has been running fine all day for me.

Hugh

> ---
>  arch/powerpc/include/asm/hw_irq.h | 20 +++++++++++++++++++-
>  arch/powerpc/kernel/syscall_64.c  |  6 +++---
>  2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index e0e71777961f..3a0db7b0b46e 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -250,9 +250,27 @@ static inline bool arch_irqs_disabled(void)
>  	}								\
>  } while(0)
>  
> +static inline bool __lazy_irq_pending(u8 irq_happened)
> +{
> +	return !!(irq_happened & ~PACA_IRQ_HARD_DIS);
> +}
> +
> +/*
> + * Check if a lazy IRQ is pending. Should be called with IRQs hard disabled.
> + */
>  static inline bool lazy_irq_pending(void)
>  {
> -	return !!(get_paca()->irq_happened & ~PACA_IRQ_HARD_DIS);
> +	return __lazy_irq_pending(get_paca()->irq_happened);
> +}
> +
> +/*
> + * Check if a lazy IRQ is pending, with no debugging checks.
> + * Should be called with IRQs hard disabled.
> + * For use in RI disabled code or other constrained situations.
> + */
> +static inline bool lazy_irq_pending_nocheck(void)
> +{
> +	return __lazy_irq_pending(local_paca->irq_happened);
>  }
>  
>  /*
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index c74295a7765b..1fe94dd9de32 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -189,7 +189,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>  
>  	/* This pattern matches prep_irq_for_idle */
>  	__hard_EE_RI_disable();
> -	if (unlikely(lazy_irq_pending())) {
> +	if (unlikely(lazy_irq_pending_nocheck())) {
>  		__hard_RI_enable();
>  		trace_hardirqs_off();
>  		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> @@ -264,7 +264,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>  
>  	trace_hardirqs_on();
>  	__hard_EE_RI_disable();
> -	if (unlikely(lazy_irq_pending())) {
> +	if (unlikely(lazy_irq_pending_nocheck())) {
>  		__hard_RI_enable();
>  		trace_hardirqs_off();
>  		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> @@ -334,7 +334,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
>  
>  		trace_hardirqs_on();
>  		__hard_EE_RI_disable();
> -		if (unlikely(lazy_irq_pending())) {
> +		if (unlikely(lazy_irq_pending_nocheck())) {
>  			__hard_RI_enable();
>  			irq_soft_mask_set(IRQS_ALL_DISABLED);
>  			trace_hardirqs_off();
> -- 
> 2.25.1
> 
> 
