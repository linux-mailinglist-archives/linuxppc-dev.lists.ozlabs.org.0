Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD62918A4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 19:28:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDn1F468VzDqjh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 04:28:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDmxN4c4YzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 04:25:25 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CDmxB401vz9vCyc;
 Sun, 18 Oct 2020 19:25:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GN-qKgBtLpLm; Sun, 18 Oct 2020 19:25:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CDmxB36Cvz9ty3L;
 Sun, 18 Oct 2020 19:25:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 494D18B778;
 Sun, 18 Oct 2020 19:25:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EpJiRDk3HG-l; Sun, 18 Oct 2020 19:25:22 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 034438B75E;
 Sun, 18 Oct 2020 19:25:22 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1A34466488; Sun, 18 Oct 2020 17:25:18 +0000 (UTC)
Message-Id: <c3e64da3d5d068c69a201e03bbae7da055761e5b.1603041883.git.christophe.leroy@csgroup.eu>
In-Reply-To: <822833ce3dc10634339818f7d1ab616edf63b0c6.1603041883.git.christophe.leroy@csgroup.eu>
References: <822833ce3dc10634339818f7d1ab616edf63b0c6.1603041883.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/2] powerpc/44x: Don't support 47x code and non 47x code
 at the same time
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 18 Oct 2020 17:25:18 +0000 (UTC)
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

440/460 variants and 470 variants are not compatible, no
need to make code supporting both and using MMU features.

Just use CONFIG_PPC_47x to decide what to build.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Move outside #ifdef CONFIG_PPC_47x a label "1:" used by 44x
---
 arch/powerpc/kernel/entry_32.S   | 11 +++--------
 arch/powerpc/mm/nohash/tlb_low.S | 29 +++++++----------------------
 2 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 8cdc8bcde703..a425360deabb 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -439,15 +439,13 @@ syscall_exit_cont:
 	andis.	r10,r0,DBCR0_IDM@h
 	bnel-	load_dbcr0
 #endif
-#ifdef CONFIG_44x
-BEGIN_MMU_FTR_SECTION
+#ifdef CONFIG_PPC_47x
 	lis	r4,icache_44x_need_flush@ha
 	lwz	r5,icache_44x_need_flush@l(r4)
 	cmplwi	cr0,r5,0
 	bne-	2f
+#endif /* CONFIG_PPC_47x */
 1:
-END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_47x)
-#endif /* CONFIG_44x */
 BEGIN_FTR_SECTION
 	lwarx	r7,0,r1
 END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
@@ -948,10 +946,7 @@ restore_kuap:
 
 	/* interrupts are hard-disabled at this point */
 restore:
-#ifdef CONFIG_44x
-BEGIN_MMU_FTR_SECTION
-	b	1f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
+#if defined(CONFIG_44x) && !defined(CONFIG_PPC_47x)
 	lis	r4,icache_44x_need_flush@ha
 	lwz	r5,icache_44x_need_flush@l(r4)
 	cmplwi	cr0,r5,0
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index eaeee402f96e..68797e072f55 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -92,36 +92,25 @@ _GLOBAL(__tlbil_va)
 	tlbsx.	r6,0,r3
 	bne	10f
 	sync
-BEGIN_MMU_FTR_SECTION
-	b	2f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
+#ifndef CONFIG_PPC_47x
 	/* On 440 There are only 64 TLB entries, so r3 < 64, which means bit
 	 * 22, is clear.  Since 22 is the V bit in the TLB_PAGEID, loading this
 	 * value will invalidate the TLB entry.
 	 */
 	tlbwe	r6,r6,PPC44x_TLB_PAGEID
-	isync
-10:	wrtee	r10
-	blr
-2:
-#ifdef CONFIG_PPC_47x
+#else
 	oris	r7,r6,0x8000	/* specify way explicitly */
 	clrrwi	r4,r3,12	/* get an EPN for the hashing with V = 0 */
 	ori	r4,r4,PPC47x_TLBE_SIZE
 	tlbwe   r4,r7,0		/* write it */
+#endif /* !CONFIG_PPC_47x */
 	isync
-	wrtee	r10
+10:	wrtee	r10
 	blr
-#else /* CONFIG_PPC_47x */
-1:	trap
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0;
-#endif /* !CONFIG_PPC_47x */
 
 _GLOBAL(_tlbil_all)
 _GLOBAL(_tlbil_pid)
-BEGIN_MMU_FTR_SECTION
-	b	2f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
+#ifndef CONFIG_PPC_47x
 	li	r3,0
 	sync
 
@@ -136,8 +125,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
 
 	isync
 	blr
-2:
-#ifdef CONFIG_PPC_47x
+#else
 	/* 476 variant. There's not simple way to do this, hopefully we'll
 	 * try to limit the amount of such full invalidates
 	 */
@@ -179,11 +167,8 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
 	b	1b		/* Then loop */
 1:	isync			/* Sync shadows */
 	wrtee	r11
-#else /* CONFIG_PPC_47x */
-1:	trap
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0;
-#endif /* !CONFIG_PPC_47x */
 	blr
+#endif /* !CONFIG_PPC_47x */
 
 #ifdef CONFIG_PPC_47x
 
-- 
2.25.0

