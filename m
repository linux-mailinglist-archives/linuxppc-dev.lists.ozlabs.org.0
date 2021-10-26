Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF443ABC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 07:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdgfN6r6Nz305v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 16:41:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdgdz5Z5rz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 16:40:37 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Hdgdt0FKfz9s2d;
 Tue, 26 Oct 2021 07:40:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A97qknif6goQ; Tue, 26 Oct 2021 07:40:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4Hdgds5GXlz9s2Z;
 Tue, 26 Oct 2021 07:40:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19Q5eWD9009296
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 07:40:32 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19Q5dSpO009213;
 Tue, 26 Oct 2021 07:39:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] powerpc/nohash: Fix __ptep_set_access_flags() and
 ptep_set_wrprotect()
Date: Tue, 26 Oct 2021 07:39:24 +0200
Message-Id: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635226765; l=4330; s=20211009;
 h=from:subject:message-id; bh=A6TaDzMM6cBQkNmmbmR20w7/7y1To2PwXuyd+xMD85o=;
 b=egPjw3AzeYQHYik6rt0LX9dHWHwhZgyoG9ReDN5j3jU4qySIzS82cEK1+8+YgefoB2EgFOlAjipf
 1wulAiVTB+Ffi+fy3wCe6rmmOr+JjTsy1FNovDX2rdxUed0vqbhX
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

Commit 26973fa5ac0e ("powerpc/mm: use pte helpers in generic code")
changed those two functions to use pte helpers to determine which
bits to clear and which bits to set.

This change was based on the assumption that bits to be set/cleared
are always the same and can be determined by applying the pte
manipulation helpers on __pte(0).

But on platforms like book3e, the bits depend on whether the page
is a user page or not.

For the time being it more or less works because of _PAGE_EXEC being
used for user pages only and exec right being set at all time on
kernel page. But following patch will clean that and output of
pte_mkexec() will depend on the page being a user or kernel page.

Instead of trying to make an even more complicated helper where bits
would become dependent on the final pte value, come back to a more
static situation like before commit 26973fa5ac0e ("powerpc/mm: use
pte helpers in generic code"), by introducing an 8xx specific
version of __ptep_set_access_flags() and ptep_set_wrprotect().

Fixes: 26973fa5ac0e ("powerpc/mm: use pte helpers in generic code")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: No change
v2: New
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 17 +++++++--------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 22 ++++++++++++++++++++
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 34ce50da1850..11c6849f7864 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -306,30 +306,29 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
+#ifndef ptep_set_wrprotect
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pte_t *ptep)
 {
-	unsigned long clr = ~pte_val(pte_wrprotect(__pte(~0)));
-	unsigned long set = pte_val(pte_wrprotect(__pte(0)));
-
-	pte_update(mm, addr, ptep, clr, set, 0);
+	pte_update(mm, addr, ptep, _PAGE_RW, 0, 0);
 }
+#endif
 
+#ifndef __ptep_set_access_flags
 static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 					   pte_t *ptep, pte_t entry,
 					   unsigned long address,
 					   int psize)
 {
-	pte_t pte_set = pte_mkyoung(pte_mkdirty(pte_mkwrite(pte_mkexec(__pte(0)))));
-	pte_t pte_clr = pte_mkyoung(pte_mkdirty(pte_mkwrite(pte_mkexec(__pte(~0)))));
-	unsigned long set = pte_val(entry) & pte_val(pte_set);
-	unsigned long clr = ~pte_val(entry) & ~pte_val(pte_clr);
+	unsigned long set = pte_val(entry) &
+			    (_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
 	int huge = psize > mmu_virtual_psize ? 1 : 0;
 
-	pte_update(vma->vm_mm, address, ptep, clr, set, huge);
+	pte_update(vma->vm_mm, address, ptep, 0, set, huge);
 
 	flush_tlb_page(vma, address);
 }
+#endif
 
 static inline int pte_young(pte_t pte)
 {
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index fcc48d590d88..1a89ebdc3acc 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -136,6 +136,28 @@ static inline pte_t pte_mkhuge(pte_t pte)
 
 #define pte_mkhuge pte_mkhuge
 
+static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
+				     unsigned long clr, unsigned long set, int huge);
+
+static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+{
+	pte_update(mm, addr, ptep, 0, _PAGE_RO, 0);
+}
+#define ptep_set_wrprotect ptep_set_wrprotect
+
+static inline void __ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
+					   pte_t entry, unsigned long address, int psize)
+{
+	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_EXEC);
+	unsigned long clr = ~pte_val(entry) & _PAGE_RO;
+	int huge = psize > mmu_virtual_psize ? 1 : 0;
+
+	pte_update(vma->vm_mm, address, ptep, clr, set, huge);
+
+	flush_tlb_page(vma, address);
+}
+#define __ptep_set_access_flags __ptep_set_access_flags
+
 static inline unsigned long pgd_leaf_size(pgd_t pgd)
 {
 	if (pgd_val(pgd) & _PMD_PAGE_8M)
-- 
2.31.1

