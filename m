Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B623E191656
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 17:27:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mxVn1s7pzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:27:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mxSL1JrHzDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:25:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=H96Q0Epp; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mxSL0GT3z8tR6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:25:38 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mxSK6ZsKz9sSL; Wed, 25 Mar 2020 03:25:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=H96Q0Epp; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mxSK0y6yz9sSJ
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Mar 2020 03:25:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mxSD4bgGz9tyVd;
 Tue, 24 Mar 2020 17:25:32 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=H96Q0Epp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CPKdzTJC1sGh; Tue, 24 Mar 2020 17:25:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mxSD3LB3z9tyVc;
 Tue, 24 Mar 2020 17:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585067132; bh=ibSBrPLMjuFKwUWvyjO1aoOL48irX/OSszKuznNJCWY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=H96Q0EppTTbIWDf05TKrMcjngHXF3T1Mv8mP8pzMw+RI3DbBb+rkrSy9pbUyEMgQH
 Y9fC4UCmrKBYsixlnZGk3wEqPQ7KchMT1G/PWWeuOlJks8QqoPbN6QEwPGc2ZdFfbq
 MGhDeetFH0v971IAwhIRA2Jz8G551KktgmpbNUk0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F7E18B7AA;
 Tue, 24 Mar 2020 17:25:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8zrsePe1chUa; Tue, 24 Mar 2020 17:25:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 988018B7A8;
 Tue, 24 Mar 2020 17:25:33 +0100 (CET)
Subject: Re: [RFC PATCH 3/3] powerpc/lib: Use a temporary mm for code patching
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-4-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <db40ec6a-1d81-91e3-00d8-cd86fd5262d5@c-s.fr>
Date: Tue, 24 Mar 2020 17:25:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323045205.20314-4-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/03/2020 à 05:52, Christopher M. Riedl a écrit :
> Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
> mappings to other CPUs. These mappings should be kept local to the CPU
> doing the patching. Use the pre-initialized temporary mm and patching
> address for this purpose. Also add a check after patching to ensure the
> patch succeeded.
> 
> Based on x86 implementation:
> 
> commit b3fd8e83ada0
> ("x86/alternatives: Use temporary mm for text poking")
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>   arch/powerpc/lib/code-patching.c | 128 ++++++++++++++-----------------
>   1 file changed, 57 insertions(+), 71 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 18b88ecfc5a8..f156132e8975 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -19,6 +19,7 @@
>   #include <asm/page.h>
>   #include <asm/code-patching.h>
>   #include <asm/setup.h>
> +#include <asm/mmu_context.h>
>   
>   static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
>   			       unsigned int *patch_addr)
> @@ -65,99 +66,79 @@ void __init poking_init(void)
>   	pte_unmap_unlock(ptep, ptl);
>   }
>   
> -static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> -
> -static int text_area_cpu_up(unsigned int cpu)
> -{
> -	struct vm_struct *area;
> -
> -	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
> -	if (!area) {
> -		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
> -			cpu);
> -		return -1;
> -	}
> -	this_cpu_write(text_poke_area, area);
> -
> -	return 0;
> -}
> -
> -static int text_area_cpu_down(unsigned int cpu)
> -{
> -	free_vm_area(this_cpu_read(text_poke_area));
> -	return 0;
> -}
> -
> -/*
> - * Run as a late init call. This allows all the boot time patching to be done
> - * simply by patching the code, and then we're called here prior to
> - * mark_rodata_ro(), which happens after all init calls are run. Although
> - * BUG_ON() is rude, in this case it should only happen if ENOMEM, and we judge
> - * it as being preferable to a kernel that will crash later when someone tries
> - * to use patch_instruction().
> - */
> -static int __init setup_text_poke_area(void)
> -{
> -	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> -		"powerpc/text_poke:online", text_area_cpu_up,
> -		text_area_cpu_down));
> -
> -	return 0;
> -}
> -late_initcall(setup_text_poke_area);
> +struct patch_mapping {
> +	spinlock_t *ptl; /* for protecting pte table */
> +	struct temp_mm temp_mm;
> +};
>   
>   /*
>    * This can be called for kernel text or a module.
>    */
> -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> +static int map_patch(const void *addr, struct patch_mapping *patch_mapping)

Why change the name ?

>   {
> -	unsigned long pfn;
> -	int err;
> +	struct page *page;
> +	pte_t pte, *ptep;
> +	pgprot_t pgprot;
>   
>   	if (is_vmalloc_addr(addr))
> -		pfn = vmalloc_to_pfn(addr);
> +		page = vmalloc_to_page(addr);
>   	else
> -		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
> +		page = virt_to_page(addr);
>   
> -	err = map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
> +	if (radix_enabled())
> +		pgprot = __pgprot(pgprot_val(PAGE_KERNEL));
> +	else
> +		pgprot = PAGE_SHARED;

Can you explain the difference between radix and non radix ?

Why PAGE_KERNEL for a page that is mapped in userspace ?

Why do you need to do __pgprot(pgprot_val(PAGE_KERNEL)) instead of just 
using PAGE_KERNEL ?

>   
> -	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err);
> -	if (err)
> +	ptep = get_locked_pte(patching_mm, patching_addr, &patch_mapping->ptl);
> +	if (unlikely(!ptep)) {
> +		pr_warn("map patch: failed to allocate pte for patching\n");
>   		return -1;
> +	}
> +
> +	pte = mk_pte(page, pgprot);
> +	set_pte_at(patching_mm, patching_addr, ptep, pte);
> +
> +	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> +	use_temporary_mm(&patch_mapping->temp_mm);
>   
>   	return 0;
>   }
>   
> -static inline int unmap_patch_area(unsigned long addr)
> +static int unmap_patch(struct patch_mapping *patch_mapping)
>   {
>   	pte_t *ptep;
>   	pmd_t *pmdp;
>   	pud_t *pudp;
>   	pgd_t *pgdp;
>   
> -	pgdp = pgd_offset_k(addr);
> +	pgdp = pgd_offset(patching_mm, patching_addr);
>   	if (unlikely(!pgdp))
>   		return -EINVAL;
>   
> -	pudp = pud_offset(pgdp, addr);
> +	pudp = pud_offset(pgdp, patching_addr);
>   	if (unlikely(!pudp))
>   		return -EINVAL;
>   
> -	pmdp = pmd_offset(pudp, addr);
> +	pmdp = pmd_offset(pudp, patching_addr);
>   	if (unlikely(!pmdp))
>   		return -EINVAL;
>   
> -	ptep = pte_offset_kernel(pmdp, addr);
> +	ptep = pte_offset_kernel(pmdp, patching_addr);

ptep should be stored in the patch_mapping struct instead of walking 
again the page tables.

>   	if (unlikely(!ptep))
>   		return -EINVAL;
>   
> -	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
> +	/*
> +	 * In hash, pte_clear flushes the tlb
> +	 */
> +	pte_clear(patching_mm, patching_addr, ptep);
> +	unuse_temporary_mm(&patch_mapping->temp_mm);
>   
>   	/*
> -	 * In hash, pte_clear flushes the tlb, in radix, we have to
> +	 * In radix, we have to explicitly flush the tlb (no-op in hash)
>   	 */
> -	pte_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	local_flush_tlb_mm(patching_mm);
> +	pte_unmap_unlock(ptep, patch_mapping->ptl);
>   
>   	return 0;
>   }
> @@ -167,33 +148,38 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
>   	int err;
>   	unsigned int *patch_addr = NULL;
>   	unsigned long flags;
> -	unsigned long text_poke_addr;
> -	unsigned long kaddr = (unsigned long)addr;
> +	struct patch_mapping patch_mapping;
>   
>   	/*
> -	 * During early early boot patch_instruction is called
> -	 * when text_poke_area is not ready, but we still need
> -	 * to allow patching. We just do the plain old patching
> +	 * The patching_mm is initialized before calling mark_rodata_ro. Prior
> +	 * to this, patch_instruction is called when we don't have (and don't
> +	 * need) the patching_mm so just do plain old patching.
>   	 */
> -	if (!this_cpu_read(text_poke_area))
> +	if (!patching_mm)
>   		return raw_patch_instruction(addr, instr);
>   
>   	local_irq_save(flags);
>   
> -	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
> -	if (map_patch_area(addr, text_poke_addr)) {
> -		err = -1;
> +	err = map_patch(addr, &patch_mapping);
> +	if (err)
>   		goto out;
> -	}
>   
> -	patch_addr = (unsigned int *)(text_poke_addr) +
> -			((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
> +	patch_addr = (unsigned int *)(patching_addr) +
> +			(offset_in_page((unsigned long)addr) /
> +				sizeof(unsigned int));
>   
>   	__patch_instruction(addr, instr, patch_addr);

The error returned by __patch_instruction() should be managed.

>   
> -	err = unmap_patch_area(text_poke_addr);
> +	err = unmap_patch(&patch_mapping);
>   	if (err)
> -		pr_warn("failed to unmap %lx\n", text_poke_addr);
> +		pr_warn("unmap patch: failed to unmap patch\n");
> +
> +	/*
> +	 * Something is wrong if what we just wrote doesn't match what we
> +	 * think we just wrote.
> +	 * XXX: BUG_ON() instead?

No, not a BUG_ON(). If patching fails, that's no a vital fault, we can 
fail gracefully. You should return a fault instead.

> +	 */
> +	WARN_ON(memcmp(addr, &instr, sizeof(instr)));

Come on. addr is an *int, instr is an int. By doing a memcmp() on 
&instr, you for the compiler to write instr into the stack whereas local 
vars are mainly in registers on RISC processors like powerpc. Following 
should do it:

	WARN_ON(*addr != instr);

>   
>   out:
>   	local_irq_restore(flags);
> 

Christophe
