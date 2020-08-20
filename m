Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A424C0BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 16:39:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXS2T6VjdzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 00:38:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXRvz1VrszDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 00:33:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BXRvk3Rf6z9vD3m;
 Thu, 20 Aug 2020 16:33:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nQSbO1N6odEA; Thu, 20 Aug 2020 16:33:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BXRvk2SGBz9vD3l;
 Thu, 20 Aug 2020 16:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F21BE8B860;
 Thu, 20 Aug 2020 16:33:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ru8Mj5dwt87n; Thu, 20 Aug 2020 16:33:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 831998B764;
 Thu, 20 Aug 2020 16:33:07 +0200 (CEST)
Subject: Re: [PATCH v2 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use
 set_*_at to update an existing pte entry
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <20200819130107.478414-8-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b21d1dbb-7439-d317-8516-94c80f333e92@csgroup.eu>
Date: Thu, 20 Aug 2020 16:32:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819130107.478414-8-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2020 à 15:01, Aneesh Kumar K.V a écrit :
> set_pte_at() should not be used to set a pte entry at locations that
> already holds a valid pte entry. Architectures like ppc64 don't do TLB
> invalidate in set_pte_at() and hence expect it to be used to set locations
> that are not a valid PTE.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/debug_vm_pgtable.c | 35 +++++++++++++++--------------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 76f4c713e5a3..9c7e2c9cfc76 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -74,15 +74,18 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>   {
>   	pte_t pte = pfn_pte(pfn, prot);
>   
> +	/*
> +	 * Architectures optimize set_pte_at by avoiding TLB flush.
> +	 * This requires set_pte_at to be not used to update an
> +	 * existing pte entry. Clear pte before we do set_pte_at
> +	 */
> +
>   	pr_debug("Validating PTE advanced\n");
>   	pte = pfn_pte(pfn, prot);
>   	set_pte_at(mm, vaddr, ptep, pte);
>   	ptep_set_wrprotect(mm, vaddr, ptep);
>   	pte = ptep_get(ptep);
>   	WARN_ON(pte_write(pte));
> -
> -	pte = pfn_pte(pfn, prot);
> -	set_pte_at(mm, vaddr, ptep, pte);
>   	ptep_get_and_clear(mm, vaddr, ptep);
>   	pte = ptep_get(ptep);
>   	WARN_ON(!pte_none(pte));
> @@ -96,13 +99,11 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>   	ptep_set_access_flags(vma, vaddr, ptep, pte, 1);
>   	pte = ptep_get(ptep);
>   	WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
> -
> -	pte = pfn_pte(pfn, prot);
> -	set_pte_at(mm, vaddr, ptep, pte);
>   	ptep_get_and_clear_full(mm, vaddr, ptep, 1);
>   	pte = ptep_get(ptep);
>   	WARN_ON(!pte_none(pte));
>   
> +	pte = pfn_pte(pfn, prot);
>   	pte = pte_mkyoung(pte);
>   	set_pte_at(mm, vaddr, ptep, pte);
>   	ptep_test_and_clear_young(vma, vaddr, ptep);
> @@ -164,9 +165,6 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>   	pmdp_set_wrprotect(mm, vaddr, pmdp);
>   	pmd = READ_ONCE(*pmdp);
>   	WARN_ON(pmd_write(pmd));
> -
> -	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
> -	set_pmd_at(mm, vaddr, pmdp, pmd);
>   	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>   	pmd = READ_ONCE(*pmdp);
>   	WARN_ON(!pmd_none(pmd));
> @@ -180,13 +178,11 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>   	pmdp_set_access_flags(vma, vaddr, pmdp, pmd, 1);
>   	pmd = READ_ONCE(*pmdp);
>   	WARN_ON(!(pmd_write(pmd) && pmd_dirty(pmd)));
> -
> -	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
> -	set_pmd_at(mm, vaddr, pmdp, pmd);
>   	pmdp_huge_get_and_clear_full(vma, vaddr, pmdp, 1);
>   	pmd = READ_ONCE(*pmdp);
>   	WARN_ON(!pmd_none(pmd));
>   
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>   	pmd = pmd_mkyoung(pmd);
>   	set_pmd_at(mm, vaddr, pmdp, pmd);
>   	pmdp_test_and_clear_young(vma, vaddr, pmdp);
> @@ -283,18 +279,10 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>   	WARN_ON(pud_write(pud));
>   
>   #ifndef __PAGETABLE_PMD_FOLDED

Same as below, once set_put_at() is gone, I don't think this #ifndef 
__PAGETABLE_PMD_FOLDED is still need, should be possible to replace by 
'if (mm_pmd_folded())'

> -
> -	pud = pud_mkhuge(pfn_pud(pfn, prot));
> -	set_pud_at(mm, vaddr, pudp, pud);
>   	pudp_huge_get_and_clear(mm, vaddr, pudp);
>   	pud = READ_ONCE(*pudp);
>   	WARN_ON(!pud_none(pud));
>   
> -	pud = pud_mkhuge(pfn_pud(pfn, prot));
> -	set_pud_at(mm, vaddr, pudp, pud);
> -	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
> -	pud = READ_ONCE(*pudp);
> -	WARN_ON(!pud_none(pud));
>   #endif /* __PAGETABLE_PMD_FOLDED */
>   
>   	pud = pud_mkhuge(pfn_pud(pfn, prot));
> @@ -307,6 +295,13 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>   	pud = READ_ONCE(*pudp);
>   	WARN_ON(!(pud_write(pud) && pud_dirty(pud)));
>   
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	pudp_huge_get_and_clear_full(vma, vaddr, pudp, 1);
> +	pud = READ_ONCE(*pudp);
> +	WARN_ON(!pud_none(pud));
> +#endif /* __PAGETABLE_PMD_FOLDED */

pudp_huge_get_and_clear_full() and pud_none() are always defined, I 
think this #ifndef can be replaced by an 'if (mm_pmd_folded())'

> +
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>   	pud = pud_mkyoung(pud);
>   	set_pud_at(mm, vaddr, pudp, pud);
>   	pudp_test_and_clear_young(vma, vaddr, pudp);
> 

Christophe
