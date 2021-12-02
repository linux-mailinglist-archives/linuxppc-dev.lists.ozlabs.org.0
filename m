Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9EC4662FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 13:01:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4ZLX2JL6z2ybB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4ZKY59l6z2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 23:00:49 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J4ZKM1wPfz9sT4;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EWEZsUM2eIq; Thu,  2 Dec 2021 13:00:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J4ZKL5mMmz9sSP;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6A5F8B7BB;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Mm0lz5tDgq2D; Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.163])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 442A28B7C5;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1B2C0VUo177253
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 2 Dec 2021 13:00:31 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1B2C0VsH177252;
 Thu, 2 Dec 2021 13:00:31 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 04/11] powerpc/code-patching: Fix unmap_patch_area() error
 handling
Date: Thu,  2 Dec 2021 13:00:20 +0100
Message-Id: <299804b117fae35c786c827536c91f25352e279b.1638446239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
References: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638446424; l=2710; s=20211009;
 h=from:subject:message-id; bh=dnzE3hEwjNr2PhI9F6ZIsWK8sD3seRJ5LwRqpFunwNQ=;
 b=Vb8Ji7vYy51vdr5O4xcIsSvEOmuDwx9Mm4r/X52UBqMKOoiyyP9vY2L2zePjMQgl+6gJFDw3MfJ6
 bY/d/AfwBCZpOZflDE5lLcZd+xgUI/n6tZqeAnxZ5zKt676IX5zi
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

pXd_offset() doesn't return NULL. When the base is NULL, it
still adds the offset.

Use pXd_none() to check validity instead. It also improves
performance by folding out none existing levels as pXd_none()
always returns 0 in that case.

Such an error is unexpected, use WARN_ON() so that the caller
doesn't have to worry about it, and drop the returned value.

And now that unmap_patch_area() doesn't return error, we can
take into account the error returned by __patch_instruction().

While at it, remove the 'inline' property which is useless.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 4ce2b6457757..5fa719a4ee69 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -94,7 +94,7 @@ static int map_patch_area(void *addr, unsigned long text_poke_addr)
 	return map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);
 }
 
-static inline int unmap_patch_area(unsigned long addr)
+static void unmap_patch_area(unsigned long addr)
 {
 	pte_t *ptep;
 	pmd_t *pmdp;
@@ -103,32 +103,30 @@ static inline int unmap_patch_area(unsigned long addr)
 	pgd_t *pgdp;
 
 	pgdp = pgd_offset_k(addr);
-	if (unlikely(!pgdp))
-		return -EINVAL;
+	if (WARN_ON(pgd_none(*pgdp)))
+		return;
 
 	p4dp = p4d_offset(pgdp, addr);
-	if (unlikely(!p4dp))
-		return -EINVAL;
+	if (WARN_ON(p4d_none(*p4dp)))
+		return;
 
 	pudp = pud_offset(p4dp, addr);
-	if (unlikely(!pudp))
-		return -EINVAL;
+	if (WARN_ON(pud_none(*pudp)))
+		return;
 
 	pmdp = pmd_offset(pudp, addr);
-	if (unlikely(!pmdp))
-		return -EINVAL;
+	if (WARN_ON(pmd_none(*pmdp)))
+		return;
 
 	ptep = pte_offset_kernel(pmdp, addr);
-	if (unlikely(!ptep))
-		return -EINVAL;
+	if (WARN_ON(pte_none(*ptep)))
+		return;
 
 	/*
 	 * In hash, pte_clear flushes the tlb, in radix, we have to
 	 */
 	pte_clear(&init_mm, addr, ptep);
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-
-	return 0;
 }
 
 static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
@@ -156,11 +154,9 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 
 	patch_addr = (u32 *)(text_poke_addr + (kaddr & ~PAGE_MASK));
 
-	__patch_instruction(addr, instr, patch_addr);
+	err = __patch_instruction(addr, instr, patch_addr);
 
-	err = unmap_patch_area(text_poke_addr);
-	if (err)
-		pr_warn("failed to unmap %lx\n", text_poke_addr);
+	unmap_patch_area(text_poke_addr);
 
 out:
 	local_irq_restore(flags);
-- 
2.33.1

