Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9DDF984
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:07:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thdC25XmzDq9l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jVkBxiSf"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0n2GbhzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0h6Skgz9vD35;
 Tue, 30 Apr 2019 14:39:00 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jVkBxiSf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LdDPldxYfxVO; Tue, 30 Apr 2019 14:39:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0h5NXhz9vD30;
 Tue, 30 Apr 2019 14:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627940; bh=nKNkh+9M+azIVENVognMyOnKj/MQdKoYB9p0ZvWJLDs=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=jVkBxiSfiaR98K+iIHgBcU+kOEifPxTZdhWZ+z1u9wHdTkz14Tqtxnt08pzn+aCfH
 YjXMwTq/dbZp+VwXQBYN4UsHPDaT81p0ZIJubGZRGUVBVzCHoUZMPH1ip+xJD7Umel
 RBqng6mZxGTLoNtaBsYdqNnl8IcfdMchedC7NKkI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 205748B8DF;
 Tue, 30 Apr 2019 14:39:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DQCJzSfk09IN; Tue, 30 Apr 2019 14:39:02 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B71708B8C2;
 Tue, 30 Apr 2019 14:39:01 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7A42F666F8; Tue, 30 Apr 2019 12:39:01 +0000 (UTC)
Message-Id: <08a881c9ae7cdcbca83ef2c995b17b1f3fbd55ef.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 12/16] powerpc: Fix 32-bit handling of MSR_EE on exceptions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:39:01 +0000 (UTC)
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

[text mostly copied from benh's RFC/WIP]

ppc32 are still doing something rather gothic and wrong on 32-bit
which we stopped doing on 64-bit a while ago.

We have that thing where some handlers "copy" the EE value from the
original stack frame into the new MSR before transferring to the
handler.

Thus for a number of exceptions, we enter the handlers with interrupts
enabled.

This is rather fishy, some of the stuff that handlers might do early
on such as irq_enter/exit or user_exit, context tracking, etc...
should be run with interrupts off afaik.

Generally our handlers know when to re-enable interrupts if needed.

The problem we were having is that we assumed these interrupts would
return with interrupts enabled. However that isn't the case.

Instead, this patch changes things so that we always enter exception
handlers with interrupts *off* with the notable exception of syscalls
which are special (and get a fast path).

Suggested-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 116 ++++++++++++++++++++++++-----------------
 1 file changed, 67 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index d0cea3deb86c..0c555f9f1543 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -37,6 +37,7 @@
 #include <asm/feature-fixups.h>
 #include <asm/barrier.h>
 #include <asm/kup.h>
+#include <asm/bug.h>
 
 #include "head_32.h"
 
@@ -206,19 +207,42 @@ transfer_to_handler_cont:
 	mtspr	SPRN_NRI, r0
 #endif
 #ifdef CONFIG_TRACE_IRQFLAGS
+	/*
+	 * When tracing IRQ state (lockdep) we enable the MMU before we call
+	 * the IRQ tracing functions as they might access vmalloc space or
+	 * perform IOs for console output.
+	 *
+	 * To speed up the syscall path where interrupts stay on, let's check
+	 * first if we are changing the MSR value at all.
+	 */
+	tophys(r12, r1)
+	lwz	r12,_MSR(r12)
+	xor	r12,r10,r12
+	andi.	r12,r12,MSR_EE
+	bne	1f
+
+	/* MSR isn't changing, just transition directly */
+#endif
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r10
+	mtlr	r9
+	SYNC
+	RFI				/* jump to handler, enable MMU */
+
+#ifdef CONFIG_TRACE_IRQFLAGS
+1:	/* MSR is changing, re-enable MMU so we can notify lockdep. We need to
+	 * keep interrupts disabled at this point otherwise we might risk
+	 * taking an interrupt before we tell lockdep they are enabled.
+	 */
 	lis	r12,reenable_mmu@h
 	ori	r12,r12,reenable_mmu@l
+	LOAD_MSR_KERNEL(r0, MSR_KERNEL)
 	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r10
+	mtspr	SPRN_SRR1,r0
 	SYNC
 	RFI
-reenable_mmu:				/* re-enable mmu so we can */
-	mfmsr	r10
-	lwz	r12,_MSR(r1)
-	xor	r10,r10,r12
-	andi.	r10,r10,MSR_EE		/* Did EE change? */
-	beq	1f
 
+reenable_mmu:
 	/*
 	 * The trace_hardirqs_off will use CALLER_ADDR0 and CALLER_ADDR1.
 	 * If from user mode there is only one stack frame on the stack, and
@@ -233,14 +257,24 @@ reenable_mmu:				/* re-enable mmu so we can */
 	 * they aren't useful past this point (aren't syscall arguments),
 	 * the rest is restored from the exception frame.
 	 */
+
+	/* Are we enabling or disabling interrupts ? */
+	andi.	r0,r10,MSR_EE
+
 	stwu	r1,-32(r1)
 	stw	r9,8(r1)
 	stw	r11,12(r1)
 	stw	r3,16(r1)
 	stw	r4,20(r1)
 	stw	r5,24(r1)
-	bl	trace_hardirqs_off
-	lwz	r5,24(r1)
+
+	bne-	0f
+
+	/* If we are disabling interrupts (normal case), simply log it with
+	 * lockdep
+	 */
+1:	bl	trace_hardirqs_off
+2:	lwz	r5,24(r1)
 	lwz	r4,20(r1)
 	lwz	r3,16(r1)
 	lwz	r11,12(r1)
@@ -250,15 +284,22 @@ reenable_mmu:				/* re-enable mmu so we can */
 	lwz	r6,GPR6(r1)
 	lwz	r7,GPR7(r1)
 	lwz	r8,GPR8(r1)
-1:	mtctr	r11
+	mtctr	r11
 	mtlr	r9
 	bctr				/* jump to handler */
-#else /* CONFIG_TRACE_IRQFLAGS */
-	mtspr	SPRN_SRR0,r11
-	mtspr	SPRN_SRR1,r10
-	mtlr	r9
-	SYNC
-	RFI				/* jump to handler, enable MMU */
+
+	/* If we are enabling interrupt, this is a syscall. They shouldn't
+	 * happen while interrupts are disabled, so let's do a warning here.
+	 */
+0:	trap
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
+	bl	trace_hardirqs_on
+
+	/* Now enable for real */
+	mfmsr	r10
+	ori	r10,r10,MSR_EE
+	mtmsr	r10
+	b	2b
 #endif /* CONFIG_TRACE_IRQFLAGS */
 
 #if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
@@ -316,29 +357,13 @@ _GLOBAL(DoSyscall)
 	rlwinm	r11,r11,0,4,2
 	stw	r11,_CCR(r1)
 #ifdef CONFIG_TRACE_IRQFLAGS
-	/* Return from syscalls can (and generally will) hard enable
-	 * interrupts. You aren't supposed to call a syscall with
-	 * interrupts disabled in the first place. However, to ensure
-	 * that we get it right vs. lockdep if it happens, we force
-	 * that hard enable here with appropriate tracing if we see
-	 * that we have been called with interrupts off
-	 */
+	/* Make sure interrupts are enabled */
 	mfmsr	r11
 	andi.	r12,r11,MSR_EE
-	bne+	1f
-	/* We came in with interrupts disabled, we enable them now */
-	bl	trace_hardirqs_on
-	mfmsr	r11
-	lwz	r0,GPR0(r1)
-	lwz	r3,GPR3(r1)
-	lwz	r4,GPR4(r1)
-	ori	r11,r11,MSR_EE
-	lwz	r5,GPR5(r1)
-	lwz	r6,GPR6(r1)
-	lwz	r7,GPR7(r1)
-	lwz	r8,GPR8(r1)
-	mtmsr	r11
-1:
+	/* We came in with interrupts disabled, we WARN and mark them enabled
+	 * for lockdep now */
+0:	tweqi	r12, 0
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
 #endif /* CONFIG_TRACE_IRQFLAGS */
 	lwz	r11,TI_FLAGS(r2)
 	andi.	r11,r11,_TIF_SYSCALL_DOTRACE
@@ -392,8 +417,7 @@ syscall_exit_cont:
 	lwz	r8,_MSR(r1)
 #ifdef CONFIG_TRACE_IRQFLAGS
 	/* If we are going to return from the syscall with interrupts
-	 * off, we trace that here. It shouldn't happen though but we
-	 * want to catch the bugger if it does right ?
+	 * off, we trace that here. It shouldn't normally happen.
 	 */
 	andi.	r10,r8,MSR_EE
 	bne+	1f
@@ -918,13 +942,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
 	 * off in this assembly code while peeking at TI_FLAGS() and such. However
 	 * we need to inform it if the exception turned interrupts off, and we
 	 * are about to trun them back on.
-	 *
-	 * The problem here sadly is that we don't know whether the exceptions was
-	 * one that turned interrupts off or not. So we always tell lockdep about
-	 * turning them on here when we go back to wherever we came from with EE
-	 * on, even if that may meen some redudant calls being tracked. Maybe later
-	 * we could encode what the exception did somewhere or test the exception
-	 * type in the pt_regs but that sounds overkill
 	 */
 	andi.	r10,r9,MSR_EE
 	beq	1f
@@ -1212,9 +1229,10 @@ do_work:			/* r10 contains MSR_KERNEL here */
 	beq	do_user_signal
 
 do_resched:			/* r10 contains MSR_KERNEL here */
-	/* Note: We don't need to inform lockdep that we are enabling
-	 * interrupts here. As far as it knows, they are already enabled
-	 */
+#ifdef CONFIG_TRACE_IRQFLAGS
+	bl	trace_hardirqs_on
+	mfmsr	r10
+#endif
 	ori	r10,r10,MSR_EE
 	SYNC
 	MTMSRD(r10)		/* hard-enable interrupts */
-- 
2.13.3

