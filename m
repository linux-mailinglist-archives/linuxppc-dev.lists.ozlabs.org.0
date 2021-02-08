Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59E3136E4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 16:18:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ8m46DHhzDsbb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:17:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ8bW0HqjzDrhS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 02:10:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZ8bG4kdjz9vBnC;
 Mon,  8 Feb 2021 16:10:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id C7rjuJzjDpqL; Mon,  8 Feb 2021 16:10:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZ8bG3zSvz9vBn3;
 Mon,  8 Feb 2021 16:10:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C624D8B7B3;
 Mon,  8 Feb 2021 16:10:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VNxVEJ7nY3Ry; Mon,  8 Feb 2021 16:10:23 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8AD4A8B7B2;
 Mon,  8 Feb 2021 16:10:23 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 800A56733E; Mon,  8 Feb 2021 15:10:23 +0000 (UTC)
Message-Id: <8fa13a59f73647e058c95fc7e1c7a98f316bd20a.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612796617.git.christophe.leroy@csgroup.eu>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 04/22] powerpc/32: Reorder instructions to avoid using CTR
 in syscall entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  8 Feb 2021 15:10:23 +0000 (UTC)
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

Now that we are using rfi instead of mtmsr to reactivate MMU, it is
possible to reorder instructions and avoid the need to use CTR for
stashing SRR0.

null_syscall on 8xx is reduced by 3 cycles (283 => 280 cycles).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 4029c51dce5d..24dc326e0d56 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -116,30 +116,28 @@
 .endm
 
 .macro SYSCALL_ENTRY trapno
-	mfspr	r12,SPRN_SPRG_THREAD
 	mfspr	r9, SPRN_SRR1
-	mfspr	r11, SPRN_SRR0
-	mtctr	r11
+	mfspr	r10, SPRN_SRR0
 	andi.	r11, r9, MSR_PR
+	beq-	99f
+	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL)		/* can take exceptions */
+	lis	r12, 1f@h
+	ori	r12, r12, 1f@l
+	mtspr	SPRN_SRR1, r11
+	mtspr	SPRN_SRR0, r12
+	mfspr	r12,SPRN_SPRG_THREAD
 	mr	r11, r1
 	lwz	r1,TASK_STACK-THREAD(r12)
-	beq-	99f
+	tovirt(r12, r12)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL)		/* can take exceptions */
-	mtspr	SPRN_SRR1, r10
-	lis	r10, 1f@h
-	ori	r10, r10, 1f@l
-	mtspr	SPRN_SRR0, r10
 	rfi
 1:
-	tovirt(r12, r12)
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
+	stw	r10,_NIP(r11)
 	mflr	r10
 	stw	r10, _LINK(r11)
-	mfctr	r10
-	stw	r10,_NIP(r11)
 	mfcr	r10
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	stw	r10,_CCR(r11)		/* save registers */
-- 
2.25.0

