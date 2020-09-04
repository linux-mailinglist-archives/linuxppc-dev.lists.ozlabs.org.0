Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B159625D01C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 06:00:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjP8m3rC0zDrKW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 14:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjP7154rSzDql2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 13:58:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE07101E;
 Thu,  3 Sep 2020 20:58:48 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9A6D3F71F;
 Thu,  3 Sep 2020 20:58:46 -0700 (PDT)
Subject: Re: [PATCH v4 08/13] mm/debug_vm_pgtable/locks: Move non page table
 modifying test together
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-9-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <56830efb-887e-0000-a46e-ae015e5854cd@arm.com>
Date: Fri, 4 Sep 2020 09:28:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-9-aneesh.kumar@linux.ibm.com>
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
> This will help in adding proper locks in a later patch
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 51 ++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index de333871f407..f59cf6a9b05e 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -986,7 +986,7 @@ static int __init debug_vm_pgtable(void)
>  	p4dp = p4d_alloc(mm, pgdp, vaddr);
>  	pudp = pud_alloc(mm, p4dp, vaddr);
>  	pmdp = pmd_alloc(mm, pudp, vaddr);
> -	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
> +	ptep = pte_alloc_map(mm, pmdp, vaddr);
>  
>  	/*
>  	 * Save all the page table page addresses as the page table
> @@ -1006,33 +1006,12 @@ static int __init debug_vm_pgtable(void)
>  	p4d_basic_tests(p4d_aligned, prot);
>  	pgd_basic_tests(pgd_aligned, prot);
>  
> -	pte_clear_tests(mm, ptep, vaddr);
> -	pmd_clear_tests(mm, pmdp);
> -	pud_clear_tests(mm, pudp);
> -	p4d_clear_tests(mm, p4dp);
> -	pgd_clear_tests(mm, pgdp);
> -
> -	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
> -	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
> -	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -
>  	pmd_leaf_tests(pmd_aligned, prot);
>  	pud_leaf_tests(pud_aligned, prot);
>  
> -	pmd_huge_tests(pmdp, pmd_aligned, prot);
> -	pud_huge_tests(pudp, pud_aligned, prot);
> -
>  	pte_savedwrite_tests(pte_aligned, protnone);
>  	pmd_savedwrite_tests(pmd_aligned, protnone);
>  
> -	pte_unmap_unlock(ptep, ptl);
> -
> -	pmd_populate_tests(mm, pmdp, saved_ptep);
> -	pud_populate_tests(mm, pudp, saved_pmdp);
> -	p4d_populate_tests(mm, p4dp, saved_pudp);
> -	pgd_populate_tests(mm, pgdp, saved_p4dp);
> -
>  	pte_special_tests(pte_aligned, prot);
>  	pte_protnone_tests(pte_aligned, protnone);
>  	pmd_protnone_tests(pmd_aligned, protnone);
> @@ -1050,11 +1029,37 @@ static int __init debug_vm_pgtable(void)
>  	pmd_swap_tests(pmd_aligned, prot);
>  
>  	swap_migration_tests();
> -	hugetlb_basic_tests(pte_aligned, prot);
>  
>  	pmd_thp_tests(pmd_aligned, prot);
>  	pud_thp_tests(pud_aligned, prot);
>  
> +	hugetlb_basic_tests(pte_aligned, prot);
> +
> +	pte_clear_tests(mm, ptep, vaddr);
> +	pmd_clear_tests(mm, pmdp);
> +	pud_clear_tests(mm, pudp);
> +	p4d_clear_tests(mm, p4dp);
> +	pgd_clear_tests(mm, pgdp);
> +
> +	ptl = pte_lockptr(mm, pmdp);
> +	spin_lock(ptl);
> +
> +	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
> +	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
> +	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> +
> +
> +	pmd_huge_tests(pmdp, pmd_aligned, prot);
> +	pud_huge_tests(pudp, pud_aligned, prot);
> +
> +	pte_unmap_unlock(ptep, ptl);
> +
> +	pmd_populate_tests(mm, pmdp, saved_ptep);
> +	pud_populate_tests(mm, pudp, saved_pmdp);
> +	p4d_populate_tests(mm, p4dp, saved_pudp);
> +	pgd_populate_tests(mm, pgdp, saved_p4dp);
> +
>  	p4d_free(mm, saved_p4dp);
>  	pud_free(mm, saved_pudp);
>  	pmd_free(mm, saved_pmdp);
>

Patches applied till here [i.e PATCH_1..PATCH_8] does not boot on arm64
platform, which might create a potential git bisect problem later on.

static void __init pte_advanced_tests(struct mm_struct *mm,
                                      struct vm_area_struct *vma, pte_t *ptep,
                                      unsigned long pfn, unsigned long vaddr,
                                      pgprot_t prot)
{
        pte_t pte = pfn_pte(pfn, prot);

        /*
         * Architectures optimize set_pte_at by avoiding TLB flush.
         * This requires set_pte_at to be not used to update an
         * existing pte entry. Clear pte before we do set_pte_at
         */

        pr_debug("Validating PTE advanced\n");
        pte = pfn_pte(pfn, prot);
        set_pte_at(mm, vaddr, ptep, pte);   ----------> Crashed here.
............
............

[   19.031831] Unable to handle kernel paging request at virtual address fffffdfffde00028
[   19.033181] Mem abort info:
[   19.033627]   ESR = 0x96000006
[   19.034129]   EC = 0x25: DABT (current EL), IL = 32 bits
[   19.035002]   SET = 0, FnV = 0
[   19.035523]   EA = 0, S1PTW = 0
[   19.036054] Data abort info:
[   19.036538]   ISV = 0, ISS = 0x00000006
[   19.037170]   CM = 0, WnR = 0
[   19.037662] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008158b000
[   19.038749] [fffffdfffde00028] pgd=0000000081d69003, p4d=0000000081d69003, pud=0000000081d6a003, pmd=0000000000000000
[   19.040560] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   19.041467] Modules linked in:
[   19.041968] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.9.0-rc3-00231-gdef09f62540f #62
[   19.043472] Hardware name: linux,dummy-virt (DT)
[   19.044292] pstate: 20400005 (nzCv daif +PAN -UAO BTYPE=--)
[   19.045235] pc : _raw_spin_lock+0x34/0x70
[   19.045944] lr : debug_vm_pgtable+0x3c8/0x8b8
[   19.046713] sp : ffff80001219bcf0
[   19.047295] x29: ffff80001219bcf0 x28: ffff8000114ac000 
[   19.048224] x27: ffff0005df61f080 x26: ffff8000114ac000 
[   19.049148] x25: 0020000000000fd3 x24: 0020000081400fd3 
[   19.050076] x23: 00003df483b17000 x22: ffff0005ddd63e90 
[   19.051011] x21: ffff0005dddc8000 x20: ffff0005ddd5f0e8 
[   19.051937] x19: ffff0005de3718b8 x18: 0000000000000010 
[   19.052846] x17: 00000000dbb99b48 x16: 00000000cc138a43 
[   19.053774] x15: 0000000000000001 x14: 0000000000000002 
[   19.054703] x13: 000000000055e46d x12: fffffe0017577200 
[   19.055630] x11: 0000000000000008 x10: ffff0005fc455210 
[   19.056553] x9 : ffff0005fc455210 x8 : 0000000000000010 
[   19.057484] x7 : ffff8005ead60000 x6 : ffff0005fcfcee00 
[   19.058410] x5 : ffff0005fc455200 x4 : 0000000000000000 
[   19.059344] x3 : fffffdfffde00028 x2 : 0000000000000001 
[   19.060272] x1 : 0000000000000000 x0 : fffffdfffde00028 
[   19.061203] Call trace:
[   19.061644]  _raw_spin_lock+0x34/0x70
[   19.062289]  debug_vm_pgtable+0x3c8/0x8b8
[   19.063001]  do_one_initcall+0x74/0x1cc
[   19.063680]  kernel_init_freeable+0x1d0/0x238
[   19.064448]  kernel_init+0x14/0x118
[   19.065067]  ret_from_fork+0x10/0x34
[   19.065703] Code: d503201f 52800001 52800022 2a0103e4 (88e47c02) 
[   19.066835] ---[ end trace ff33eeb13d2a13af ]---
