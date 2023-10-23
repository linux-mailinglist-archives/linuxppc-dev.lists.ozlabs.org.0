Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 221B77D3D34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 19:15:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MeuEwtvu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDhf30Q9Gz3bWy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 04:15:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MeuEwtvu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDhd61TWZz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 04:14:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 043BD625F2;
	Mon, 23 Oct 2023 17:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43161C433C9;
	Mon, 23 Oct 2023 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698081270;
	bh=Ja8s9hHWNsMl9rR/A2vkVRwGBByDHecu9TUfTmLK5O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeuEwtvuDFO5yp5iwwuVEJNzg9RfG0g2iSphmorTs1YHktZPSgAIBmOgSnoaQJdHm
	 nUlWIMj2sV40TRQksuLqdyoEUZOrZ4YgskSrGgA2/nhb9IFL78IFLLm5ChkY8qJxOI
	 XvSk9ecB7rzX1Id68w7pVTn+QD7K44RzxoL0JXDRTA8j3sh2U4yTDlfwo97LvPAH00
	 RUnsGssWWAdudZuWTwU1hLYa0ovrTsWm97cFrfjCEL0C5VQBb75ldMMm5wnopS8rdo
	 ma5otrvqzXBMC9YyKDYNnhopzPnGbtq133bDGxB7c+u2v5Gw+ZIgVNda5UvccMxt+p
	 Sq/U+bn87cRzw==
Date: Mon, 23 Oct 2023 18:14:20 +0100
From: Will Deacon <will@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231023171420.GA4041@willie-the-truck>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918072955.2507221-5-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_
 T=F6pel?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

On Mon, Sep 18, 2023 at 10:29:46AM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Extend execmem parameters to accommodate more complex overrides of
> module_alloc() by architectures.
> 
> This includes specification of a fallback range required by arm, arm64
> and powerpc and support for allocation of KASAN shadow required by
> arm64, s390 and x86.
> 
> The core implementation of execmem_alloc() takes care of suppressing
> warnings when the initial allocation fails but there is a fallback range
> defined.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/arm/kernel/module.c     | 38 ++++++++++++---------
>  arch/arm64/kernel/module.c   | 57 ++++++++++++++------------------
>  arch/powerpc/kernel/module.c | 52 ++++++++++++++---------------
>  arch/s390/kernel/module.c    | 52 +++++++++++------------------
>  arch/x86/kernel/module.c     | 64 +++++++++++-------------------------
>  include/linux/execmem.h      | 14 ++++++++
>  mm/execmem.c                 | 43 ++++++++++++++++++++++--
>  7 files changed, 167 insertions(+), 153 deletions(-)

[...]

> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index dd851297596e..cd6320de1c54 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -20,6 +20,7 @@
>  #include <linux/random.h>
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
> +#include <linux/execmem.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/insn.h>
> @@ -108,46 +109,38 @@ static int __init module_init_limits(void)
>  
>  	return 0;
>  }
> -subsys_initcall(module_init_limits);
>  
> -void *module_alloc(unsigned long size)
> +static struct execmem_params execmem_params __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.flags = EXECMEM_KASAN_SHADOW,
> +			.alignment = MODULE_ALIGN,
> +		},
> +	},
> +};
> +
> +struct execmem_params __init *execmem_arch_params(void)
>  {
> -	void *p = NULL;
> +	struct execmem_range *r = &execmem_params.ranges[EXECMEM_DEFAULT];
>  
> -	/*
> -	 * Where possible, prefer to allocate within direct branch range of the
> -	 * kernel such that no PLTs are necessary.
> -	 */

Why are you removing this comment? I think you could just move it next
to the part where we set a 128MiB range.

> -	if (module_direct_base) {
> -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> -					 module_direct_base,
> -					 module_direct_base + SZ_128M,
> -					 GFP_KERNEL | __GFP_NOWARN,
> -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> -					 __builtin_return_address(0));
> -	}
> +	module_init_limits();

Hmm, this used to be run from subsys_initcall(), but now you're running
it _really_ early, before random_init(), so randomization of the module
space is no longer going to be very random if we don't have early entropy
from the firmware or the CPU, which is likely to be the case on most SoCs.

>  
> -	if (!p && module_plt_base) {
> -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> -					 module_plt_base,
> -					 module_plt_base + SZ_2G,
> -					 GFP_KERNEL | __GFP_NOWARN,
> -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> -					 __builtin_return_address(0));
> -	}
> +	r->pgprot = PAGE_KERNEL;
>  
> -	if (!p) {
> -		pr_warn_ratelimited("%s: unable to allocate memory\n",
> -				    __func__);
> -	}
> +	if (module_direct_base) {
> +		r->start = module_direct_base;
> +		r->end = module_direct_base + SZ_128M;
>  
> -	if (p && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
> -		vfree(p);
> -		return NULL;
> +		if (module_plt_base) {
> +			r->fallback_start = module_plt_base;
> +			r->fallback_end = module_plt_base + SZ_2G;
> +		}
> +	} else if (module_plt_base) {
> +		r->start = module_plt_base;
> +		r->end = module_plt_base + SZ_2G;
>  	}
>  
> -	/* Memory is intended to be executable, reset the pointer tag. */
> -	return kasan_reset_tag(p);
> +	return &execmem_params;
>  }
>  
>  enum aarch64_reloc_op {

[...]

> diff --git a/include/linux/execmem.h b/include/linux/execmem.h
> index 44e213625053..806ad1a0088d 100644
> --- a/include/linux/execmem.h
> +++ b/include/linux/execmem.h
> @@ -32,19 +32,33 @@ enum execmem_type {
>  	EXECMEM_TYPE_MAX,
>  };
>  
> +/**
> + * enum execmem_module_flags - options for executable memory allocations
> + * @EXECMEM_KASAN_SHADOW:	allocate kasan shadow
> + */
> +enum execmem_range_flags {
> +	EXECMEM_KASAN_SHADOW	= (1 << 0),
> +};
> +
>  /**
>   * struct execmem_range - definition of a memory range suitable for code and
>   *			  related data allocations
>   * @start:	address space start
>   * @end:	address space end (inclusive)
> + * @fallback_start:	start of the range for fallback allocations
> + * @fallback_end:	end of the range for fallback allocations (inclusive)
>   * @pgprot:	permissions for memory in this address space
>   * @alignment:	alignment required for text allocations
> + * @flags:	options for memory allocations for this range
>   */
>  struct execmem_range {
>  	unsigned long   start;
>  	unsigned long   end;
> +	unsigned long   fallback_start;
> +	unsigned long   fallback_end;
>  	pgprot_t        pgprot;
>  	unsigned int	alignment;
> +	enum execmem_range_flags flags;
>  };
>  
>  /**
> diff --git a/mm/execmem.c b/mm/execmem.c
> index f25a5e064886..a8c2f44d0133 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -11,12 +11,46 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
>  {
>  	unsigned long start = range->start;
>  	unsigned long end = range->end;
> +	unsigned long fallback_start = range->fallback_start;
> +	unsigned long fallback_end = range->fallback_end;
>  	unsigned int align = range->alignment;
>  	pgprot_t pgprot = range->pgprot;
> +	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
> +	unsigned long vm_flags  = VM_FLUSH_RESET_PERMS;
> +	bool fallback  = !!fallback_start;
> +	gfp_t gfp_flags = GFP_KERNEL;
> +	void *p;
>  
> -	return __vmalloc_node_range(size, align, start, end,
> -				   GFP_KERNEL, pgprot, VM_FLUSH_RESET_PERMS,
> -				   NUMA_NO_NODE, __builtin_return_address(0));
> +	if (PAGE_ALIGN(size) > (end - start))
> +		return NULL;
> +
> +	if (kasan)
> +		vm_flags |= VM_DEFER_KMEMLEAK;

Hmm, I don't think we passed this before on arm64, should we have done?

Will
