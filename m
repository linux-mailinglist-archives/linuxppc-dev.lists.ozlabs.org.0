Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10022569C70
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 10:07:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldpsx00LGz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 18:07:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdpsT3rlmz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 18:06:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LdpsH64xtz9tCS;
	Thu,  7 Jul 2022 10:06:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Li-Xwk3QDtB; Thu,  7 Jul 2022 10:06:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LdpsH5Gkpz9tCP;
	Thu,  7 Jul 2022 10:06:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A3CFE8B79F;
	Thu,  7 Jul 2022 10:06:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id m_jbEc0-QBnx; Thu,  7 Jul 2022 10:06:43 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (po20309.idsi0.si.c-s.fr [192.168.233.123])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E8528B768;
	Thu,  7 Jul 2022 10:06:43 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 26786Th0478042
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 7 Jul 2022 10:06:29 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 26786RM0478030;
	Thu, 7 Jul 2022 10:06:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/code-patching: Speed up page mapping/unmapping on PPC32
Date: Thu,  7 Jul 2022 10:06:18 +0200
Message-Id: <1feabfad5952631acc033d671fad722706c4dd59.1657181170.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657181176; l=3182; s=20211009; h=from:subject:message-id; bh=qwhrSHeqOdSBuhjAZ7n0ZaDDCNODjbH+IoPBYXh8TLE=; b=Eu+muKObPx2nnetst4eRQIP8D4t+eSz6fBgEcqfF5o0mUE1vt7zXPiTNXqKOa1Z/wr6+ErHJsz1H X4OFI5j7BJVzJ1P6BhJ4/vSElRORJQwxcEh1webfYjxJFl93mA/K
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 591b4b268435 ("powerpc/code-patching: Pre-map patch area")
the patch area is premapped so intermediate page tables are already
allocated.

Use __set_pte_at() directly instead of the heavy map_kernel_page(),
at for unmapping just do a pte_clear() followed by a flush.

__set_pte_at() can be used directly without the filters in
set_pte_at() because we are mapping a normal page non executable.

Make sure gcc knows text_poke_area is page aligned in order to
optimise the flush.

This change reduces by 66% the time needed to activate ftrace on
an 8xx (588000 tb ticks instead of 1744000).

Don't perform the change on PPC64 for now, as it is problematic for
the time being.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Only do it on PPC32 for now, mpe reported a problem on PPC64, see https://lore.kernel.org/lkml/165261053687.1047019.4165741740473209888.b4-ty@ellerman.id.au/T/#m9d91e820c43ebe56a72ad89403dac9eb270f5bb6
---
 arch/powerpc/lib/code-patching.c | 37 ++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 6edf0697a526..01b9f5dc79d6 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -94,17 +94,20 @@ void __init poking_init(void)
 	static_branch_enable(&poking_init_done);
 }
 
+static unsigned long get_patch_pfn(void *addr)
+{
+	if (IS_ENABLED(CONFIG_MODULES) && is_vmalloc_or_module_addr(addr))
+		return vmalloc_to_pfn(addr);
+	else
+		return __pa_symbol(addr) >> PAGE_SHIFT;
+}
+
 /*
  * This can be called for kernel text or a module.
  */
 static int map_patch_area(void *addr, unsigned long text_poke_addr)
 {
-	unsigned long pfn;
-
-	if (IS_ENABLED(CONFIG_MODULES) && is_vmalloc_or_module_addr(addr))
-		pfn = vmalloc_to_pfn(addr);
-	else
-		pfn = __pa_symbol(addr) >> PAGE_SHIFT;
+	unsigned long pfn = get_patch_pfn(addr);
 
 	return map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
 }
@@ -149,17 +152,29 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	int err;
 	u32 *patch_addr;
 	unsigned long text_poke_addr;
+	pte_t *pte;
+	unsigned long pfn = get_patch_pfn(addr);
 
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
+	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
 	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
 
-	err = map_patch_area(addr, text_poke_addr);
-	if (err)
-		return err;
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		pte = virt_to_kpte(text_poke_addr);
+		__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
+	} else {
+		err = map_patch_area(addr, text_poke_addr);
+		if (err)
+			return err;
+	}
 
 	err = __patch_instruction(addr, instr, patch_addr);
 
-	unmap_patch_area(text_poke_addr);
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		pte_clear(&init_mm, text_poke_addr, pte);
+		flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
+	} else {
+		unmap_patch_area(text_poke_addr);
+	}
 
 	return err;
 }
-- 
2.36.1

