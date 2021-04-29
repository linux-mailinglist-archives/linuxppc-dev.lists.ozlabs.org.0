Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C936E615
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6hj5sYzz3bpt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:34:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:111;
 helo=mout-y-111.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org
 [IPv6:2001:67c:2050:1::465:111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6cj0KK3z304F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:15 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4FW6Pc0hBpzQjwH;
 Thu, 29 Apr 2021 09:21:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id hxaeLrmAl8wU; Thu, 29 Apr 2021 09:21:36 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/11] powerpc: Initialize and use a temporary mm for
 patching
Date: Thu, 29 Apr 2021 02:20:54 -0500
Message-Id: <20210429072057.8870-9-cmr@bluescreens.de>
In-Reply-To: <20210429072057.8870-1-cmr@bluescreens.de>
References: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.57 / 15.00 / 15.00
X-Rspamd-Queue-Id: 291ED17DF
X-Rspamd-UID: 65f6aa
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When code patching a STRICT_KERNEL_RWX kernel the page containing the
address to be patched is temporarily mapped as writeable. Currently, a
per-cpu vmalloc patch area is used for this purpose. While the patch
area is per-cpu, the temporary page mapping is inserted into the kernel
page tables for the duration of patching. The mapping is exposed to CPUs
other than the patching CPU - this is undesirable from a hardening
perspective. Use a temporary mm instead which keeps the mapping local to
the CPU doing the patching.

Use the `poking_init` init hook to prepare a temporary mm and patching
address. Initialize the temporary mm by copying the init mm. Choose a
randomized patching address inside the temporary mm userspace address
space. The patching address is randomized between PAGE_SIZE and
DEFAULT_MAP_WINDOW-PAGE_SIZE. The upper limit is necessary due to how
the Book3s64 Hash MMU operates - by default the space above
DEFAULT_MAP_WINDOW is not available. For now, the patching address for
all platforms/MMUs is randomized inside this range.  The number of
possible random addresses is dependent on PAGE_SIZE and limited by
DEFAULT_MAP_WINDOW.

Bits of entropy with 64K page size on BOOK3S_64:

        bits of entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)

        PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
        bits of entropy = log2(128TB / 64K) bits of entropy = 31

Randomization occurs only once during initialization at boot.

Introduce two new functions, map_patch() and unmap_patch(), to
respectively create and remove the temporary mapping with write
permissions at patching_addr. The Hash MMU on Book3s64 requires mapping
the page for patching with PAGE_SHARED since the kernel cannot access
userspace pages with the PAGE_PRIVILEGED (PAGE_KERNEL) bit set.

Also introduce hash_prefault_mapping() to preload the SLB entry and HPTE
for the patching_addr when using the Hash MMU on Book3s64 to avoid
taking an SLB and Hash fault during patching.

Since patching_addr is now a userspace address, lock/unlock KUAP on
non-Book3s64 platforms. On Book3s64 with a Radix MMU, mapping the page
with PAGE_KERNEL sets EAA[0] for the PTE which ignores the AMR (KUAP)
according to PowerISA v3.0b Figure 35. On Book3s64 with a Hash MMU, the
hash PTE for the mapping is inserted with HPTE_USE_KERNEL_KEY which
similarly avoids the need for switching KUAP.

Finally, add a new WARN_ON() to check that the instruction was patched
as intended after the temporary mapping is torn down.

Based on x86 implementation:

commit 4fc19708b165
("x86/alternatives: Initialize temporary mm for patching")

and:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v4:  * In the previous series this was two separate patches: one to init
       the temporary mm in poking_init() (unused in powerpc at the time)
       and the other to use it for patching (which removed all the
       per-cpu vmalloc code). Now that we use poking_init() in the
       existing per-cpu vmalloc approach, that separation doesn't work
       as nicely anymore so I just merged the two patches into one.
     * Preload the SLB entry and hash the page for the patching_addr
       when using Hash on book3s64 to avoid taking an SLB and Hash fault
       during patching. The previous implementation was a hack which
       changed current->mm to allow the SLB and Hash fault handlers to
       work with the temporary mm since both of those code-paths always
       assume mm == current->mm.
     * Also (hmm - seeing a trend here) with the book3s64 Hash MMU we
       have to manage the mm->context.active_cpus counter and mm cpumask
       since they determine (via mm_is_thread_local()) if the TLB flush
       in pte_clear() is local or not - it should always be local when
       we're using the temporary mm. On book3s64's Radix MMU we can
       just call local_flush_tlb_mm().
     * Use HPTE_USE_KERNEL_KEY on Hash to avoid costly lock/unlock of
       KUAP.
---
 arch/powerpc/lib/code-patching.c | 209 ++++++++++++++++++-------------
 1 file changed, 121 insertions(+), 88 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index cbdfba8a39360..7e15abc09ec04 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -11,6 +11,8 @@
 #include <linux/cpuhotplug.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/sched/task.h>
+#include <linux/random.h>
 
 #include <asm/tlbflush.h>
 #include <asm/page.h>
@@ -19,6 +21,7 @@
 #include <asm/inst.h>
 #include <asm/mmu_context.h>
 #include <asm/debug.h>
+#include <asm/tlb.h>
 
 static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr,
 			       struct ppc_inst *patch_addr)
@@ -113,113 +116,142 @@ static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
 	}
 }
 
-static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
+static struct mm_struct *patching_mm __ro_after_init;
+static unsigned long patching_addr __ro_after_init;
+
+void __init poking_init(void)
+{
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+
+	/*
+	 * Some parts of the kernel (static keys for example) depend on
+	 * successful code patching. Code patching under STRICT_KERNEL_RWX
+	 * requires this setup - otherwise we cannot patch at all. We use
+	 * BUG_ON() here and later since an early failure is preferred to
+	 * buggy behavior and/or strange crashes later.
+	 */
+	patching_mm = copy_init_mm();
+	BUG_ON(!patching_mm);
+
+	/*
+	 * Choose a randomized, page-aligned address from the range:
+	 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE]
+	 * The lower address bound is PAGE_SIZE to avoid the zero-page.
+	 * The upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to stay
+	 * under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
+	 */
+	patching_addr = PAGE_SIZE + ((get_random_long() & PAGE_MASK)
+			% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));
+
+	/*
+	 * PTE allocation uses GFP_KERNEL which means we need to pre-allocate
+	 * the PTE here. We cannot do the allocation during patching with IRQs
+	 * disabled (ie. "atomic" context).
+	 */
+	ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
+	BUG_ON(!ptep);
+	pte_unmap_unlock(ptep, ptl);
+}
 
 #if IS_BUILTIN(CONFIG_LKDTM)
 unsigned long read_cpu_patching_addr(unsigned int cpu)
 {
-	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
+	return patching_addr;
 }
 #endif
 
-static int text_area_cpu_up(unsigned int cpu)
+struct patch_mapping {
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+	struct temp_mm temp_mm;
+};
+
+#ifdef CONFIG_PPC_BOOK3S_64
+
+static inline int hash_prefault_mapping(pgprot_t pgprot)
 {
-	struct vm_struct *area;
+	int err;
 
-	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
-	if (!area) {
-		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
-			cpu);
-		return -1;
-	}
-	this_cpu_write(text_poke_area, area);
+	if (radix_enabled())
+		return 0;
 
-	return 0;
-}
+	err = slb_allocate_user(patching_mm, patching_addr);
+	if (err)
+		pr_warn("map patch: failed to allocate slb entry\n");
 
-static int text_area_cpu_down(unsigned int cpu)
-{
-	free_vm_area(this_cpu_read(text_poke_area));
-	return 0;
+	err = hash_page_mm(patching_mm, patching_addr, pgprot_val(pgprot), 0,
+			   HPTE_USE_KERNEL_KEY);
+	if (err)
+		pr_warn("map patch: failed to insert hashed page\n");
+
+	/* See comment in switch_slb() in mm/book3s64/slb.c */
+	isync();
+
+	return err;
 }
 
-/*
- * Run as a late init call. This allows all the boot time patching to be done
- * simply by patching the code, and then we're called here prior to
- * mark_rodata_ro(), which happens after all init calls are run. Although
- * BUG_ON() is rude, in this case it should only happen if ENOMEM, and we judge
- * it as being preferable to a kernel that will crash later when someone tries
- * to use patch_instruction().
- */
-static int __init setup_text_poke_area(void)
-{
-	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-		"powerpc/text_poke:online", text_area_cpu_up,
-		text_area_cpu_down));
+#else
 
+static inline int hash_prefault_mapping(pgprot_t pgprot)
+{
 	return 0;
 }
-late_initcall(setup_text_poke_area);
+
+#endif /* CONFIG_PPC_BOOK3S_64 */
 
 /*
  * This can be called for kernel text or a module.
  */
-static int map_patch_area(void *addr, unsigned long text_poke_addr)
+static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
 {
-	unsigned long pfn;
-	int err;
+	struct page *page;
+	pte_t pte;
+	pgprot_t pgprot;
 
 	if (is_vmalloc_or_module_addr(addr))
-		pfn = vmalloc_to_pfn(addr);
+		page = vmalloc_to_page(addr);
 	else
-		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
+		page = virt_to_page(addr);
 
-	err = map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
+	if (radix_enabled())
+		pgprot = PAGE_KERNEL;
+	else
+		pgprot = PAGE_SHARED;
 
-	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err);
-	if (err)
+	patch_mapping->ptep = get_locked_pte(patching_mm, patching_addr,
+					     &patch_mapping->ptl);
+	if (unlikely(!patch_mapping->ptep)) {
+		pr_warn("map patch: failed to allocate pte for patching\n");
 		return -1;
+	}
 
-	return 0;
-}
-
-static inline int unmap_patch_area(unsigned long addr)
-{
-	pte_t *ptep;
-	pmd_t *pmdp;
-	pud_t *pudp;
-	p4d_t *p4dp;
-	pgd_t *pgdp;
-
-	pgdp = pgd_offset_k(addr);
-	if (unlikely(!pgdp))
-		return -EINVAL;
-
-	p4dp = p4d_offset(pgdp, addr);
-	if (unlikely(!p4dp))
-		return -EINVAL;
+	pte = mk_pte(page, pgprot);
+	pte = pte_mkdirty(pte);
+	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
 
-	pudp = pud_offset(p4dp, addr);
-	if (unlikely(!pudp))
-		return -EINVAL;
+	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
+	use_temporary_mm(&patch_mapping->temp_mm);
 
-	pmdp = pmd_offset(pudp, addr);
-	if (unlikely(!pmdp))
-		return -EINVAL;
+	/*
+	 * On Book3s64 with the Hash MMU we have to manually insert the SLB
+	 * entry and HPTE to prevent taking faults on the patching_addr later.
+	 */
+	return(hash_prefault_mapping(pgprot));
+}
 
-	ptep = pte_offset_kernel(pmdp, addr);
-	if (unlikely(!ptep))
-		return -EINVAL;
+static void unmap_patch(struct patch_mapping *patch_mapping)
+{
+	/* Book3s64 Hash MMU: pte_clear() flushes the TLB */
+	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
 
-	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
+	/* Book3s64 Radix MMU: explicitly flush the TLB (no-op in Hash MMU) */
+	local_flush_tlb_mm(patching_mm);
 
-	/*
-	 * In hash, pte_clear flushes the tlb, in radix, we have to
-	 */
-	pte_clear(&init_mm, addr, ptep);
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
 
-	return 0;
+	/* Book3s64 Hash MMU: switch_mm_irqs_off() invalidates the SLB */
+	unuse_temporary_mm(&patch_mapping->temp_mm);
 }
 
 static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
@@ -227,32 +259,33 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 	int err;
 	struct ppc_inst *patch_addr = NULL;
 	unsigned long flags;
-	unsigned long text_poke_addr;
-	unsigned long kaddr = (unsigned long)addr;
+	struct patch_mapping patch_mapping;
 
 	/*
-	 * During early early boot patch_instruction is called
-	 * when text_poke_area is not ready, but we still need
-	 * to allow patching. We just do the plain old patching
+	 * The patching_mm is initialized before calling mark_rodata_ro. Prior
+	 * to this, patch_instruction is called when we don't have (and don't
+	 * need) the patching_mm so just do plain old patching.
 	 */
-	if (!this_cpu_read(text_poke_area))
+	if (!patching_mm)
 		return raw_patch_instruction(addr, instr);
 
 	local_irq_save(flags);
 
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
-	if (map_patch_area(addr, text_poke_addr)) {
-		err = -1;
+	err = map_patch(addr, &patch_mapping);
+	if (err)
 		goto out;
-	}
 
-	patch_addr = (struct ppc_inst *)(text_poke_addr + (kaddr & ~PAGE_MASK));
+	patch_addr = (struct ppc_inst *)(patching_addr | offset_in_page(addr));
 
-	__patch_instruction(addr, instr, patch_addr);
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		allow_read_write_user(patch_addr, patch_addr, ppc_inst_len(instr));
+	err = __patch_instruction(addr, instr, patch_addr);
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		prevent_read_write_user(patch_addr, patch_addr, ppc_inst_len(instr));
 
-	err = unmap_patch_area(text_poke_addr);
-	if (err)
-		pr_warn("failed to unmap %lx\n", text_poke_addr);
+	unmap_patch(&patch_mapping);
+
+	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
 
 out:
 	local_irq_restore(flags);
-- 
2.26.1

