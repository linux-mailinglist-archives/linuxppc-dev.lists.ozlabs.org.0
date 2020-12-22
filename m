Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E59042E0B21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:49:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0d3k2Rn3zDqHh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:49:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cc45M46zDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cbw1x4Pz9v1wH;
 Tue, 22 Dec 2020 14:28:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sDRYXgDRTno3; Tue, 22 Dec 2020 14:28:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cbw0NW6z9v1vl;
 Tue, 22 Dec 2020 14:28:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48CE88B81B;
 Tue, 22 Dec 2020 14:28:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7DqYX_mvUlT9; Tue, 22 Dec 2020 14:28:29 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBDDE8B81C;
 Tue, 22 Dec 2020 14:28:28 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ABFEC66969; Tue, 22 Dec 2020 13:28:28 +0000 (UTC)
Message-Id: <0246430576c2ff0aed1d35ccbd6f44e658908102.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 06/15] powerpc: Remove address and errorcode arguments from
 do_break()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:28 +0000 (UTC)
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

Let do_break() retrieve address and errorcode from regs.

This simplifies the code and shouldn't impeed performance as
address and errorcode are likely still hot in the cache.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/debug.h     | 3 +--
 arch/powerpc/kernel/exceptions-64s.S | 2 --
 arch/powerpc/kernel/head_8xx.S       | 5 -----
 arch/powerpc/kernel/process.c        | 8 +++-----
 4 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index ec57daf87f40..0550eceab3ca 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, unsigned long address,
 			 unsigned long error_code, int brkpt);
 #else
 
-extern void do_break(struct pt_regs *regs, unsigned long address,
-		     unsigned long error_code);
+void do_break(struct pt_regs *regs);
 #endif
 
 #endif /* _ASM_POWERPC_DEBUG_H */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index cfbd1d690033..3ea067bcbb95 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3262,8 +3262,6 @@ handle_page_fault:
 
 /* We have a data breakpoint exception - handle it */
 handle_dabr_fault:
-	ld      r4,_DAR(r1)
-	ld      r5,_DSISR(r1)
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 	bl      do_break
 	/*
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 52702f3db6df..81f3c984f50c 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -364,11 +364,6 @@ do_databreakpoint:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
-#ifdef CONFIG_VMAP_STACK
-	lwz	r5,_DSISR(r11)
-#else
-	mfspr	r5,SPRN_DSISR
-#endif
 	EXC_XFER_STD(0x1c00, do_break)
 
 	. = 0x1c00
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a66f435dabbf..99c5e4fc5ff1 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -659,12 +659,10 @@ static void do_break_handler(struct pt_regs *regs)
 	}
 }
 
-void do_break (struct pt_regs *regs, unsigned long address,
-		    unsigned long error_code)
+void do_break(struct pt_regs *regs)
 {
 	current->thread.trap_nr = TRAP_HWBKPT;
-	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, error_code,
-			11, SIGSEGV) == NOTIFY_STOP)
+	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, regs->dsisr, 11, SIGSEGV) == NOTIFY_STOP)
 		return;
 
 	if (debugger_break_match(regs))
@@ -681,7 +679,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
 		do_break_handler(regs);
 
 	/* Deliver the signal to userspace */
-	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
+	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
 }
 #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
 
-- 
2.25.0

