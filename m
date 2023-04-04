Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE9A6D66F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrWWS1G1lz3cdd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 01:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bcnFN54+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bcnFN54+;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrWVb5Vbpz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 01:13:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZvG/eQpMaXzqTjgxevrqYb3nMrHM03KndTh2qrpj9U0=; b=bcnFN54+FqSTJ1jVRh6m09inYu
	noe6Iv3bQ7qijhJ/b9UGGN6Xt79Ty18dyrnQsn/wOzNoAcusUKSZugfCQZJIfcivHmKl5Htj45Qwd
	ccGGSAQj9syXjLSIRXbEvQsrpf9p0Xy0FekbeJFs47DIWWemWhZzBtG9rQKFRcwjv+cHhFYk66JGV
	2HCsJDNMPUXX7me+AUz2d2QBnIrseciExrbE14eKjKA7MZLsO/Q8Jbd4n6OnSKkaSOHQYkG6uYpr6
	koyhLd7cLRwuUjPUq+GJx03ybD0cikWGzZymBFhZWnuULPo+uvY3cWeZ1M+SD+eS8UBWnzMmymLz6
	5MfnUH9A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pjiKY-00FSz8-RV; Tue, 04 Apr 2023 15:12:19 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 084FA300338;
	Tue,  4 Apr 2023 17:12:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E4AEB26442AC2; Tue,  4 Apr 2023 17:12:17 +0200 (CEST)
Date: Tue, 4 Apr 2023 17:12:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230404151217.GB297936@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404134224.137038-4-ypodemsk@redhat.com>
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
Cc: geert+renesas@glider.be, tony@atomide.com, Frederic Weisbecker <fweisbec@gmail.com>, linus.walleij@linaro.org, dave.hansen@linux.intel.com, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, gor@linux.ibm.com, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, keescook@chromium.org, paulmck@kernel.org, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, arnd@arndb.de, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, dave
 m@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
> The tlb_remove_table_smp_sync IPI is used to ensure the outdated tlb page
> is not currently being accessed and can be cleared.
> This occurs once all CPUs have left the lockless gup code section.
> If they reenter the page table walk, the pointers will be to the new
> pages.
> Therefore the IPI is only needed for CPUs in kernel mode.
> By preventing the IPI from being sent to CPUs not in kernel mode,
> Latencies are reduced.
> 
> Race conditions considerations:
> The context state check is vulnerable to race conditions between the
> moment the context state is read to when the IPI is sent (or not).
> 
> Here are these scenarios.
> case 1:
> CPU-A                                             CPU-B
> 
>                                                   state == CONTEXT_KERNEL
> int state = atomic_read(&ct->state);
>                                                   Kernel-exit:
>                                                   state == CONTEXT_USER
> if (state & CT_STATE_MASK == CONTEXT_KERNEL)
> 
> In this case, the IPI will be sent to CPU-B despite it is no longer in
> the kernel. The consequence of which would be an unnecessary IPI being
> handled by CPU-B, causing a reduction in latency.
> This would have been the case every time without this patch.
> 
> case 2:
> CPU-A                                             CPU-B
> 
> modify pagetables
> tlb_flush (memory barrier)
>                                                   state == CONTEXT_USER
> int state = atomic_read(&ct->state);
>                                                   Kernel-enter:
>                                                   state == CONTEXT_KERNEL
>                                                   READ(pagetable values)
> if (state & CT_STATE_MASK == CONTEXT_USER)
> 
> In this case, the IPI will not be sent to CPU-B despite it returning to
> the kernel and even reading the pagetable.
> However since this CPU-B has entered the pagetable after the
> modification it is reading the new, safe values.
> 
> The only case when this IPI is truly necessary is when CPU-B has entered
> the lockless gup code section before the pagetable modifications and
> has yet to exit them, in which case it is still in the kernel.
> 
> Signed-off-by: Yair Podemsky <ypodemsk@redhat.com>
> ---
>  mm/mmu_gather.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
> index 5ea9be6fb87c..731d955e152d 100644
> --- a/mm/mmu_gather.c
> +++ b/mm/mmu_gather.c
> @@ -9,6 +9,7 @@
>  #include <linux/smp.h>
>  #include <linux/swap.h>
>  #include <linux/rmap.h>
> +#include <linux/context_tracking_state.h>
>  
>  #include <asm/pgalloc.h>
>  #include <asm/tlb.h>
> @@ -191,6 +192,20 @@ static void tlb_remove_table_smp_sync(void *arg)
>  	/* Simply deliver the interrupt */
>  }
>  
> +
> +#ifdef CONFIG_CONTEXT_TRACKING
> +static bool cpu_in_kernel(int cpu, void *info)
> +{
> +	struct context_tracking *ct = per_cpu_ptr(&context_tracking, cpu);
> +	int state = atomic_read(&ct->state);
> +	/* will return true only for cpus in kernel space */
> +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> +}
> +#define CONTEXT_PREDICATE cpu_in_kernel
> +#else
> +#define CONTEXT_PREDICATE NULL
> +#endif /* CONFIG_CONTEXT_TRACKING */
> +
>  #ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
>  #define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
>  #else
> @@ -206,8 +221,8 @@ void tlb_remove_table_sync_one(struct mm_struct *mm)
>  	 * It is however sufficient for software page-table walkers that rely on
>  	 * IRQ disabling.
>  	 */
> -	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK, tlb_remove_table_smp_sync,
> -			NULL, true);
> +	on_each_cpu_cond_mask(CONTEXT_PREDICATE, tlb_remove_table_smp_sync,
> +			NULL, true, REMOVE_TABLE_IPI_MASK);
>  }

I think this is correct; but... I would like much of the changelog
included in a comment above cpu_in_kernel(). I'm sure someone will try
and read this code and wonder about those race conditions.

Of crucial importance is the fact that the page-table modification comes
before the tlbi.

Also, do we really not already have this helper function somewhere, it
seems like something obvious to already have, Frederic?


