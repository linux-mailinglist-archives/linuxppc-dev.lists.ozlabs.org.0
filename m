Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E089E79AB0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 21:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkxDV61S5z3gkG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 05:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkx3b0D8bz3dM8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 05:04:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Rkx2W16Xfz9vQp;
	Mon, 11 Sep 2023 21:03:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQOnxkStWJR4; Mon, 11 Sep 2023 21:03:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Rkx283ypZz9vSN;
	Mon, 11 Sep 2023 21:03:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72E638B77E;
	Mon, 11 Sep 2023 21:03:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OEgnyR7zeS2A; Mon, 11 Sep 2023 21:03:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C98F8B7A7;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38BJ3K2Q3544262
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 21:03:20 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38BJ3K3n3544261;
	Mon, 11 Sep 2023 21:03:20 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 19/19] powerpc/nohash: Refactor __ptep_set_access_flags()
Date: Mon, 11 Sep 2023 21:03:25 +0200
Message-ID: <318bf9a24060c5030f9c00e9892f873c045ae20c.1694443576.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694443576.git.christophe.leroy@csgroup.eu>
References: <cover.1694443576.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694458987; l=3503; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=GQ0/DYaX0gwK87V/+BgDwtKJXzY9yJiuS0RRcinUoIc=; b=JMlrbm3Z7ohhIhcwW4J8Y4uXxshtTGrZ49MbLwTV67sSzZScasUKtvvmwUnddR/JdBq5aR4Q+ 5UaUnq/pto2AgnBjlt1Zfcc7effaPW358KRx06jFS4KuOwpiNrr67bD
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

nohash/32 version of __ptep_set_access_flags() does the same
as nohash/64 version, the only difference is that nohash/32
version is more complete and uses pte_update().

Make it common and remove the nohash/64 version.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 16 ----------------
 arch/powerpc/include/asm/nohash/64/pgtable.h | 15 ---------------
 arch/powerpc/include/asm/nohash/pgtable.h    | 17 +++++++++++++++++
 3 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 481594097f46..9164a9e41b02 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -161,22 +161,6 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp = __pmd(0);
 }
 
-#ifndef __ptep_set_access_flags
-static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
-					   pte_t *ptep, pte_t entry,
-					   unsigned long address,
-					   int psize)
-{
-	unsigned long set = pte_val(entry) &
-			    (_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
-	int huge = psize > mmu_virtual_psize ? 1 : 0;
-
-	pte_update(vma->vm_mm, address, ptep, 0, set, huge);
-
-	flush_tlb_page(vma, address);
-}
-#endif
-
 /*
  * Note that on Book E processors, the pmd contains the kernel virtual
  * (lowmem) address of the pte page.  The physical address is less useful
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index b59fbf754f82..36b9bad428cc 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -159,21 +159,6 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	__young;							\
 })
 
-/* Set the dirty and/or accessed bits atomically in a linux PTE */
-static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
-					   pte_t *ptep, pte_t entry,
-					   unsigned long address,
-					   int psize)
-{
-	unsigned long bits = pte_val(entry) &
-		(_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
-
-	unsigned long old = pte_val(*ptep);
-	*ptep = __pte(old | bits);
-
-	flush_tlb_page(vma, address);
-}
-
 #define pmd_ERROR(e) \
 	pr_err("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
 #define pgd_ERROR(e) \
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 464eb771db82..1493f0b09ae9 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -102,6 +102,23 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
 	pte_update(mm, addr, ptep, ~0UL, 0, 0);
 }
 
+/* Set the dirty and/or accessed bits atomically in a linux PTE */
+#ifndef __ptep_set_access_flags
+static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
+					   pte_t *ptep, pte_t entry,
+					   unsigned long address,
+					   int psize)
+{
+	unsigned long set = pte_val(entry) &
+			    (_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
+	int huge = psize > mmu_virtual_psize ? 1 : 0;
+
+	pte_update(vma->vm_mm, address, ptep, 0, set, huge);
+
+	flush_tlb_page(vma, address);
+}
+#endif
+
 /* Generic accessors to PTE bits */
 #ifndef pte_mkwrite_novma
 static inline pte_t pte_mkwrite_novma(pte_t pte)
-- 
2.41.0

