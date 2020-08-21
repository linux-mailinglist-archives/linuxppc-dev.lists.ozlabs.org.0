Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6CD24D049
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 10:06:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXvGZ098HzDql0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:05:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BXvDs2tKTzDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 18:04:28 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E693930E;
 Fri, 21 Aug 2020 01:04:26 -0700 (PDT)
Received: from [10.163.67.49] (unknown [10.163.67.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D56A3F66B;
 Fri, 21 Aug 2020 01:04:25 -0700 (PDT)
Subject: Re: [PATCH v2 10/13] mm/debug_vm_pgtable/locks: Take correct page
 table lock
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <20200819130107.478414-11-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <af7282c1-0d59-3f29-2a59-05575cd9d7f3@arm.com>
Date: Fri, 21 Aug 2020 13:33:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200819130107.478414-11-aneesh.kumar@linux.ibm.com>
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



On 08/19/2020 06:31 PM, Aneesh Kumar K.V wrote:
> Make sure we call pte accessors with correct lock held.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 69fe3cd8126c..8f7a8ccb5a54 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -1024,33 +1024,39 @@ static int __init debug_vm_pgtable(void)
>  	pmd_thp_tests(pmd_aligned, prot);
>  	pud_thp_tests(pud_aligned, prot);
>  
> +	hugetlb_basic_tests(pte_aligned, prot);
> +
>  	/*
>  	 * Page table modifying tests
>  	 */
> -	pte_clear_tests(mm, ptep, vaddr);
> -	pmd_clear_tests(mm, pmdp);
> -	pud_clear_tests(mm, pudp);
> -	p4d_clear_tests(mm, p4dp);
> -	pgd_clear_tests(mm, pgdp);
>  
>  	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
> +	pte_clear_tests(mm, ptep, vaddr);
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
> -	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
> -	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -
> +	pte_unmap_unlock(ptep, ptl);
>  
> +	ptl = pmd_lock(mm, pmdp);
> +	pmd_clear_tests(mm, pmdp);
> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>  	pmd_huge_tests(pmdp, pmd_aligned, prot);
> +	pmd_populate_tests(mm, pmdp, saved_ptep);
> +	spin_unlock(ptl);
> +
> +	ptl = pud_lock(mm, pudp);
> +	pud_clear_tests(mm, pudp);
> +	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>  	pud_huge_tests(pudp, pud_aligned, prot);
> +	pud_populate_tests(mm, pudp, saved_pmdp);
> +	spin_unlock(ptl);
>  
> -	pte_unmap_unlock(ptep, ptl);
> +	//hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);

Commenting out an existing test in the middle of another change ?
