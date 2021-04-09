Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A823598FE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:19:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGsyZ4tdJz3byB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:19:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGsyF0cdDz30J5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:19:00 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGsy92WK2z9vBLl;
 Fri,  9 Apr 2021 11:18:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VIGbBDxwdmtv; Fri,  9 Apr 2021 11:18:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGsy917Ksz9vBLh;
 Fri,  9 Apr 2021 11:18:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 485A68B7E0;
 Fri,  9 Apr 2021 11:18:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 49eHvFWmlrR0; Fri,  9 Apr 2021 11:18:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5851C8B7DE;
 Fri,  9 Apr 2021 11:18:57 +0200 (CEST)
Subject: Re: [PATCH v3 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
 <20210330060752.592769-6-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <edcedef1-b4ab-3f5d-e467-ac55dd171013@csgroup.eu>
Date: Fri, 9 Apr 2021 11:18:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330060752.592769-6-aneesh.kumar@linux.ibm.com>
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
Cc: joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2021 à 08:07, Aneesh Kumar K.V a écrit :
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   .../include/asm/book3s/64/tlbflush-radix.h    | 19 ++++++++-------
>   arch/powerpc/include/asm/book3s/64/tlbflush.h | 23 +++++++++++++++----
>   arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  4 ++--
>   arch/powerpc/mm/book3s64/radix_tlb.c          | 23 ++++++++-----------
>   4 files changed, 42 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> index 8b33601cdb9d..90c91f7b526f 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> @@ -56,15 +56,18 @@ static inline void radix__flush_all_lpid_guest(unsigned int lpid)
>   }
>   #endif
>   
> -extern void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> -					   unsigned long start, unsigned long end);
> -extern void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
> -					 unsigned long end, int psize);
> -extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
> -				       unsigned long start, unsigned long end);
> -extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> +				    unsigned long start, unsigned long end,
> +				    bool also_pwc);

No sure 'also_pwc' is a nice name.

What about 'flush_pwc' ?


> +void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
> +				unsigned long start, unsigned long end,
> +				bool also_pwc);
> +void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
> +				      unsigned long end, int psize, bool also_pwc);
> +void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   			    unsigned long end);
> -extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
> +void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
> +
>   
>   extern void radix__local_flush_tlb_mm(struct mm_struct *mm);
>   extern void radix__local_flush_all_mm(struct mm_struct *mm);
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> index 215973b4cb26..efe5336e2b6f 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
>   		hash__tlbiel_all(TLB_INVAL_SCOPE_LPID);
>   }
>   
> +static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
> +					   unsigned long start,
> +					   unsigned long end,
> +					   bool also_pwc)
> +{
> +	if (radix_enabled())
> +		return radix__flush_pmd_tlb_range(vma, start, end, also_pwc);
> +	return hash__flush_tlb_range(vma, start, end);
> +}
>   
>   #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>   static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
>   				       unsigned long start, unsigned long end)
> +{
> +	return flush_pmd_tlb_pwc_range(vma, start, end, false);
> +}
> +
> +static inline void flush_hugetlb_tlb_pwc_range(struct vm_area_struct *vma,
> +					       unsigned long start,
> +					       unsigned long end,
> +					       bool also_pwc)
>   {
>   	if (radix_enabled())
> -		return radix__flush_pmd_tlb_range(vma, start, end);
> +		return radix__flush_hugetlb_tlb_range(vma, start, end, also_pwc);
>   	return hash__flush_tlb_range(vma, start, end);
>   }
>   
> @@ -60,9 +77,7 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>   					   unsigned long start,
>   					   unsigned long end)
>   {
> -	if (radix_enabled())
> -		return radix__flush_hugetlb_tlb_range(vma, start, end);
> -	return hash__flush_tlb_range(vma, start, end);
> +	return flush_hugetlb_tlb_pwc_range(vma, start, end, false);
>   }
>   
>   static inline void flush_tlb_range(struct vm_area_struct *vma,
> diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> index cb91071eef52..55c5c9c39ae2 100644
> --- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> @@ -26,13 +26,13 @@ void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigned long v
>   }
>   
>   void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long start,
> -				   unsigned long end)
> +				    unsigned long end, bool also_pwc)
>   {
>   	int psize;
>   	struct hstate *hstate = hstate_file(vma->vm_file);
>   
>   	psize = hstate_get_psize(hstate);
> -	radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
> +	radix__flush_tlb_pwc_range_psize(vma->vm_mm, start, end, psize, also_pwc);
>   }
>   
>   /*
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 817a02ef6032..416fe9b48e14 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1090,7 +1090,7 @@ void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   {
>   #ifdef CONFIG_HUGETLB_PAGE
>   	if (is_vm_hugetlb_page(vma))
> -		return radix__flush_hugetlb_tlb_range(vma, start, end);
> +		return radix__flush_hugetlb_tlb_range(vma, start, end, false);
>   #endif
>   
>   	__radix__flush_tlb_range(vma->vm_mm, start, end);
> @@ -1151,9 +1151,6 @@ void radix__flush_all_lpid_guest(unsigned int lpid)
>   	_tlbie_lpid_guest(lpid, RIC_FLUSH_ALL);
>   }
>   
> -static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
> -				  unsigned long end, int psize);
> -
>   void radix__tlb_flush(struct mmu_gather *tlb)
>   {
>   	int psize = 0;
> @@ -1177,10 +1174,8 @@ void radix__tlb_flush(struct mmu_gather *tlb)
>   		else
>   			radix__flush_all_mm(mm);
>   	} else {
> -		if (!tlb->freed_tables)
> -			radix__flush_tlb_range_psize(mm, start, end, psize);
> -		else
> -			radix__flush_tlb_pwc_range_psize(mm, start, end, psize);
> +		radix__flush_tlb_pwc_range_psize(mm, start,
> +						 end, psize, tlb->freed_tables);
>   	}
>   }
>   
> @@ -1260,10 +1255,10 @@ void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
>   	return __radix__flush_tlb_range_psize(mm, start, end, psize, false);
>   }
>   
> -static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
> -				  unsigned long end, int psize)
> +void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
> +				      unsigned long end, int psize, bool also_pwc)
>   {
> -	__radix__flush_tlb_range_psize(mm, start, end, psize, true);
> +	__radix__flush_tlb_range_psize(mm, start, end, psize, also_pwc);
>   }
>   
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> @@ -1315,9 +1310,11 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
>   void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
> -				unsigned long start, unsigned long end)
> +				unsigned long start, unsigned long end,
> +				bool also_pwc)
>   {
> -	radix__flush_tlb_range_psize(vma->vm_mm, start, end, MMU_PAGE_2M);
> +	__radix__flush_tlb_range_psize(vma->vm_mm, start,
> +				       end, MMU_PAGE_2M, also_pwc);
>   }
>   EXPORT_SYMBOL(radix__flush_pmd_tlb_range);
>   
> 
