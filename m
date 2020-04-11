Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 907AD1A4F61
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 12:30:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zrjv3Pq7zDqw8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 20:30:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zrhD1t6MzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 20:28:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Qduhf0lR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48zrh95S62z9sT0;
 Sat, 11 Apr 2020 20:28:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586600922;
 bh=cPj8VvFWURbZVhgVSLLn43ICM2dJQq/eRqr/jpps3ZQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Qduhf0lR3jqKFFNlnfBx+RF60jeT6ap6BDoh7bCu8k6eFLAuo1FuOt6Wa00D4SH02
 CWbHfBmqNWnIUuyiZYQlVAxekLsqsdDqx4orBOjPBowRAYyb8EHj1/DJ/Y5Ax9GdQI
 M1G45dnd6QydGcAZykOWQO0SQlDbBxzGMKtlVlt6S9u2B+QospT1fzgf//2xfyvoyQ
 /l+ZLLLUrnOZPfThRDr4rzATX6jaLZAZ3CmfzOs1pY5XMa1+WUElLGXwiLBZD3sSCA
 p5hYnrpD/SmFpIlUeQ5p2eWIk3PdgAr/zqafSPY1TSqDo+ATrVzjYUV8opW7kId6mP
 l2vJmqNSGGWgQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH v10 14/14] powerpc: Use mm_context vas_windows counter to
 issue CP_ABORT
In-Reply-To: <1585812024.2275.68.camel@hbabu-laptop>
References: <1585810846.2275.23.camel@hbabu-laptop>
 <1585812024.2275.68.camel@hbabu-laptop>
Date: Sat, 11 Apr 2020 20:28:50 +1000
Message-ID: <87mu7ijoyl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, frederic.barrat@fr.ibm.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, clg@kaod.org, herbert@gondor.apana.org.au,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> set_thread_uses_vas() sets used_vas flag for a process that opened VAS
> window and issue CP_ABORT during context switch for only that process.
> In multi-thread application, windows can be shared. For example Thread A
> can open a window and Thread B can run COPY/PASTE instructions to send
> NX request which may cause corruption or snooping or a covert channel.
> Also once this flag is set, continue to run CP_ABORT even the VAS window
> is closed.
>
> So define vas-windows counter in process mm_context, increment this
> counter for each window open and decrement it for window close. If
> vas-windows is set, issue CP_ABORT during context switch. It means
> clear the foreign real address mapping only if the process / thread uses
> COPY/PASTE. Then disable it for that process if windows are not open.
>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Suggested-by: Milton Miller <miltonm@us.ibm.com>
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h    |  3 +++
>  arch/powerpc/include/asm/mmu_context.h      | 22 ++++++++++++++++++++++
>  arch/powerpc/include/asm/processor.h        |  1 -
>  arch/powerpc/kernel/process.c               |  8 ++++++--
>  arch/powerpc/platforms/powernv/vas-window.c |  1 +
>  5 files changed, 32 insertions(+), 3 deletions(-)

This should presumably be tagged:

Fixes: 9d2a4d71332c ("powerpc: Define set_thread_uses_vas()")

I _think_ we don't need to backport it because currently there's no code
in the kernel that will actually trigger the used_vas case, but please
spell that out for me in the change log.

> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index bb3deb7..f0a9ff6 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -116,6 +116,9 @@ struct patb_entry {
>  	/* Number of users of the external (Nest) MMU */
>  	atomic_t copros;
>  
> +	/* Number of user space windows opened in process mm_context */
> +	atomic_t vas_windows;

This should probably be a refcount_t.

Which is an atomic that has wrappers that catch overflow/underflow cases
for you, like you've open-coded below.

> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index 360367c..7fd249498 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -185,11 +185,33 @@ static inline void mm_context_remove_copro(struct mm_struct *mm)
>  			dec_mm_active_cpus(mm);
>  	}
>  }
> +
> +/*
> + * vas_windows counter shows number of open windows in the mm
> + * context. During context switch, use this counter to clear the
> + * foreign real address mapping (CP_ABORT) for the thread / process
> + * that intend to use COPY/PASTE. When a process closes all windows,
> + * disable CP_ABORT which is expensive to run.
> + */
> +static inline void mm_context_add_vas_windows(struct mm_struct *mm)

I think this would read better if it wasn't plural. "windows" implies
you can add more than one at a time.

So:

static inline void mm_context_add_vas_window(struct mm_struct *mm)

> +{
> +	atomic_inc(&mm->context.vas_windows);
> +}
> +
> +static inline void mm_context_remove_vas_windows(struct mm_struct *mm)
> +{
> +	int c = atomic_dec_if_positive(&mm->context.vas_windows);
> +
> +	/* Detect imbalance between add and remove */
> +	WARN_ON(c < 0);

ie. here.

> +}
>  #else
>  static inline void inc_mm_active_cpus(struct mm_struct *mm) { }
>  static inline void dec_mm_active_cpus(struct mm_struct *mm) { }
>  static inline void mm_context_add_copro(struct mm_struct *mm) { }
>  static inline void mm_context_remove_copro(struct mm_struct *mm) { }
> +static inline void mm_context_add_vas_windows(struct mm_struct *mm) { }
> +static inline void mm_context_remove_vas_windows(struct mm_struct *mm) { }
>  #endif

  
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index eedcbfb..bfa336f 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -272,7 +272,6 @@ struct thread_struct {
>  	unsigned 	mmcr0;
>  
>  	unsigned 	used_ebb;
> -	unsigned int	used_vas;
>  #endif
>  };
>  
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index fad50db..a3ecaf9 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1221,7 +1221,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  		 * mappings, we must issue a cp_abort to clear any state and
>  		 * prevent snooping, corruption or a covert channel.
>  		 */
> -		if (current->thread.used_vas)
> +		if (current->mm &&
> +			atomic_read(&current->mm->context.vas_windows))
>  			asm volatile(PPC_CP_ABORT);
>  	}
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> @@ -1466,7 +1467,10 @@ int set_thread_uses_vas(void)

set_thread_uses_vas() should probably just be moved into vas-window.c
which is its only caller.

>  	if (!cpu_has_feature(CPU_FTR_ARCH_300))
>  		return -EINVAL;
>  
> -	current->thread.used_vas = 1;
> +	if (!current->mm)
> +		return -EINVAL;
> +
> +	mm_context_add_vas_windows(current->mm);
  
I needed to dig a bit to confirm this was the right place to call this.

The call trace is:
  mm_context_add_vas_window()
  set_thread_uses_vas()
  vas_tx_win_open()
  coproc_ioc_tx_win_open()
  coproc_ioctl()

> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> index 3ffad5a..33dfbbf 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -1333,6 +1333,7 @@ int vas_win_close(struct vas_window *window)
>  			put_pid(window->pid);
>  			if (window->mm) {
>  				mm_context_remove_copro(window->mm);
> +				mm_context_remove_vas_windows(window->mm);
>  				mmdrop(window->mm);
>  			}
>  		}

And similarly here, this is:
  vas_win_close()
  coproc_release()


cheers
