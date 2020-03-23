Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D60D18EF04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 06:05:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m2Q10XymzDqkx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:05:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m2LC65j6zDqhk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 16:02:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48m2LB3Pkzz8tR6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 16:02:10 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48m2L92JF9z9sSG; Mon, 23 Mar 2020 16:02:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48m2L82vCwz9sRR
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 16:02:08 +1100 (AEDT)
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 54ACC808C8
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 00:51:26 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 210D26004B
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 00:51:22 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.230])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id E166F60049
 for <linuxppc-dev@ozlabs.org>; Mon, 23 Mar 2020 04:51:21 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 3/3] powerpc/lib: Use a temporary mm for code patching
Date: Sun, 22 Mar 2020 23:52:05 -0500
Message-Id: <20200323045205.20314-4-cmr@informatik.wtf>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323045205.20314-1-cmr@informatik.wtf>
References: <20200323045205.20314-1-cmr@informatik.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
mappings to other CPUs. These mappings should be kept local to the CPU
doing the patching. Use the pre-initialized temporary mm and patching
address for this purpose. Also add a check after patching to ensure the
patch succeeded.

Based on x86 implementation:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/lib/code-patching.c | 128 ++++++++++++++-----------------
 1 file changed, 57 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 18b88ecfc5a8..f156132e8975 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -19,6 +19,7 @@
 #include <asm/page.h>
 #include <asm/code-patching.h>
 #include <asm/setup.h>
+#include <asm/mmu_context.h>
 
 static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
 			       unsigned int *patch_addr)
@@ -65,99 +66,79 @@ void __init poking_init(void)
 	pte_unmap_unlock(ptep, ptl);
 }
 
-static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
-
-static int text_area_cpu_up(unsigned int cpu)
-{
-	struct vm_struct *area;
-
-	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
-	if (!area) {
-		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
-			cpu);
-		return -1;
-	}
-	this_cpu_write(text_poke_area, area);
-
-	return 0;
-}
-
-static int text_area_cpu_down(unsigned int cpu)
-{
-	free_vm_area(this_cpu_read(text_poke_area));
-	return 0;
-}
-
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
-
-	return 0;
-}
-late_initcall(setup_text_poke_area);
+struct patch_mapping {
+	spinlock_t *ptl; /* for protecting pte table */
+	struct temp_mm temp_mm;
+};
 
 /*
  * This can be called for kernel text or a module.
  */
-static int map_patch_area(void *addr, unsigned long text_poke_addr)
+static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
 {
-	unsigned long pfn;
-	int err;
+	struct page *page;
+	pte_t pte, *ptep;
+	pgprot_t pgprot;
 
 	if (is_vmalloc_addr(addr))
-		pfn = vmalloc_to_pfn(addr);
+		page = vmalloc_to_page(addr);
 	else
-		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
+		page = virt_to_page(addr);
 
-	err = map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
+	if (radix_enabled())
+		pgprot = __pgprot(pgprot_val(PAGE_KERNEL));
+	else
+		pgprot = PAGE_SHARED;
 
-	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err);
-	if (err)
+	ptep = get_locked_pte(patching_mm, patching_addr, &patch_mapping->ptl);
+	if (unlikely(!ptep)) {
+		pr_warn("map patch: failed to allocate pte for patching\n");
 		return -1;
+	}
+
+	pte = mk_pte(page, pgprot);
+	set_pte_at(patching_mm, patching_addr, ptep, pte);
+
+	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
+	use_temporary_mm(&patch_mapping->temp_mm);
 
 	return 0;
 }
 
-static inline int unmap_patch_area(unsigned long addr)
+static int unmap_patch(struct patch_mapping *patch_mapping)
 {
 	pte_t *ptep;
 	pmd_t *pmdp;
 	pud_t *pudp;
 	pgd_t *pgdp;
 
-	pgdp = pgd_offset_k(addr);
+	pgdp = pgd_offset(patching_mm, patching_addr);
 	if (unlikely(!pgdp))
 		return -EINVAL;
 
-	pudp = pud_offset(pgdp, addr);
+	pudp = pud_offset(pgdp, patching_addr);
 	if (unlikely(!pudp))
 		return -EINVAL;
 
-	pmdp = pmd_offset(pudp, addr);
+	pmdp = pmd_offset(pudp, patching_addr);
 	if (unlikely(!pmdp))
 		return -EINVAL;
 
-	ptep = pte_offset_kernel(pmdp, addr);
+	ptep = pte_offset_kernel(pmdp, patching_addr);
 	if (unlikely(!ptep))
 		return -EINVAL;
 
-	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
+	/*
+	 * In hash, pte_clear flushes the tlb
+	 */
+	pte_clear(patching_mm, patching_addr, ptep);
+	unuse_temporary_mm(&patch_mapping->temp_mm);
 
 	/*
-	 * In hash, pte_clear flushes the tlb, in radix, we have to
+	 * In radix, we have to explicitly flush the tlb (no-op in hash)
 	 */
-	pte_clear(&init_mm, addr, ptep);
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	local_flush_tlb_mm(patching_mm);
+	pte_unmap_unlock(ptep, patch_mapping->ptl);
 
 	return 0;
 }
@@ -167,33 +148,38 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 	int err;
 	unsigned int *patch_addr = NULL;
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
 
-	patch_addr = (unsigned int *)(text_poke_addr) +
-			((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
+	patch_addr = (unsigned int *)(patching_addr) +
+			(offset_in_page((unsigned long)addr) /
+				sizeof(unsigned int));
 
 	__patch_instruction(addr, instr, patch_addr);
 
-	err = unmap_patch_area(text_poke_addr);
+	err = unmap_patch(&patch_mapping);
 	if (err)
-		pr_warn("failed to unmap %lx\n", text_poke_addr);
+		pr_warn("unmap patch: failed to unmap patch\n");
+
+	/*
+	 * Something is wrong if what we just wrote doesn't match what we
+	 * think we just wrote.
+	 * XXX: BUG_ON() instead?
+	 */
+	WARN_ON(memcmp(addr, &instr, sizeof(instr)));
 
 out:
 	local_irq_restore(flags);
-- 
2.25.1

