Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8A24289A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 13:26:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRS8R31fwzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 21:26:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRS6k1VdXzDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 21:25:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D6AAD6E;
 Wed, 12 Aug 2020 04:25:15 -0700 (PDT)
Received: from [10.163.66.87] (unknown [10.163.66.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2CA63F70D;
 Wed, 12 Aug 2020 04:25:13 -0700 (PDT)
Subject: Re: [PATCH 05/16] debug_vm_pgtable/savedwrite: Enable savedwrite test
 with CONFIG_NUMA_BALANCING
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-5-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <99f47f48-25c3-c3d3-ed20-3ca8800ae588@arm.com>
Date: Wed, 12 Aug 2020 16:54:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-5-aneesh.kumar@linux.ibm.com>
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
> Saved write support was added to track the write bit of a pte after marking the
> pte protnone. This was done so that AUTONUMA can convert a write pte to protnone
> and still track the old write bit. When converting it back we set the pte write
> bit correctly thereby avoiding a write fault again. Hence enable the test only
> when CONFIG_NUMA_BALANCING is enabled.

This has not been a problem on architectures that do not define pxx_savedwrite()
as they fallback on standard pxx_write() helpers. But ppc64 defines a fall back
for pte_savedwrite() when !CONFIG_NUMA_BALANCING, which always returns false.
Agreed, it makes sense to add CONFIG_NUMA_BALANCING check. But a simple runtime
check will do as the functions are always visible/defined.

if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
	return;

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 679bb3d289a3..de8a62d0a931 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -110,6 +110,7 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>  	WARN_ON(pte_young(pte));
>  }
>  
> +#ifdef CONFIG_NUMA_BALANCING
>  static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pte_t pte = pfn_pte(pfn, prot);
> @@ -118,6 +119,8 @@ static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  	WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
>  	WARN_ON(pte_savedwrite(pte_clear_savedwrite(pte_mk_savedwrite(pte))));
>  }
> +#endif
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>  {
> @@ -221,6 +224,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>  	WARN_ON(!pmd_none(pmd));
>  }
>  
> +#ifdef CONFIG_NUMA_BALANCING
>  static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pmd_t pmd = pfn_pmd(pfn, prot);
> @@ -229,6 +233,7 @@ static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  	WARN_ON(!pmd_savedwrite(pmd_mk_savedwrite(pmd_clear_savedwrite(pmd))));
>  	WARN_ON(pmd_savedwrite(pmd_clear_savedwrite(pmd_mk_savedwrite(pmd))));
>  }
> +#endif
>  
>  #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>  static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
> @@ -1005,8 +1010,10 @@ static int __init debug_vm_pgtable(void)
>  	pmd_huge_tests(pmdp, pmd_aligned, prot);
>  	pud_huge_tests(pudp, pud_aligned, prot);
>  
> +#ifdef CONFIG_NUMA_BALANCING
>  	pte_savedwrite_tests(pte_aligned, prot);
>  	pmd_savedwrite_tests(pmd_aligned, prot);
> +#endif

BTW, config  wrappers should be avoided at the call site. If and when needed
a stub is defined for !CONFIG_XXX_XXX.

>  
>  	pte_unmap_unlock(ptep, ptl);
>  
> 
