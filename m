Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9AD25D0E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 07:36:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjRJ71mptzDrHs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 15:36:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjRG50bKyzDrHb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 15:35:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ABDC101E;
 Thu,  3 Sep 2020 22:35:06 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C1CB3F71F;
 Thu,  3 Sep 2020 22:35:04 -0700 (PDT)
Subject: Re: [PATCH v4 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use
 set_*_at to update an existing pte entry
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-8-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c02a243d-d26d-f62f-d212-ac69ac84d284@arm.com>
Date: Fri, 4 Sep 2020 11:04:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-8-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/02/2020 05:12 PM, Aneesh Kumar K.V wrote:
> set_pte_at() should not be used to set a pte entry at locations that
> already holds a valid pte entry. Architectures like ppc64 don't do TLB
> invalidate in set_pte_at() and hence expect it to be used to set locations
> that are not a valid PTE.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 35 +++++++++++++++--------------------
>  1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 9cafed39c236..de333871f407 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -79,15 +79,18 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>  {
>  	pte_t pte = pfn_pte(pfn, prot);
>  
> +	/*
> +	 * Architectures optimize set_pte_at by avoiding TLB flush.
> +	 * This requires set_pte_at to be not used to update an
> +	 * existing pte entry. Clear pte before we do set_pte_at
> +	 */
> +
>  	pr_debug("Validating PTE advanced\n");
>  	pte = pfn_pte(pfn, prot);
>  	set_pte_at(mm, vaddr, ptep, pte);
>  	ptep_set_wrprotect(mm, vaddr, ptep);
>  	pte = ptep_get(ptep);
>  	WARN_ON(pte_write(pte));
> -
> -	pte = pfn_pte(pfn, prot);
> -	set_pte_at(mm, vaddr, ptep, pte);
>  	ptep_get_and_clear(mm, vaddr, ptep);
>  	pte = ptep_get(ptep);
>  	WARN_ON(!pte_none(pte));
> @@ -101,13 +104,11 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>  	ptep_set_access_flags(vma, vaddr, ptep, pte, 1);
>  	pte = ptep_get(ptep);
>  	WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
> -
> -	pte = pfn_pte(pfn, prot);
> -	set_pte_at(mm, vaddr, ptep, pte);
>  	ptep_get_and_clear_full(mm, vaddr, ptep, 1);
>  	pte = ptep_get(ptep);
>  	WARN_ON(!pte_none(pte));
>  
> +	pte = pfn_pte(pfn, prot);
>  	pte = pte_mkyoung(pte);
>  	set_pte_at(mm, vaddr, ptep, pte);
>  	ptep_test_and_clear_young(vma, vaddr, ptep);
> @@ -169,9 +170,6 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	pmdp_set_wrprotect(mm, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(pmd_write(pmd));
> -
> -	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
> -	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(!pmd_none(pmd));
> @@ -185,13 +183,11 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	pmdp_set_access_flags(vma, vaddr, pmdp, pmd, 1);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(!(pmd_write(pmd) && pmd_dirty(pmd)));
> -
> -	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
> -	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_huge_get_and_clear_full(vma, vaddr, pmdp, 1);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(!pmd_none(pmd));
>  
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	pmd = pmd_mkyoung(pmd);
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_test_and_clear_young(vma, vaddr, pmdp);
> @@ -292,17 +288,9 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  	WARN_ON(pud_write(pud));
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> -	pud = pud_mkhuge(pfn_pud(pfn, prot));
> -	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_huge_get_and_clear(mm, vaddr, pudp);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(!pud_none(pud));
> -
> -	pud = pud_mkhuge(pfn_pud(pfn, prot));
> -	set_pud_at(mm, vaddr, pudp, pud);
> -	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
> -	pud = READ_ONCE(*pudp);
> -	WARN_ON(!pud_none(pud));
>  #endif /* __PAGETABLE_PMD_FOLDED */
>  
>  	pud = pud_mkhuge(pfn_pud(pfn, prot));
> @@ -315,6 +303,13 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(!(pud_write(pud) && pud_dirty(pud)));
>  
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
> +	pud = READ_ONCE(*pudp);
> +	WARN_ON(!pud_none(pud));
> +#endif /* __PAGETABLE_PMD_FOLDED */
> +
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	pud = pud_mkyoung(pud);
>  	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_test_and_clear_young(vma, vaddr, pudp);
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
