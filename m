Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0733365119
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 05:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPV5W5Yx2z30BN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ifDcvMtL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ifDcvMtL; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPV553GPPz2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:47:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPV5300Qtz9vDk;
 Tue, 20 Apr 2021 13:47:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618890471;
 bh=dzX0AONR3rVVRmA3Bml1sXuJR87hajtjlzDDZwg+F/4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ifDcvMtLMoFGMG44uawsaQegbQSLx4J2mkoxK2SCLaTbftjGO7IeYPOQKI/c3YRPA
 otiUG9asxlb/iRdLYO+oBJTSmbMqgKuz0csFWdUQCwz8c33q2anATHhB9jJUwlh4q8
 SOPnsf9aWFZfk04ccVw+rmnt+GRBjgTJOUDWi9dIfyxLZtCVW0809IpUdcdmrXcdgU
 c2pXjHkmwmfpi7mpZm2g8cWyZOjaZPZZsdaSi60BduQ2KoDv5j8DlfNNDj/d0JYXIa
 R33GkVsqFzdzID3G4HNDADD/98Ey9fIymKU9BsSvNmgY8g3JE1bF3l6E7ZoFkSPC3t
 NiK5vle4RW1IA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH v4 6/9] mm/mremap: Use range flush that does TLB and
 page walk cache flush
In-Reply-To: <20210414085915.301189-7-aneesh.kumar@linux.ibm.com>
References: <20210414085915.301189-1-aneesh.kumar@linux.ibm.com>
 <20210414085915.301189-7-aneesh.kumar@linux.ibm.com>
Date: Tue, 20 Apr 2021 13:47:50 +1000
Message-ID: <87fszld3bt.fsf@mpe.ellerman.id.au>
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
Cc: joel@joelfernandes.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Some architectures do have the concept of page walk cache which need
> to be flush when updating higher levels of page tables. A fast mremap
> that involves moving page table pages instead of copying pte entries
> should flush page walk cache since the old translation cache is no more
> valid.
>
> Add new helper flush_pte_tlb_pwc_range() which invalidates both TLB and
> page walk cache where TLB entries are mapped with page size PAGE_SIZE.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/tlbflush.h | 11 +++++++++++
>  mm/mremap.c                                   | 15 +++++++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> index f9f8a3a264f7..c236b66f490b 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -80,6 +80,17 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>  	return flush_hugetlb_tlb_pwc_range(vma, start, end, false);
>  }
>  
> +#define flush_pte_tlb_pwc_range flush_tlb_pwc_range
> +static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
> +					   unsigned long start, unsigned long end,
> +					   bool also_pwc)

This still uses the also_pwc name, which is a bit inconsistent with the
previous patch.

But, does it even need to be a parameter? AFAICS you always pass true,
and pwc=true is sort of implied by the name isn't it?

cheers

> +{
> +	if (radix_enabled())
> +		return radix__flush_tlb_pwc_range_psize(vma->vm_mm, start,
> +							end, mmu_virtual_psize, also_pwc);
> +	return hash__flush_tlb_range(vma, start, end);
> +}
> +
>  static inline void flush_tlb_range(struct vm_area_struct *vma,
>  				   unsigned long start, unsigned long end)
>  {
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 574287f9bb39..0e7b11daafee 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -210,6 +210,17 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
>  		drop_rmap_locks(vma);
>  }
>  
> +#ifndef flush_pte_tlb_pwc_range
> +#define flush_pte_tlb_pwc_range flush_pte_tlb_pwc_range
> +static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
> +					   unsigned long start,
> +					   unsigned long end,
> +					   bool also_pwc)
> +{
> +	return flush_tlb_range(vma, start, end);
> +}
> +#endif
> +
>  #ifdef CONFIG_HAVE_MOVE_PMD
>  static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>  		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
> @@ -260,7 +271,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>  	VM_BUG_ON(!pmd_none(*new_pmd));
>  	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
>  
> -	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
> +	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE, true);
>  	if (new_ptl != old_ptl)
>  		spin_unlock(new_ptl);
>  	spin_unlock(old_ptl);
> @@ -307,7 +318,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
>  	VM_BUG_ON(!pud_none(*new_pud));
>  
>  	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
> -	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
> +	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PUD_SIZE, true);
>  	if (new_ptl != old_ptl)
>  		spin_unlock(new_ptl);
>  	spin_unlock(old_ptl);
> -- 
> 2.30.2
