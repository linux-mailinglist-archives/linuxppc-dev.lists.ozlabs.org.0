Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67217ADF2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWw04JDzz3hW4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWhV33m4z3dM5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:32:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgN2dBMz9v9n;
	Mon, 25 Sep 2023 20:32:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V692qp74eYgB; Mon, 25 Sep 2023 20:32:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg460DTz9tlk;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CA4F68B7A9;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ExC5wiofn3Xg; Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 486A18B763;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVbBE1499268
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVb221499267;
	Mon, 25 Sep 2023 20:31:37 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 34/37] powerpc/32s: Introduce _PAGE_READ and remove _PAGE_USER
Date: Mon, 25 Sep 2023 20:31:48 +0200
Message-ID: <b7702dd5a041ec59055ed2880f4952e94c087a2e.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666676; l=14501; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=yZFI8Kr59tjfuc3nMnBN3+e6lXlAH/wprV0PenXjj+o=; b=CdsqWY/3ssgRkhpYfWjZoOBFl8ATak9hMHrztsseSuo3Ph3WPAc07w2A5/zpx2bARgew926oo 2wtbvoA2kiPDhkgm75xjrFeSb+5UPhhveNUDw4V9UCkYt/kbJBIsWV8
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

On 603 MMU, TLB missed are handled by SW and there are separated
DTLB and ITLB. It is therefore possible to implement execute-only
protection by not loading DTLB when read access is not permitted.

To do that, _PAGE_READ flag is needed but there is no bit available
for it in PTE. On the other hand the only real use of _PAGE_USER is
to implement PAGE_NONE by clearing _PAGE_USER.

As _PAGE_NONE can also be implemented by clearing _PAGE_READ, remove
_PAGE_USER and add _PAGE_READ. Then use the virtual address to know
whether user rights or kernel rights are to be used.

With that change, 603 MMU now honors execute-only protection.

For hash (604) MMU it is more tricky because hash table is common to
load/store and execute. Nevertheless it is still possible to check
whether _PAGE_READ is set before loading hash table for a load/store
access. At least it can't be read unless it is executed first.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 48 ++++-----------
 arch/powerpc/kernel/head_book3s_32.S         | 61 +++++++++++---------
 arch/powerpc/mm/book3s32/hash_low.S          | 22 ++++---
 3 files changed, 60 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 480ad6b4fd6f..244621c88510 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -20,7 +20,7 @@
 
 #define _PAGE_PRESENT	0x001	/* software: pte contains a translation */
 #define _PAGE_HASHPTE	0x002	/* hash_page has made an HPTE for this pte */
-#define _PAGE_USER	0x004	/* usermode access allowed */
+#define _PAGE_READ	0x004	/* software: read access allowed */
 #define _PAGE_GUARDED	0x008	/* G: prohibit speculative access */
 #define _PAGE_COHERENT	0x010	/* M: enforce memory coherence (SMP systems) */
 #define _PAGE_NO_CACHE	0x020	/* I: cache inhibit */
@@ -28,11 +28,9 @@
 #define _PAGE_DIRTY	0x080	/* C: page changed */
 #define _PAGE_ACCESSED	0x100	/* R: page referenced */
 #define _PAGE_EXEC	0x200	/* software: exec allowed */
-#define _PAGE_RW	0x400	/* software: user write access allowed */
+#define _PAGE_WRITE	0x400	/* software: user write access allowed */
 #define _PAGE_SPECIAL	0x800	/* software: Special page */
 
-#define _PAGE_WRITE	_PAGE_RW
-
 #ifdef CONFIG_PTE_64BIT
 /* We never clear the high word of the pte */
 #define _PTE_NONE_MASK	(0xffffffff00000000ULL | _PAGE_HASHPTE)
@@ -44,26 +42,13 @@
 #define _PMD_PRESENT_MASK (PAGE_MASK)
 #define _PMD_BAD	(~PAGE_MASK)
 
-/* We borrow the _PAGE_USER bit to store the exclusive marker in swap PTEs. */
-#define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
+/* We borrow the _PAGE_READ bit to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_READ
 
 /* And here we include common definitions */
 
-#define _PAGE_KERNEL_RO		0
-#define _PAGE_KERNEL_ROX	(_PAGE_EXEC)
-#define _PAGE_KERNEL_RW		(_PAGE_DIRTY | _PAGE_RW)
-#define _PAGE_KERNEL_RWX	(_PAGE_DIRTY | _PAGE_RW | _PAGE_EXEC)
-
 #define _PAGE_HPTEFLAGS _PAGE_HASHPTE
 
-#ifndef __ASSEMBLY__
-
-static inline bool pte_user(pte_t pte)
-{
-	return pte_val(pte) & _PAGE_USER;
-}
-#endif /* __ASSEMBLY__ */
-
 /*
  * Location of the PFN in the PTE. Most 32-bit platforms use the same
  * as _PAGE_SHIFT here (ie, naturally aligned).
@@ -99,20 +84,7 @@ static inline bool pte_user(pte_t pte)
 #define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED)
 #define _PAGE_BASE	(_PAGE_BASE_NC | _PAGE_COHERENT)
 
-/*
- * Permission masks used to generate the __P and __S table.
- *
- * Note:__pgprot is defined in arch/powerpc/include/asm/page.h
- *
- * Write permissions imply read permissions for now.
- */
-#define PAGE_NONE	__pgprot(_PAGE_BASE)
-#define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
-#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
-#define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
-#define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
+#include <asm/pgtable-masks.h>
 
 /* Permission masks used for kernel mappings */
 #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
@@ -408,12 +380,16 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 }
 
 /* Generic accessors to PTE bits */
+static inline bool pte_read(pte_t pte)
+{
+	return !!(pte_val(pte) & _PAGE_READ);
+}
+
 static inline bool pte_write(pte_t pte)
 {
 	return !!(pte_val(pte) & _PAGE_WRITE);
 }
 
-static inline int pte_read(pte_t pte)		{ return 1; }
 static inline int pte_dirty(pte_t pte)		{ return !!(pte_val(pte) & _PAGE_DIRTY); }
 static inline int pte_young(pte_t pte)		{ return !!(pte_val(pte) & _PAGE_ACCESSED); }
 static inline int pte_special(pte_t pte)	{ return !!(pte_val(pte) & _PAGE_SPECIAL); }
@@ -448,10 +424,10 @@ static inline bool pte_ci(pte_t pte)
 static inline bool pte_access_permitted(pte_t pte, bool write)
 {
 	/*
-	 * A read-only access is controlled by _PAGE_USER bit.
+	 * A read-only access is controlled by _PAGE_READ bit.
 	 * We have _PAGE_READ set for WRITE and EXECUTE
 	 */
-	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
+	if (!pte_present(pte) || !pte_read(pte))
 		return false;
 
 	if (write && !pte_write(pte))
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 615d429d7bd1..c1d89764dd22 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -412,10 +412,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 	. = INTERRUPT_INST_TLB_MISS_603
 InstructionTLBMiss:
 /*
- * r0:	scratch
+ * r0:	userspace flag (later scratch)
  * r1:	linux style pte ( later becomes ppc hardware pte )
  * r2:	ptr to linux-style pte
- * r3:	scratch
+ * r3:	fault address
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_IMISS
@@ -424,12 +424,13 @@ InstructionTLBMiss:
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SDR1
-	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC | _PAGE_USER
+	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 	rlwinm	r2, r2, 28, 0xfffff000
 #ifdef CONFIG_MODULES
+	li	r0, 3
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
+	li	r0, 0
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 #endif
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
@@ -437,13 +438,15 @@ InstructionTLBMiss:
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
 	beq-	InstructionAddressInvalid	/* return if no mapping */
 	rlwimi	r2,r3,22,20,29		/* insert next 10 bits of address */
-	lwz	r0,0(r2)		/* get linux-style pte */
-	andc.	r1,r1,r0		/* check access & ~permission */
+	lwz	r2,0(r2)		/* get linux-style pte */
+	andc.	r1,r1,r2		/* check access & ~permission */
 	bne-	InstructionAddressInvalid /* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwimi	r0,r0,32-2,31,31	/* _PAGE_USER -> PP lsb */
+#ifdef CONFIG_MODULES
+	rlwimi	r2, r0, 0, 31, 31	/* userspace ? -> PP lsb */
+#endif
 	ori	r1, r1, 0xe06		/* clear out reserved bits */
-	andc	r1, r0, r1		/* PP = user? 1 : 0 */
+	andc	r1, r2, r1		/* PP = user? 1 : 0 */
 BEGIN_FTR_SECTION
 	rlwinm	r1,r1,0,~_PAGE_COHERENT	/* clear M (coherence not required) */
 END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
@@ -478,38 +481,38 @@ InstructionAddressInvalid:
 	. = INTERRUPT_DATA_LOAD_TLB_MISS_603
 DataLoadTLBMiss:
 /*
- * r0:	scratch
+ * r0:	userspace flag (later scratch)
  * r1:	linux style pte ( later becomes ppc hardware pte )
  * r2:	ptr to linux-style pte
- * r3:	scratch
+ * r3:	fault address
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_DMISS
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ
 	rlwinm	r2, r2, 28, 0xfffff000
+	li	r0, 3
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r0, 0
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
 	beq-	DataAddressInvalid	/* return if no mapping */
 	rlwimi	r2,r3,22,20,29		/* insert next 10 bits of address */
-	lwz	r0,0(r2)		/* get linux-style pte */
-	andc.	r1,r1,r0		/* check access & ~permission */
+	lwz	r2,0(r2)		/* get linux-style pte */
+	andc.	r1,r1,r2		/* check access & ~permission */
 	bne-	DataAddressInvalid	/* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwinm	r1,r0,32-9,30,30	/* _PAGE_WRITE -> PP msb */
-	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
-	rlwimi	r1,r0,32-3,24,24	/* _PAGE_WRITE -> _PAGE_DIRTY */
-	rlwimi	r0,r0,32-1,31,31	/* _PAGE_USER -> PP lsb */
+	rlwinm	r1,r2,32-9,30,30	/* _PAGE_WRITE -> PP msb */
+	rlwimi	r2,r0,0,30,31		/* userspace ? -> PP */
+	rlwimi	r1,r2,32-3,24,24	/* _PAGE_WRITE -> _PAGE_DIRTY */
 	xori	r1,r1,_PAGE_DIRTY	/* clear dirty when not rw */
 	ori	r1,r1,0xe04		/* clear out reserved bits */
-	andc	r1,r0,r1		/* PP = user? rw? 1: 3: 0 */
+	andc	r1,r2,r1		/* PP = user? rw? 1: 3: 0 */
 BEGIN_FTR_SECTION
 	rlwinm	r1,r1,0,~_PAGE_COHERENT	/* clear M (coherence not required) */
 END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
@@ -558,34 +561,35 @@ DataAddressInvalid:
 	. = INTERRUPT_DATA_STORE_TLB_MISS_603
 DataStoreTLBMiss:
 /*
- * r0:	scratch
+ * r0:	userspace flag (later scratch)
  * r1:	linux style pte ( later becomes ppc hardware pte )
  * r2:	ptr to linux-style pte
- * r3:	scratch
+ * r3:	fault address
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_DMISS
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
 	rlwinm	r2, r2, 28, 0xfffff000
+	li	r0, 3
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r0, 0
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
 	beq-	DataAddressInvalid	/* return if no mapping */
 	rlwimi	r2,r3,22,20,29		/* insert next 10 bits of address */
-	lwz	r0,0(r2)		/* get linux-style pte */
-	andc.	r1,r1,r0		/* check access & ~permission */
+	lwz	r2,0(r2)		/* get linux-style pte */
+	andc.	r1,r1,r2		/* check access & ~permission */
 	bne-	DataAddressInvalid	/* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwimi	r0,r0,32-2,31,31	/* _PAGE_USER -> PP lsb */
+	rlwimi	r2,r0,0,31,31		/* userspace ? -> PP lsb */
 	li	r1,0xe06		/* clear out reserved bits & PP msb */
-	andc	r1,r0,r1		/* PP = user? 1: 0 */
+	andc	r1,r2,r1		/* PP = user? 1: 0 */
 BEGIN_FTR_SECTION
 	rlwinm	r1,r1,0,~_PAGE_COHERENT	/* clear M (coherence not required) */
 END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
@@ -690,6 +694,7 @@ hash_page_dsi:
 	mfsrr0	r5
 	mfsrr1	r9
 	rlwinm	r3, r3, 32 - 15, _PAGE_WRITE	/* DSISR_STORE -> _PAGE_WRITE */
+	ori	r3, r3, _PAGE_PRESENT | _PAGE_READ
 	bl	hash_page
 	mfspr	r10, SPRN_SPRG_THREAD
 	restore_regs_thread r10
@@ -699,7 +704,7 @@ hash_page_isi:
 	mr	r11, r10
 	mfspr	r10, SPRN_SPRG_THREAD
 	save_regs_thread	r10
-	li	r3, 0
+	li	r3, _PAGE_PRESENT | _PAGE_EXEC
 	lwz	r4, SRR0(r10)
 	lwz	r9, SRR1(r10)
 	bl	hash_page
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index acb0584c174c..4ed0efd03db5 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -36,8 +36,9 @@
 
 /*
  * Load a PTE into the hash table, if possible.
- * The address is in r4, and r3 contains an access flag:
- * _PAGE_WRITE (0x400) if a write.
+ * The address is in r4, and r3 contains required access flags:
+ *   - For ISI: _PAGE_PRESENT | _PAGE_EXEC
+ *   - For DSI: _PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE if a write.
  * r9 contains the SRR1 value, from which we use the MSR_PR bit.
  * SPRG_THREAD contains the physical address of the current task's thread.
  *
@@ -67,12 +68,16 @@ _GLOBAL(hash_page)
 	lis	r0, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r4,r0
 	mfspr	r8,SPRN_SPRG_THREAD	/* current task's THREAD (phys) */
-	ori	r3,r3,_PAGE_USER|_PAGE_PRESENT /* test low addresses as user */
 	lwz	r5,PGDIR(r8)		/* virt page-table root */
 	blt+	112f			/* assume user more likely */
 	lis	r5,swapper_pg_dir@ha	/* if kernel address, use */
+	andi.	r0,r9,MSR_PR		/* Check usermode */
 	addi	r5,r5,swapper_pg_dir@l	/* kernel page table */
-	rlwimi	r3,r9,32-12,29,29	/* MSR_PR -> _PAGE_USER */
+#ifdef CONFIG_SMP
+	bne-	.Lhash_page_out		/* return if usermode */
+#else
+	bnelr-
+#endif
 112:	tophys(r5, r5)
 #ifndef CONFIG_PTE_64BIT
 	rlwimi	r5,r4,12,20,29		/* insert top 10 bits of address */
@@ -307,12 +312,15 @@ Hash_msk = (((1 << Hash_bits) - 1) * 64)
 __REF
 _GLOBAL(create_hpte)
 	/* Convert linux-style PTE (r5) to low word of PPC-style PTE (r8) */
+	lis	r0, TASK_SIZE@h
+	rlwinm	r5,r5,0,~3		/* Clear PP bits */
+	cmplw	r4,r0
 	rlwinm	r8,r5,32-9,30,30	/* _PAGE_WRITE -> PP msb */
 	rlwinm	r0,r5,32-6,30,30	/* _PAGE_DIRTY -> PP msb */
 	and	r8,r8,r0		/* writable if _RW & _DIRTY */
-	rlwimi	r5,r5,32-1,30,30	/* _PAGE_USER -> PP msb */
-	rlwimi	r5,r5,32-2,31,31	/* _PAGE_USER -> PP lsb */
-	ori	r8,r8,0xe04		/* clear out reserved bits */
+	bge-	1f			/* Kernelspace ? Skip */
+	ori	r5,r5,3			/* Userspace ? PP = 3 */
+1:	ori	r8,r8,0xe04		/* clear out reserved bits */
 	andc	r8,r5,r8		/* PP = user? (rw&dirty? 1: 3): 0 */
 BEGIN_FTR_SECTION
 	rlwinm	r8,r8,0,~_PAGE_COHERENT	/* clear M (coherence not required) */
-- 
2.41.0

