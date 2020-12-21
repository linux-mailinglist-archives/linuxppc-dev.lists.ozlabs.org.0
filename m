Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4F2DF930
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 07:19:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czq7Z1HjczDqLD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 17:19:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czq5w25J6zDqHX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 17:18:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Czq5g2cWMz9txlJ;
 Mon, 21 Dec 2020 07:17:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GBQLneuKLPej; Mon, 21 Dec 2020 07:17:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Czq5g0rh1z9txlH;
 Mon, 21 Dec 2020 07:17:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F35F58B790;
 Mon, 21 Dec 2020 07:18:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4_zuVwtqaYyp; Mon, 21 Dec 2020 07:18:03 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B01418B75B;
 Mon, 21 Dec 2020 07:18:03 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 75B4B66935; Mon, 21 Dec 2020 06:18:03 +0000 (UTC)
Message-Id: <a3d819d5c348cee9783a311d5d3f3ba9b48fd219.1608531452.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32: Fix vmap stack - Properly set r1 before
 activating MMU on syscall too
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 21 Dec 2020 06:18:03 +0000 (UTC)
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

We need r1 to be properly set before activating MMU, otherwise any new
exception taken while saving registers into the stack in syscall
prologs will use the user stack, which is wrong and will even lockup
or crash when KUAP is selected.

Do that by switching the meaning of r11 and r1 until we have saved r1
to the stack: copy r1 into r11 and setup the new stack pointer in r1.
To avoid complicating and impacting all generic and specific prolog
code (and more), copy back r1 into r11 once r11 is save onto
the stack.

We could get rid of copying r1 back and forth at the cost of rewriting
everything to use r1 instead of r11 all the way when CONFIG_VMAP_STACK
is set, but the effort is probably not worth it for now.

Fixes: da7bb43ab9da ("powerpc/32: Fix vmap stack - Properly set r1 before activating MMU")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 541664d95702..a2f72c966baf 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -121,18 +121,28 @@
 #ifdef CONFIG_VMAP_STACK
 	mfspr	r11, SPRN_SRR0
 	mtctr	r11
-#endif
 	andi.	r11, r9, MSR_PR
-	lwz	r11,TASK_STACK-THREAD(r12)
+	mr	r11, r1
+	lwz	r1,TASK_STACK-THREAD(r12)
 	beq-	99f
-	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
-#ifdef CONFIG_VMAP_STACK
+	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 	li	r10, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
 	mtmsr	r10
 	isync
+	tovirt(r12, r12)
+	stw	r11,GPR1(r1)
+	stw	r11,0(r1)
+	mr	r11, r1
+#else
+	andi.	r11, r9, MSR_PR
+	lwz	r11,TASK_STACK-THREAD(r12)
+	beq-	99f
+	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
+	tophys(r11, r11)
+	stw	r1,GPR1(r11)
+	stw	r1,0(r11)
+	tovirt(r1, r11)		/* set new kernel sp */
 #endif
-	tovirt_vmstack r12, r12
-	tophys_novmstack r11, r11
 	mflr	r10
 	stw	r10, _LINK(r11)
 #ifdef CONFIG_VMAP_STACK
@@ -140,9 +150,6 @@
 #else
 	mfspr	r10,SPRN_SRR0
 #endif
-	stw	r1,GPR1(r11)
-	stw	r1,0(r11)
-	tovirt_novmstack r1, r11	/* set new kernel sp */
 	stw	r10,_NIP(r11)
 	mfcr	r10
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
-- 
2.25.0

