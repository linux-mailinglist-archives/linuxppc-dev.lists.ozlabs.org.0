Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B14E4341
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 16:42:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNG2h6gvZz3bdT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 02:42:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNG0s5GMPz30hl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 02:41:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KNG0S6KMDz9sTf;
 Tue, 22 Mar 2022 16:40:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdS7A4p8cTJ3; Tue, 22 Mar 2022 16:40:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KNG0N0gHPz9sTX;
 Tue, 22 Mar 2022 16:40:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0522E8B763;
 Tue, 22 Mar 2022 16:40:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GtRwm26YODKb; Tue, 22 Mar 2022 16:40:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.14])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2F258B776;
 Tue, 22 Mar 2022 16:40:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22MFeT9R1513370
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 16:40:29 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22MFeT5D1513369;
 Tue, 22 Mar 2022 16:40:29 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 2/4] powerpc/code-patching: Speed up page mapping/unmapping
Date: Tue, 22 Mar 2022 16:40:19 +0100
Message-Id: <3a1e34312b5c169cde846174c275241db85f7406.1647962456.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647962456.git.christophe.leroy@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647963619; l=2635; s=20211009;
 h=from:subject:message-id; bh=35yiHUmQqTxn+N9RYcp08cbKx03tJYDkvUBA219cU6Q=;
 b=C1icnQR+MZ6ADKWVnpRpqlb+vWViOhf0mEe0MchKsPUtNDbD69fdcgFkM7Crvql273l7ISOsCS4r
 vocZXidRCkWjGuy8MaUzY/j17WJUfzCAxHHqn5HSwDR8dbaeozAW
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f970f189875b..62692c6031bc 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -90,17 +90,20 @@ void __init poking_init(void)
 		text_area_cpu_down));
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
@@ -145,17 +148,19 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
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
+	pte = virt_to_kpte(text_poke_addr);
+	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
 
 	err = __patch_instruction(addr, instr, patch_addr);
 
-	unmap_patch_area(text_poke_addr);
+	pte_clear(&init_mm, text_poke_addr, pte);
+	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
 
 	return err;
 }
-- 
2.35.1

