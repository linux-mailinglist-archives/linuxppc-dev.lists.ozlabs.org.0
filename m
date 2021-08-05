Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060D3E119F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:48:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgP1y75QTz3bZ3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:48:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgP1d11zMz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:48:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgP1W0lLfz9sWL;
 Thu,  5 Aug 2021 11:48:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAL63266AMRg; Thu,  5 Aug 2021 11:48:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgP1V3w03z9sWG;
 Thu,  5 Aug 2021 11:48:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02B8C8B7BD;
 Thu,  5 Aug 2021 11:48:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id W-Uj75ez5EBS; Thu,  5 Aug 2021 11:48:13 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C20BB8B7C0;
 Thu,  5 Aug 2021 11:48:10 +0200 (CEST)
Subject: Re: [PATCH v5 7/8] powerpc/64s: Initialize and use a temporary mm for
 patching on Radix
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-8-cmr@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9cc03303-ca54-94b8-7d0b-42647ff4d5a7@csgroup.eu>
Date: Thu, 5 Aug 2021 11:48:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713053113.4632-8-cmr@linux.ibm.com>
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/07/2021 à 07:31, Christopher M. Riedl a écrit :
> When code patching a STRICT_KERNEL_RWX kernel the page containing the
> address to be patched is temporarily mapped as writeable. Currently, a
> per-cpu vmalloc patch area is used for this purpose. While the patch
> area is per-cpu, the temporary page mapping is inserted into the kernel
> page tables for the duration of patching. The mapping is exposed to CPUs
> other than the patching CPU - this is undesirable from a hardening
> perspective. Use a temporary mm instead which keeps the mapping local to
> the CPU doing the patching.
> 
> Use the `poking_init` init hook to prepare a temporary mm and patching
> address. Initialize the temporary mm by copying the init mm. Choose a
> randomized patching address inside the temporary mm userspace address
> space. The patching address is randomized between PAGE_SIZE and
> DEFAULT_MAP_WINDOW-PAGE_SIZE.
> 
> Bits of entropy with 64K page size on BOOK3S_64:
> 
>          bits of entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
> 
>          PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
>          bits of entropy = log2(128TB / 64K)
> 	bits of entropy = 31
> 
> The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash MMU
> operates - by default the space above DEFAULT_MAP_WINDOW is not
> available. Currently the Hash MMU does not use a temporary mm so
> technically this upper limit isn't necessary; however, a larger
> randomization range does not further "harden" this overall approach and
> future work may introduce patching with a temporary mm on Hash as well.
> 
> Randomization occurs only once during initialization at boot for each
> possible CPU in the system.
> 
> Introduce two new functions, map_patch() and unmap_patch(), to
> respectively create and remove the temporary mapping with write
> permissions at patching_addr. Map the page with PAGE_KERNEL to set
> EAA[0] for the PTE which ignores the AMR (so no need to unlock/lock
> KUAP) according to PowerISA v3.0b Figure 35 on Radix.
> 
> Based on x86 implementation:
> 
> commit 4fc19708b165
> ("x86/alternatives: Initialize temporary mm for patching")
> 
> and:
> 
> commit b3fd8e83ada0
> ("x86/alternatives: Use temporary mm for text poking")
> 
> Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> 
> ---
> 
> v5:  * Only support Book3s64 Radix MMU for now.
>       * Use a per-cpu datastructure to hold the patching_addr and
>         patching_mm to avoid the need for a synchronization lock/mutex.
> 
> v4:  * In the previous series this was two separate patches: one to init
>         the temporary mm in poking_init() (unused in powerpc at the time)
>         and the other to use it for patching (which removed all the
>         per-cpu vmalloc code). Now that we use poking_init() in the
>         existing per-cpu vmalloc approach, that separation doesn't work
>         as nicely anymore so I just merged the two patches into one.
>       * Preload the SLB entry and hash the page for the patching_addr
>         when using Hash on book3s64 to avoid taking an SLB and Hash fault
>         during patching. The previous implementation was a hack which
>         changed current->mm to allow the SLB and Hash fault handlers to
>         work with the temporary mm since both of those code-paths always
>         assume mm == current->mm.
>       * Also (hmm - seeing a trend here) with the book3s64 Hash MMU we
>         have to manage the mm->context.active_cpus counter and mm cpumask
>         since they determine (via mm_is_thread_local()) if the TLB flush
>         in pte_clear() is local or not - it should always be local when
>         we're using the temporary mm. On book3s64's Radix MMU we can
>         just call local_flush_tlb_mm().
>       * Use HPTE_USE_KERNEL_KEY on Hash to avoid costly lock/unlock of
>         KUAP.
> ---
>   arch/powerpc/lib/code-patching.c | 132 +++++++++++++++++++++++++++++--
>   1 file changed, 125 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 9f2eba9b70ee4..027dabd42b8dd 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -11,6 +11,7 @@
>   #include <linux/cpuhotplug.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
> +#include <linux/random.h>
>   
>   #include <asm/tlbflush.h>
>   #include <asm/page.h>
> @@ -103,6 +104,7 @@ static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
>   
>   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
>   static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
> +static DEFINE_PER_CPU(struct mm_struct *, cpu_patching_mm);
>   
>   #if IS_BUILTIN(CONFIG_LKDTM)
>   unsigned long read_cpu_patching_addr(unsigned int cpu)
> @@ -133,6 +135,51 @@ static int text_area_cpu_down(unsigned int cpu)
>   	return 0;
>   }
>   
> +static __always_inline void __poking_init_temp_mm(void)
> +{
> +	int cpu;
> +	spinlock_t *ptl; /* for protecting pte table */
> +	pte_t *ptep;
> +	struct mm_struct *patching_mm;
> +	unsigned long patching_addr;
> +
> +	for_each_possible_cpu(cpu) {
> +		/*
> +		 * Some parts of the kernel (static keys for example) depend on
> +		 * successful code patching. Code patching under
> +		 * STRICT_KERNEL_RWX requires this setup - otherwise we cannot
> +		 * patch at all. We use BUG_ON() here and later since an early
> +		 * failure is preferred to buggy behavior and/or strange
> +		 * crashes later.
> +		 */
> +		patching_mm = copy_init_mm();
> +		BUG_ON(!patching_mm);

Read https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on and 
https://github.com/linuxppc/issues/issues/88

Avoid BUG_ON()s thanks.

> +
> +		per_cpu(cpu_patching_mm, cpu) = patching_mm;
> +
> +		/*
> +		 * Choose a randomized, page-aligned address from the range:
> +		 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE] The lower
> +		 * address bound is PAGE_SIZE to avoid the zero-page.  The
> +		 * upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to
> +		 * stay under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
> +		 */
> +		patching_addr = PAGE_SIZE + ((get_random_long() & PAGE_MASK)
> +				% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));

% should be at the end of first line and the second line alignment should match open parenthesis in 
first line.

> +
> +		per_cpu(cpu_patching_addr, cpu) = patching_addr;
> +
> +		/*
> +		 * PTE allocation uses GFP_KERNEL which means we need to
> +		 * pre-allocate the PTE here because we cannot do the
> +		 * allocation during patching when IRQs are disabled.
> +		 */
> +		ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
> +		BUG_ON(!ptep);

Avoid BUG_ON() please


> +		pte_unmap_unlock(ptep, ptl);
> +	}
> +}
> +
>   /*
>    * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
>    * we judge it as being preferable to a kernel that will crash later when
> @@ -140,6 +187,11 @@ static int text_area_cpu_down(unsigned int cpu)
>    */
>   void __init poking_init(void)
>   {
> +	if (radix_enabled()) {
> +		__poking_init_temp_mm();
> +		return;
> +	}
> +
>   	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>   		"powerpc/text_poke:online", text_area_cpu_up,
>   		text_area_cpu_down));
> @@ -213,30 +265,96 @@ static inline int unmap_patch_area(void)
>   	return -EINVAL;
>   }
>   
> +struct patch_mapping {
> +	spinlock_t *ptl; /* for protecting pte table */
> +	pte_t *ptep;
> +	struct temp_mm temp_mm;
> +};
> +
> +/*
> + * This can be called for kernel text or a module.
> + */
> +static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
> +{
> +	struct page *page;
> +	pte_t pte;
> +	pgprot_t pgprot;
> +	struct mm_struct *patching_mm = __this_cpu_read(cpu_patching_mm);
> +	unsigned long patching_addr = __this_cpu_read(cpu_patching_addr);
> +
> +	if (is_vmalloc_or_module_addr(addr))
> +		page = vmalloc_to_page(addr);
> +	else
> +		page = virt_to_page(addr);
> +
> +	patch_mapping->ptep = get_locked_pte(patching_mm, patching_addr,
> +					     &patch_mapping->ptl);

Not sure you need to split this line, checkpatch now allows 100 chars per line.


> +	if (unlikely(!patch_mapping->ptep)) {
> +		pr_warn("map patch: failed to allocate pte for patching\n");

That's a lot better than all above BUG_ONs


> +		return -1;
> +	}
> +
> +	pgprot = PAGE_KERNEL;
> +	pte = mk_pte(page, pgprot);
> +	pte = pte_mkdirty(pte);

I'm sure you can do

	pte = pte_mkdirty(mk_pte(page, PAGE_KERNEL));

And indeed PAGE_KERNEL already includes _PAGE_DIRTY, so all you should need is

	pte = mk_pte(page, PAGE_KERNEL);

Or even just

	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, mk_pte(page, PAGE_KERNEL));


> +	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
> +
> +	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> +	use_temporary_mm(&patch_mapping->temp_mm);
> +
> +	return 0;
> +}
> +
> +static void unmap_patch(struct patch_mapping *patch_mapping)
> +{
> +	struct mm_struct *patching_mm = __this_cpu_read(cpu_patching_mm);
> +	unsigned long patching_addr = __this_cpu_read(cpu_patching_addr);
> +
> +	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
> +
> +	local_flush_tlb_mm(patching_mm);
> +
> +	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
> +
> +	unuse_temporary_mm(&patch_mapping->temp_mm);

Shouldn't you stop using it before unmapping/unlocking it ?


> +}
> +
>   static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
>   {
>   	int err, rc = 0;
>   	u32 *patch_addr = NULL;
>   	unsigned long flags;
> +	struct patch_mapping patch_mapping;
>   
>   	/*
> -	 * During early early boot patch_instruction is called
> -	 * when text_poke_area is not ready, but we still need
> -	 * to allow patching. We just do the plain old patching
> +	 * During early early boot patch_instruction is called when the
> +	 * patching_mm/text_poke_area is not ready, but we still need to allow
> +	 * patching. We just do the plain old patching.
>   	 */
> -	if (!this_cpu_read(text_poke_area))
> -		return raw_patch_instruction(addr, instr);
> +	if (radix_enabled()) {
> +		if (!this_cpu_read(cpu_patching_mm))
> +			return raw_patch_instruction(addr, instr);
> +	} else {
> +		if (!this_cpu_read(text_poke_area))
> +			return raw_patch_instruction(addr, instr);
> +	}
>   
>   	local_irq_save(flags);
>   
> -	err = map_patch_area(addr);
> +	if (radix_enabled())
> +		err = map_patch(addr, &patch_mapping);

Maybe call it map_patch_mm() or map_patch_mapping() ?

> +	else
> +		err = map_patch_area(addr);
>   	if (err)
>   		goto out;
>   
>   	patch_addr = (u32 *)(__this_cpu_read(cpu_patching_addr) | offset_in_page(addr));
>   	rc = __patch_instruction(addr, instr, patch_addr);
>   
> -	err = unmap_patch_area();
> +	if (radix_enabled())
> +		unmap_patch(&patch_mapping);

No err ? Would be better if it could return something, allthough always 0.

And same comment about naming.

> +	else
> +		err = unmap_patch_area();
>   
>   out:
>   	local_irq_restore(flags);
> 
