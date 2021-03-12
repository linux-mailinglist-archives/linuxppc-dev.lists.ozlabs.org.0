Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A40338E1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxmDK5X18z3hmN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:01:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlzV6Yfwz3dL6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxlzR410sz9ttBX;
 Fri, 12 Mar 2021 13:50:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yR1C5TxzNG56; Fri, 12 Mar 2021 13:50:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxlzR2LVWz9ttBL;
 Fri, 12 Mar 2021 13:50:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 269F88B813;
 Fri, 12 Mar 2021 13:50:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DGrmgJMMnPmK; Fri, 12 Mar 2021 13:50:44 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CDD2C8B764;
 Fri, 12 Mar 2021 13:50:43 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 97762675C9; Fri, 12 Mar 2021 12:50:43 +0000 (UTC)
Message-Id: <e1c45d2e895e0693c42d2a6840df1105a148efea.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 33/41] powerpc/32: Refactor saving of volatile registers in
 exception prologs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:43 +0000 (UTC)
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

Exception prologs all do the same at the end:
- Save trapno in stack
- Mark stack with exception marker
- Save r0
- Save r3 to r8

Refactor that into a COMMON_EXCEPTION_PROLOG_END macro.
At the same time use r1 instead of r11.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h    | 16 ++++++++++------
 arch/powerpc/kernel/head_40x.S   |  9 +--------
 arch/powerpc/kernel/head_booke.h | 26 +++++++++++++-------------
 3 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 84e6251622e8..ba20bfabdf63 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -104,15 +104,19 @@
 	li	r10, MSR_KERNEL		/* can take exceptions */
 	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
-	stw	r0,GPR0(r11)
+	COMMON_EXCEPTION_PROLOG_END \trapno
+_ASM_NOKPROBE_SYMBOL(\name\()_virt)
+.endm
+
+.macro COMMON_EXCEPTION_PROLOG_END trapno
+	stw	r0,GPR0(r1)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
-	stw	r10,8(r11)
+	stw	r10,8(r1)
 	li	r10, \trapno
-	stw	r10,_TRAP(r11)
-	SAVE_4GPRS(3, r11)
-	SAVE_2GPRS(7, r11)
-_ASM_NOKPROBE_SYMBOL(\name\()_virt)
+	stw	r10,_TRAP(r1)
+	SAVE_4GPRS(3, r1)
+	SAVE_2GPRS(7, r1)
 .endm
 
 .macro prepare_transfer_to_handler
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 52b40bf529c6..e1360b88b6cb 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -157,14 +157,7 @@ _ENTRY(crit_esr)
 	mfspr	r12,SPRN_SRR2
 	mfspr	r9,SPRN_SRR3
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?)	   */
-	stw	r0,GPR0(r11)
-	lis	r10, STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
-	addi	r10, r10, STACK_FRAME_REGS_MARKER@l
-	stw	r10, 8(r11)
-	li	r10, \trapno + 2
-	stw	r10,_TRAP(r11)
-	SAVE_4GPRS(3, r11)
-	SAVE_2GPRS(7, r11)
+	COMMON_EXCEPTION_PROLOG_END \trapno + 2
 _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 .endm
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index fa566e89f18b..4d583fbef0b6 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -78,14 +78,18 @@ END_BTB_FLUSH_SECTION
 	stw	r1, 0(r11);						     \
 	mr	r1, r11;						     \
 	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
-	stw	r0,GPR0(r11);						     \
-	lis	r10, STACK_FRAME_REGS_MARKER@ha;/* exception frame marker */ \
-	addi	r10, r10, STACK_FRAME_REGS_MARKER@l;			     \
-	stw	r10, 8(r11);						     \
-	li	r10, trapno;						     \
-	stw	r10,_TRAP(r11);						     \
-	SAVE_4GPRS(3, r11);						     \
-	SAVE_2GPRS(7, r11)
+	COMMON_EXCEPTION_PROLOG_END trapno
+
+.macro COMMON_EXCEPTION_PROLOG_END trapno
+	stw	r0,GPR0(r1)
+	lis	r10, STACK_FRAME_REGS_MARKER@ha	/* exception frame marker */
+	addi	r10, r10, STACK_FRAME_REGS_MARKER@l
+	stw	r10, 8(r1)
+	li	r10, \trapno
+	stw	r10,_TRAP(r1)
+	SAVE_4GPRS(3, r1)
+	SAVE_2GPRS(7, r1)
+.endm
 
 .macro prepare_transfer_to_handler
 	bl	prepare_transfer_to_handler
@@ -231,11 +235,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r1,0(r11);						     \
 	mr	r1,r11;							     \
 	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
-	li	r10, trapno;						     \
-	stw	r10,_TRAP(r11);						     \
-	stw	r0,GPR0(r11);						     \
-	SAVE_4GPRS(3, r11);						     \
-	SAVE_2GPRS(7, r11)
+	COMMON_EXCEPTION_PROLOG_END trapno
 
 #define SAVE_xSRR(xSRR)			\
 	mfspr	r0,SPRN_##xSRR##0;	\
-- 
2.25.0

