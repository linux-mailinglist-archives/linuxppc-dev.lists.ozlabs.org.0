Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AF3314DD1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:08:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZg9K6HGVzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 22:08:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdbK46KYzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:57:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdbF5D3qz9txgb;
 Tue,  9 Feb 2021 10:56:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jGZa_jGzfEkB; Tue,  9 Feb 2021 10:56:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdbF4LPMz9txg8;
 Tue,  9 Feb 2021 10:56:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96B358B7D6;
 Tue,  9 Feb 2021 10:56:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Sv_LMXIGXG_z; Tue,  9 Feb 2021 10:56:58 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 623438B7D4;
 Tue,  9 Feb 2021 10:56:58 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 341C767342; Tue,  9 Feb 2021 09:56:58 +0000 (UTC)
Message-Id: <c99a7a1b2f30006dc0c7cfffee9e14d1df877c75.1612864004.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 33/41] powerpc/32: Save remaining registers in
 exception prolog
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:58 +0000 (UTC)
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

Save non volatile registers, XER, CTR, MSR and NIP in exception prolog.

Also assign proper value to r2 and r3 there.

For now, recalculate thread pointer in prepare_transfer_to_handler.
It will disappear once KUAP is ported to C.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S | 18 +++---------------
 arch/powerpc/kernel/head_32.h  | 12 ++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 75ca010bd78d..fd24520b2e0c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -57,20 +57,9 @@
  */
 	.globl	prepare_transfer_to_handler
 prepare_transfer_to_handler:
-	SAVE_NVGPRS(r11)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	stw	r2,GPR2(r11)
-	stw	r12,_NIP(r11)
-	stw	r9,_MSR(r11)
-	andi.	r2,r9,MSR_PR
-	mfctr	r12
-	mfspr	r2,SPRN_XER
-	stw	r12,_CTR(r11)
-	stw	r2,_XER(r11)
-	mfspr	r12,SPRN_SPRG_THREAD
-	tovirt(r12, r12)
+	andi.	r0,r9,MSR_PR
+	addi	r12, r2, THREAD
 	beq	2f			/* if from user, fix up THREAD.regs */
-	addi	r2, r12, -THREAD
 	stw	r3,PT_REGS(r12)
 #ifdef CONFIG_PPC_BOOK3S_32
 	kuep_lock r11, r12
@@ -80,8 +69,7 @@ prepare_transfer_to_handler:
 2:	/* if from kernel, check interrupted DOZE/NAP mode and
          * check for stack overflow
          */
-	kuap_save_and_lock r11, r12, r9, r2, r6
-	addi	r2, r12, -THREAD
+	kuap_save_and_lock r11, r12, r9, r5, r6
 #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	lwz	r12,TI_LOCAL_FLAGS(r2)
 	mtcrf	0x01,r12
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 12c39178a1d2..b29c13221baa 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -116,6 +116,18 @@
 	stw	r10,_TRAP(r1)
 	SAVE_4GPRS(3, r1)
 	SAVE_2GPRS(7, r1)
+	SAVE_NVGPRS(r1)
+	stw	r2,GPR2(r1)
+	stw	r12,_NIP(r1)
+	stw	r9,_MSR(r1)
+	mfctr	r0
+	mfspr	r10,SPRN_XER
+	mfspr	r2,SPRN_SPRG_THREAD
+	stw	r0,_CTR(r1)
+	tovirt(r2, r2)
+	stw	r10,_XER(r1)
+	addi	r2, r2, -THREAD
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 .endm
 
-- 
2.25.0

