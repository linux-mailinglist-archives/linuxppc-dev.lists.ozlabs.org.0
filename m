Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D64074AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 04:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5xjz1jfnz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 12:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=80.241.56.152;
 helo=mout-p-102.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5xjQ4Nx1z2yPS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 12:37:30 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4H5xX81GbvzQk9n;
 Sat, 11 Sep 2021 04:29:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 4/4] powerpc/64s: Initialize and use a temporary mm for
 patching on Radix
Date: Fri, 10 Sep 2021 21:29:04 -0500
Message-Id: <20210911022904.30962-5-cmr@bluescreens.de>
In-Reply-To: <20210911022904.30962-1-cmr@bluescreens.de>
References: <20210911022904.30962-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1293F26B
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
Cc: linux-hardening@vger.kernel.org
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
DEFAULT_MAP_WINDOW-PAGE_SIZE.

Bits of entropy with 64K page size on BOOK3S_64:

        bits of entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)

        PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
        bits of entropy = log2(128TB / 64K)
	bits of entropy = 31

The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash MMU
operates - by default the space above DEFAULT_MAP_WINDOW is not
available. Currently the Hash MMU does not use a temporary mm so
technically this upper limit isn't necessary; however, a larger
randomization range does not further "harden" this overall approach and
future work may introduce patching with a temporary mm on Hash as well.

Randomization occurs only once during initialization at boot for each
possible CPU in the system.

Introduce two new functions, map_patch_mm() and unmap_patch_mm(), to
respectively create and remove the temporary mapping with write
permissions at patching_addr. Map the page with PAGE_KERNEL to set
EAA[0] for the PTE which ignores the AMR (so no need to unlock/lock
KUAP) according to PowerISA v3.0b Figure 35 on Radix.

Based on x86 implementation:

commit 4fc19708b165
("x86/alternatives: Initialize temporary mm for patching")

and:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v6:  * Small clean-ups (naming, formatting, style, etc).
     * Call stop_using_temporary_mm() before pte_unmap_unlock() after
       patching.
     * Replace BUG_ON()s in poking_init() w/ WARN_ON()s.

v5:  * Only support Book3s64 Radix MMU for now.
     * Use a per-cpu datastructure to hold the patching_addr and
       patching_mm to avoid the need for a synchronization lock/mutex.

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
 arch/powerpc/lib/code-patching.c | 119 +++++++++++++++++++++++++++++--
 1 file changed, 112 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index e802e42c2789..af8e2a02a9dd 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -11,6 +11,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/random.h>
 
 #include <asm/tlbflush.h>
 #include <asm/page.h>
@@ -103,6 +104,7 @@ static inline void stop_using_temporary_mm(struct temp_mm *temp_mm)
 
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
+static DEFINE_PER_CPU(struct mm_struct *, cpu_patching_mm);
 
 static int text_area_cpu_up(unsigned int cpu)
 {
@@ -126,8 +128,48 @@ static int text_area_cpu_down(unsigned int cpu)
 	return 0;
 }
 
+static __always_inline void __poking_init_temp_mm(void)
+{
+	int cpu;
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+	struct mm_struct *patching_mm;
+	unsigned long patching_addr;
+
+	for_each_possible_cpu(cpu) {
+		patching_mm = copy_init_mm();
+		WARN_ON(!patching_mm);
+		per_cpu(cpu_patching_mm, cpu) = patching_mm;
+
+		/*
+		 * Choose a randomized, page-aligned address from the range:
+		 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE] The lower
+		 * address bound is PAGE_SIZE to avoid the zero-page.  The
+		 * upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to
+		 * stay under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
+		 */
+		patching_addr = PAGE_SIZE + ((get_random_long() & PAGE_MASK)
+				% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));
+		per_cpu(cpu_patching_addr, cpu) = patching_addr;
+
+		/*
+		 * PTE allocation uses GFP_KERNEL which means we need to
+		 * pre-allocate the PTE here because we cannot do the
+		 * allocation during patching when IRQs are disabled.
+		 */
+		ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
+		WARN_ON(!ptep);
+		pte_unmap_unlock(ptep, ptl);
+	}
+}
+
 void __init poking_init(void)
 {
+	if (radix_enabled()) {
+		__poking_init_temp_mm();
+		return;
+	}
+
 	WARN_ON(cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
 		text_area_cpu_down) < 0);
@@ -197,30 +239,93 @@ static inline int unmap_patch_area(void)
 	return 0;
 }
 
+struct patch_mapping {
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+	struct temp_mm temp_mm;
+};
+
+/*
+ * This can be called for kernel text or a module.
+ */
+static int map_patch_mm(const void *addr, struct patch_mapping *patch_mapping)
+{
+	struct page *page;
+	struct mm_struct *patching_mm = __this_cpu_read(cpu_patching_mm);
+	unsigned long patching_addr = __this_cpu_read(cpu_patching_addr);
+
+	if (is_vmalloc_or_module_addr(addr))
+		page = vmalloc_to_page(addr);
+	else
+		page = virt_to_page(addr);
+
+	patch_mapping->ptep = get_locked_pte(patching_mm, patching_addr,
+					     &patch_mapping->ptl);
+	if (unlikely(!patch_mapping->ptep)) {
+		pr_warn("map patch: failed to allocate pte for patching\n");
+		return -1;
+	}
+
+	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep,
+		   pte_mkdirty(mk_pte(page, PAGE_KERNEL)));
+
+	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
+	start_using_temporary_mm(&patch_mapping->temp_mm);
+
+	return 0;
+}
+
+static int unmap_patch_mm(struct patch_mapping *patch_mapping)
+{
+	struct mm_struct *patching_mm = __this_cpu_read(cpu_patching_mm);
+	unsigned long patching_addr = __this_cpu_read(cpu_patching_addr);
+
+	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
+
+	local_flush_tlb_mm(patching_mm);
+	stop_using_temporary_mm(&patch_mapping->temp_mm);
+
+	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
+
+	return 0;
+}
+
 static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 {
 	int err, rc = 0;
 	u32 *patch_addr = NULL;
 	unsigned long flags;
+	struct patch_mapping patch_mapping;
 
 	/*
-	 * During early early boot patch_instruction is called
-	 * when text_poke_area is not ready, but we still need
-	 * to allow patching. We just do the plain old patching
+	 * During early early boot patch_instruction is called when the
+	 * patching_mm/text_poke_area is not ready, but we still need to allow
+	 * patching. We just do the plain old patching.
 	 */
-	if (!this_cpu_read(text_poke_area))
-		return raw_patch_instruction(addr, instr);
+	if (radix_enabled()) {
+		if (!this_cpu_read(cpu_patching_mm))
+			return raw_patch_instruction(addr, instr);
+	} else {
+		if (!this_cpu_read(text_poke_area))
+			return raw_patch_instruction(addr, instr);
+	}
 
 	local_irq_save(flags);
 
-	err = map_patch_area(addr);
+	if (radix_enabled())
+		err = map_patch_mm(addr, &patch_mapping);
+	else
+		err = map_patch_area(addr);
 	if (err)
 		goto out;
 
 	patch_addr = (u32 *)(__this_cpu_read(cpu_patching_addr) | offset_in_page(addr));
 	rc = __patch_instruction(addr, instr, patch_addr);
 
-	err = unmap_patch_area();
+	if (radix_enabled())
+		err = unmap_patch_mm(&patch_mapping);
+	else
+		err = unmap_patch_area();
 
 out:
 	local_irq_restore(flags);
-- 
2.32.0

