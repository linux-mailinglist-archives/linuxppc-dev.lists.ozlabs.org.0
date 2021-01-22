Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3D300013
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 11:21:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMb056NjzzDqFw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 21:21:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMZdX2MzjzDrB5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 21:05:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DMZdM5LQZz9vBmw;
 Fri, 22 Jan 2021 11:05:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oIsxJJLXGj1u; Fri, 22 Jan 2021 11:05:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DMZdM4R5jz9vBml;
 Fri, 22 Jan 2021 11:05:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B83E28B818;
 Fri, 22 Jan 2021 11:05:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eRpNFiB2Wcw4; Fri, 22 Jan 2021 11:05:28 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F3358B817;
 Fri, 22 Jan 2021 11:05:28 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 595F266AAE; Fri, 22 Jan 2021 10:05:28 +0000 (UTC)
Message-Id: <fa49013eb6aaea3048bed1276b2334adbfce7c1c.1611309841.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611309841.git.christophe.leroy@csgroup.eu>
References: <cover.1611309841.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 05/14] powerpc/40x: Save SRR0/SRR1 and r10/r11 earlier in
 critical exception
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 22 Jan 2021 10:05:28 +0000 (UTC)
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

In order to be able to switch MMU on in exception prolog, save
SRR0 and SRR1 earlier.

Also save r10 and r11 into stack earlier to better match with the
normal exception prolog.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S | 9 ---------
 arch/powerpc/kernel/head_40x.S | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index b102b40c4988..715a8b1aafc6 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -107,15 +107,6 @@ _ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
 #ifdef CONFIG_40x
 	.globl	crit_transfer_to_handler
 crit_transfer_to_handler:
-	lwz	r0,crit_r10@l(0)
-	stw	r0,GPR10(r11)
-	lwz	r0,crit_r11@l(0)
-	stw	r0,GPR11(r11)
-	mfspr	r0,SPRN_SRR0
-	stw	r0,crit_srr0@l(0)
-	mfspr	r0,SPRN_SRR1
-	stw	r0,crit_srr1@l(0)
-
 	/* set the stack limit to the current stack */
 	mfspr	r8,SPRN_SPRG_THREAD
 	lwz	r0,KSP_LIMIT(r8)
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 595a4cf83391..6394040bbaba 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -103,6 +103,10 @@ _ENTRY(saved_ksp_limit)
 .macro CRITICAL_EXCEPTION_PROLOG
 	stw	r10,crit_r10@l(0)	/* save two registers to work with */
 	stw	r11,crit_r11@l(0)
+	mfspr	r10,SPRN_SRR0
+	mfspr	r11,SPRN_SRR1
+	stw	r10,crit_srr0@l(0)
+	stw	r11,crit_srr1@l(0)
 	mfcr	r10			/* save CR in r10 for now	   */
 	mfspr	r11,SPRN_SRR3		/* check whether user or kernel    */
 	andi.	r11,r11,MSR_PR
@@ -120,6 +124,10 @@ _ENTRY(saved_ksp_limit)
 	stw	r9,GPR9(r11)
 	mflr	r10
 	stw	r10,_LINK(r11)
+	lwz	r10,crit_r10@l(0)
+	lwz	r12,crit_r11@l(0)
+	stw	r10,GPR10(r11)
+	stw	r12,GPR11(r11)
 	mfspr	r12,SPRN_DEAR		/* save DEAR and ESR in the frame  */
 	stw	r12,_DEAR(r11)		/* since they may have had stuff   */
 	mfspr	r9,SPRN_ESR		/* in them at the point where the  */
-- 
2.25.0

