Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB22C3A0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:26:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgsrS5FqTzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:26:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgsVm6GwmzDqfy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 18:10:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgsVj0FR4z9v4Wm;
 Wed, 25 Nov 2020 08:10:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eWICQhUcIWtq; Wed, 25 Nov 2020 08:10:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgsVh5rDcz9tynD;
 Wed, 25 Nov 2020 08:10:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BDDF8B7C2;
 Wed, 25 Nov 2020 08:10:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mbpsKKQH9cvA; Wed, 25 Nov 2020 08:10:53 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57A318B7B7;
 Wed, 25 Nov 2020 08:10:53 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 3A993668BA; Wed, 25 Nov 2020 07:10:53 +0000 (UTC)
Message-Id: <6f5c8a7faa8cc54acb89c55c20aa579a2f30a4e9.1606285014.git.christophe.leroy@csgroup.eu>
In-Reply-To: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
References: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 8/8] powerpc/32: Use SPRN_SPRG_SCRATCH2 in exception prologs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 25 Nov 2020 07:10:53 +0000 (UTC)
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

Use SPRN_SPRG_SCRATCH2 as a third scratch register in
exception prologs in order to simplify them and avoid
data going back and forth from/to CR.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 5e3393122d29..a1ee1e12241e 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -40,7 +40,7 @@
 
 .macro EXCEPTION_PROLOG_1 for_rtas=0
 #ifdef CONFIG_VMAP_STACK
-	mr	r11, r1
+	mtspr	SPRN_SPRG_SCRATCH2,r1
 	subi	r1, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 	beq	1f
 	mfspr	r1,SPRN_SPRG_THREAD
@@ -61,15 +61,10 @@
 
 .macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
 #ifdef CONFIG_VMAP_STACK
-	mtcr	r10
-	li	r10, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
-	mtmsr	r10
+	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	mtmsr	r11
 	isync
-#else
-	stw	r10,_CCR(r11)		/* save registers */
-#endif
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-#ifdef CONFIG_VMAP_STACK
+	mfspr	r11, SPRN_SPRG_SCRATCH2
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
@@ -78,14 +73,12 @@
 	stw	r1,0(r11)
 	tovirt(r1, r11)		/* set new kernel sp */
 #endif
+	stw	r10,_CCR(r11)		/* save registers */
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
-	stw	r10,GPR10(r11)
-#ifdef CONFIG_VMAP_STACK
-	mfcr	r10
-	stw	r10, _CCR(r11)
-#endif
+	mfspr	r10,SPRN_SPRG_SCRATCH0
 	mfspr	r12,SPRN_SPRG_SCRATCH1
+	stw	r10,GPR10(r11)
 	stw	r12,GPR11(r11)
 	mflr	r10
 	stw	r10,_LINK(r11)
@@ -99,7 +92,6 @@
 	stw	r10, _DSISR(r11)
 	.endif
 	lwz	r9, SRR1(r12)
-	andi.	r10, r9, MSR_PR
 	lwz	r12, SRR0(r12)
 #else
 	mfspr	r12,SPRN_SRR0
-- 
2.25.0

