Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A1C219900
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 09:04:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2RxV0rMczDqys
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 17:04:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Rvk46XpzDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 17:02:55 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B2RvW0b9Wz9v0J8;
 Thu,  9 Jul 2020 09:02:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0U9ZvYfRgq0Z; Thu,  9 Jul 2020 09:02:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B2RvV6QsJz9v0J2;
 Thu,  9 Jul 2020 09:02:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A1328B809;
 Thu,  9 Jul 2020 09:02:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2w2eNtAogbVu; Thu,  9 Jul 2020 09:02:48 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 781ED8B806;
 Thu,  9 Jul 2020 09:02:47 +0200 (CEST)
Subject: Re: [PATCH v2 3/5] powerpc/lib: Use a temporary mm for code patching
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@lists.ozlabs.org
References: <20200709040316.12789-1-cmr@informatik.wtf>
 <20200709040316.12789-4-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9de00169-208f-5c94-0c29-1180364c9bd7@csgroup.eu>
Date: Thu, 9 Jul 2020 09:02:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709040316.12789-4-cmr@informatik.wtf>
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
Cc: kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/07/2020 à 06:03, Christopher M. Riedl a écrit :
> Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
> mappings to other CPUs. These mappings should be kept local to the CPU
> doing the patching. Use the pre-initialized temporary mm and patching
> address for this purpose. Also add a check after patching to ensure the
> patch succeeded.

While trying the LKDTM test, I realised that this is useless for non SMP.
Is it worth applying that change to non SMP systems ?

Christophe

> 
> Use the KUAP functions on non-BOOKS3_64 platforms since the temporary
> mapping for patching uses a userspace address (to keep the mapping
> local). On BOOKS3_64 platforms hash does not implement KUAP and on radix
> the use of PAGE_KERNEL sets EAA[0] for the PTE which means the AMR
> (KUAP) protection is ignored (see PowerISA v3.0b, Fig, 35).
> 
> Based on x86 implementation:
> 
> commit b3fd8e83ada0
> ("x86/alternatives: Use temporary mm for text poking")
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>   arch/powerpc/lib/code-patching.c | 152 +++++++++++--------------------
>   1 file changed, 54 insertions(+), 98 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 8ae1a9e5fe6e..80fe3864f377 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -19,6 +19,7 @@
>   #include <asm/code-patching.h>
>   #include <asm/setup.h>
>   #include <asm/inst.h>
> +#include <asm/mmu_context.h>
>   
>   static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr,
>   			       struct ppc_inst *patch_addr)
> @@ -77,106 +78,57 @@ void __init poking_init(void)
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
> +	pte_t *ptep;
> +	struct temp_mm temp_mm;
> +};
>   
>   /*
>    * This can be called for kernel text or a module.
>    */
> -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> +static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
>   {
> -	unsigned long pfn;
> -	int err;
> +	struct page *page;
> +	pte_t pte;
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
> +		pgprot = PAGE_KERNEL;
> +	else
> +		pgprot = PAGE_SHARED;
>   
> -	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err);
> -	if (err)
> +	patch_mapping->ptep = get_locked_pte(patching_mm, patching_addr,
> +					     &patch_mapping->ptl);
> +	if (unlikely(!patch_mapping->ptep)) {
> +		pr_warn("map patch: failed to allocate pte for patching\n");
>   		return -1;
> +	}
> +
> +	pte = mk_pte(page, pgprot);
> +	pte = pte_mkdirty(pte);
> +	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
> +
> +	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> +	use_temporary_mm(&patch_mapping->temp_mm);
>   
>   	return 0;
>   }
>   
> -static inline int unmap_patch_area(unsigned long addr)
> +static void unmap_patch(struct patch_mapping *patch_mapping)
>   {
> -	pte_t *ptep;
> -	pmd_t *pmdp;
> -	pud_t *pudp;
> -	p4d_t *p4dp;
> -	pgd_t *pgdp;
> -
> -	pgdp = pgd_offset_k(addr);
> -	if (unlikely(!pgdp))
> -		return -EINVAL;
> -
> -	p4dp = p4d_offset(pgdp, addr);
> -	if (unlikely(!p4dp))
> -		return -EINVAL;
> -
> -	pudp = pud_offset(p4dp, addr);
> -	if (unlikely(!pudp))
> -		return -EINVAL;
> -
> -	pmdp = pmd_offset(pudp, addr);
> -	if (unlikely(!pmdp))
> -		return -EINVAL;
> -
> -	ptep = pte_offset_kernel(pmdp, addr);
> -	if (unlikely(!ptep))
> -		return -EINVAL;
> +	/* In hash, pte_clear flushes the tlb */
> +	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
> +	unuse_temporary_mm(&patch_mapping->temp_mm);
>   
> -	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
> -
> -	/*
> -	 * In hash, pte_clear flushes the tlb, in radix, we have to
> -	 */
> -	pte_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> -
> -	return 0;
> +	/* In radix, we have to explicitly flush the tlb (no-op in hash) */
> +	local_flush_tlb_mm(patching_mm);
> +	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
>   }
>   
>   static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
> @@ -184,32 +136,36 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
>   	int err;
>   	struct ppc_inst *patch_addr = NULL;
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
> -	patch_addr = (struct ppc_inst *)(text_poke_addr + (kaddr & ~PAGE_MASK));
> +	patch_addr = (struct ppc_inst *)(patching_addr | offset_in_page(addr));
>   
> -	__patch_instruction(addr, instr, patch_addr);
> +	if (!radix_enabled())
> +		allow_write_to_user(patch_addr, ppc_inst_len(instr));
> +	err = __patch_instruction(addr, instr, patch_addr);
> +	if (!radix_enabled())
> +		prevent_write_to_user(patch_addr, ppc_inst_len(instr));
>   
> -	err = unmap_patch_area(text_poke_addr);
> -	if (err)
> -		pr_warn("failed to unmap %lx\n", text_poke_addr);
> +	unmap_patch(&patch_mapping);
> +	/*
> +	 * Something is wrong if what we just wrote doesn't match what we
> +	 * think we just wrote.
> +	 */
> +	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
>   
>   out:
>   	local_irq_restore(flags);
> 
