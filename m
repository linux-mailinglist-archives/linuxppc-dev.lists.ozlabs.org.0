Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A522125D0F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 07:41:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjRPw1KG7zDrKq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 15:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BjRMy5yBvzDrHd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 15:40:13 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A56101E;
 Thu,  3 Sep 2020 22:40:11 -0700 (PDT)
Received: from [10.163.70.23] (unknown [10.163.70.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B1AB3F71F;
 Thu,  3 Sep 2020 22:40:09 -0700 (PDT)
Subject: Re: [PATCH v4 09/13] mm/debug_vm_pgtable/locks: Take correct page
 table lock
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-10-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <5dc579c4-1892-e260-19ef-4d26a9641e8d@arm.com>
Date: Fri, 4 Sep 2020 11:09:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-10-aneesh.kumar@linux.ibm.com>
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
> Make sure we call pte accessors with correct lock held.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index f59cf6a9b05e..2bc1952e5f83 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -1035,30 +1035,39 @@ static int __init debug_vm_pgtable(void)
>  
>  	hugetlb_basic_tests(pte_aligned, prot);
>  
> -	pte_clear_tests(mm, ptep, vaddr);
> -	pmd_clear_tests(mm, pmdp);
> -	pud_clear_tests(mm, pudp);
> -	p4d_clear_tests(mm, p4dp);
> -	pgd_clear_tests(mm, pgdp);
> +	/*
> +	 * Page table modifying tests. They need to hold
> +	 * proper page table lock.
> +	 */
>  
>  	ptl = pte_lockptr(mm, pmdp);
>  	spin_lock(ptl);
> -
> +	pte_clear_tests(mm, ptep, vaddr);
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
> -	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
> -	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> -
> +	pte_unmap_unlock(ptep, ptl);
>  
> +	ptl = pmd_lock(mm, pmdp);
> +	pmd_clear_tests(mm, pmdp);
> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
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
> +	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>  
> -	pmd_populate_tests(mm, pmdp, saved_ptep);
> -	pud_populate_tests(mm, pudp, saved_pmdp);
> +	spin_lock(&mm->page_table_lock);
> +	p4d_clear_tests(mm, p4dp);
> +	pgd_clear_tests(mm, pgdp);
>  	p4d_populate_tests(mm, p4dp, saved_pudp);
>  	pgd_populate_tests(mm, pgdp, saved_p4dp);
> +	spin_unlock(&mm->page_table_lock);
>  
>  	p4d_free(mm, saved_p4dp);
>  	pud_free(mm, saved_pudp);
> 

This patch, in itself looks good but will probably require folding with
the previous one to prevent the git bisect problem on arm64.
