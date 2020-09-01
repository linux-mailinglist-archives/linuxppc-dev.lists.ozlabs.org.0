Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12D258624
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 05:24:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgXVf05n5zDqQh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 13:24:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BgXRY6fhXzDqXY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 13:21:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5799830E;
 Mon, 31 Aug 2020 20:21:44 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34D923F68F;
 Mon, 31 Aug 2020 20:21:38 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 06/13] mm/debug_vm_pgtable/THP: Mark the pte entry huge
 before using set_pmd/pud_at
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-7-aneesh.kumar@linux.ibm.com>
Message-ID: <37558832-9cb6-9a11-0009-e268ad51c1f3@arm.com>
Date: Tue, 1 Sep 2020 08:51:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-7-aneesh.kumar@linux.ibm.com>
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
> kernel expects entries to be marked huge before we use set_pmd_at()/set_pud_at().
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 5c0680836fe9..de83a20c1b30 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -155,7 +155,7 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  				      unsigned long pfn, unsigned long vaddr,
>  				      pgprot_t prot)
>  {
> -	pmd_t pmd = pfn_pmd(pfn, prot);
> +	pmd_t pmd;
>  
>  	if (!has_transparent_hugepage())
>  		return;
> @@ -164,19 +164,19 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>  	/* Align the address wrt HPAGE_PMD_SIZE */
>  	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
>  
> -	pmd = pfn_pmd(pfn, prot);
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_set_wrprotect(mm, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(pmd_write(pmd));
>  
> -	pmd = pfn_pmd(pfn, prot);
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
>  	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>  	pmd = READ_ONCE(*pmdp);
>  	WARN_ON(!pmd_none(pmd));
>  
> -	pmd = pfn_pmd(pfn, prot);
> +	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>  	pmd = pmd_wrprotect(pmd);
>  	pmd = pmd_mkclean(pmd);
>  	set_pmd_at(mm, vaddr, pmdp, pmd);
> @@ -237,7 +237,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>  
>  static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>  {
> -	pmd_t pmd = pfn_pmd(pfn, prot);
> +	pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));

There is no set_pmd_at() in this particular test, why change ?

>  
>  	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
>  		return;
> @@ -277,7 +277,7 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>  				      unsigned long pfn, unsigned long vaddr,
>  				      pgprot_t prot)
>  {
> -	pud_t pud = pfn_pud(pfn, prot);
> +	pud_t pud;
>  
>  	if (!has_transparent_hugepage())
>  		return;
> @@ -286,25 +286,28 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
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

Please drop the extra line here.

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

Please drop the extra line here.

> +	pud = pud_mkhuge(pfn_pud(pfn, prot));
>  	pud = pud_wrprotect(pud);
>  	pud = pud_mkclean(pud);
>  	set_pud_at(mm, vaddr, pudp, pud);
>

There is a checkpatch.pl warning here.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
kernel expects entries to be marked huge before we use set_pmd_at()/set_pud_at().

total: 0 errors, 1 warnings, 77 lines checked
