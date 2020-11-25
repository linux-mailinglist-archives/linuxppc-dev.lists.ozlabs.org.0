Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00D2C413F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:39:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch26t0XdkzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:39:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch1wx5k85zDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:30:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ch1wl6dWnzB09ZG;
 Wed, 25 Nov 2020 14:30:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tiP2ACF6c6Dh; Wed, 25 Nov 2020 14:30:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ch1wl5mwpzB09ZC;
 Wed, 25 Nov 2020 14:30:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 256FE8B7D3;
 Wed, 25 Nov 2020 14:30:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kLzwU45PaoBg; Wed, 25 Nov 2020 14:30:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AAEAB8B7D9;
 Wed, 25 Nov 2020 14:30:32 +0100 (CET)
Subject: Re: [PATCH v6 03/22] powerpc/book3s64/kuap/kuep: Make KUAP and KUEP a
 subfeature of PPC_MEM_KEYS
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-4-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a98c3e0e-ddc9-3278-b707-669627c45e88@csgroup.eu>
Date: Wed, 25 Nov 2020 14:30:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125051634.509286-4-aneesh.kumar@linux.ibm.com>
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



Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
> The next set of patches adds support for kuap with hash translation.
> Hence make KUAP a BOOK3S_64 feature. Also make it a subfeature of
> PPC_MEM_KEYS. Hash translation is going to use pkeys to support
> KUAP/KUEP. Adding this dependency reduces the code complexity and
> enables us to move some of the initialization code to pkeys.c
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   .../powerpc/include/asm/book3s/64/kup-radix.h |  4 ++--
>   arch/powerpc/include/asm/book3s/64/mmu.h      |  2 +-
>   arch/powerpc/include/asm/ptrace.h             |  7 +++++-
>   arch/powerpc/kernel/asm-offsets.c             |  3 +++
>   arch/powerpc/mm/book3s64/Makefile             |  2 +-
>   arch/powerpc/mm/book3s64/pkeys.c              | 24 ++++++++++++-------
>   arch/powerpc/platforms/Kconfig.cputype        |  5 ++++
>   7 files changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> index 28716e2f13e3..68eaa2fac3ab 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -16,7 +16,7 @@
>   #ifdef CONFIG_PPC_KUAP
>   	BEGIN_MMU_FTR_SECTION_NESTED(67)
>   	mfspr	\gpr1, SPRN_AMR
> -	ld	\gpr2, STACK_REGS_KUAP(r1)
> +	ld	\gpr2, STACK_REGS_AMR(r1)
>   	cmpd	\gpr1, \gpr2
>   	beq	998f
>   	isync
> @@ -48,7 +48,7 @@
>   	bne	\msr_pr_cr, 99f
>   	.endif
>   	mfspr	\gpr1, SPRN_AMR
> -	std	\gpr1, STACK_REGS_KUAP(r1)
> +	std	\gpr1, STACK_REGS_AMR(r1)
>   	li	\gpr2, (AMR_KUAP_BLOCKED >> AMR_KUAP_SHIFT)
>   	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
>   	cmpd	\use_cr, \gpr1, \gpr2
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index e0b52940e43c..a2a015066bae 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -199,7 +199,7 @@ extern int mmu_io_psize;
>   void mmu_early_init_devtree(void);
>   void hash__early_init_devtree(void);
>   void radix__early_init_devtree(void);
> -#ifdef CONFIG_PPC_MEM_KEYS
> +#ifdef CONFIG_PPC_PKEY
>   void pkey_early_init_devtree(void);
>   #else
>   static inline void pkey_early_init_devtree(void) {}
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index e2c778c176a3..e7f1caa007a4 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -53,9 +53,14 @@ struct pt_regs
>   #ifdef CONFIG_PPC64
>   			unsigned long ppr;
>   #endif
> +			union {
>   #ifdef CONFIG_PPC_KUAP
> -			unsigned long kuap;
> +				unsigned long kuap;
>   #endif
> +#ifdef CONFIG_PPC_PKEY
> +				unsigned long amr;
> +#endif
> +			};
>   		};
>   		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
>   	};
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index c2722ff36e98..418a0b314a33 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -354,6 +354,9 @@ int main(void)
>   	STACK_PT_REGS_OFFSET(_PPR, ppr);
>   #endif /* CONFIG_PPC64 */
>   
> +#ifdef CONFIG_PPC_PKEY
> +	STACK_PT_REGS_OFFSET(STACK_REGS_AMR, amr);
> +#endif
>   #ifdef CONFIG_PPC_KUAP
>   	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
>   #endif
> diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
> index fd393b8be14f..1b56d3af47d4 100644
> --- a/arch/powerpc/mm/book3s64/Makefile
> +++ b/arch/powerpc/mm/book3s64/Makefile
> @@ -17,7 +17,7 @@ endif
>   obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
>   obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
>   obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
> -obj-$(CONFIG_PPC_MEM_KEYS)	+= pkeys.o
> +obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
>   
>   # Instrumenting the SLB fault path can lead to duplicate SLB entries
>   KCOV_INSTRUMENT_slb.o := n
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index b1d091a97611..7dc71f85683d 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -89,12 +89,14 @@ static int scan_pkey_feature(void)
>   		}
>   	}
>   
> +#ifdef CONFIG_PPC_MEM_KEYS
>   	/*
>   	 * Adjust the upper limit, based on the number of bits supported by
>   	 * arch-neutral code.
>   	 */
>   	pkeys_total = min_t(int, pkeys_total,
>   			    ((ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT) + 1));

I don't think we need an #ifdef here. I thing an 'if (IS_ENABLED(CONFIG_PPC_MEM_KEYS))' should make it.

> +#endif
>   	return pkeys_total;
>   }
>   
> @@ -102,6 +104,7 @@ void __init pkey_early_init_devtree(void)
>   {
>   	int pkeys_total, i;
>   
> +#ifdef CONFIG_PPC_MEM_KEYS
>   	/*
>   	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
>   	 * generic defines for PKEY_DISABLE_ACCESS and PKEY_DISABLE_WRITE.
> @@ -117,7 +120,7 @@ void __init pkey_early_init_devtree(void)
>   	BUILD_BUG_ON(__builtin_clzl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT) +
>   		     __builtin_popcountl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT)
>   				!= (sizeof(u64) * BITS_PER_BYTE));
> -
> +#endif
>   	/*
>   	 * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
>   	 */
> @@ -223,14 +226,6 @@ void __init pkey_early_init_devtree(void)
>   	return;
>   }
>   
> -void pkey_mm_init(struct mm_struct *mm)
> -{
> -	if (!mmu_has_feature(MMU_FTR_PKEY))
> -		return;
> -	mm_pkey_allocation_map(mm) = initial_allocation_mask;
> -	mm->context.execute_only_pkey = execute_only_key;
> -}
> -
>   static inline u64 read_amr(void)
>   {
>   	return mfspr(SPRN_AMR);
> @@ -257,6 +252,15 @@ static inline void write_iamr(u64 value)
>   	mtspr(SPRN_IAMR, value);
>   }
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
>   static inline void init_amr(int pkey, u8 init_bits)
>   {
>   	u64 new_amr_bits = (((u64)init_bits & 0x3UL) << pkeyshift(pkey));
> @@ -445,3 +449,5 @@ void arch_dup_pkeys(struct mm_struct *oldmm, struct mm_struct *mm)
>   	mm_pkey_allocation_map(mm) = mm_pkey_allocation_map(oldmm);
>   	mm->context.execute_only_pkey = oldmm->context.execute_only_pkey;
>   }
> +
> +#endif /* CONFIG_PPC_MEM_KEYS */
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index c194c4ae8bc7..f255e8f32155 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -395,6 +395,11 @@ config PPC_KUAP_DEBUG
>   	  Add extra debugging for Kernel Userspace Access Protection (KUAP)
>   	  If you're unsure, say N.
>   
> +config PPC_PKEY
> +	def_bool y
> +	depends on PPC_BOOK3S_64
> +	depends on PPC_MEM_KEYS || PPC_KUAP || PPC_KUEP
> +
>   config ARCH_ENABLE_HUGEPAGE_MIGRATION
>   	def_bool y
>   	depends on PPC_BOOK3S_64 && HUGETLB_PAGE && MIGRATION
> 
