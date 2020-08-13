Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387524339B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 07:28:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRw8M1xMYzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 15:28:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRw6f1w5RzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 15:26:48 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D8A6D6E;
 Wed, 12 Aug 2020 22:26:45 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B17223F6CF;
 Wed, 12 Aug 2020 22:26:43 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 10/16] debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-10-aneesh.kumar@linux.ibm.com>
Message-ID: <40f2acb5-1da3-4c0a-5590-3fd12d128421@arm.com>
Date: Thu, 13 Aug 2020 10:55:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-10-aneesh.kumar@linux.ibm.com>
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

On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
> Architectures like ppc64 use deposited page table while updating the huge pte
> entries.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 644d28861ce9..48475d288df1 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -147,7 +147,7 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>  static void __init pmd_advanced_tests(struct mm_struct *mm,
>  				      struct vm_area_struct *vma, pmd_t *pmdp,
>  				      unsigned long pfn, unsigned long vaddr,
> -				      pgprot_t prot)
> +				      pgprot_t prot, pgtable_t pgtable)
>  {
>  	pmd_t pmd;
>  
> @@ -158,6 +158,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	/* Align the address wrt HPAGE_PMD_SIZE */
>  	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
>  
> +	pgtable_trans_huge_deposit(mm, pmdp, pgtable);
> +
>  	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_set_wrprotect(mm, vaddr, pmdp);
> @@ -188,6 +190,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	pmdp_test_and_clear_young(vma, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(pmd_young(pmd));
> +
> +	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
>  }
>  
>  static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
> @@ -1002,7 +1006,7 @@ static int __init debug_vm_pgtable(void)
>  	pgd_clear_tests(mm, pgdp);
>  
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>  	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>  	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>  
> 

Makes sense, if it is required for THP to work correctly but needs to be tested
across enabled platforms. Why should not the same apply for pud_advanced_tests()
on platforms that supports PUD based THP.
