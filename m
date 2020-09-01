Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B136258612
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 05:17:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgXL43XSBzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 13:17:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BgXGl0s4TzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 13:14:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3115330E;
 Mon, 31 Aug 2020 20:14:05 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FCD53F68F;
 Mon, 31 Aug 2020 20:14:00 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 02/13] powerpc/mm: Move setting pte specific flags to
 pfn_pte
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-3-aneesh.kumar@linux.ibm.com>
Message-ID: <5b3f0db6-09f6-3f40-c9fc-911814d691bb@arm.com>
Date: Tue, 1 Sep 2020 08:43:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-3-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/27/2020 01:34 PM, Aneesh Kumar K.V wrote:
> powerpc used to set the pte specific flags in set_pte_at(). This is different
> from other architectures. To be consistent with other architecture update
> pfn_pte to set _PAGE_PTE on ppc64. Also, drop now unused pte_mkpte.
> 
> We add a VM_WARN_ON() to catch the usage of calling set_pte_at() without setting
> _PAGE_PTE bit. We will remove that after a few releases.
> 
> With respect to huge pmd entries, pmd_mkhuge() takes care of adding the
> _PAGE_PTE bit.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 15 +++++++++------
>  arch/powerpc/include/asm/nohash/pgtable.h    |  5 -----
>  arch/powerpc/mm/pgtable.c                    |  5 -----
>  3 files changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 079211968987..2382fd516f6b 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -619,7 +619,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
>  	VM_BUG_ON(pfn >> (64 - PAGE_SHIFT));
>  	VM_BUG_ON((pfn << PAGE_SHIFT) & ~PTE_RPN_MASK);
>  
> -	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot));
> +	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot) | _PAGE_PTE);
>  }
>  
>  static inline unsigned long pte_pfn(pte_t pte)
> @@ -655,11 +655,6 @@ static inline pte_t pte_mkexec(pte_t pte)
>  	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_EXEC));
>  }
>  
> -static inline pte_t pte_mkpte(pte_t pte)
> -{
> -	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
> -}
> -
>  static inline pte_t pte_mkwrite(pte_t pte)
>  {
>  	/*
> @@ -823,6 +818,14 @@ static inline int pte_none(pte_t pte)
>  static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, pte_t pte, int percpu)
>  {
> +
> +	VM_WARN_ON(!(pte_raw(pte) & cpu_to_be64(_PAGE_PTE)));
> +	/*
> +	 * Keep the _PAGE_PTE added till we are sure we handle _PAGE_PTE
> +	 * in all the callers.
> +	 */
> +	 pte = __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
> +
>  	if (radix_enabled())
>  		return radix__set_pte_at(mm, addr, ptep, pte, percpu);
>  	return hash__set_pte_at(mm, addr, ptep, pte, percpu);
> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
> index 4b7c3472eab1..6277e7596ae5 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -140,11 +140,6 @@ static inline pte_t pte_mkold(pte_t pte)
>  	return __pte(pte_val(pte) & ~_PAGE_ACCESSED);
>  }
>  
> -static inline pte_t pte_mkpte(pte_t pte)
> -{
> -	return pte;
> -}
> -
>  static inline pte_t pte_mkspecial(pte_t pte)
>  {
>  	return __pte(pte_val(pte) | _PAGE_SPECIAL);
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 9c0547d77af3..ab57b07ef39a 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -184,9 +184,6 @@ void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  	 */
>  	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>  
> -	/* Add the pte bit when trying to set a pte */
> -	pte = pte_mkpte(pte);
> -
>  	/* Note: mm->context.id might not yet have been assigned as
>  	 * this context might not have been activated yet when this
>  	 * is called.
> @@ -275,8 +272,6 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
>  	 */
>  	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
>  
> -	pte = pte_mkpte(pte);
> -
>  	pte = set_pte_filter(pte);
>  
>  	val = pte_val(pte);
> 

There is one checkpatch.pl warning for this patch.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#6: 
powerpc used to set the pte specific flags in set_pte_at(). This is different

total: 0 errors, 1 warnings, 61 lines checked
