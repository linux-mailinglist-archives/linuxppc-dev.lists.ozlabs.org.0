Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0445925D058
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 06:23:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjPgN44r8zDrLj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 14:23:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjPdW6C7GzDr1d
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 14:21:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 992B7101E;
 Thu,  3 Sep 2020 21:21:49 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB4A93F71F;
 Thu,  3 Sep 2020 21:21:47 -0700 (PDT)
Subject: Re: [PATCH v4 10/13] mm/debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-11-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <a68f0c11-4b3e-ea53-58c6-2a60c8c29782@arm.com>
Date: Fri, 4 Sep 2020 09:51:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-11-aneesh.kumar@linux.ibm.com>
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
> Architectures like ppc64 use deposited page table while updating the
> huge pte entries.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 2bc1952e5f83..26023d990bd0 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -154,7 +154,7 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>  static void __init pmd_advanced_tests(struct mm_struct *mm,
>  				      struct vm_area_struct *vma, pmd_t *pmdp,
>  				      unsigned long pfn, unsigned long vaddr,
> -				      pgprot_t prot)
> +				      pgprot_t prot, pgtable_t pgtable)
>  {
>  	pmd_t pmd;
>  
> @@ -165,6 +165,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	/* Align the address wrt HPAGE_PMD_SIZE */
>  	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
>  
> +	pgtable_trans_huge_deposit(mm, pmdp, pgtable);
> +
>  	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_set_wrprotect(mm, vaddr, pmdp);
> @@ -193,6 +195,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	pmdp_test_and_clear_young(vma, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(pmd_young(pmd));
> +
> +	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
>  }
>  
>  static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
> @@ -371,7 +375,7 @@ static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
>  static void __init pmd_advanced_tests(struct mm_struct *mm,
>  				      struct vm_area_struct *vma, pmd_t *pmdp,
>  				      unsigned long pfn, unsigned long vaddr,
> -				      pgprot_t prot)
> +				      pgprot_t prot, pgtable_t pgtable)
>  {
>  }
>  static void __init pud_advanced_tests(struct mm_struct *mm,
> @@ -1048,7 +1052,7 @@ static int __init debug_vm_pgtable(void)
>  
>  	ptl = pmd_lock(mm, pmdp);
>  	pmd_clear_tests(mm, pmdp);
> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>  	pmd_huge_tests(pmdp, pmd_aligned, prot);
>  	pmd_populate_tests(mm, pmdp, saved_ptep);
>  	spin_unlock(ptl);
> 

Moving this down further in the series has not really helped the possible
git bisect problem on arm64. Nonetheless, the patch in itself, makes sense.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
