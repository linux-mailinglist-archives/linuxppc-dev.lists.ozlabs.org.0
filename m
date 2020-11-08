Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCE2AAC64
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 18:01:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTgPY2sHXzDqC7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 04:01:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTgKj1MtPzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 03:57:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CTgKV6JHBz9tyqV;
 Sun,  8 Nov 2020 17:57:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NkLS1fSN036r; Sun,  8 Nov 2020 17:57:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CTgKV4v8nz9tyqR;
 Sun,  8 Nov 2020 17:57:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 490A78B77F;
 Sun,  8 Nov 2020 17:57:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1vTl7CMWKfeE; Sun,  8 Nov 2020 17:57:38 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E28068B75B;
 Sun,  8 Nov 2020 17:57:37 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BCAD966855; Sun,  8 Nov 2020 16:57:37 +0000 (UTC)
Message-Id: <f7e9cb9e9240feec63cb330abf40b67d1aad852f.1604854583.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7719261b0a0d2787772339484c33eb809723bca7.1604854583.git.christophe.leroy@csgroup.eu>
References: <7719261b0a0d2787772339484c33eb809723bca7.1604854583.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/3] powerpc: Remove RFI macro
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun,  8 Nov 2020 16:57:37 +0000 (UTC)
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

RFI macro is just there to add an infinite loop past
rfi in order to avoid prefetch on 40x in half a dozen
of places in entry_32 and head_32.

Those places are already full of #ifdefs, so just add a
few more to explicitely show those loops and remove RFI.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h |  5 -----
 arch/powerpc/kernel/entry_32.S     | 30 ++++++++++++++++++++++++------
 arch/powerpc/kernel/head_32.h      |  5 ++++-
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index bedf3eb52ebc..101986d4a29d 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -498,11 +498,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define MTMSRD(r)	mtmsrd	r
 #define MTMSR_EERI(reg)	mtmsrd	reg,1
 #else
-#ifndef CONFIG_40x
-#define	RFI		rfi
-#else
-#define RFI		rfi; b .	/* Prevent prefetch past rfi */
-#endif
 #define MTMSRD(r)	mtmsr	r
 #define MTMSR_EERI(reg)	mtmsr	reg
 #endif
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index e10e1167ffb1..c7c28e8acc10 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -234,7 +234,10 @@ transfer_to_handler_cont:
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r10
 	mtlr	r9
-	RFI				/* jump to handler, enable MMU */
+	rfi				/* jump to handler, enable MMU */
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 
 #if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 4:	rlwinm	r12,r12,0,~_TLF_NAPPING
@@ -263,7 +266,10 @@ _ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
 	LOAD_REG_IMMEDIATE(r0, MSR_KERNEL)
 	mtspr	SPRN_SRR0,r12
 	mtspr	SPRN_SRR1,r0
-	RFI
+	rfi
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 
 reenable_mmu:
 	/*
@@ -321,7 +327,10 @@ stack_ovf:
 #endif
 	mtspr	SPRN_SRR0,r9
 	mtspr	SPRN_SRR1,r10
-	RFI
+	rfi
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 _ASM_NOKPROBE_SYMBOL(stack_ovf)
 #endif
 
@@ -470,7 +479,10 @@ syscall_exit_finish:
 #endif
 	mtspr	SPRN_SRR0,r7
 	mtspr	SPRN_SRR1,r8
-	RFI
+	rfi
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 _ASM_NOKPROBE_SYMBOL(syscall_exit_finish)
 #ifdef CONFIG_44x
 2:	li	r7,0
@@ -600,7 +612,10 @@ ret_from_kernel_syscall:
 #endif
 	mtspr	SPRN_SRR0, r9
 	mtspr	SPRN_SRR1, r10
-	RFI
+	rfi
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 _ASM_NOKPROBE_SYMBOL(ret_from_kernel_syscall)
 
 /*
@@ -803,7 +818,10 @@ fast_exception_return:
 	REST_GPR(9, r11)
 	REST_GPR(12, r11)
 	lwz	r11,GPR11(r11)
-	RFI
+	rfi
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 
 #if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 7c767765071d..232000742c9a 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -222,7 +222,10 @@
 #endif
 	mtspr	SPRN_SRR1,r10
 	mtspr	SPRN_SRR0,r11
-	RFI				/* jump to handler, enable MMU */
+	rfi				/* jump to handler, enable MMU */
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 99:	b	ret_from_kernel_syscall
 .endm
 
-- 
2.25.0

