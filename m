Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1679AAF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 21:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkx3s43Xnz3dTx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 05:04:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkx2Q60w0z3c3q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 05:03:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Rkx2B17Jvz9vQn;
	Mon, 11 Sep 2023 21:03:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUW_7x_0OnXn; Mon, 11 Sep 2023 21:03:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Rkx275QlNz9vQp;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A0E68B77E;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6uy24cVqYCXI; Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F10E68B787;
	Mon, 11 Sep 2023 21:03:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38BJ3JlM3544233
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 21:03:19 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38BJ3J4I3544232;
	Mon, 11 Sep 2023 21:03:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 12/19] powerpc/nohash: Refactor pte_update()
Date: Mon, 11 Sep 2023 21:03:18 +0200
Message-ID: <3f04f96b9059e756bad9ffc0786b5f0062039342.1694443576.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694443576.git.christophe.leroy@csgroup.eu>
References: <cover.1694443576.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694458987; l=5130; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xkkBzed2zZJkZITyMdV9FKsj7P96yTZeDIXATjlEXm8=; b=ZoVGH7d3IDh4T2WkUTav7eUDCBb/gchkX3gp7BlF75eyB5izH0mNOS/mqYzDijfxPkwSZphl5 MUqS6qRDe6wDXeIt0e74jZRog4uicbAAy5XaS6sC9ireYkvoIana+yK
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

pte_update() is similar.

Take the nohash/32 version which works on nohash/64 and add the debug
call to assert_pte_locked() which is only on nohash/64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 33 ---------------
 arch/powerpc/include/asm/nohash/64/pgtable.h | 17 --------
 arch/powerpc/include/asm/nohash/pgtable.h    | 42 ++++++++++++++++++++
 3 files changed, 42 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index a74476de1ef6..ae7f3c8afd4f 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -9,8 +9,6 @@
 #include <linux/threads.h>
 #include <asm/mmu.h>			/* For sub-arch specific PPC_PIN_SIZE */
 
-extern int icache_44x_need_flush;
-
 #endif /* __ASSEMBLY__ */
 
 #define PTE_INDEX_SIZE	PTE_SHIFT
@@ -203,37 +201,6 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp = __pmd(0);
 }
 
-/*
- * PTE updates. This function is called whenever an existing
- * valid PTE is updated. This does -not- include set_pte_at()
- * which nowadays only sets a new PTE.
- *
- * Depending on the type of MMU, we may need to use atomic updates
- * and the PTE may be either 32 or 64 bit wide. In the later case,
- * when using atomic updates, only the low part of the PTE is
- * accessed atomically.
- *
- * In addition, on 44x, we also maintain a global flag indicating
- * that an executable user mapping was modified, which is needed
- * to properly flush the virtually tagged instruction cache of
- * those implementations.
- */
-#ifndef pte_update
-static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
-				     unsigned long clr, unsigned long set, int huge)
-{
-	pte_basic_t old = pte_val(*p);
-	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
-
-	*p = __pte(new);
-
-	if (IS_ENABLED(CONFIG_44x) && (old & _PAGE_USER) && (old & _PAGE_EXEC))
-		icache_44x_need_flush = 1;
-
-	return old;
-}
-#endif
-
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 					      unsigned long addr, pte_t *ptep)
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index f5a8e8a9dba4..b149a39f2685 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -171,23 +171,6 @@ static inline void p4d_set(p4d_t *p4dp, unsigned long val)
 	*p4dp = __p4d(val);
 }
 
-/* Atomic PTE updates */
-static inline unsigned long pte_update(struct mm_struct *mm,
-				       unsigned long addr,
-				       pte_t *ptep, unsigned long clr,
-				       unsigned long set,
-				       int huge)
-{
-	unsigned long old = pte_val(*ptep);
-	*ptep = __pte((old & ~clr) | set);
-
-	/* huge pages use the old page table lock */
-	if (!huge)
-		assert_pte_locked(mm, addr);
-
-	return old;
-}
-
 static inline int pte_young(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_ACCESSED;
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 3d684b500fe6..bd5c3a4baabd 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -2,6 +2,11 @@
 #ifndef _ASM_POWERPC_NOHASH_PGTABLE_H
 #define _ASM_POWERPC_NOHASH_PGTABLE_H
 
+#ifndef __ASSEMBLY__
+static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
+				     unsigned long clr, unsigned long set, int huge);
+#endif
+
 #if defined(CONFIG_PPC64)
 #include <asm/nohash/64/pgtable.h>
 #else
@@ -18,6 +23,43 @@
 
 #ifndef __ASSEMBLY__
 
+extern int icache_44x_need_flush;
+
+/*
+ * PTE updates. This function is called whenever an existing
+ * valid PTE is updated. This does -not- include set_pte_at()
+ * which nowadays only sets a new PTE.
+ *
+ * Depending on the type of MMU, we may need to use atomic updates
+ * and the PTE may be either 32 or 64 bit wide. In the later case,
+ * when using atomic updates, only the low part of the PTE is
+ * accessed atomically.
+ *
+ * In addition, on 44x, we also maintain a global flag indicating
+ * that an executable user mapping was modified, which is needed
+ * to properly flush the virtually tagged instruction cache of
+ * those implementations.
+ */
+#ifndef pte_update
+static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
+				     unsigned long clr, unsigned long set, int huge)
+{
+	pte_basic_t old = pte_val(*p);
+	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
+
+	*p = __pte(new);
+
+	if (IS_ENABLED(CONFIG_44x) && (old & _PAGE_USER) && (old & _PAGE_EXEC))
+		icache_44x_need_flush = 1;
+
+	/* huge pages use the old page table lock */
+	if (!huge)
+		assert_pte_locked(mm, addr);
+
+	return old;
+}
+#endif
+
 /* Generic accessors to PTE bits */
 #ifndef pte_write
 static inline int pte_write(pte_t pte)
-- 
2.41.0

