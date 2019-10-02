Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0334C4971
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 10:26:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jq3l3bPWzDq99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 18:26:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jpxp12tRzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 18:21:18 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB6A8B291;
 Wed,  2 Oct 2019 08:21:14 +0000 (UTC)
Date: Wed, 2 Oct 2019 10:21:09 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 27/27] powerpc/64s: system call support for scv/rfscv
 instructions
Message-ID: <20190923125046.GD18205@kitsune.suse.cz>
References: <20190915012813.29317-1-npiggin@gmail.com>
 <20190915012813.29317-28-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190915012813.29317-28-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 15, 2019 at 11:28:13AM +1000, Nicholas Piggin wrote:
> Add support for the scv instruction on POWER9 and later CPUs.
> 
> For now this implements the zeroth scv vector 'scv 0', as identical
> to 'sc' system calls, with the exception that lr is not preserved, and
> it is 64-bit only. There may yet be changes made to this ABI, so it's
> for testing only.
> 
> This also doesn't yet properly handle PR KVM, or the case where a guest
> is denied AIL=3 mode. I haven't added real mode entry points, so scv
> must not be used when AIL=0, but I haven't cleared the FSCR in this
> case.
> 
> This also implements a strange hack to handle the non-implemented
> vectors, scheduling a decrementer and expecting it to interrupt and
> replay pending soft masked interrupts. This is unlikely to be a good
> idea, and needs to actually do a proper handler and replay in case an
> interrupt is pending.
> 
> It may also require some errata handling before it can be safely used
> on all POWER9 CPUs, I have to look that up.
> 
> rfscv is implemented to return from scv type system calls. It can not
> be used to return from sc system calls because those are defined to
> preserve lr.
> 
> In a comparison of getpid syscall, the test program had scv taking
> about 3 more cycles in user mode (92 vs 89 for sc), due to lr handling.
> Total cycles taken for a getpid system call on POWER9 are improved from
> 436 to 345 (26.3% faster), mostly due to reducing mtmsr and mtspr.
...
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 034b52d3d78c..3e8aa5ae8ec8 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -15,6 +15,77 @@ extern void __noreturn tabort_syscall(void);
>  
>  typedef long (*syscall_fn)(long, long, long, long, long, long);
>  
> +#ifdef CONFIG_PPC_BOOK3S
> +long system_call_vectored_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs)
> +{
> +	unsigned long ti_flags;
> +	syscall_fn f;
> +
> +	BUG_ON(!(regs->msr & MSR_RI));
> +	BUG_ON(!(regs->msr & MSR_PR));
> +	BUG_ON(!FULL_REGS(regs));
> +	BUG_ON(regs->softe != IRQS_ENABLED);
> +
> +	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> +			unlikely(regs->msr & MSR_TS_T))
> +		tabort_syscall();
> +
> +	account_cpu_user_entry();
> +
> +#ifdef CONFIG_PPC_SPLPAR
> +	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
> +			firmware_has_feature(FW_FEATURE_SPLPAR)) {
> +		struct lppaca *lp = get_lppaca();
> +
> +		if (unlikely(local_paca->dtl_ridx != lp->dtl_idx))
This adds another instance of the lack of endian conversion issue.
> +			accumulate_stolen_time();
> +	}
> +#endif

Thanks

Michal
