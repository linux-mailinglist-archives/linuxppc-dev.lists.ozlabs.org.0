Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7657D253D5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 08:02:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcXFM2SSKzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 16:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.87;
 helo=se18-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se18-4.privateemail.com (se18-4.privateemail.com
 [198.54.127.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcXCN4NKRzDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 16:00:48 +1000 (AEST)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <cmr@codefail.de>)
 id 1kBAOn-0000UN-Pc; Wed, 26 Aug 2020 22:24:35 -0700
Received: from MTA-13.privateemail.com (unknown [10.20.147.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id B3AACA70;
 Thu, 27 Aug 2020 05:24:33 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 9CC2080053;
 Thu, 27 Aug 2020 01:24:29 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.231])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 97E1B80065;
 Thu, 27 Aug 2020 05:24:22 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/6] powerpc: Use a temporary mm for code patching
Date: Thu, 27 Aug 2020 00:26:59 -0500
Message-Id: <20200827052659.24922-7-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827052659.24922-1-cmr@codefail.de>
References: <20200827052659.24922-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.000585059256087)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhVXNNxSVjR90Xn
 MyPKk7P6/ETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kq02yUY2BU41HLqp9U+7si8M8
 LdvJpZ7k99Lvu8YZXeI6p5bbhGYzvfahQ7X4A9L0Ye/JicEYVQv1wTfnWwJUGLoHT+TiZ2cHCmVO
 a6Hj9oiE0WSLndgNEtBdBgcB1mbTJODXbtOodkPED+RkHjVGH2xZ/WG2ZLv5RT/cF5Q6687AHRjU
 JmjnvGEokRBTZJpViFKfD1jKgYfH+6S5qDVYoJU2GVfilQJSaX7ehrnJEB/bhw3Crbac1ieeuRax
 ITFpzO11BRKqT8B4uLrn7iz8uvLBMzbIQcSG8L0jOzL80Q1MxDcqDeEvahfPkDkTlH91LgaQnmF8
 H6pa6B8MTK1ligAJ9G0GMvMSOAhk0taEj8weJNI+C0vMCMVtmGEXbiaCRPGqg4v6OwYy/yt5Cj+T
 3txbXpCgbiKBsA+Ddi6maweYdUirBly/K12a4uqqibUj/dHBojDbLVZkEx6TcwTT039q0aZI3qbh
 XsaDdLgW9brs8lq6YeUVTmb2st+aVE9JYOaeuiH/yEdZH8S1+TgcJBOjh0vPxcQOjKKOrYIQYpwa
 mUdylUIKhf3z2GAHxH7IMNrut00GZ5qvF8IF7tMR72KEsztVVBDOPEFKS2UxZBa4usXI0/RRtkWs
 roL69if1wov2GavqJ07j7hZY8mVbefiuK2KN35hXmy7nXQ2QuBuxX4OQOI/UQ6jnFfMBgzwOw1To
 H/cUtROfGg27pVfRPjU3fSpvtX7kDRT+AqQr2T3rxJw/s9JEmzH0m3M+UGtqNj9Evvd+SsDHzFys
 9Dg+KBYtnE0AZFYX5uoEURkdF/pDPDo3pDJlUlQ25PasjIMI9uAIvgWsH+Wq0zDLDi3S8euO5TcD
 eKjrEmYPn2IVWRsZR6NeDQwp7lDA8K9tDm+p97/T4LRRVYxF+VXiiOfHJN40eTXlWiUAYdLmsJdA
 oPKCpWwKtkkGG+bEnfOEkWTNI3SjTCvjMfNBc9ze9o81pXKSQ+GI7QB7PH97h6/L6Wb57LVs51cV
 C2TOjdXlLnr1FFwa8AyQYqjO7qYtiXb+9Q==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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

Currently, code patching a STRICT_KERNEL_RWX exposes the temporary
mappings to other CPUs. These mappings should be kept local to the CPU
doing the patching. Use the pre-initialized temporary mm and patching
address for this purpose. Also add a check after patching to ensure the
patch succeeded.

Toggle KUAP on non-radix MMU platforms when patching since the temporary
mapping for patching uses a userspace address. With a radix MMU this is
not required since mapping a page with PAGE_KERNEL sets EAA[0] for the
PTE which means the AMR (KUAP) protection is ignored (see PowerISA
v3.0b, Fig. 35).

Based on x86 implementation:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/lib/code-patching.c | 153 +++++++++++--------------------
 1 file changed, 54 insertions(+), 99 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 051d7ae6d8ee..9fb098680da8 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -149,113 +149,64 @@ void __init poking_init(void)
 	pte_unmap_unlock(ptep, ptl);
 }
 
-static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
-
 #ifdef CONFIG_LKDTM
 unsigned long read_cpu_patching_addr(unsigned int cpu)
 {
-	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
+	return patching_addr;
 }
 #endif
 
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
+
+	pte = mk_pte(page, pgprot);
+	pte = pte_mkdirty(pte);
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
-
-	pudp = pud_offset(p4dp, addr);
-	if (unlikely(!pudp))
-		return -EINVAL;
-
-	pmdp = pmd_offset(pudp, addr);
-	if (unlikely(!pmdp))
-		return -EINVAL;
+	/* In hash, pte_clear flushes the tlb */
+	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
+	unuse_temporary_mm(&patch_mapping->temp_mm);
 
-	ptep = pte_offset_kernel(pmdp, addr);
-	if (unlikely(!ptep))
-		return -EINVAL;
-
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
 
 static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
@@ -263,32 +214,36 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
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
+	if (!radix_enabled())
+		allow_write_to_user(patch_addr, ppc_inst_len(instr));
+	err = __patch_instruction(addr, instr, patch_addr);
+	if (!radix_enabled())
+		prevent_write_to_user(patch_addr, ppc_inst_len(instr));
 
-	err = unmap_patch_area(text_poke_addr);
-	if (err)
-		pr_warn("failed to unmap %lx\n", text_poke_addr);
+	unmap_patch(&patch_mapping);
+	/*
+	 * Something is wrong if what we just wrote doesn't match what we
+	 * think we just wrote.
+	 */
+	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
 
 out:
 	local_irq_restore(flags);
-- 
2.28.0

