Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCBF91BE8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 14:28:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T+o2fpEN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9ZVF3RYhz3cYt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 22:28:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T+o2fpEN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9ZTZ23Zbz3c2t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 22:28:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719577683;
	bh=f1Ax4HaCi4KMe2mVa2crrvjdvABKKIX41TNNtKzKpXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T+o2fpENOeW5XInyDaLP3twhKqIXtc/fH0JmQol7N0SWpo3lQOy1B3VfyTTagwwC9
	 fVWiqyHiya+rAM92/aUOKBsqMuus9UFuGvVIIbpGHyCF7d9iTcz3rkEKhJa8R5Vomc
	 tqtd3yBxRLavI/TksHeaxfV1eYdBEbTB/11DCngQt++NR+gR/KsmmrLcAHClALVi/D
	 VzPpll9ibEHqUk6qjpqGLioYbrknCuca0u5JkyaLIZkkcLYoD9yZ8k49woc53Wb8eL
	 4KZeE8mS6i2iTjwdjx2QryUgiAk2NewAEJOrX8P3RzxX2kT8UNSBOoeBJyejODdSSy
	 N5GJlZvr4a8aw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9ZTb06sXz4wb7;
	Fri, 28 Jun 2024 22:28:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] radix/kfence: map __kfence_pool at page granularity
In-Reply-To: <20240619104919.20772-1-hbathini@linux.ibm.com>
References: <20240619104919.20772-1-hbathini@linux.ibm.com>
Date: Fri, 28 Jun 2024 22:28:02 +1000
Message-ID: <878qypl0a5.fsf@mail.lhotse>
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
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Marco Elver <elver@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Potapenko <glider@google.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,

Just a few little things ...

Hari Bathini <hbathini@linux.ibm.com> writes:
> When KFENCE is enabled, total system memory is mapped at page level
> granularity. But in radix MMU mode, ~3GB additional memory is needed
> to map 100GB of system memory at page level granularity when compared
> to using 2MB direct mapping. This is not desired considering KFENCE is
> designed to be enabled in production kernels [1].
> Also, mapping memory
> allocated for KFENCE pool at page granularity seems sufficient enough
> to enable KFENCE support.

This should be firmer, eg:
  Mapping only the memory allocated for KFENCE pool at page granularity is sufficient to enable KFENCE support.

> So, allocate __kfence_pool during bootup and
> map it at page granularity instead of mapping all system memory at
> page granularity.
>
> Without patch:
>     # cat /proc/meminfo
>     MemTotal:       101201920 kB
>
> With patch:
>     # cat /proc/meminfo
>     MemTotal:       104483904 kB
>
> Note that enabling KFENCE at runtime is disabled for radix MMU for now,
> as it depends on the ability to split page table mappings and such APIs
> are not currently implemented for radix MMU.
>
> All kfence_test.c testcases passed with this patch.
>
> [1] https://lore.kernel.org/all/20201103175841.3495947-2-elver@google.com/
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>
> Changes in v2:
> * Dropped the patch that adds support to enable KFENCE after startup.
> * Added changes to avoid KFENCE enablement after system startup.
> * Also, added a TODO explaining why KFENCE enablement after startup
>   is not supported for now.
> * Functions to alloc/map __kfence_pool as suggested by Ritesh.
> * Moved changes that apply to ppc32 as well to common file as suggested
>   by Christophe.
>
>
>  arch/powerpc/include/asm/kfence.h        | 12 +++-
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 74 ++++++++++++++++++++++--
>  arch/powerpc/mm/init-common.c            | 14 +++++
>  3 files changed, 95 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
> index 424ceef82ae6..78590288ee80 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -15,10 +15,20 @@
>  #define ARCH_FUNC_PREFIX "."
>  #endif
>  
> +#ifdef CONFIG_KFENCE
> +extern bool kfence_early_init;
 
This is only read in radix_pgtable.c, so it needed be global.

> +extern bool kfence_disabled;
> +
> +static inline void disable_kfence(void)
> +{
> +	kfence_disabled = true;
> +}
> +
>  static inline bool arch_kfence_init_pool(void)
>  {
> -	return true;
> +	return !kfence_disabled;
>  }
> +#endif
>  
>  #ifdef CONFIG_PPC64
>  static inline bool kfence_protect_page(unsigned long addr, bool protect)
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 15e88f1439ec..a74912e0fd99 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -301,7 +304,10 @@ static int __meminit create_physical_mapping(unsigned long start,
>  	int psize;
>  	unsigned long max_mapping_size = memory_block_size;
>  
> -	if (debug_pagealloc_enabled_or_kfence())
> +	if (mapping_sz_limit < max_mapping_size)
> +		max_mapping_size = mapping_sz_limit;
> +
> +	if (debug_pagealloc_enabled())
>  		max_mapping_size = PAGE_SIZE;
>  
>  	start = ALIGN(start, PAGE_SIZE);
> @@ -356,8 +362,64 @@ static int __meminit create_physical_mapping(unsigned long start,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_KFENCE
> +static inline phys_addr_t radix_alloc_kfence_pool_early(void)
 
This is internal to radix_pgtable.c, so I think we can drop the radix
prefix. There's also no alloc_kfence_pool(), so early is not really
required IMHO. So it could just be alloc_kfence_pool(). Similar for map.

...
> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
> index d3a7726ecf51..f881ab5107aa 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -31,6 +31,20 @@ EXPORT_SYMBOL_GPL(kernstart_virt_addr);
>  
>  bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
>  bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
> +#ifdef CONFIG_KFENCE
> +bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
> +bool __ro_after_init kfence_disabled;
> +
> +static int __init parse_kfence_early_init(char *arg)
> +{
> +	int val;
> +
> +	if (get_option(&arg, &val))
> +		kfence_early_init = !!val;
> +	return 0;
> +}
> +early_param("kfence.sample_interval", parse_kfence_early_init);
> +#endif

AFAICS except for kfence_disabled, this can all go in radix_pgtable.c.

That would make it unambiguous that kfence_early_init is only used by
the radix kfence code, and avoid any bad interactions with the other
subarches - which was my original concern about adding the code here.

cheers
