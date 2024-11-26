Return-Path: <linuxppc-dev+bounces-3567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114819D95D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 11:53:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyKDN3dvKz2ykT;
	Tue, 26 Nov 2024 21:53:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732618388;
	cv=none; b=ID80maYKFYM/my+oGB8SHt8TjQq5cLOSbyN2/35UnQiquDcF3KQj6vuRvpvoeJ4X7gHBtosZby+BtRwR4eNh5fPS2ZiqOPZTuT8q78aRLPUhEsoHEVb2wLAkQEF8/x67wEeXvrbQ2+8hGu0HrqbvQBfV0M43XGlw6DD4Jju4uU9pQxxcYzle0HiJDhmJjKm5yz2qFSjyQUoQgiC0GbjMUYtT/iAENA0AuCVzTxmlER2NvesGcgFVs82pKQ/wrKe7IFPpVxA9+e3xgpoT9BSUqDBajrZR8WPb6MtxPQajliT078mMs25DNGxAflR4bgOl8rEJjlg2LXZlNCt4FTwyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732618388; c=relaxed/relaxed;
	bh=ibTCSn2O2pup5lVwY5V2OpQUkAfWM2czUJgxYCtHUFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRVGSjWUh244JH4jPb5C96baCf+Da4VqTiy1Xam2mO2zxn7yPpP/uNlk7Zm6vqID8NupDiQrHOHnmbEd7nfrdcBGSMO0iT7RYJlsj3Knuz55Xmzb8mNb6QyowTE58+o9G7mVXmQ6YNfSPQit5uUHoJtY59bSuRD6OiHiSfuJiJWNxSP9DDgh7LXsyjv0/hhZjZTjUPeU7tQNgWygXhZRNeYSQAxc2aL453fGbuiipOpWp9yrSgX/WDYojZBWK3AkE04t7Seusc1CKoD2f562rcJHVxw8mI3VTzjpYBKl7sqCyhRS81cRShh0I3ixDs3XLHm6Hxtll5y06DmV2akjAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyKDM34hGz2yXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 21:53:07 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XyKDJ2wVlz9sRy;
	Tue, 26 Nov 2024 11:53:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccCw1T0xF9VZ; Tue, 26 Nov 2024 11:53:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XyKDJ1mk5z9sRr;
	Tue, 26 Nov 2024 11:53:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 298B68B776;
	Tue, 26 Nov 2024 11:53:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id c1FcoxhNcuJA; Tue, 26 Nov 2024 11:53:04 +0100 (CET)
Received: from [192.168.232.206] (unknown [192.168.232.206])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A04338B763;
	Tue, 26 Nov 2024 11:53:03 +0100 (CET)
Message-ID: <97991c77-4d9c-4e33-a076-2dd79cd454fb@csgroup.eu>
Date: Tue, 26 Nov 2024 11:53:03 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] powerpc: Add preempt lazy support
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, Luming Yu <luming.yu@shingroup.cn>
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-2-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241116192306.88217-2-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 16/11/2024 à 20:23, Shrikanth Hegde a écrit :
> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
> 
> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
> return to kernel.

FWIW, there is work in progress on using generic entry/exit for powerpc, 
if you can help testing it that can help, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/F0AE0A4571CE3126+20241111031934.1579-2-luming.yu@shingroup.cn/

Christophe


> 
> Ran a few benchmarks and db workload on Power10. Performance is close to
> preempt=none/voluntary.
>   
> Since Powerpc systems can have large core count and large memory,
> preempt lazy is going to be helpful in avoiding soft lockup issues.
> 
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Reviewed-by: Ankur Arora <ankur.a.arora@oracle.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                   | 1 +
>   arch/powerpc/include/asm/thread_info.h | 9 ++++++---
>   arch/powerpc/kernel/interrupt.c        | 4 ++--
>   3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8094a01974cc..2f625aecf94b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -145,6 +145,7 @@ config PPC
>   	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>   	select ARCH_HAS_PHYS_TO_DMA
>   	select ARCH_HAS_PMEM_API
> +	select ARCH_HAS_PREEMPT_LAZY
>   	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index 6ebca2996f18..2785c7462ebf 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -103,6 +103,7 @@ void arch_setup_new_exec(void);
>   #define TIF_PATCH_PENDING	6	/* pending live patching update */
>   #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
>   #define TIF_SINGLESTEP		8	/* singlestepping active */
> +#define TIF_NEED_RESCHED_LAZY	9       /* Scheduler driven lazy preemption */
>   #define TIF_SECCOMP		10	/* secure computing */
>   #define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
>   #define TIF_NOERROR		12	/* Force successful syscall return */
> @@ -122,6 +123,7 @@ void arch_setup_new_exec(void);
>   #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
>   #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
>   #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
> +#define _TIF_NEED_RESCHED_LAZY	(1<<TIF_NEED_RESCHED_LAZY)
>   #define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
>   #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
>   #define _TIF_32BIT		(1<<TIF_32BIT)
> @@ -142,9 +144,10 @@ void arch_setup_new_exec(void);
>   				 _TIF_SYSCALL_EMU)
>   
>   #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
> -				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
> -				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
> -				 _TIF_NOTIFY_SIGNAL)
> +				 _TIF_NEED_RESCHED_LAZY | _TIF_NOTIFY_RESUME | \
> +				 _TIF_UPROBE | _TIF_RESTORE_TM | \
> +				 _TIF_PATCH_PENDING | _TIF_NOTIFY_SIGNAL)
> +
>   #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
>   
>   /* Bits in local_flags */
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index af62ec974b97..8f4acc55407b 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -185,7 +185,7 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
>   	ti_flags = read_thread_flags();
>   	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
>   		local_irq_enable();
> -		if (ti_flags & _TIF_NEED_RESCHED) {
> +		if (ti_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
>   			schedule();
>   		} else {
>   			/*
> @@ -396,7 +396,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   		/* Returning to a kernel context with local irqs enabled. */
>   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>   again:
> -		if (IS_ENABLED(CONFIG_PREEMPT)) {
> +		if (IS_ENABLED(CONFIG_PREEMPTION)) {
>   			/* Return to preemptible kernel context */
>   			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>   				if (preempt_count() == 0)

