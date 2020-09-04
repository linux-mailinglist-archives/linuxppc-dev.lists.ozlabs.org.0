Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86825D131
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 08:21:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjSHd1y50zDrN1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 16:21:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjSFW0fv8zDrCN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 16:19:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F417C1045;
 Thu,  3 Sep 2020 23:19:39 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 310643F71F;
 Thu,  3 Sep 2020 23:19:37 -0700 (PDT)
Subject: Re: [PATCH v4 12/13] mm/debug_vm_pgtable/hugetlb: Disable hugetlb
 test on ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-13-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6d5a896a-5796-0ca3-d7ca-0ff21cfb38d9@arm.com>
Date: Fri, 4 Sep 2020 11:49:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-13-aneesh.kumar@linux.ibm.com>
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
> The seems to be missing quite a lot of details w.r.t allocating
> the correct pgtable_t page (huge_pte_alloc()), holding the right
> lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.
> 
> ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of these.
> Hence disable the test on ppc64.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index b53903fdee85..9afa1354326b 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -811,6 +811,7 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
>  #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
>  }
>  
> +#ifndef CONFIG_PPC_BOOK3S_64
>  static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>  					  struct vm_area_struct *vma,
>  					  pte_t *ptep, unsigned long pfn,
> @@ -853,6 +854,7 @@ static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>  	pte = huge_ptep_get(ptep);
>  	WARN_ON(!(huge_pte_write(pte) && huge_pte_dirty(pte)));
>  }
> +#endif
>  #else  /* !CONFIG_HUGETLB_PAGE */
>  static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot) { }
>  static void __init hugetlb_advanced_tests(struct mm_struct *mm,
> @@ -1065,7 +1067,9 @@ static int __init debug_vm_pgtable(void)
>  	pud_populate_tests(mm, pudp, saved_pmdp);
>  	spin_unlock(ptl);
>  
> +#ifndef CONFIG_PPC_BOOK3S_64
>  	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> +#endif
>  
>  	spin_lock(&mm->page_table_lock);
>  	p4d_clear_tests(mm, p4dp);
> 

Is it still required now that DEBUG_VM_PGTABLE has been dropped from powerpc
or you would like to re-enabled it back ?

https://lore.kernel.org/linuxppc-dev/159913592797.5893.5829441560236719450.b4-ty@ellerman.id.au/T/#m6d890e2fe84cf180cb875fae5f791e9c83db8d30
