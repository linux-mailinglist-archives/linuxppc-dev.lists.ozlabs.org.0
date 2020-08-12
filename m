Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AD2428E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 13:52:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRSjV3xPQzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 21:51:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRSgP4KBbzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 21:50:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89B07D6E;
 Wed, 12 Aug 2020 04:50:04 -0700 (PDT)
Received: from [10.163.66.87] (unknown [10.163.66.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8783F70D;
 Wed, 12 Aug 2020 04:50:02 -0700 (PDT)
Subject: Re: [PATCH 07/16] debug_vm_pgtable/THP: Mark the pte entry huge
 before using set_pud_at
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-7-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d847f62f-b6e1-b173-51cb-dd86ccc6f6cc@arm.com>
Date: Wed, 12 Aug 2020 17:19:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-7-aneesh.kumar@linux.ibm.com>
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
> kernel expect entries to be marked huge before we use set_pud_at().
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index b6aca2526e01..cd609a212dd4 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -265,7 +265,7 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  				      unsigned long pfn, unsigned long vaddr,
>  				      pgprot_t prot)
>  {
> -	pud_t pud = pfn_pud(pfn, prot);
> +	pud_t pud;
>  
>  	if (!has_transparent_hugepage())
>  		return;
> @@ -274,25 +274,28 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  	/* Align the address wrt HPAGE_PUD_SIZE */
>  	vaddr = (vaddr & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE;
>  
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_set_wrprotect(mm, vaddr, pudp);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(pud_write(pud));
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> -	pud = pfn_pud(pfn, prot);
> +
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_huge_get_and_clear(mm, vaddr, pudp);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(!pud_none(pud));
>  
> -	pud = pfn_pud(pfn, prot);
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	set_pud_at(mm, vaddr, pudp, pud);
>  	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
>  	pud = READ_ONCE(*pudp);
>  	WARN_ON(!pud_none(pud));
>  #endif /* __PAGETABLE_PMD_FOLDED */
> -	pud = pfn_pud(pfn, prot);
> +
> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	pud = pud_wrprotect(pud);
>  	pud = pud_mkclean(pud);
>  	set_pud_at(mm, vaddr, pudp, pud);
> 

Looks very similar to the previous patch, hence please fold it back.
Seems fair enough that pxx_set_at() expects given entry to be huge.
But would need to run them across enabled platforms to be sure.
