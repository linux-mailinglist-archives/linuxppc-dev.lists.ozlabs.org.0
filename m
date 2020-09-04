Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB625D046
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 06:18:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjPYm3DkszDr5j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 14:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjPX01WppzDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 14:17:03 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B730C101E;
 Thu,  3 Sep 2020 21:17:01 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E00393F71F;
 Thu,  3 Sep 2020 21:16:59 -0700 (PDT)
Subject: Re: [PATCH v4 13/13] mm/debug_vm_pgtable: Avoid none pte in
 pte_clear_test
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114601.183715-1-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <44674c44-2873-77a8-fe99-d706c2043501@arm.com>
Date: Fri, 4 Sep 2020 09:46:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114601.183715-1-aneesh.kumar@linux.ibm.com>
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



On 09/02/2020 05:16 PM, Aneesh Kumar K.V wrote:
> pte_clear_tests operate on an existing pte entry. Make sure that
> is not a none pte entry.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 9afa1354326b..c36530c69e33 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -542,9 +542,10 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
>  #endif /* PAGETABLE_P4D_FOLDED */
>  
>  static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
> -				   unsigned long vaddr)
> +				   unsigned long pfn, unsigned long vaddr,
> +				   pgprot_t prot)
>  {
> -	pte_t pte = ptep_get(ptep);
> +	pte_t pte = pfn_pte(pfn, prot);
>  
>  	pr_debug("Validating PTE clear\n");
>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> @@ -1049,7 +1050,7 @@ static int __init debug_vm_pgtable(void)
>  
>  	ptl = pte_lockptr(mm, pmdp);
>  	spin_lock(ptl);
> -	pte_clear_tests(mm, ptep, vaddr);
> +	pte_clear_tests(mm, ptep, pte_aligned, vaddr, prot);
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>  	pte_unmap_unlock(ptep, ptl);
>  
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
