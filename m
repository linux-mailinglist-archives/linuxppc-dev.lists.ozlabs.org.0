Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB0253D03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:59:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVrW6L6JzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:59:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcVps21b9zDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:57:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BcVpn2Zj1z9vCxf;
 Thu, 27 Aug 2020 06:57:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pt4XaqWgpYZa; Thu, 27 Aug 2020 06:57:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BcVpn1Qsyz9vCxd;
 Thu, 27 Aug 2020 06:57:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D22A98B77D;
 Thu, 27 Aug 2020 06:57:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EljHenXme-vW; Thu, 27 Aug 2020 06:57:53 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CFC4E8B75F;
 Thu, 27 Aug 2020 06:57:52 +0200 (CEST)
Subject: Re: [PATCH v5 08/23] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP
 to MMU_FTR_KUAP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-9-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0913af16-f571-3c23-40ea-0419cbd4acdf@csgroup.eu>
Date: Thu, 27 Aug 2020 06:57:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827040931.297759-9-aneesh.kumar@linux.ibm.com>
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



Le 27/08/2020 à 06:09, Aneesh Kumar K.V a écrit :
> This is in preparate to adding support for kuap with hash translation.
> In preparation for that rename/move kuap related functions to
> non radix names. Also move the feature bit closer to MMU_FTR_KUEP.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/book3s/64/kup.h | 18 +++++++++---------
>   arch/powerpc/include/asm/mmu.h           | 16 ++++++++--------
>   arch/powerpc/mm/book3s64/pkeys.c         |  2 +-
>   3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
> index 918a2fcceee7..5cec202dc42f 100644
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
> @@ -36,7 +36,7 @@
>   	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
>   999:	tdne	\gpr1, \gpr2
>   	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>   #endif
>   .endm
>   
> @@ -56,7 +56,7 @@
>   	mtspr	SPRN_AMR, \gpr2
>   	isync
>   99:
> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>   #endif
>   .endm
>   
> @@ -69,7 +69,7 @@
>   
>   static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>   {
> -	if (mmu_has_feature(MMU_FTR_RADIX_KUAP) && unlikely(regs->kuap != amr)) {
> +	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
>   		isync();
>   		mtspr(SPRN_AMR, regs->kuap);
>   		/*
> @@ -82,7 +82,7 @@ static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>   
>   static inline unsigned long kuap_get_and_check_amr(void)
>   {
> -	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
> +	if (mmu_has_feature(MMU_FTR_KUAP)) {
>   		unsigned long amr = mfspr(SPRN_AMR);
>   		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
>   			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
> @@ -93,7 +93,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
>   
>   static inline void kuap_check_amr(void)
>   {
> -	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
>   		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
>   }
>   
> @@ -122,7 +122,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
>   
>   static inline unsigned long get_kuap(void)
>   {
> -	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (!early_mmu_has_feature(MMU_FTR_KUAP))
>   		return 0;
>   
>   	return mfspr(SPRN_AMR);
> @@ -130,7 +130,7 @@ static inline unsigned long get_kuap(void)
>   
>   static inline void set_kuap(unsigned long value)
>   {
> -	if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +	if (!early_mmu_has_feature(MMU_FTR_KUAP))
>   		return;
>   
>   	/*
> @@ -180,7 +180,7 @@ static inline void restore_user_access(unsigned long flags)
>   static inline bool
>   bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
>   {
> -	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
> +	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
>   		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
>   		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>   }
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 255a1837e9f7..04e7a65637fb 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -29,7 +29,12 @@
>    */
>   
>   /*
> - * Support for KUEP feature.
> + * Supports KUAP (key 0 controlling userspace addresses) on radix
> + */
> +#define MMU_FTR_KUAP			ASM_CONST(0x00000200)
> +
> +/*
> + * Suppor for KUEP feature.

Unexpected change I guess. Suppor ==> Support

Christophe

>    */
>   #define MMU_FTR_KUEP			ASM_CONST(0x00000400)
>   
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
