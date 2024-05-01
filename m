Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8D78B85D4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 09:04:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dx+m61Cb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTp2j1Nk1z3cRr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 17:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dx+m61Cb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTp1v5DVVz3bsj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 17:03:29 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso5414827a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2024 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714547007; x=1715151807; darn=lists.ozlabs.org;
        h=in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MgCUWlvN3cDUOvSQIntO6X4LFaPF+2+gzIBsSOK7abM=;
        b=dx+m61CbnCrqxOK2K8eG0QBnPwOxh0fwUSlvhuumzMLx05Qi8wwcpreMFxvMoRYxl3
         7CqzNbBng1EROAqYJjHfzVXncB1mgCJ9Yzg3b2eSEyTXizuNajxlZrGAj81mgg6enr3u
         xDfloZj7fuPAiXOFB4VqDrQe4MvKaOl8SjPVq9ETMuQz28Qlmz2lsFzMXHn+3DX408SM
         vEaCzRlxqRBPPVI6LQ1OUzq9pLMSzPIbY/Q/NQvEOlTiRMXWXrPLZqaUBMKAQ2no3n4M
         R1kvrO3aeI9G5uy9FQNUb7wi86WJGy51DgiOrJIDYtXEgF/6P2N0aJjPBpGnF5vEMIZZ
         9PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714547007; x=1715151807;
        h=in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MgCUWlvN3cDUOvSQIntO6X4LFaPF+2+gzIBsSOK7abM=;
        b=LPTz4VVq9WAMqJi8C0OYCJprImwy0uN0izId5Ka+sGxczYCXAZtje0PLw3SHX8r9RO
         2yxRaerRaj9eyrvBkEl1ttCQQ9WMrEeWRThZW8CKpfHJTD6/xtXZ2JYrp1aCeZev3+RC
         qeuFUDLDJCYsB/lASeLt+U8RUEDzchJcZSjptHbuZX4AyKeP5tH44es/kik05S8OFVNn
         2F2sExMd+QdrO6yvTOqeitIUA+MTeRqPkcBiHTN6yTCJML3uGrZECddK8GDXmwvUYzDq
         uzRwl+/tvyJ8xqwAJzSLVgK4o8wY31c/5+KXKydOrdVAtzfsvMG1Krfz1goCYFGIktmg
         ivrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdk1xr8Qux9MtDci+b7GI6UfVmQN2i8mtrRfhlsaupjfzJz/GXDJcieeHyZ94qWz6w85sN3jQXaGBgb1wt55SZH4ZigUDaGYQUN8ApYw==
X-Gm-Message-State: AOJu0YxnGFNz/8BiG0uGWvQ6svsGbuDbAxorr2zJ1qAS2kjWIap5vKiD
	wjR779+nokUQUl8ut49KUtkTPvxefIoKnqcwny17Mt5z+ionpAw/B4yv1A==
X-Google-Smtp-Source: AGHT+IEnN54vUn5SqgdXVkVBLYxlgyhlOykF8ulsTaolcT3/KMeT1IO8+wtuwlT8EKPiNkk4JfT59A==
X-Received: by 2002:a05:6a20:394c:b0:1aa:755f:1746 with SMTP id r12-20020a056a20394c00b001aa755f1746mr2804424pzg.22.1714547006439;
        Wed, 01 May 2024 00:03:26 -0700 (PDT)
Received: from dw-tp ([171.76.84.250])
        by smtp.gmail.com with ESMTPSA id gu27-20020a056a004e5b00b006ee25097c2csm19568506pfb.103.2024.05.01.00.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 00:03:25 -0700 (PDT)
Date: Wed, 01 May 2024 12:33:21 +0530
Message-Id: <87o79q3tfq.fsf@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] radix/kfence: support late __kfence_pool allocation
In-Reply-To: <20240424110926.184077-2-hbathini@linux.ibm.com>
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
Cc: Marco Elver <elver@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Potapenko <glider@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:

> With commit b33f778bba5ef ("kfence: alloc kfence_pool after system
> startup"), KFENCE pool can be allocated after system startup via the
> page allocator. This can lead to problems as all memory is not mapped
> at page granularity anymore with CONFIG_KFENCE. Address this by direct
> mapping all memory at PMD level and split the mapping for PMD pages
> that overlap with __kfence_pool to page level granularity if and when
> __kfence_pool is allocated after system startup.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/radix.h |  2 +
>  arch/powerpc/include/asm/kfence.h          | 14 +++++-
>  arch/powerpc/mm/book3s64/radix_pgtable.c   | 50 +++++++++++++++++++++-
>  3 files changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 8f55ff74bb68..0423ddbcf73c 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -340,6 +340,8 @@ extern void radix__vmemmap_remove_mapping(unsigned long start,
>  extern int radix__map_kernel_page(unsigned long ea, unsigned long pa,
>  				 pgprot_t flags, unsigned int psz);
>  
> +extern bool radix_kfence_init_pool(void);
> +
>  static inline unsigned long radix__get_tree_size(void)
>  {
>  	unsigned long rts_field;
> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
> index 18ec2b06ba1e..c5d2fb2f9ecb 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -18,12 +18,24 @@
>  
>  #ifdef CONFIG_KFENCE
>  extern bool kfence_early_init;
> -#endif
> +
> +static inline bool kfence_alloc_pool_late(void)
> +{
> +	return !kfence_early_init;
> +}

Minor nit, but do we need kfence_alloc_pool_late()?
The function name looks confusing. Can we not just use
!kfence_early_init? If not then maybe bool kfence_late_init?

>  
>  static inline bool arch_kfence_init_pool(void)
>  {
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (radix_enabled())
> +		return radix_kfence_init_pool();

Can we directly check...
        if (radix_enabled() && !kfence_early_init)
... instead of embedding the check inside radix_kfence_late_init_pool()

> +#endif
> +
>  	return true;
>  }
> +#else
> +static inline bool kfence_alloc_pool_late(void) { return false; }
> +#endif
>  
>  #ifdef CONFIG_PPC64
>  static inline bool kfence_protect_page(unsigned long addr, bool protect)
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index fccbf92f279b..f4374e3e31e1 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -253,6 +253,53 @@ void radix__mark_initmem_nx(void)
>  }
>  #endif /* CONFIG_STRICT_KERNEL_RWX */
>  
> +#ifdef CONFIG_KFENCE
> +static inline int radix_split_pmd_page(pmd_t *pmd, unsigned long addr)
> +{
> +	pte_t *pte = pte_alloc_one_kernel(&init_mm);
> +	unsigned long pfn = PFN_DOWN(__pa(addr));

Minor nit. Since addr will always be page aligned, so maybe PHYS_PFN() is better
suited. Although it does not matter.

> +	int i;
> +
> +	if (!pte)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < PTRS_PER_PTE; i++) {
> +		__set_pte_at(&init_mm, addr, pte + i, pfn_pte(pfn + i, PAGE_KERNEL), 0);
> +		asm volatile("ptesync": : :"memory");
> +	}

Maybe a comment above the loop on why __set_pte_at() is ok for late
kfence init? and why not pte_update()? [1]

[1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/


> +	pmd_populate_kernel(&init_mm, pmd, pte);
> +
> +	flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> +	return 0;
> +}
> +
> +bool radix_kfence_init_pool(void)
> +{
> +	unsigned int page_psize, pmd_psize;
> +	unsigned long addr;
> +	pmd_t *pmd;
> +
> +	if (!kfence_alloc_pool_late())
> +		return true;
> +
> +	page_psize = shift_to_mmu_psize(PAGE_SHIFT);
> +	pmd_psize = shift_to_mmu_psize(PMD_SHIFT);
> +	for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
> +	     addr += PAGE_SIZE) {
> +		pmd = pmd_off_k(addr);
> +
> +		if (pmd_leaf(*pmd)) {
> +			if (radix_split_pmd_page(pmd, addr & PMD_MASK))
> +				return false;
> +			update_page_count(pmd_psize, -1);
> +			update_page_count(page_psize, PTRS_PER_PTE);
> +		}
> +	}
> +
> +	return true;
> +}
> +#endif
> +
>  static inline void __meminit
>  print_mapping(unsigned long start, unsigned long end, unsigned long size, bool exec)
>  {
> @@ -391,7 +438,8 @@ static void __init radix_init_pgtable(void)
>  			continue;
>  		}
>  
> -		WARN_ON(create_physical_mapping(start, end, -1, PAGE_KERNEL, ~0UL));
> +		WARN_ON(create_physical_mapping(start, end, -1, PAGE_KERNEL,
> +						kfence_alloc_pool_late() ? PMD_SIZE : ~0UL));

So everytime we have !kfence_early_init to true, we always use PMD_SIZE. 
So do we never map 1G mapping for direct map? 

>  	}
>  
>  #ifdef CONFIG_KFENCE
> -- 
> 2.44.0
