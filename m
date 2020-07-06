Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D19215740
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 14:29:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0lJ12p33zDqZl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 22:29:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0lFR2vJnzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 22:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KZs6kSCM; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0lFP5nj1z9sDX;
 Mon,  6 Jul 2020 22:27:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594038442;
 bh=lXQ/a/hPj1/PDI3RxQ0AeOGOt1x90mEDDwiBIayzRWM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KZs6kSCMdSJjYCMi77zoeehD1Set8N2KfnS722UPWxaVs5auvmtpwRmEWbOHZW1Cu
 tkUy3Ge5QsMvvpjV1SlRWolTttBrSEHLRUCOiQ/5jZSylkclQ+LRkj8D5onBEvaBBs
 yEx0tUIzCwzu12MSN3W4Kj7l7qOoxXLozD0RuATMe+l8BTVNvrV7zCzvxy7ZO9S6SN
 RFKn+RXH0raT+oP9rM59hVAORmee/ErJq1MAQooiRLjJUd+TS5Bp5+XafRiJom+/SR
 ftjG+xn087gzulvkRXnhOqpPalMieGIi9yB5rZ79fJD3ZV+eJwyDCeDaNjsfFZFcvM
 KM+uqfJ0uSKiQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 18/26] powerpc/book3s64/keys/kuap: Reset AMR/IAMR
 values on kexec
In-Reply-To: <20200619135850.47155-19-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-19-aneesh.kumar@linux.ibm.com>
Date: Mon, 06 Jul 2020 22:29:33 +1000
Message-ID: <87h7uk6d3m.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> As we kexec across kernels that use AMR/IAMR for different purposes
> we need to ensure that new kernels get kexec'd with a reset value
> of AMR/IAMR. For ex: the new kernel can use key 0 for kernel mapping and the old
> AMR value prevents access to key 0.
>
> This patch also removes reset if IAMR and AMOR in kexec_sequence. Reset of AMOR
> is not needed and the IAMR reset is partial (it doesn't do the reset
> on secondary cpus) and is redundant with this patch.

I like the idea of cleaning this stuff up.

But I think tying it into kup/kuep/kuap and the MMU features and ifdefs
and so on is overly complicated.

We should just have eg:

void reset_sprs(void)
{
	if (early_cpu_has_feature(CPU_FTR_ARCH_206)) {
        	mtspr(SPRN_AMR, 0);
        	mtspr(SPRN_UAMOR, 0);
        }

	if (early_cpu_has_feature(CPU_FTR_ARCH_207S)) {
        	mtspr(SPRN_IAMR, 0);
        }
}

And call that from the kexec paths.

cheers

> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> index 3ee1ec60be84..c57063c35833 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -180,6 +180,26 @@ static inline unsigned long kuap_get_and_check_amr(void)
>  }
>  #endif /* CONFIG_PPC_KUAP */
>  
> +#define reset_kuap reset_kuap
> +static inline void reset_kuap(void)
> +{
> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
> +		mtspr(SPRN_AMR, 0);
> +		/*  Do we need isync()? We are going via a kexec reset */
> +		isync();
> +	}
> +}
> +
> +#define reset_kuep reset_kuep
> +static inline void reset_kuep(void)
> +{
> +	if (mmu_has_feature(MMU_FTR_KUEP)) {
> +		mtspr(SPRN_IAMR, 0);
> +		/*  Do we need isync()? We are going via a kexec reset */
> +		isync();
> +	}
> +}
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H */
> diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
> index c745ee41ad66..4dc23a706910 100644
> --- a/arch/powerpc/include/asm/kup.h
> +++ b/arch/powerpc/include/asm/kup.h
> @@ -113,6 +113,20 @@ static inline void prevent_current_write_to_user(void)
>  	prevent_user_access(NULL, NULL, ~0UL, KUAP_CURRENT_WRITE);
>  }
>  
> +#ifndef reset_kuap
> +#define reset_kuap reset_kuap
> +static inline void reset_kuap(void)
> +{
> +}
> +#endif
> +
> +#ifndef reset_kuep
> +#define reset_kuep reset_kuep
> +static inline void reset_kuep(void)
> +{
> +}
> +#endif
> +
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif /* _ASM_POWERPC_KUAP_H_ */
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 1864605eca29..7bb46ad98207 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -413,20 +413,6 @@ _GLOBAL(kexec_sequence)
>  	li	r0,0
>  	std	r0,16(r1)
>  
> -BEGIN_FTR_SECTION
> -	/*
> -	 * This is the best time to turn AMR/IAMR off.
> -	 * key 0 is used in radix for supervisor<->user
> -	 * protection, but on hash key 0 is reserved
> -	 * ideally we want to enter with a clean state.
> -	 * NOTE, we rely on r0 being 0 from above.
> -	 */
> -	mtspr	SPRN_IAMR,r0
> -BEGIN_FTR_SECTION_NESTED(42)
> -	mtspr	SPRN_AMOR,r0
> -END_FTR_SECTION_NESTED_IFSET(CPU_FTR_HVMODE, 42)
> -END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
> -
>  	/* save regs for local vars on new stack.
>  	 * yes, we won't go back, but ...
>  	 */
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index b4184092172a..a124715f33ea 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -152,6 +152,9 @@ static void kexec_smp_down(void *arg)
>  	if (ppc_md.kexec_cpu_down)
>  		ppc_md.kexec_cpu_down(0, 1);
>  
> +	reset_kuap();
> +	reset_kuep();
> +
>  	kexec_smp_wait();
>  	/* NOTREACHED */
>  }
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index c58ad1049909..9673f4b74c9a 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -165,6 +165,9 @@ void mmu_cleanup_all(void)
>  		radix__mmu_cleanup_all();
>  	else if (mmu_hash_ops.hpte_clear_all)
>  		mmu_hash_ops.hpte_clear_all();
> +
> +	reset_kuap();
> +	reset_kuep();
>  }
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -- 
> 2.26.2
