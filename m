Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC81BD212
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 04:07:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bhjz2wm4zDr24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bhdx4pFTzDr0R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 12:04:21 +1000 (AEST)
Received: from MTA-14-4.privateemail.com (mta-14.privateemail.com
 [198.54.118.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 244AE80A8D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 22:04:18 -0400 (EDT)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 8C92C80064;
 Tue, 28 Apr 2020 22:04:14 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-14.privateemail.com (Postfix) with ESMTPA id D8D2080060;
 Wed, 29 Apr 2020 02:04:13 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@lists.ozlabs.org,
	kernel-hardening@lists.openwall.com
Subject: [RFC PATCH v2 3/5] powerpc/lib: Use a temporary mm for code patching
Date: Tue, 28 Apr 2020 21:05:29 -0500
Message-Id: <20200429020531.20684-4-cmr@informatik.wtf>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429020531.20684-1-cmr@informatik.wtf>
References: <20200429020531.20684-1-cmr@informatik.wtf>
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

Use the KUAP functions on non-BOOKS3_64 platforms since the temporary
mapping for patching uses a userspace address (to keep the mapping
local). On BOOKS3_64 platforms hash does not implement KUAP and on radix
the use of PAGE_KERNEL sets EAA[0] for the PTE which means the AMR
(KUAP) protection is ignored (see PowerISA v3.0b, Fig, 35).

Based on x86 implementation:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/lib/code-patching.c | 149 ++++++++++++-------------------
 1 file changed, 55 insertions(+), 94 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 259c19480a85..26f06cdb5d7e 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -19,6 +19,7 @@
 #include <asm/page.h>
 #include <asm/code-patching.h>
 #include <asm/setup.h>
+#include <asm/mmu_context.h>
 
 static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
 			       unsigned int *patch_addr)
@@ -72,101 +73,58 @@ void __init poking_init(void)
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
+	pte_t *ptep;
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
+	pte_t pte;
+	pgprot_t pgprot;
 
 	if (is_vmalloc_addr(addr))
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
+
+	pte = mk_pte(page, pgprot);
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		pte = pte_mkdirty(pte);
+	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
+
+	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
+	use_temporary_mm(&patch_mapping->temp_mm);
 
 	return 0;
 }
 
-static inline int unmap_patch_area(unsigned long addr)
+static void unmap_patch(struct patch_mapping *patch_mapping)
 {
-	pte_t *ptep;
-	pmd_t *pmdp;
-	pud_t *pudp;
-	pgd_t *pgdp;
-
-	pgdp = pgd_offset_k(addr);
-	if (unlikely(!pgdp))
-		return -EINVAL;
-
-	pudp = pud_offset(pgdp, addr);
-	if (unlikely(!pudp))
-		return -EINVAL;
-
-	pmdp = pmd_offset(pudp, addr);
-	if (unlikely(!pmdp))
-		return -EINVAL;
-
-	ptep = pte_offset_kernel(pmdp, addr);
-	if (unlikely(!ptep))
-		return -EINVAL;
+	/* In hash, pte_clear flushes the tlb */
+	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
+	unuse_temporary_mm(&patch_mapping->temp_mm);
 
-	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
-
-	/*
-	 * In hash, pte_clear flushes the tlb, in radix, we have to
-	 */
-	pte_clear(&init_mm, addr, ptep);
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-
-	return 0;
+	/* In radix, we have to explicitly flush the tlb (no-op in hash) */
+	local_flush_tlb_mm(patching_mm);
+	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
 }
 
 static int do_patch_instruction(unsigned int *addr, unsigned int instr)
@@ -174,33 +132,36 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
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
+	patch_addr = (unsigned int *)(patching_addr | offset_in_page(addr));
 
-	__patch_instruction(addr, instr, patch_addr);
+	if (!radix_enabled())
+		allow_write_to_user(patch_addr, sizeof(instr));
+	err = __patch_instruction(addr, instr, patch_addr);
+	if (!radix_enabled())
+		prevent_write_to_user(patch_addr, sizeof(instr));
 
-	err = unmap_patch_area(text_poke_addr);
-	if (err)
-		pr_warn("failed to unmap %lx\n", text_poke_addr);
+	unmap_patch(&patch_mapping);
+	/*
+	 * Something is wrong if what we just wrote doesn't match what we
+	 * think we just wrote.
+	 */
+	WARN_ON(*addr != instr);
 
 out:
 	local_irq_restore(flags);
-- 
2.26.1

