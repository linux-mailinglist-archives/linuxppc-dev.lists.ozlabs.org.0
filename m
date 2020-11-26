Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 155D02C4DCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 04:27:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChNTx75GZzDrCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:27:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChNSH63S9zDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 14:25:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kOczjU3S; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChNSH4D3tz9sTv;
 Thu, 26 Nov 2020 14:25:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606361135;
 bh=lbmOqsxTQiUdgkbLgTguVYCEqu3p2LIz/N+rfbJVcrY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kOczjU3SFtpf9PeMcA8TBlwr9EiY5cUrOrRGYdCe8WIPg/cG1boSwsTwFVSbjLUlZ
 mP/YFYsF5YHL+z8vMM4XGw2YmKJ7Odh/RKp/m/BlWYiA8fwhfQA90P+kr3cm9f70h7
 B4QqLGUUOJNpfJeokz4LahKqANlA21bQoWCeBMihbuvhmoyuG2f92GWI3Y+ofaSJL0
 Vl8cfwCuIAmwuFj5jlCyceCADKQq3O2L92jq6b0kZy4kUD5IF2nwq2EfyX95QCNOWn
 HO8/khtTFN/UxhW9I3+d+7nxMy6ncEhJixwmpHgVIiF6Yvy15CO76ny70kqDtHWbI+
 ZUQxrv4TOUr3Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 03/22] powerpc/book3s64/kuap/kuep: Make KUAP and KUEP a
 subfeature of PPC_MEM_KEYS
In-Reply-To: <20201125051634.509286-4-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-4-aneesh.kumar@linux.ibm.com>
Date: Thu, 26 Nov 2020 14:25:35 +1100
Message-ID: <87wny8yf2o.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> The next set of patches adds support for kuap with hash translation.
> Hence make KUAP a BOOK3S_64 feature. Also make it a subfeature of
> PPC_MEM_KEYS. Hash translation is going to use pkeys to support
> KUAP/KUEP. Adding this dependency reduces the code complexity and
> enables us to move some of the initialization code to pkeys.c

The subject and change log don't really match the patch anymore since
you incorporated my changes.

This adds a new CONFIG called PPC_PKEY which is enabled if either PKEY
or KUAP/KUEP is enabled etc.

cheers

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  .../powerpc/include/asm/book3s/64/kup-radix.h |  4 ++--
>  arch/powerpc/include/asm/book3s/64/mmu.h      |  2 +-
>  arch/powerpc/include/asm/ptrace.h             |  7 +++++-
>  arch/powerpc/kernel/asm-offsets.c             |  3 +++
>  arch/powerpc/mm/book3s64/Makefile             |  2 +-
>  arch/powerpc/mm/book3s64/pkeys.c              | 24 ++++++++++++-------
>  arch/powerpc/platforms/Kconfig.cputype        |  5 ++++
>  7 files changed, 33 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> index 28716e2f13e3..68eaa2fac3ab 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -16,7 +16,7 @@
>  #ifdef CONFIG_PPC_KUAP
>  	BEGIN_MMU_FTR_SECTION_NESTED(67)
>  	mfspr	\gpr1, SPRN_AMR
> -	ld	\gpr2, STACK_REGS_KUAP(r1)
> +	ld	\gpr2, STACK_REGS_AMR(r1)
>  	cmpd	\gpr1, \gpr2
>  	beq	998f
>  	isync
> @@ -48,7 +48,7 @@
>  	bne	\msr_pr_cr, 99f
>  	.endif
>  	mfspr	\gpr1, SPRN_AMR
> -	std	\gpr1, STACK_REGS_KUAP(r1)
> +	std	\gpr1, STACK_REGS_AMR(r1)
>  	li	\gpr2, (AMR_KUAP_BLOCKED >> AMR_KUAP_SHIFT)
>  	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
>  	cmpd	\use_cr, \gpr1, \gpr2
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index e0b52940e43c..a2a015066bae 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -199,7 +199,7 @@ extern int mmu_io_psize;
>  void mmu_early_init_devtree(void);
>  void hash__early_init_devtree(void);
>  void radix__early_init_devtree(void);
> -#ifdef CONFIG_PPC_MEM_KEYS
> +#ifdef CONFIG_PPC_PKEY
>  void pkey_early_init_devtree(void);
>  #else
>  static inline void pkey_early_init_devtree(void) {}
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index e2c778c176a3..e7f1caa007a4 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -53,9 +53,14 @@ struct pt_regs
>  #ifdef CONFIG_PPC64
>  			unsigned long ppr;
>  #endif
> +			union {
>  #ifdef CONFIG_PPC_KUAP
> -			unsigned long kuap;
> +				unsigned long kuap;
>  #endif
> +#ifdef CONFIG_PPC_PKEY
> +				unsigned long amr;
> +#endif
> +			};
>  		};
>  		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
>  	};
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index c2722ff36e98..418a0b314a33 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -354,6 +354,9 @@ int main(void)
>  	STACK_PT_REGS_OFFSET(_PPR, ppr);
>  #endif /* CONFIG_PPC64 */
>  
> +#ifdef CONFIG_PPC_PKEY
> +	STACK_PT_REGS_OFFSET(STACK_REGS_AMR, amr);
> +#endif
>  #ifdef CONFIG_PPC_KUAP
>  	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
>  #endif
> diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
> index fd393b8be14f..1b56d3af47d4 100644
> --- a/arch/powerpc/mm/book3s64/Makefile
> +++ b/arch/powerpc/mm/book3s64/Makefile
> @@ -17,7 +17,7 @@ endif
>  obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
>  obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
>  obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
> -obj-$(CONFIG_PPC_MEM_KEYS)	+= pkeys.o
> +obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
>  
>  # Instrumenting the SLB fault path can lead to duplicate SLB entries
>  KCOV_INSTRUMENT_slb.o := n
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index b1d091a97611..7dc71f85683d 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -89,12 +89,14 @@ static int scan_pkey_feature(void)
>  		}
>  	}
>  
> +#ifdef CONFIG_PPC_MEM_KEYS
>  	/*
>  	 * Adjust the upper limit, based on the number of bits supported by
>  	 * arch-neutral code.
>  	 */
>  	pkeys_total = min_t(int, pkeys_total,
>  			    ((ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT) + 1));
> +#endif
>  	return pkeys_total;
>  }
>  
> @@ -102,6 +104,7 @@ void __init pkey_early_init_devtree(void)
>  {
>  	int pkeys_total, i;
>  
> +#ifdef CONFIG_PPC_MEM_KEYS
>  	/*
>  	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
>  	 * generic defines for PKEY_DISABLE_ACCESS and PKEY_DISABLE_WRITE.
> @@ -117,7 +120,7 @@ void __init pkey_early_init_devtree(void)
>  	BUILD_BUG_ON(__builtin_clzl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT) +
>  		     __builtin_popcountl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT)
>  				!= (sizeof(u64) * BITS_PER_BYTE));
> -
> +#endif
>  	/*
>  	 * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
>  	 */
> @@ -223,14 +226,6 @@ void __init pkey_early_init_devtree(void)
>  	return;
>  }
>  
> -void pkey_mm_init(struct mm_struct *mm)
> -{
> -	if (!mmu_has_feature(MMU_FTR_PKEY))
> -		return;
> -	mm_pkey_allocation_map(mm) = initial_allocation_mask;
> -	mm->context.execute_only_pkey = execute_only_key;
> -}
> -
>  static inline u64 read_amr(void)
>  {
>  	return mfspr(SPRN_AMR);
> @@ -257,6 +252,15 @@ static inline void write_iamr(u64 value)
>  	mtspr(SPRN_IAMR, value);
>  }
>  
> +#ifdef CONFIG_PPC_MEM_KEYS
> +void pkey_mm_init(struct mm_struct *mm)
> +{
> +	if (!mmu_has_feature(MMU_FTR_PKEY))
> +		return;
> +	mm_pkey_allocation_map(mm) = initial_allocation_mask;
> +	mm->context.execute_only_pkey = execute_only_key;
> +}
> +
>  static inline void init_amr(int pkey, u8 init_bits)
>  {
>  	u64 new_amr_bits = (((u64)init_bits & 0x3UL) << pkeyshift(pkey));
> @@ -445,3 +449,5 @@ void arch_dup_pkeys(struct mm_struct *oldmm, struct mm_struct *mm)
>  	mm_pkey_allocation_map(mm) = mm_pkey_allocation_map(oldmm);
>  	mm->context.execute_only_pkey = oldmm->context.execute_only_pkey;
>  }
> +
> +#endif /* CONFIG_PPC_MEM_KEYS */
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index c194c4ae8bc7..f255e8f32155 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -395,6 +395,11 @@ config PPC_KUAP_DEBUG
>  	  Add extra debugging for Kernel Userspace Access Protection (KUAP)
>  	  If you're unsure, say N.
>  
> +config PPC_PKEY
> +	def_bool y
> +	depends on PPC_BOOK3S_64
> +	depends on PPC_MEM_KEYS || PPC_KUAP || PPC_KUEP
> +
>  config ARCH_ENABLE_HUGEPAGE_MIGRATION
>  	def_bool y
>  	depends on PPC_BOOK3S_64 && HUGETLB_PAGE && MIGRATION
> -- 
> 2.28.0
