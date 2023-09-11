Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1879AAFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 21:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkx6X3lMtz3fJ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 05:07:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkx2m67Ymz3cVK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 05:04:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Rkx2H1c5Wz9vRb;
	Mon, 11 Sep 2023 21:03:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjonPj-IqfdS; Mon, 11 Sep 2023 21:03:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Rkx276ffKz9vRr;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A79888B7AE;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xpGaFA-4WJf4; Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 070AF8B796;
	Mon, 11 Sep 2023 21:03:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38BJ3JxJ3544245
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 21:03:19 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38BJ3JlQ3544244;
	Mon, 11 Sep 2023 21:03:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 15/19] powerpc/nohash: Deduplicate pte helpers
Date: Mon, 11 Sep 2023 21:03:21 +0200
Message-ID: <4f05d3e5269d152b1065ef70ce54c6d098c971b8.1694443576.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694443576.git.christophe.leroy@csgroup.eu>
References: <cover.1694443576.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694458987; l=4616; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7Nj78NI8w1zn6IUFHsjJFgSVFFWBM7nNkBOO0XrdP0o=; b=yqyX2yaAL7lh6EtoW18zilwI9NP9fEuS0Jbyu+8TfK2uzwxG9TWrYjlWdKdxB1mOAtCaYOzMu 2b48X6IsVgqALmD4mh2yIdtFVr76PHNE8unFnY9cyagCuguToR6X8uj
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

Deduplicate following helpers that are identical on
nohash/32 and nohash/64:
  pte_mkwrite_novma()
  pte_mkdirty()
  pte_mkyoung()
  pte_wrprotect()
  pte_mkexec()
  pte_young()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 36 --------------------
 arch/powerpc/include/asm/nohash/64/pgtable.h | 25 --------------
 arch/powerpc/include/asm/nohash/pgtable.h    | 36 ++++++++++++++++++++
 3 files changed, 36 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index a39ecd498084..de51f78449a0 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -156,37 +156,6 @@
 #define pte_clear(mm, addr, ptep) \
 	do { pte_update(mm, addr, ptep, ~0, 0, 0); } while (0)
 
-#ifndef pte_mkwrite_novma
-static inline pte_t pte_mkwrite_novma(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_RW);
-}
-#endif
-
-static inline pte_t pte_mkdirty(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_DIRTY);
-}
-
-static inline pte_t pte_mkyoung(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_ACCESSED);
-}
-
-#ifndef pte_wrprotect
-static inline pte_t pte_wrprotect(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~_PAGE_RW);
-}
-#endif
-
-#ifndef pte_mkexec
-static inline pte_t pte_mkexec(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_EXEC);
-}
-#endif
-
 #define pmd_none(pmd)		(!pmd_val(pmd))
 #define	pmd_bad(pmd)		(pmd_val(pmd) & _PMD_BAD)
 #define	pmd_present(pmd)	(pmd_val(pmd) & _PMD_PRESENT_MASK)
@@ -238,11 +207,6 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 }
 #endif
 
-static inline int pte_young(pte_t pte)
-{
-	return pte_val(pte) & _PAGE_ACCESSED;
-}
-
 /*
  * Note that on Book E processors, the pmd contains the kernel virtual
  * (lowmem) address of the pte page.  The physical address is less useful
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 34a518a1c04d..e8bbc6ec1084 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -80,26 +80,6 @@
 #ifndef __ASSEMBLY__
 /* pte_clear moved to later in this file */
 
-static inline pte_t pte_mkwrite_novma(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_RW);
-}
-
-static inline pte_t pte_mkdirty(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_DIRTY);
-}
-
-static inline pte_t pte_mkyoung(pte_t pte)
-{
-	return __pte(pte_val(pte) | _PAGE_ACCESSED);
-}
-
-static inline pte_t pte_wrprotect(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~_PAGE_RW);
-}
-
 #define PMD_BAD_BITS		(PTE_TABLE_SIZE-1)
 #define PUD_BAD_BITS		(PMD_TABLE_SIZE-1)
 
@@ -165,11 +145,6 @@ static inline void p4d_set(p4d_t *p4dp, unsigned long val)
 	*p4dp = __p4d(val);
 }
 
-static inline int pte_young(pte_t pte)
-{
-	return pte_val(pte) & _PAGE_ACCESSED;
-}
-
 static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 					      unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index c64a040f4a6a..21f232d2e34f 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -70,6 +70,37 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 #endif
 
 /* Generic accessors to PTE bits */
+#ifndef pte_mkwrite_novma
+static inline pte_t pte_mkwrite_novma(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_RW);
+}
+#endif
+
+static inline pte_t pte_mkdirty(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_DIRTY);
+}
+
+static inline pte_t pte_mkyoung(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_ACCESSED);
+}
+
+#ifndef pte_wrprotect
+static inline pte_t pte_wrprotect(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~_PAGE_RW);
+}
+#endif
+
+#ifndef pte_mkexec
+static inline pte_t pte_mkexec(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_EXEC);
+}
+#endif
+
 #ifndef pte_write
 static inline int pte_write(pte_t pte)
 {
@@ -96,6 +127,11 @@ static inline bool pte_hw_valid(pte_t pte)
 	return pte_val(pte) & _PAGE_PRESENT;
 }
 
+static inline int pte_young(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_ACCESSED;
+}
+
 /*
  * Don't just check for any non zero bits in __PAGE_USER, since for book3e
  * and PTE_64BIT, PAGE_KERNEL_X contains _PAGE_BAP_SR which is also in
-- 
2.41.0

