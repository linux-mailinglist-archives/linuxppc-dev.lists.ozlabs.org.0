Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A02E874DD8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 12:44:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=P97xgt/0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr6sV6h1zz3vlj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 22:44:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=P97xgt/0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr6qw30twz3vhH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 22:43:08 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Tr6qw17tcz4wxX; Thu,  7 Mar 2024 22:43:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709811788;
	bh=wfsl//Yx5twrVaHlgu5HK464L6tiBljfgjcUx3A4o+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P97xgt/0ZfwvFNw76M+gvsnFmpUck9sf57KK971d5Mvg9Mw3bQU9gdTR7yXpermX4
	 gvXcpzQi2YhMD2chK/9KhvGZYsveGqpRxES40VooU5qmEdUgSYyEECkTYyB/Xsu58m
	 gnkwvbEWpen+hRGh/+WjIkthO2w/wTrDTPvJu0eGuByVYTh8dctCdkeeIu3GaXOVvR
	 xDxqeUGTI+mUeMe0hfA/I45XHGokVufoACJEg99obc2PuODLOMKkfy3Aq7lOQ74akN
	 ivUqmDI1mcKkqMmM5KzlPI5tE6nkEwgARmwJonByjQNm30aJinyRxwaytEcOjXGseu
	 SZjBiPePYQBOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr6qw01hvz4wx5;
	Thu,  7 Mar 2024 22:43:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
In-Reply-To: <20240214095146.1527369-1-mahesh@linux.ibm.com>
References: <20240214095146.1527369-1-mahesh@linux.ibm.com>
Date: Thu, 07 Mar 2024 22:43:07 +1100
Message-ID: <87edcmnu7o.fsf@mail.lhotse>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mahesh,

Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> nmi_enter()/nmi_exit() touches per cpu variables which can lead to kernel
> crash when invoked during real mode interrupt handling (e.g. early HMI/MCE
> interrupt handler) if percpu allocation comes from vmalloc area.
>
> Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
> wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue when
> percpu allocation is from the embedded first chunk. However with
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where percpu
> allocation can come from the vmalloc area.
>
> With kernel command line "percpu_alloc=page" we can force percpu allocation
> to come from vmalloc area and can see kernel crash in machine_check_early:
>
> [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
> [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
> [    1.215719] --- interrupt: 200
> [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
> [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
> [    1.215724] [c000000fffd73210] [c000000000008364] machine_check_early_common+0x134/0x1f8
>
> Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if percpu
> first chunk is not embedded.

My system (powernv) doesn't even boot with percpu_alloc=page.

AFAIK the only reason we added support for it was to handle 4K kernels
with HPT. See commit eb553f16973a ("powerpc/64/mm: implement page
mapping percpu first chunk allocator").

So I wonder if we should change the Kconfig to only offer it as an
option in that case, and change the logic in setup_per_cpu_areas() to
only use it as a last resort.

I guess we probably still need this commit though, even if just for 4K HPT.


> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> Changes in v4:
> - Fix coding style issues.
>
> Changes in v3:
> - Address comments from Christophe Leroy to avoid using #ifdefs in the
>   code
> - v2 at https://lore.kernel.org/linuxppc-dev/20240205053647.1763446-1-mahesh@linux.ibm.com/
>
> Changes in v2:
> - Rebase to upstream master
> - Use jump_labels, if CONFIG_JUMP_LABEL is enabled, to avoid redoing the
>   embed first chunk test at each interrupt entry.
> - v1 is at https://lore.kernel.org/linuxppc-dev/164578465828.74956.6065296024817333750.stgit@jupiter/
> ---
>  arch/powerpc/include/asm/interrupt.h | 10 ++++++++++
>  arch/powerpc/include/asm/percpu.h    | 10 ++++++++++
>  arch/powerpc/kernel/setup_64.c       |  3 +++
>  3 files changed, 23 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index a4196ab1d0167..0b96464ff0339 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -336,6 +336,14 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
>  	if (IS_ENABLED(CONFIG_KASAN))
>  		return;
>  
> +	/*
> +	 * Likewise, do not use it in real mode if percpu first chunk is not
> +	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
> +	 * are chances where percpu allocation can come from vmalloc area.
> +	 */
> +	if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk)

I think this would be clearer if it was inverted, eg:

        if (percpu_first_chunk_is_paged)
               return;

That way you shouldn't need to check CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK here.
Instead it can be part of the ifdef in the header.

> @@ -351,6 +359,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>  		// no nmi_exit for a pseries hash guest taking a real mode exception
>  	} else if (IS_ENABLED(CONFIG_KASAN)) {
>  		// no nmi_exit for KASAN in real mode
> +	} else if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk) {
> +		// no nmi_exit if percpu first chunk is not embedded
>  	} else {
>  		nmi_exit();
>  	}
> diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
> index 8e5b7d0b851c6..e24063eb0b33b 100644
> --- a/arch/powerpc/include/asm/percpu.h
> +++ b/arch/powerpc/include/asm/percpu.h
> @@ -15,6 +15,16 @@
>  #endif /* CONFIG_SMP */
>  #endif /* __powerpc64__ */
>  
> +#ifdef CONFIG_PPC64
> +#include <linux/jump_label.h>
> +DECLARE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
> +
> +#define is_embed_first_chunk	\
> +		(static_key_enabled(&__percpu_embed_first_chunk.key))
> +#else
> +#define is_embed_first_chunk	true
> +#endif /* CONFIG_PPC64 */
> +

Something like:

#ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
#include <linux/jump_label.h>
DECLARE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);

#define percpu_first_chunk_is_paged	\
		(static_key_enabled(&__percpu_first_chunk_is_paged.key))
#else
#define percpu_first_chunk_is_paged	false
#endif /* CONFIG_PPC64 */

> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 2f19d5e944852..e04f0ff69d4b6 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -834,6 +834,7 @@ static __init int pcpu_cpu_to_node(int cpu)
>  
>  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(__per_cpu_offset);
> +DEFINE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
>  
>  void __init setup_per_cpu_areas(void)
>  {
> @@ -869,6 +870,8 @@ void __init setup_per_cpu_areas(void)
>  			pr_warn("PERCPU: %s allocator failed (%d), "
>  				"falling back to page size\n",
>  				pcpu_fc_names[pcpu_chosen_fc], rc);
> +		else
> +			static_key_enable(&__percpu_embed_first_chunk.key);
>  	}
>  
>  	if (rc < 0)
 
Finally, the current patch breaks the microwatt build:

  $ make microwatt_defconfig ; make -s -j (nproc)
  make[1]: Entering directory '/home/michael/linux/.build'
    GEN     Makefile
  #
  # configuration written to .config
  #
  make[1]: Leaving directory '/home/michael/linux/.build'
  ld: arch/powerpc/kernel/traps.o:(.toc+0x0): undefined reference to `__percpu_embed_first_chunk'
  ld: arch/powerpc/kernel/mce.o:(.toc+0x0): undefined reference to `__percpu_embed_first_chunk'
  make[3]: *** [../scripts/Makefile.vmlinux:37: vmlinux] Error 1

I guess because it has CONFIG_JUMP_LABEL=n?

cheers
