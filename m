Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3483FE87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 07:34:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNdmr4vn7z3c5h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 17:34:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 599 seconds by postgrey-1.37 at boromir; Mon, 29 Jan 2024 17:33:40 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNdmN1Gnzz2yk9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 17:33:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 660671FB;
	Sun, 28 Jan 2024 22:23:48 -0800 (PST)
Received: from [10.162.42.11] (a077893.blr.arm.com [10.162.42.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6BE23F5A1;
	Sun, 28 Jan 2024 22:23:02 -0800 (PST)
Message-ID: <1b3c1513-826d-4908-93c3-212a6f1b2d74@arm.com>
Date: Mon, 29 Jan 2024 11:52:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/debug_vm_pgtable: Fix BUG_ON with pud advanced test
Content-Language: en-US
To: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20240129060022.68044-1-aneesh.kumar@kernel.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240129060022.68044-1-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/29/24 11:30, Aneesh Kumar K.V (IBM) wrote:
> Architectures like powerpc add debug checks to ensure we find only devmap
> PUD pte entries. These debug checks are only done with CONFIG_DEBUG_VM.
> This patch marks the ptes used for PUD advanced test devmap pte entries
> so that we don't hit on debug checks on architecture like ppc64 as
> below.
> 
> WARNING: CPU: 2 PID: 1 at arch/powerpc/mm/book3s64/radix_pgtable.c:1382 radix__pud_hugepage_update+0x38/0x138
> ....
> NIP [c0000000000a7004] radix__pud_hugepage_update+0x38/0x138
> LR [c0000000000a77a8] radix__pudp_huge_get_and_clear+0x28/0x60
> Call Trace:
> [c000000004a2f950] [c000000004a2f9a0] 0xc000000004a2f9a0 (unreliable)
> [c000000004a2f980] [000d34c100000000] 0xd34c100000000
> [c000000004a2f9a0] [c00000000206ba98] pud_advanced_tests+0x118/0x334
> [c000000004a2fa40] [c00000000206db34] debug_vm_pgtable+0xcbc/0x1c48
> [c000000004a2fc10] [c00000000000fd28] do_one_initcall+0x60/0x388
> 
> Also
> 
>  kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:202!
>  ....
> 
>  NIP [c000000000096510] pudp_huge_get_and_clear_full+0x98/0x174
>  LR [c00000000206bb34] pud_advanced_tests+0x1b4/0x334
>  Call Trace:
>  [c000000004a2f950] [000d34c100000000] 0xd34c100000000 (unreliable)
>  [c000000004a2f9a0] [c00000000206bb34] pud_advanced_tests+0x1b4/0x334
>  [c000000004a2fa40] [c00000000206db34] debug_vm_pgtable+0xcbc/0x1c48
>  [c000000004a2fc10] [c00000000000fd28] do_one_initcall+0x60/0x388
> 
> Fixes: 27af67f35631 ("powerpc/book3s64/mm: enable transparent pud hugepage")
> Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
> ---
>  mm/debug_vm_pgtable.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 5662e29fe253..65c19025da3d 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -362,6 +362,12 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
>  	vaddr &= HPAGE_PUD_MASK;
>  
>  	pud = pfn_pud(args->pud_pfn, args->page_prot);
> +	/*
> +	 * Some architectures have debug checks to make sure
> +	 * huge pud mapping are only found with devmap entries
> +	 * For now test with only devmap entries.
> +	 */
Do you see this behaviour to be changed in powerpc anytime soon ? Otherwise
these pud_mkdevmap() based work arounds, might be required to stick around
for longer just to prevent powerpc specific triggers. Given PUD transparent
huge pages i.e HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD are just supported on x86
and powerpc platforms, could not this problem be solved in a more uniform
manner.

> +	pud = pud_mkdevmap(pud);
>  	set_pud_at(args->mm, vaddr, args->pudp, pud);
>  	flush_dcache_page(page);
>  	pudp_set_wrprotect(args->mm, vaddr, args->pudp);
> @@ -374,6 +380,7 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
>  	WARN_ON(!pud_none(pud));
>  #endif /* __PAGETABLE_PMD_FOLDED */
>  	pud = pfn_pud(args->pud_pfn, args->page_prot);
> +	pud = pud_mkdevmap(pud);
>  	pud = pud_wrprotect(pud);
>  	pud = pud_mkclean(pud);
>  	set_pud_at(args->mm, vaddr, args->pudp, pud);
> @@ -391,6 +398,7 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
>  #endif /* __PAGETABLE_PMD_FOLDED */
>  
>  	pud = pfn_pud(args->pud_pfn, args->page_prot);
> +	pud = pud_mkdevmap(pud);
>  	pud = pud_mkyoung(pud);
>  	set_pud_at(args->mm, vaddr, args->pudp, pud);
>  	flush_dcache_page(page);
