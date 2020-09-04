Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2125D03C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 06:11:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjPQ00dXZzDrKW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 14:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjPMr73qjzDr7W
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 14:10:00 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7066101E;
 Thu,  3 Sep 2020 21:09:58 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D26E53F71F;
 Thu,  3 Sep 2020 21:09:56 -0700 (PDT)
Subject: Re: [PATCH v4 05/13] mm/debug_vm_pgtable/savedwrite: Enable
 savedwrite test with CONFIG_NUMA_BALANCING
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-6-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <b89d69b2-caa0-e8e2-9401-8b3ff1546fbe@arm.com>
Date: Fri, 4 Sep 2020 09:39:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-6-aneesh.kumar@linux.ibm.com>
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
> Saved write support was added to track the write bit of a pte after
> marking the pte protnone. This was done so that AUTONUMA can convert
> a write pte to protnone and still track the old write bit. When converting
> it back we set the pte write bit correctly thereby avoiding a write fault
> again. Hence enable the test only when CONFIG_NUMA_BALANCING is enabled and
> use protnone protflags.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 4c73e63b4ceb..8704901f6bd8 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -119,10 +119,14 @@ static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pte_t pte = pfn_pte(pfn, prot);
>  
> +	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
> +		return;
> +
>  	pr_debug("Validating PTE saved write\n");
>  	WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
>  	WARN_ON(pte_savedwrite(pte_clear_savedwrite(pte_mk_savedwrite(pte))));
>  }
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>  {
> @@ -234,6 +238,9 @@ static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pmd_t pmd = pfn_pmd(pfn, prot);
>  
> +	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
> +		return;
> +
>  	pr_debug("Validating PMD saved write\n");
>  	WARN_ON(!pmd_savedwrite(pmd_mk_savedwrite(pmd_clear_savedwrite(pmd))));
>  	WARN_ON(pmd_savedwrite(pmd_clear_savedwrite(pmd_mk_savedwrite(pmd))));
> @@ -1019,8 +1026,8 @@ static int __init debug_vm_pgtable(void)
>  	pmd_huge_tests(pmdp, pmd_aligned, prot);
>  	pud_huge_tests(pudp, pud_aligned, prot);
>  
> -	pte_savedwrite_tests(pte_aligned, prot);
> -	pmd_savedwrite_tests(pmd_aligned, prot);
> +	pte_savedwrite_tests(pte_aligned, protnone);
> +	pmd_savedwrite_tests(pmd_aligned, protnone);
>  
>  	pte_unmap_unlock(ptep, ptl);
>  
> 

No more checkpatch.pl warnings.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
