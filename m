Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3E7ADF40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvX2s2ZbXz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWjP0JpYz3dB3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgf5qYVz9vBd;
	Mon, 25 Sep 2023 20:32:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIN-HgKFLGKg; Mon, 25 Sep 2023 20:32:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg55gVvz9vCF;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BF3BC8B763;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Y7ZLTfexy5js; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 54B8F8B799;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVbP71499264
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVbff1499263;
	Mon, 25 Sep 2023 20:31:37 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 33/37] powerpc/32s: Add _PAGE_WRITE to supplement _PAGE_RW
Date: Mon, 25 Sep 2023 20:31:47 +0200
Message-ID: <5798782869fe4d2698f104948dabd17657b89395.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666676; l=6489; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=w8lCMn6fQrKFUDciAu4k+9qWlzo84meF29r7KmIvWGM=; b=WZ9W8sVKqmGxVulTsX1UFYzcUMQzqw5SfB925cZyY9UJdKyut/GJfLjNw0P+JszcEgv4mkP1X 00h9pNCKurNDgHGfs3f7yJQu1uD9AoW6T4IMPvEHI5iznlT+IPccokx
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

Several places, _PAGE_RW maps to write permission and don't
always imply read. To make it more clear, do as book3s/64 in
commit c7d54842deb1 ("powerpc/mm: Use _PAGE_READ to indicate
Read access") and use _PAGE_WRITE when more relevant.

For the time being _PAGE_WRITE is equivalent to _PAGE_RW but that
will change when _PAGE_READ gets added in following patches.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 15 ++++++++++++---
 arch/powerpc/kernel/head_book3s_32.S         |  6 +++---
 arch/powerpc/mm/book3s32/hash_low.S          | 12 ++++++------
 arch/powerpc/mm/book3s32/mmu.c               |  2 +-
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 80505915c77c..480ad6b4fd6f 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -31,6 +31,8 @@
 #define _PAGE_RW	0x400	/* software: user write access allowed */
 #define _PAGE_SPECIAL	0x800	/* software: Special page */
 
+#define _PAGE_WRITE	_PAGE_RW
+
 #ifdef CONFIG_PTE_64BIT
 /* We never clear the high word of the pte */
 #define _PTE_NONE_MASK	(0xffffffff00000000ULL | _PAGE_HASHPTE)
@@ -347,7 +349,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pte_t *ptep)
 {
-	pte_update(mm, addr, ptep, _PAGE_RW, 0, 0);
+	pte_update(mm, addr, ptep, _PAGE_WRITE, 0, 0);
 }
 
 static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
@@ -406,7 +408,11 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 }
 
 /* Generic accessors to PTE bits */
-static inline int pte_write(pte_t pte)		{ return !!(pte_val(pte) & _PAGE_RW);}
+static inline bool pte_write(pte_t pte)
+{
+	return !!(pte_val(pte) & _PAGE_WRITE);
+}
+
 static inline int pte_read(pte_t pte)		{ return 1; }
 static inline int pte_dirty(pte_t pte)		{ return !!(pte_val(pte) & _PAGE_DIRTY); }
 static inline int pte_young(pte_t pte)		{ return !!(pte_val(pte) & _PAGE_ACCESSED); }
@@ -469,7 +475,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
 /* Generic modifiers for PTE bits */
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~_PAGE_RW);
+	return __pte(pte_val(pte) & ~_PAGE_WRITE);
 }
 
 static inline pte_t pte_exprotect(pte_t pte)
@@ -499,6 +505,9 @@ static inline pte_t pte_mkpte(pte_t pte)
 
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
+	/*
+	 * write implies read, hence set both
+	 */
 	return __pte(pte_val(pte) | _PAGE_RW);
 }
 
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 6764b98ca360..615d429d7bd1 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -503,9 +503,9 @@ DataLoadTLBMiss:
 	andc.	r1,r1,r0		/* check access & ~permission */
 	bne-	DataAddressInvalid	/* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwinm	r1,r0,32-9,30,30	/* _PAGE_RW -> PP msb */
+	rlwinm	r1,r0,32-9,30,30	/* _PAGE_WRITE -> PP msb */
 	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
-	rlwimi	r1,r0,32-3,24,24	/* _PAGE_RW -> _PAGE_DIRTY */
+	rlwimi	r1,r0,32-3,24,24	/* _PAGE_WRITE -> _PAGE_DIRTY */
 	rlwimi	r0,r0,32-1,31,31	/* _PAGE_USER -> PP lsb */
 	xori	r1,r1,_PAGE_DIRTY	/* clear dirty when not rw */
 	ori	r1,r1,0xe04		/* clear out reserved bits */
@@ -689,7 +689,7 @@ hash_page_dsi:
 	mfdar	r4
 	mfsrr0	r5
 	mfsrr1	r9
-	rlwinm	r3, r3, 32 - 15, _PAGE_RW	/* DSISR_STORE -> _PAGE_RW */
+	rlwinm	r3, r3, 32 - 15, _PAGE_WRITE	/* DSISR_STORE -> _PAGE_WRITE */
 	bl	hash_page
 	mfspr	r10, SPRN_SPRG_THREAD
 	restore_regs_thread r10
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 8b804e1a9fa4..acb0584c174c 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -37,7 +37,7 @@
 /*
  * Load a PTE into the hash table, if possible.
  * The address is in r4, and r3 contains an access flag:
- * _PAGE_RW (0x400) if a write.
+ * _PAGE_WRITE (0x400) if a write.
  * r9 contains the SRR1 value, from which we use the MSR_PR bit.
  * SPRG_THREAD contains the physical address of the current task's thread.
  *
@@ -113,15 +113,15 @@ _GLOBAL(hash_page)
 	lwarx	r6,0,r8			/* get linux-style pte, flag word */
 #ifdef CONFIG_PPC_KUAP
 	mfsrin	r5,r4
-	rlwinm	r0,r9,28,_PAGE_RW	/* MSR[PR] => _PAGE_RW */
-	rlwinm	r5,r5,12,_PAGE_RW	/* Ks => _PAGE_RW */
+	rlwinm	r0,r9,28,_PAGE_WRITE	/* MSR[PR] => _PAGE_WRITE */
+	rlwinm	r5,r5,12,_PAGE_WRITE	/* Ks => _PAGE_WRITE */
 	andc	r5,r5,r0		/* Ks & ~MSR[PR] */
-	andc	r5,r6,r5		/* Clear _PAGE_RW when Ks = 1 && MSR[PR] = 0 */
+	andc	r5,r6,r5		/* Clear _PAGE_WRITE when Ks = 1 && MSR[PR] = 0 */
 	andc.	r5,r3,r5		/* check access & ~permission */
 #else
 	andc.	r5,r3,r6		/* check access & ~permission */
 #endif
-	rlwinm	r0,r3,32-3,24,24	/* _PAGE_RW access -> _PAGE_DIRTY */
+	rlwinm	r0,r3,32-3,24,24	/* _PAGE_WRITE access -> _PAGE_DIRTY */
 	ori	r0,r0,_PAGE_ACCESSED|_PAGE_HASHPTE
 #ifdef CONFIG_SMP
 	bne-	.Lhash_page_out		/* return if access not permitted */
@@ -307,7 +307,7 @@ Hash_msk = (((1 << Hash_bits) - 1) * 64)
 __REF
 _GLOBAL(create_hpte)
 	/* Convert linux-style PTE (r5) to low word of PPC-style PTE (r8) */
-	rlwinm	r8,r5,32-9,30,30	/* _PAGE_RW -> PP msb */
+	rlwinm	r8,r5,32-9,30,30	/* _PAGE_WRITE -> PP msb */
 	rlwinm	r0,r5,32-6,30,30	/* _PAGE_DIRTY -> PP msb */
 	and	r8,r8,r0		/* writable if _RW & _DIRTY */
 	rlwimi	r5,r5,32-1,30,30	/* _PAGE_USER -> PP msb */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index d1041c946ce2..06bf0972792d 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -277,7 +277,7 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 	/* Do DBAT first */
 	wimgxpp = flags & (_PAGE_WRITETHRU | _PAGE_NO_CACHE
 			   | _PAGE_COHERENT | _PAGE_GUARDED);
-	wimgxpp |= (flags & _PAGE_RW)? BPP_RW: BPP_RX;
+	wimgxpp |= (flags & _PAGE_WRITE)? BPP_RW: BPP_RX;
 	bat[1].batu = virt | (bl << 2) | 2; /* Vs=1, Vp=0 */
 	bat[1].batl = BAT_PHYS_ADDR(phys) | wimgxpp;
 	if (!is_kernel_addr(virt))
-- 
2.41.0

