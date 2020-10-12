Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3428B0F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 10:58:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8sz13rFWzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 19:58:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8stp6jpvzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 19:54:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C8stf27mQz9tyQB;
 Mon, 12 Oct 2020 10:54:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XeC7sGU9_Mg2; Mon, 12 Oct 2020 10:54:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C8stf14pzz9tyQ9;
 Mon, 12 Oct 2020 10:54:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78C5E8B78D;
 Mon, 12 Oct 2020 10:54:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sp7t6gW6OcR4; Mon, 12 Oct 2020 10:54:33 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CC798B788;
 Mon, 12 Oct 2020 10:54:33 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 030B866441; Mon, 12 Oct 2020 08:54:33 +0000 (UTC)
Message-Id: <80f488db230c6b0e7b3b990d72bd94a8a069e93e.1602492856.git.christophe.leroy@csgroup.eu>
In-Reply-To: <af834e8a0f1fa97bfae65664950f0984a70c4750.1602492856.git.christophe.leroy@csgroup.eu>
References: <af834e8a0f1fa97bfae65664950f0984a70c4750.1602492856.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/2] powerpc/8xx: Manage _PAGE_ACCESSED through APG bits in
 L1 entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Oct 2020 08:54:33 +0000 (UTC)
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

When _PAGE_ACCESSED is not set, a minor fault is expected.
To do this, TLB miss exception ANDs _PAGE_PRESENT and _PAGE_ACCESSED
into the L2 entry valid bit.

To simplify the processing and reduce the number of instructions in
TLB miss exceptions, manage it as an APG bit and get it next to
_PAGE_GUARDED bit to allow a copy in one go. Then declare the
corresponding groups as handling all accesses as user accesses.
As the PP bits always define user as No Access, it will generate
a fault.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 47 +++++++-------------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  9 ++--
 arch/powerpc/kernel/head_8xx.S               | 36 +++------------
 4 files changed, 28 insertions(+), 66 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 85ed2390fb99..567cdc557402 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -63,7 +63,7 @@ static inline void restore_user_access(unsigned long flags)
 static inline bool
 bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
-	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xf0000000),
+	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xff000000),
 		    "Bug: fault blocked by AP register !");
 }
 
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 1d9ac0f9c794..0bd1b144eb76 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -33,19 +33,18 @@
  * respectively NA for All or X for Supervisor and no access for User.
  * Then we use the APG to say whether accesses are according to Page rules or
  * "all Supervisor" rules (Access to all)
- * Therefore, we define 2 APG groups. lsb is _PMD_USER
- * 0 => Kernel => 01 (all accesses performed according to page definition)
- * 1 => User => 00 (all accesses performed as supervisor iaw page definition)
- * 2-15 => Not Used
- */
-#define MI_APG_INIT	0x40000000
-
-/*
- * 0 => Kernel => 01 (all accesses performed according to page definition)
- * 1 => User => 10 (all accesses performed according to swaped page definition)
- * 2-15 => Not Used
- */
-#define MI_APG_KUEP	0x60000000
+ * _PAGE_ACCESSED is also managed via APG. When _PAGE_ACCESSED is not set, say
+ * "all User" rules, that will lead to NA for all.
+ * Therefore, we define 4 APG groups. lsb is _PAGE_ACCESSED
+ * 0 => Kernel => 11 (all accesses performed according as user iaw page definition)
+ * 1 => Kernel+Accessed => 01 (all accesses performed according to page definition)
+ * 2 => User => 11 (all accesses performed according as user iaw page definition)
+ * 3 => User+Accessed => 00 (all accesses performed as supervisor iaw page definition) for INIT
+ *                    => 10 (all accesses performed according to swaped page definition) for KUEP
+ * 4-15 => Not Used
+ */
+#define MI_APG_INIT	0xdc000000
+#define MI_APG_KUEP	0xde000000
 
 /* The effective page number register.  When read, contains the information
  * about the last instruction TLB miss.  When MI_RPN is written, bits in
@@ -106,25 +105,9 @@
 #define MD_Ks		0x80000000	/* Should not be set */
 #define MD_Kp		0x40000000	/* Should always be set */
 
-/*
- * All pages' PP data bits are set to either 000 or 011 or 001, which means
- * respectively RW for Supervisor and no access for User, or RO for
- * Supervisor and no access for user and NA for ALL.
- * Then we use the APG to say whether accesses are according to Page rules or
- * "all Supervisor" rules (Access to all)
- * Therefore, we define 2 APG groups. lsb is _PMD_USER
- * 0 => Kernel => 01 (all accesses performed according to page definition)
- * 1 => User => 00 (all accesses performed as supervisor iaw page definition)
- * 2-15 => Not Used
- */
-#define MD_APG_INIT	0x40000000
-
-/*
- * 0 => No user => 01 (all accesses performed according to page definition)
- * 1 => User => 10 (all accesses performed according to swaped page definition)
- * 2-15 => Not Used
- */
-#define MD_APG_KUAP	0x60000000
+/* See explanation above at the definition of MI_APG_INIT */
+#define MD_APG_INIT	0xdc000000
+#define MD_APG_KUAP	0xde000000
 
 /* The effective page number register.  When read, contains the information
  * about the last instruction TLB miss.  When MD_RPN is written, bits in
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 66f403a7da44..1581204467e1 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -39,9 +39,9 @@
  * into the TLB.
  */
 #define _PAGE_GUARDED	0x0010	/* Copied to L1 G entry in DTLB */
-#define _PAGE_SPECIAL	0x0020	/* SW entry */
+#define _PAGE_ACCESSED	0x0020	/* Copied to L1 APG 1 entry in I/DTLB */
 #define _PAGE_EXEC	0x0040	/* Copied to PP (bit 21) in ITLB */
-#define _PAGE_ACCESSED	0x0080	/* software: page referenced */
+#define _PAGE_SPECIAL	0x0080	/* SW entry */
 
 #define _PAGE_NA	0x0200	/* Supervisor NA, User no access */
 #define _PAGE_RO	0x0600	/* Supervisor RO, User no access */
@@ -59,11 +59,12 @@
 
 #define _PMD_PRESENT	0x0001
 #define _PMD_PRESENT_MASK	_PMD_PRESENT
-#define _PMD_BAD	0x0fd0
+#define _PMD_BAD	0x0f90
 #define _PMD_PAGE_MASK	0x000c
 #define _PMD_PAGE_8M	0x000c
 #define _PMD_PAGE_512K	0x0004
-#define _PMD_USER	0x0020	/* APG 1 */
+#define _PMD_ACCESSED	0x0020	/* APG 1 */
+#define _PMD_USER	0x0040	/* APG 2 */
 
 #define _PTE_NONE_MASK	0
 
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 6f3799a04121..ee0bfebc375f 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -222,23 +222,13 @@ InstructionTLBMiss:
 3:
 	mtcr	r11
 #endif
-#if defined(CONFIG_HUGETLBFS) || !defined(CONFIG_PIN_TLB_TEXT)
 	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
 	mtspr	SPRN_MD_TWC, r11
-#else
-	lwz	r10, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
-	mtspr	SPRN_MI_TWC, r10	/* Set segment attributes */
-	mtspr	SPRN_MD_TWC, r10
-#endif
 	mfspr	r10, SPRN_MD_TWC
 	lwz	r10, 0(r10)	/* Get the pte */
-#if defined(CONFIG_HUGETLBFS) || !defined(CONFIG_PIN_TLB_TEXT)
+	rlwimi	r11, r10, 0, _PAGE_GUARDED | _PAGE_ACCESSED
 	rlwimi	r11, r10, 32 - 9, _PMD_PAGE_512K
 	mtspr	SPRN_MI_TWC, r11
-#endif
-	rlwinm	r11, r10, 32-7, _PAGE_PRESENT
-	and	r11, r11, r10
-	rlwimi	r10, r11, 0, _PAGE_PRESENT
 	/* The Linux PTE won't go exactly into the MMU TLB.
 	 * Software indicator bits 20 and 23 must be clear.
 	 * Software indicator bits 22, 24, 25, 26, and 27 must be
@@ -289,28 +279,16 @@ DataStoreTLBMiss:
 	mfspr	r10, SPRN_MD_TWC
 	lwz	r10, 0(r10)	/* Get the pte */
 
-	/* Insert the Guarded flag into the TWC from the Linux PTE.
+	/* Insert Guarded and Accessed flags into the TWC from the Linux PTE.
 	 * It is bit 27 of both the Linux PTE and the TWC (at least
 	 * I got that right :-).  It will be better when we can put
 	 * this into the Linux pgd/pmd and load it in the operation
 	 * above.
 	 */
-	rlwimi	r11, r10, 0, _PAGE_GUARDED
+	rlwimi	r11, r10, 0, _PAGE_GUARDED | _PAGE_ACCESSED
 	rlwimi	r11, r10, 32 - 9, _PMD_PAGE_512K
 	mtspr	SPRN_MD_TWC, r11
 
-	/* Both _PAGE_ACCESSED and _PAGE_PRESENT has to be set.
-	 * We also need to know if the insn is a load/store, so:
-	 * Clear _PAGE_PRESENT and load that which will
-	 * trap into DTLB Error with store bit set accordinly.
-	 */
-	/* PRESENT=0x1, ACCESSED=0x20
-	 * r11 = ((r10 & PRESENT) & ((r10 & ACCESSED) >> 5));
-	 * r10 = (r10 & ~PRESENT) | r11;
-	 */
-	rlwinm	r11, r10, 32-7, _PAGE_PRESENT
-	and	r11, r11, r10
-	rlwimi	r10, r11, 0, _PAGE_PRESENT
 	/* The Linux PTE won't go exactly into the MMU TLB.
 	 * Software indicator bits 24, 25, 26, and 27 must be
 	 * set.  All other Linux PTE bits control the behavior
@@ -701,7 +679,7 @@ initial_mmu:
 	li	r9, 4				/* up to 4 pages of 8M */
 	mtctr	r9
 	lis	r9, KERNELBASE@h		/* Create vaddr for TLB */
-	li	r10, MI_PS8MEG | MI_SVALID	/* Set 8M byte page */
+	li	r10, MI_PS8MEG | _PMD_ACCESSED | MI_SVALID
 	li	r11, MI_BOOTINIT		/* Create RPN for address 0 */
 1:
 	mtspr	SPRN_MI_CTR, r8	/* Set instruction MMU control */
@@ -765,7 +743,7 @@ _GLOBAL(mmu_pin_tlb)
 #ifdef CONFIG_PIN_TLB_TEXT
 	LOAD_REG_IMMEDIATE(r5, 28 << 8)
 	LOAD_REG_IMMEDIATE(r6, PAGE_OFFSET)
-	LOAD_REG_IMMEDIATE(r7, MI_SVALID | MI_PS8MEG)
+	LOAD_REG_IMMEDIATE(r7, MI_SVALID | MI_PS8MEG | _PMD_ACCESSED)
 	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_RO | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
 	LOAD_REG_ADDR(r9, _sinittext)
 	li	r0, 4
@@ -787,7 +765,7 @@ _GLOBAL(mmu_pin_tlb)
 	LOAD_REG_IMMEDIATE(r5, 28 << 8 | MD_TWAM)
 #ifdef CONFIG_PIN_TLB_DATA
 	LOAD_REG_IMMEDIATE(r6, PAGE_OFFSET)
-	LOAD_REG_IMMEDIATE(r7, MI_SVALID | MI_PS8MEG)
+	LOAD_REG_IMMEDIATE(r7, MI_SVALID | MI_PS8MEG | _PMD_ACCESSED)
 #ifdef CONFIG_PIN_TLB_IMMR
 	li	r0, 3
 #else
@@ -824,7 +802,7 @@ _GLOBAL(mmu_pin_tlb)
 #endif
 #ifdef CONFIG_PIN_TLB_IMMR
 	LOAD_REG_IMMEDIATE(r0, VIRT_IMMR_BASE | MD_EVALID)
-	LOAD_REG_IMMEDIATE(r7, MD_SVALID | MD_PS512K | MD_GUARDED)
+	LOAD_REG_IMMEDIATE(r7, MD_SVALID | MD_PS512K | MD_GUARDED | _PMD_ACCESSED)
 	mfspr   r8, SPRN_IMMR
 	rlwinm	r8, r8, 0, 0xfff80000
 	ori	r8, r8, 0xf0 | _PAGE_DIRTY | _PAGE_SPS | _PAGE_SH | \
-- 
2.25.0

