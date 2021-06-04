Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E37A39BB3E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 16:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxQlx61rDz3c0D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 00:54:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxQlN0hspz307G
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 00:54:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FxQlB33kLzBCvh;
 Fri,  4 Jun 2021 16:54:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1UtYnGTUR70; Fri,  4 Jun 2021 16:54:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FxQlB2BpLzBCtv;
 Fri,  4 Jun 2021 16:54:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 438888B8A9;
 Fri,  4 Jun 2021 16:54:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vbUKUYTHH2Wa; Fri,  4 Jun 2021 16:54:14 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 133C38B885;
 Fri,  4 Jun 2021 16:54:14 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DF5DA64BDB; Fri,  4 Jun 2021 14:54:13 +0000 (UTC)
Message-Id: <1684c39724a069b0ce1aa82eaee6ec194e354e4e.1622818435.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5ab3a517bc883a2fc905fb2cb5ee9344f37b2cfa.1622818435.git.christophe.leroy@csgroup.eu>
References: <5ab3a517bc883a2fc905fb2cb5ee9344f37b2cfa.1622818435.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/4] powerpc/32: Interchange r1 and r11 in SYSCALL_ENTRY on
 booke
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  4 Jun 2021 14:54:13 +0000 (UTC)
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

To better match non booke version of SYSCALL_ENTRY macro,
interchange r1 and r11 in the booke version.

While at it, in both versions use r1 instead of r11 to save
_NIP and _CCR.

All other uses of r11 will go away in next patch, so don't
bother changing them for now.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h    |  4 ++--
 arch/powerpc/kernel/head_booke.h | 17 +++++++++--------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 1e55bc054659..7ca25eb9bc75 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -158,12 +158,12 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
-	stw	r12,_NIP(r11)
+	stw	r12,_NIP(r1)
 	mflr	r12
 	stw	r12, _LINK(r11)
 	mfcr	r12
 	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
-	stw	r12,_CCR(r11)		/* save registers */
+	stw	r12,_CCR(r1)
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #endif
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index f82470091697..4a2fad9f225e 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -135,17 +135,18 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #endif
 	mfspr	r9, SPRN_SRR1
 	BOOKE_CLEAR_BTB(r11)
-	lwz	r11, TASK_STACK - THREAD(r10)
+	mr	r11, r1
+	lwz	r1, TASK_STACK - THREAD(r10)
 	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
-	ALLOC_STACK_FRAME(r11, THREAD_SIZE - INT_FRAME_SIZE)
-	stw	r12, _CCR(r11)		/* save various registers */
+	ALLOC_STACK_FRAME(r1, THREAD_SIZE - INT_FRAME_SIZE)
+	stw	r12, _CCR(r1)
 	mflr	r12
-	stw	r12,_LINK(r11)
+	stw	r12,_LINK(r1)
 	mfspr	r12,SPRN_SRR0
-	stw	r1, GPR1(r11)
-	stw	r1, 0(r11)
-	mr	r1, r11
-	stw	r12,_NIP(r11)
+	stw	r11, GPR1(r1)
+	stw	r11, 0(r1)
+	mr	r11, r1
+	stw	r12,_NIP(r1)
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?)	   */
 	lis	r12, STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
-- 
2.25.0

