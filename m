Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2042C4158
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:46:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch2Hh17LPzDqv5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:46:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2DD3VjkzDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:43:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ch2D53l4KzB09ZG;
 Wed, 25 Nov 2020 14:43:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bPbUSivLiCDs; Wed, 25 Nov 2020 14:43:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ch2D52TbrzB09ZS;
 Wed, 25 Nov 2020 14:43:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACBCC8B7D3;
 Wed, 25 Nov 2020 14:43:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e66TRpyK9DqE; Wed, 25 Nov 2020 14:43:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D1DF38B7D9;
 Wed, 25 Nov 2020 14:43:49 +0100 (CET)
Subject: Re: [PATCH v6 07/22] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP
 to MMU_FTR_KUAP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-8-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <49af7fc3-c9f0-ff2c-507e-595c3be8c8f6@csgroup.eu>
Date: Wed, 25 Nov 2020 14:43:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125051634.509286-8-aneesh.kumar@linux.ibm.com>
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
> This is in preparate to adding support for kuap with hash translation.
> In preparation for that rename/move kuap related functions to
> non radix names. Also move the feature bit closer to MMU_FTR_KUEP.

It was obvious with MMU_FTR_RADIX_KUAP that it was only for Radix PPC64.
Now, do we expect it to be applies on PPC32 as well or is it still for PPC64 only ?

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/book3s/64/kup.h | 18 +++++++++---------
>   arch/powerpc/include/asm/mmu.h           | 14 +++++++-------
>   arch/powerpc/mm/book3s64/pkeys.c         |  2 +-
>   3 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
> index 39d2e3a0d64d..1d38eab83d48 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -24,7 +24,7 @@
>   	mtspr	SPRN_AMR, \gpr2
>   	/* No isync required, see kuap_restore_amr() */
>   998:
> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>   #endif
>   .endm
>   
> @@ -37,7 +37,7 @@
>   	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
>   999:	tdne	\gpr1, \gpr2
>   	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>   #endif
>   .endm
>   #endif
> @@ -58,7 +58,7 @@
>   	mtspr	SPRN_AMR, \gpr2
>   	isync
>   99:
> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>   #endif
>   .endm
>   
> @@ -73,7 +73,7 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>   
>   static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>   {
> -	if (mmu_has_feature(MMU_FTR_RADIX_KUAP) && unlikely(regs->kuap != amr)) {
> +	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
>   		isync();
>   		mtspr(SPRN_AMR, regs->kuap);
>   		/*
> @@ -86,7 +86,7 @@ static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>   
>   static inline unsigned long kuap_get_and_check_amr(void)
>   {
> -	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
> +	if (mmu_has_feature(MMU_FTR_KUAP)) {
>   		unsigned long amr = mfspr(SPRN_AMR);
>   		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
>   			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
> @@ -97,7 +97,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
>   
>   static inline void kuap_check_amr(void)
>   {
> -	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
>   		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
>   }
>   
> @@ -116,7 +116,7 @@ static inline unsigned long get_kuap(void)
>   	 * This has no effect in terms of actually blocking things on hash,
>   	 * so it doesn't break anything.
>   	 */
> -	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (!early_mmu_has_feature(MMU_FTR_KUAP))
>   		return AMR_KUAP_BLOCKED;
>   
>   	return mfspr(SPRN_AMR);
> @@ -124,7 +124,7 @@ static inline unsigned long get_kuap(void)
>   
>   static inline void set_kuap(unsigned long value)
>   {
> -	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (!early_mmu_has_feature(MMU_FTR_KUAP))
>   		return;
>   
>   	/*
> @@ -139,7 +139,7 @@ static inline void set_kuap(unsigned long value)
>   static inline bool
>   bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
>   {
> -	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
> +	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
>   		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
>   		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>   }
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 255a1837e9f7..f5c7a17c198a 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -28,6 +28,11 @@
>    * Individual features below.
>    */
>   
> +/*
> + * Supports KUAP (key 0 controlling userspace addresses) on radix
> + */
> +#define MMU_FTR_KUAP			ASM_CONST(0x00000200)
> +
>   /*
>    * Support for KUEP feature.
>    */
> @@ -120,11 +125,6 @@
>    */
>   #define MMU_FTR_1T_SEGMENT		ASM_CONST(0x40000000)
>   
> -/*
> - * Supports KUAP (key 0 controlling userspace addresses) on radix
> - */
> -#define MMU_FTR_RADIX_KUAP		ASM_CONST(0x80000000)
> -
>   /* MMU feature bit sets for various CPUs */
>   #define MMU_FTRS_DEFAULT_HPTE_ARCH_V2	\
>   	MMU_FTR_HPTE_TABLE | MMU_FTR_PPCAS_ARCH_V2
> @@ -187,10 +187,10 @@ enum {
>   #ifdef CONFIG_PPC_RADIX_MMU
>   		MMU_FTR_TYPE_RADIX |
>   		MMU_FTR_GTSE |
> +#endif /* CONFIG_PPC_RADIX_MMU */
>   #ifdef CONFIG_PPC_KUAP
> -		MMU_FTR_RADIX_KUAP |
> +	MMU_FTR_KUAP |
>   #endif /* CONFIG_PPC_KUAP */
> -#endif /* CONFIG_PPC_RADIX_MMU */
>   #ifdef CONFIG_PPC_MEM_KEYS
>   	MMU_FTR_PKEY |
>   #endif
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index 82c722fbce52..bfc27f1f0ab0 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -258,7 +258,7 @@ void __init setup_kuap(bool disabled)
>   
>   	if (smp_processor_id() == boot_cpuid) {
>   		pr_info("Activating Kernel Userspace Access Prevention\n");
> -		cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
> +		cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
>   	}
>   
>   	/*
> 
