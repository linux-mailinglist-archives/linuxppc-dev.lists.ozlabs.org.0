Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F16258632
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 05:28:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgXbK0gKTzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 13:28:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BgXY80jHnzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 13:26:35 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1826030E;
 Mon, 31 Aug 2020 20:26:34 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352D43F68F;
 Mon, 31 Aug 2020 20:26:28 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
Message-ID: <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
Date: Tue, 1 Sep 2020 08:55:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
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
> pte_clear_tests operate on an existing pte entry. Make sure that is not a none
> pte entry.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 21329c7d672f..8527ebb75f2c 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -546,7 +546,7 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
>  static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
>  				   unsigned long vaddr)
>  {
> -	pte_t pte = ptep_get(ptep);
> +	pte_t pte =  ptep_get_and_clear(mm, vaddr, ptep);

Seems like ptep_get_and_clear() here just clears the entry in preparation
for a following set_pte_at() which otherwise would have been a problem on
ppc64 as you had pointed out earlier i.e set_pte_at() should not update an
existing valid entry. So the commit message here is bit misleading.

>  
>  	pr_debug("Validating PTE clear\n");
>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> @@ -944,7 +944,7 @@ static int __init debug_vm_pgtable(void)
>  	p4d_t *p4dp, *saved_p4dp;
>  	pud_t *pudp, *saved_pudp;
>  	pmd_t *pmdp, *saved_pmdp, pmd;
> -	pte_t *ptep;
> +	pte_t *ptep, pte;
>  	pgtable_t saved_ptep;
>  	pgprot_t prot, protnone;
>  	phys_addr_t paddr;
> @@ -1049,6 +1049,8 @@ static int __init debug_vm_pgtable(void)
>  	 */
>  
>  	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
> +	pte = pfn_pte(pte_aligned, prot);
> +	set_pte_at(mm, vaddr, ptep, pte);

Not here, creating and populating an entry must be done in respective
test functions itself. Besides, this seems bit redundant as well. The
test pte_clear_tests() with the above change added, already

- Clears the PTEP entry with ptep_get_and_clear()
- Creates and populates the PTEP with set_pte_at()
- Clears with pte_clear()
- Checks for pte_none()

If the objective is to clear the PTEP entry before calling set_pte_at(),
then only the first chunk is required and it should also be merged with
a previous patch. 

[PATCH v3 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an existing pte entry 


>  	pte_clear_tests(mm, ptep, vaddr);
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>  	pte_unmap_unlock(ptep, ptl);
> 

There is a checkpatch.pl warning here.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
pte_clear_tests operate on an existing pte entry. Make sure that is not a none

total: 0 errors, 1 warnings, 24 lines checked

There is also a build failure on x86 reported from kernel test robot.
