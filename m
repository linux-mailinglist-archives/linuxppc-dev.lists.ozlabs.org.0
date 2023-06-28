Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F57408F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:33:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J/Lmb8KL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrRy337Blz30gq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 13:33:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J/Lmb8KL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrRx96451z2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 13:33:01 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35S3R5MF031490;
	Wed, 28 Jun 2023 03:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1D2IgnxP/W0IGRc0cosKcy1lwiqM6/ThsXqEukVeAd0=;
 b=J/Lmb8KLkbU+cTn8Q2NTxBlv0QSSDzqPJKtWlYykKVYStFo3i5pzUpUnVnYCrODQzWfH
 NNDx5m44tPTovMUcDHDUVxfPrF3RJwkJkl7V7+ejE2KgxxT8Ymh3yo2zFgyQ/AsBjQLl
 7bSe+AuJxuqHq0beuSr4KsqekROd4zSHIM4KssTs2y4pyw4bYNoG8EEHdvQJtxX5WKp1
 ui2jHHbGD8jcu+GdJjdYYoWR/tq7nxhlHLLERWe6eHgN8cShreRaRPLSOwUo1Ua6VL9W
 psNvOAu6sh+QwRqIkoOZhVF4rg22OO40i+ksXVErSxFgNxkU19vLs/KwlywJ6eXM9HIl XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgcyer2f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:32:39 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35S3Rflc032162;
	Wed, 28 Jun 2023 03:32:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgcyer29h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:32:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35R5tgT6024494;
	Wed, 28 Jun 2023 03:32:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rdqre2a5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:32:27 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35S3WPo425297506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jun 2023 03:32:25 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67BD520043;
	Wed, 28 Jun 2023 03:32:25 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BA9220040;
	Wed, 28 Jun 2023 03:32:22 +0000 (GMT)
Received: from [9.43.54.216] (unknown [9.43.54.216])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Jun 2023 03:32:21 +0000 (GMT)
Message-ID: <0d8633f2-69de-c178-fe03-49742b063962@linux.ibm.com>
Date: Wed, 28 Jun 2023 09:02:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 13/16] powerpc/book3s64/mm: Enable transparent pud
 hugepage
Content-Language: en-US
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <87ttusnzv5.fsf@doe.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <87ttusnzv5.fsf@doe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VoNBXqn4IHdJlU6DjjP3_6JIu3dw4MXW
X-Proofpoint-ORIG-GUID: paP1SS37B0GupJmKqrXNL-dV6ORoCMK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_16,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306280032
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/28/23 6:53 AM, Ritesh Harjani (IBM) wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

....

>>  
>>  static inline pmd_t radix__pmd_mkdevmap(pmd_t pmd)
>> @@ -292,9 +320,18 @@ static inline pmd_t radix__pmd_mkdevmap(pmd_t pmd)
>>  	return __pmd(pmd_val(pmd) | (_PAGE_PTE | _PAGE_DEVMAP));
>>  }
>>  
>> +static inline pud_t radix__pud_mkdevmap(pud_t pud)
>> +{
>> +	return __pud(pud_val(pud) | (_PAGE_PTE | _PAGE_DEVMAP));
>> +}
>> +
>> +struct vmem_altmap;
>> +struct dev_pagemap;
> 
> Minor nit.
> I guess this struct dev_pagemap is meant to be added in a later patch.

Moved that change to a later patch.

> 
>>  extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
>>  					     unsigned long page_size,
>>  					     unsigned long phys);
>> +int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end,
>> +				      int node, struct vmem_altmap *altmap);
>>  extern void radix__vmemmap_remove_mapping(unsigned long start,
>>  				    unsigned long page_size);
>>  
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>> index 77797a2a82eb..a38542259fab 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>> @@ -68,6 +68,8 @@ void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
>>  				      unsigned long end, int psize);
>>  extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
>>  				       unsigned long start, unsigned long end);
>> +extern void radix__flush_pud_tlb_range(struct vm_area_struct *vma,
>> +				       unsigned long start, unsigned long end);
>>  extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>  			    unsigned long end);
>>  extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> index 0d0c1447ecf0..a01c20a8fbf7 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> @@ -50,6 +50,14 @@ static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
>>  		radix__flush_pmd_tlb_range(vma, start, end);
>>  }
>>  
>> +#define __HAVE_ARCH_FLUSH_PUD_TLB_RANGE
>> +static inline void flush_pud_tlb_range(struct vm_area_struct *vma,
>> +				       unsigned long start, unsigned long end)
>> +{
>> +	if (radix_enabled())
>> +		radix__flush_pud_tlb_range(vma, start, end);
>> +}
>> +
>>  #define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
>>  static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>>  					   unsigned long start,
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> index 85c84e89e3ea..9e5f01a1738c 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -64,11 +64,39 @@ int pmdp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
>>  	return changed;
>>  }
>>  
>> +int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
>> +			  pud_t *pudp, pud_t entry, int dirty)
>> +{
>> +	int changed;
>> +#ifdef CONFIG_DEBUG_VM
>> +	WARN_ON(!pud_devmap(*pudp));
> 
> just a query -
> for pmdp_set_access_flags() we had
> WARN_ON(!pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
> 
> so why don't we require the same check here?
> 

Because we don't support generic anon PUD level THP. and we want to catch a wrong usage.

>> +	assert_spin_locked(pud_lockptr(vma->vm_mm, pudp));
>> +#endif
>> +	changed = !pud_same(*(pudp), entry);
>> +	if (changed) {
>> +		/*
>> +		 * We can use MMU_PAGE_2M here, because only radix
> 
> s/MMU_PAGE_2M/MMY_PAGE_1G
> 

updated

>> +		 * path look at the psize.
>> +		 */
>> +		__ptep_set_access_flags(vma, pudp_ptep(pudp),
>> +					pud_pte(entry), address, MMU_PAGE_1G);
>> +	}
>> +	return changed;
>> +}
>> +
>> +
>>  int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>>  			      unsigned long address, pmd_t *pmdp)
>>  {
>>  	return __pmdp_test_and_clear_young(vma->vm_mm, address, pmdp);
>>  }
>> +
>> +int pudp_test_and_clear_young(struct vm_area_struct *vma,
>> +			      unsigned long address, pud_t *pudp)
>> +{
>> +	return __pudp_test_and_clear_young(vma->vm_mm, address, pudp);
>> +}
>> +
>>  /*
>>   * set a new huge pmd. We should not be called for updating
>>   * an existing pmd entry. That should go via pmd_hugepage_update.
>> @@ -90,6 +118,23 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>>  	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
>>  }
>>  
>> +void set_pud_at(struct mm_struct *mm, unsigned long addr,
>> +		pud_t *pudp, pud_t pud)
>> +{
>> +#ifdef CONFIG_DEBUG_VM
>> +	/*
>> +	 * Make sure hardware valid bit is not set. We don't do
>> +	 * tlb flush for this update.
>> +	 */
>> +
>> +	WARN_ON(pte_hw_valid(pud_pte(*pudp)));
> 
> For set_pmd_at() we had
> WARN_ON(pte_hw_valid(pmd_pte(*pmdp)) && !pte_protnone(pmd_pte(*pmdp)));
> 
> Could you please help me understand why is it different for set_pud_at()
> 
> 

There is no numa fault support for devdax pages and we want to catch wrong usage.

>> +	assert_spin_locked(pud_lockptr(mm, pudp));
>> +	WARN_ON(!(pud_large(pud)));
>> +#endif
>> +	trace_hugepage_set_pud(addr, pud_val(pud));
>> +	return set_pte_at(mm, addr, pudp_ptep(pudp), pud_pte(pud));
>> +}
>> +
>>  static void do_serialize(void *arg)
>>  {
>>  	/* We've taken the IPI, so try to trim the mask while here */
>> @@ -147,11 +192,35 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
>>  	return pmd;
>>  }
>>  
>> +pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
>> +				   unsigned long addr, pud_t *pudp, int full)
>> +{
>> +	pud_t pud;
>> +
>> +	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
>> +	VM_BUG_ON((pud_present(*pudp) && !pud_devmap(*pudp)) ||
>> +		  !pud_present(*pudp));
>> +	pud = pudp_huge_get_and_clear(vma->vm_mm, addr, pudp);
>> +	/*
>> +	 * if it not a fullmm flush, then we can possibly end up converting
>> +	 * this PMD pte entry to a regular level 0 PTE by a parallel page fault.
>> +	 * Make sure we flush the tlb in this case.
>> +	 */
>> +	if (!full)
>> +		flush_pud_tlb_range(vma, addr, addr + HPAGE_PUD_SIZE);
>> +	return pud;
>> +}
>> +
>>  static pmd_t pmd_set_protbits(pmd_t pmd, pgprot_t pgprot)
>>  {
>>  	return __pmd(pmd_val(pmd) | pgprot_val(pgprot));
>>  }
>>  
>> +static pud_t pud_set_protbits(pud_t pud, pgprot_t pgprot)
>> +{
>> +	return __pud(pud_val(pud) | pgprot_val(pgprot));
>> +}
>> +
>>  /*
>>   * At some point we should be able to get rid of
>>   * pmd_mkhuge() and mk_huge_pmd() when we update all the
>> @@ -166,6 +235,15 @@ pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>  	return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
>>  }
>>  
>> +pud_t pfn_pud(unsigned long pfn, pgprot_t pgprot)
>> +{
>> +	unsigned long pudv;
>> +
>> +	pudv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
>> +
>> +	return __pud_mkhuge(pud_set_protbits(__pud(pudv), pgprot));
>> +}
>> +
>>  pmd_t mk_pmd(struct page *page, pgprot_t pgprot)
>>  {
>>  	return pfn_pmd(page_to_pfn(page), pgprot);
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index 76f6a1f3b9d8..d7e2dd3d4add 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -965,6 +965,23 @@ unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long add
>>  	return old;
>>  }
>>  
>> +unsigned long radix__pud_hugepage_update(struct mm_struct *mm, unsigned long addr,
>> +					 pud_t *pudp, unsigned long clr,
>> +					 unsigned long set)
>> +{
>> +	unsigned long old;
>> +
>> +#ifdef CONFIG_DEBUG_VM
>> +	WARN_ON(!pud_devmap(*pudp));
>> +	assert_spin_locked(pud_lockptr(mm, pudp));
>> +#endif
>> +
>> +	old = radix__pte_update(mm, addr, pudp_ptep(pudp), clr, set, 1);
>> +	trace_hugepage_update(addr, old, clr, set);
> 
> Here, we are using the same trace event for both pmd and pud update.
> See the comment in the end.
> 


updated

>> +
>> +	return old;
>> +}
>> +
>>  pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
>>  			pmd_t *pmdp)
>>  
>> @@ -1041,6 +1058,17 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
>>  	return old_pmd;
>>  }
>>  
>> +pud_t radix__pudp_huge_get_and_clear(struct mm_struct *mm,
>> +				     unsigned long addr, pud_t *pudp)
>> +{
>> +	pud_t old_pud;
>> +	unsigned long old;
>> +
>> +	old = radix__pud_hugepage_update(mm, addr, pudp, ~0UL, 0);
>> +	old_pud = __pud(old);
>> +	return old_pud;
>> +}
>> +
>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>  
>>  void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
>> index ce804b7bf84e..a18f7d2c9f63 100644
>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>> @@ -1453,6 +1453,13 @@ void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
>>  }
>>  EXPORT_SYMBOL(radix__flush_pmd_tlb_range);
>>  
>> +void radix__flush_pud_tlb_range(struct vm_area_struct *vma,
>> +				unsigned long start, unsigned long end)
>> +{
>> +	radix__flush_tlb_range_psize(vma->vm_mm, start, end, MMU_PAGE_1G);
>> +}
>> +EXPORT_SYMBOL(radix__flush_pud_tlb_range);
>> +
>>  void radix__flush_tlb_all(void)
>>  {
>>  	unsigned long rb,prs,r,rs;
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
>> index 45fd975ef521..340b86ef7284 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -94,6 +94,7 @@ config PPC_BOOK3S_64
>>  	select PPC_FPU
>>  	select PPC_HAVE_PMU_SUPPORT
>>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>> +	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
>>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>> diff --git a/include/trace/events/thp.h b/include/trace/events/thp.h
>> index 202b3e3e67ff..a919d943d106 100644
>> --- a/include/trace/events/thp.h
>> +++ b/include/trace/events/thp.h
>> @@ -25,6 +25,23 @@ TRACE_EVENT(hugepage_set_pmd,
>>  	    TP_printk("Set pmd with 0x%lx with 0x%lx", __entry->addr, __entry->pmd)
>>  );
>>  
>> +TRACE_EVENT(hugepage_set_pud,
> 
> Given we have trace_hugepage_set_pud and trace_hugepage_set_pmd, doing
> the exact same thing, we can as well have a
> DECLARE_EVENT_CLASS(hugepage_set) and then DEFINE_EVENT using this event class.
> 
>> +
>> +	    TP_PROTO(unsigned long addr, unsigned long pud),
>> +	    TP_ARGS(addr, pud),
>> +	    TP_STRUCT__entry(
>> +		    __field(unsigned long, addr)
>> +		    __field(unsigned long, pud)
>> +			    ),
>> +
>> +	    TP_fast_assign(
>> +		    __entry->addr = addr;
>> +		    __entry->pud = pud;
>> +		    ),
>> +
>> +	    TP_printk("Set pud with 0x%lx with 0x%lx", __entry->addr, __entry->pud)
>> +	);
>> +
>>  
>>  TRACE_EVENT(hugepage_update,
> 
> Same here. We can have a DECLARE_EVENT_CLASS(hugepage_update) and then
> DEFINE_EVENT for hugepage_update_pmd and hugepage_update_pud.

updated. I  created a patch that first switch  the existing tracepoint to DECLARE_EVENT_CLASS.

-aneesh

