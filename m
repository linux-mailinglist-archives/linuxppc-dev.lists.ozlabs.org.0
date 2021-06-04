Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355739BB3D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 16:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxQlc1dllz3bsg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 00:54:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxQlH4tP5z2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 00:54:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FxQl93rzlzBCvf;
 Fri,  4 Jun 2021 16:54:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5YWQuByLyAJx; Fri,  4 Jun 2021 16:54:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FxQl92zbbzBCtv;
 Fri,  4 Jun 2021 16:54:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E7568B8A9;
 Fri,  4 Jun 2021 16:54:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e7-5eloLfNFU; Fri,  4 Jun 2021 16:54:13 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12C9C8B885;
 Fri,  4 Jun 2021 16:54:13 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D8FA964BDB; Fri,  4 Jun 2021 14:54:12 +0000 (UTC)
Message-Id: <5ab3a517bc883a2fc905fb2cb5ee9344f37b2cfa.1622818435.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/4] powerpc/32: Interchange r10 and r12 in SYSCALL_ENTRY on
 non booke
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  4 Jun 2021 14:54:12 +0000 (UTC)
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

To better match booke version of SYSCALL_ENTRY macro, interchange
r10 and r12 in the non booke version.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index a8221ddcbd66..1e55bc054659 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -142,42 +142,42 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 
 .macro SYSCALL_ENTRY trapno
 	mfspr	r9, SPRN_SRR1
-	mfspr	r10, SPRN_SRR0
+	mfspr	r12, SPRN_SRR0
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL)		/* can take exceptions */
-	lis	r12, 1f@h
-	ori	r12, r12, 1f@l
+	lis	r10, 1f@h
+	ori	r10, r10, 1f@l
 	mtspr	SPRN_SRR1, r11
-	mtspr	SPRN_SRR0, r12
-	mfspr	r12,SPRN_SPRG_THREAD
+	mtspr	SPRN_SRR0, r10
+	mfspr	r10,SPRN_SPRG_THREAD
 	mr	r11, r1
-	lwz	r1,TASK_STACK-THREAD(r12)
-	tovirt(r12, r12)
+	lwz	r1,TASK_STACK-THREAD(r10)
+	tovirt(r10, r10)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 	rfi
 1:
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
-	stw	r10,_NIP(r11)
-	mflr	r10
-	stw	r10, _LINK(r11)
-	mfcr	r10
-	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
-	stw	r10,_CCR(r11)		/* save registers */
+	stw	r12,_NIP(r11)
+	mflr	r12
+	stw	r12, _LINK(r11)
+	mfcr	r12
+	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
+	stw	r12,_CCR(r11)		/* save registers */
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #endif
-	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
+	lis	r12,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
-	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
+	addi	r12,r12,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r11)
 	li	r2, \trapno
-	stw	r10,8(r11)
+	stw	r12,8(r11)
 	stw	r2,_TRAP(r11)
 	SAVE_GPR(0, r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
-	addi	r2,r12,-THREAD
+	addi	r2,r10,-THREAD
 	b	transfer_to_syscall		/* jump to handler */
 .endm
 
-- 
2.25.0

