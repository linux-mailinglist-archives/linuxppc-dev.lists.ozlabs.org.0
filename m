Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 827C1F969
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:01:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thVd011VzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cXmoYI/U"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0l1s4fzDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0f5m22z9vD34;
 Tue, 30 Apr 2019 14:38:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cXmoYI/U; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ig35iebDM3pl; Tue, 30 Apr 2019 14:38:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0f4csgz9vD32;
 Tue, 30 Apr 2019 14:38:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627938; bh=FeAId3l4TvsOqsW2dT/dfdiJV/Vo4Yf5peTM7hgWEJ8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cXmoYI/UbJR71reUPKkh86QIOyWk5rcNb0MBsS+TAcfv74EmjiR9P1IJ7uUkNxbhA
 KsVH+hQY2LQg1mXbYhrVdtSsoBYQ4f8F+2HHj82rgRo/nBAqOUS80Txame0IHqsMmc
 pvtrvXNW2XQx9YtOAAyghIqEVKKrHW09bqOdtGXQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0162F8B8C2;
 Tue, 30 Apr 2019 14:39:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RbFt5_OUUymU; Tue, 30 Apr 2019 14:38:59 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A05948B8E2;
 Tue, 30 Apr 2019 14:38:59 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6F0AC666F8; Tue, 30 Apr 2019 12:38:59 +0000 (UTC)
Message-Id: <6fcf330e155202f28a17244aa4cc95a82e1c77be.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 10/16] powerpc/32: Enter exceptions with MSR_EE unset
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:38:59 +0000 (UTC)
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

All exceptions handlers know when to reenable interrupts, so
it is safer to enter all of them with MSR_EE unset, except
for syscalls.

Suggested-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
[splited out from benh RFC patch]

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S        | 68 ++++++++++++++++++------------------
 arch/powerpc/kernel/head_32.h        |  8 -----
 arch/powerpc/kernel/head_40x.S       | 44 +++++++++++------------
 arch/powerpc/kernel/head_44x.S       |  6 ++--
 arch/powerpc/kernel/head_8xx.S       | 32 ++++++++---------
 arch/powerpc/kernel/head_booke.h     | 12 ++-----
 arch/powerpc/kernel/head_fsl_booke.S | 26 +++++++-------
 7 files changed, 90 insertions(+), 106 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 6aa8addce296..2404c39373d3 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -337,7 +337,7 @@ Alignment:
 	mfspr	r5,SPRN_DSISR
 	stw	r5,_DSISR(r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_EE(0x600, alignment_exception)
+	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
@@ -358,13 +358,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 	bl	load_up_fpu		/* if from user, just load it up */
 	b	fast_exception_return
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_EE_LITE(0x800, kernel_fp_unavailable_exception)
+	EXC_XFER_LITE(0x800, kernel_fp_unavailable_exception)
 
 /* Decrementer */
 	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
 
-	EXCEPTION(0xa00, Trap_0a, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0xb00, Trap_0b, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0xa00, Trap_0a, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0xb00, Trap_0b, unknown_exception, EXC_XFER_STD)
 
 /* System call */
 	. = 0xc00
@@ -375,7 +375,7 @@ SystemCall:
 
 /* Single step - not used on 601 */
 	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
-	EXCEPTION(0xe00, Trap_0e, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0xe00, Trap_0e, unknown_exception, EXC_XFER_STD)
 
 /*
  * The Altivec unavailable trap is at 0x0f20.  Foo.
@@ -607,35 +607,35 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 #define altivec_assist_exception	unknown_exception
 #endif
 
-	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception, EXC_XFER_EE)
-	EXCEPTION(0x1400, SMI, SMIException, EXC_XFER_EE)
-	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1600, Trap_16, altivec_assist_exception, EXC_XFER_EE)
+	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception, EXC_XFER_STD)
+	EXCEPTION(0x1400, SMI, SMIException, EXC_XFER_STD)
+	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1600, Trap_16, altivec_assist_exception, EXC_XFER_STD)
 	EXCEPTION(0x1700, Trap_17, TAUException, EXC_XFER_STD)
-	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1a00, Trap_1a, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1b00, Trap_1b, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1c00, Trap_1c, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1d00, Trap_1d, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2000, RunMode, RunModeException, EXC_XFER_EE)
-	EXCEPTION(0x2100, Trap_21, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2200, Trap_22, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2300, Trap_23, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2400, Trap_24, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2500, Trap_25, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2600, Trap_26, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2700, Trap_27, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2800, Trap_28, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2900, Trap_29, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2a00, Trap_2a, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2b00, Trap_2b, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2c00, Trap_2c, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2d00, Trap_2d, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2e00, Trap_2e, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x2f00, Trap_2f, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1a00, Trap_1a, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1b00, Trap_1b, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1c00, Trap_1c, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1d00, Trap_1d, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2000, RunMode, RunModeException, EXC_XFER_STD)
+	EXCEPTION(0x2100, Trap_21, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2200, Trap_22, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2300, Trap_23, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2400, Trap_24, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2500, Trap_25, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2600, Trap_26, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2700, Trap_27, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2800, Trap_28, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2900, Trap_29, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2a00, Trap_2a, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2b00, Trap_2b, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2c00, Trap_2c, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2d00, Trap_2d, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2e00, Trap_2e, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2f00, Trap_2f, unknown_exception, EXC_XFER_STD)
 
 	. = 0x3000
 
@@ -647,7 +647,7 @@ AltiVecUnavailable:
 	b	fast_exception_return
 #endif /* CONFIG_ALTIVEC */
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_EE_LITE(0xf20, altivec_unavailable_exception)
+	EXC_XFER_LITE(0xf20, altivec_unavailable_exception)
 
 PerformanceMonitor:
 	EXCEPTION_PROLOG
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 7221418a883f..8881b6887841 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -127,12 +127,4 @@
 	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL | MSR_EE, NOCOPY, transfer_to_handler, \
 			  ret_from_except)
 
-#define EXC_XFER_EE(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, COPY_EE, transfer_to_handler_full, \
-			  ret_from_except_full)
-
-#define EXC_XFER_EE_LITE(n, hdlr)	\
-	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, COPY_EE, transfer_to_handler, \
-			  ret_from_except)
-
 #endif /* __HEAD_32_H__ */
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 1a80a3e45e44..71597fb7cd89 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -332,7 +332,7 @@ _ENTRY(saved_ksp_limit)
 	mfspr	r4,SPRN_DEAR		/* Grab the DEAR and save it */
 	stw	r4,_DEAR(r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_EE(0x600, alignment_exception)
+	EXC_XFER_STD(0x600, alignment_exception)
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
@@ -342,19 +342,19 @@ _ENTRY(saved_ksp_limit)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x700, program_check_exception)
 
-	EXCEPTION(0x0800, Trap_08, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x0900, Trap_09, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x0A00, Trap_0A, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x0B00, Trap_0B, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x0800, Trap_08, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x0900, Trap_09, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x0A00, Trap_0A, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x0B00, Trap_0B, unknown_exception, EXC_XFER_STD)
 
 /* 0x0C00 - System Call Exception */
 	START_EXCEPTION(0x0C00,	SystemCall)
 	EXCEPTION_PROLOG
 	EXC_XFER_SYS(0xc00, DoSyscall)
 
-	EXCEPTION(0x0D00, Trap_0D, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x0E00, Trap_0E, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x0F00, Trap_0F, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x0D00, Trap_0D, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x0E00, Trap_0E, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x0F00, Trap_0F, unknown_exception, EXC_XFER_STD)
 
 /* 0x1000 - Programmable Interval Timer (PIT) Exception */
 	. = 0x1000
@@ -571,25 +571,25 @@ _ENTRY(saved_ksp_limit)
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	b	InstructionAccess
 
-	EXCEPTION(0x1300, Trap_13, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1400, Trap_14, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1600, Trap_16, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x1300, Trap_13, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1400, Trap_14, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1600, Trap_16, unknown_exception, EXC_XFER_STD)
 #ifdef CONFIG_IBM405_ERR51
 	/* 405GP errata 51 */
 	START_EXCEPTION(0x1700, Trap_17)
 	b DTLBMiss
 #else
-	EXCEPTION(0x1700, Trap_17, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x1700, Trap_17, unknown_exception, EXC_XFER_STD)
 #endif
-	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1A00, Trap_1A, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1B00, Trap_1B, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1C00, Trap_1C, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1D00, Trap_1D, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1E00, Trap_1E, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1F00, Trap_1F, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1A00, Trap_1A, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1B00, Trap_1B, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1C00, Trap_1C, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1D00, Trap_1D, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1E00, Trap_1E, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1F00, Trap_1F, unknown_exception, EXC_XFER_STD)
 
 /* Check for a single step debug exception while in an exception
  * handler before state has been saved.  This is to catch the case
@@ -665,7 +665,7 @@ Decrementer:
 FITException:
 	EXCEPTION_PROLOG
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	EXC_XFER_EE(0x1010, unknown_exception)
+	EXC_XFER_STD(0x1010, unknown_exception)
 
 	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
 WDTException:
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 9cc01948651f..e06cb1c84951 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -278,7 +278,7 @@ interrupt_base:
 	FP_UNAVAILABLE_EXCEPTION
 #else
 	EXCEPTION(0x2010, BOOKE_INTERRUPT_FP_UNAVAIL, \
-		  FloatingPointUnavailable, unknown_exception, EXC_XFER_EE)
+		  FloatingPointUnavailable, unknown_exception, EXC_XFER_STD)
 #endif
 	/* System Call Interrupt */
 	START_EXCEPTION(SystemCall)
@@ -287,7 +287,7 @@ interrupt_base:
 
 	/* Auxiliary Processor Unavailable Interrupt */
 	EXCEPTION(0x2020, BOOKE_INTERRUPT_AP_UNAVAIL, \
-		  AuxillaryProcessorUnavailable, unknown_exception, EXC_XFER_EE)
+		  AuxillaryProcessorUnavailable, unknown_exception, EXC_XFER_STD)
 
 	/* Decrementer Interrupt */
 	DECREMENTER_EXCEPTION
@@ -295,7 +295,7 @@ interrupt_base:
 	/* Fixed Internal Timer Interrupt */
 	/* TODO: Add FIT support */
 	EXCEPTION(0x1010, BOOKE_INTERRUPT_FIT, FixedIntervalTimer, \
-		  unknown_exception, EXC_XFER_EE)
+		  unknown_exception, EXC_XFER_STD)
 
 	/* Watchdog Timer Interrupt */
 	/* TODO: Add watchdog support */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 19ad6484f198..4ebcdfdae920 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -167,7 +167,7 @@ Alignment:
 	mfspr	r5,SPRN_DSISR
 	stw	r5,_DSISR(r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_EE(0x600, alignment_exception)
+	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
@@ -179,8 +179,8 @@ Alignment:
 /* Decrementer */
 	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
 
-	EXCEPTION(0xa00, Trap_0a, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0xb00, Trap_0b, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0xa00, Trap_0a, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0xb00, Trap_0b, unknown_exception, EXC_XFER_STD)
 
 /* System call */
 	. = 0xc00
@@ -190,8 +190,8 @@ SystemCall:
 
 /* Single step - not used on 601 */
 	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
-	EXCEPTION(0xe00, Trap_0e, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0xf00, Trap_0f, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0xe00, Trap_0e, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0xf00, Trap_0f, unknown_exception, EXC_XFER_STD)
 
 /* On the MPC8xx, this is a software emulation interrupt.  It occurs
  * for all unimplemented and illegal instructions.
@@ -521,13 +521,13 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
-	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1600, Trap_16, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1700, Trap_17, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1a00, Trap_1a, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1b00, Trap_1b, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1600, Trap_16, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1700, Trap_17, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1a00, Trap_1a, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1b00, Trap_1b, unknown_exception, EXC_XFER_STD)
 
 /* On the MPC8xx, these next four traps are used for development
  * support of breakpoints and such.  Someday I will get around to
@@ -549,7 +549,7 @@ DataBreakpoint:
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
 	mfspr	r5,SPRN_DSISR
-	EXC_XFER_EE(0x1c00, do_break)
+	EXC_XFER_STD(0x1c00, do_break)
 11:
 	mtcr	r10
 	mfspr	r10, SPRN_SPRG_SCRATCH0
@@ -569,10 +569,10 @@ InstructionBreakpoint:
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	rfi
 #else
-	EXCEPTION(0x1d00, Trap_1d, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x1d00, Trap_1d, unknown_exception, EXC_XFER_STD)
 #endif
-	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_EE)
-	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_STD)
 
 	. = 0x2000
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 612f54ba1125..264976c43f34 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -255,14 +255,6 @@ END_BTB_FLUSH_SECTION
 	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL | MSR_EE, NOCOPY, transfer_to_handler, \
 			  ret_from_except)
 
-#define EXC_XFER_EE(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, COPY_EE, transfer_to_handler_full, \
-			  ret_from_except_full)
-
-#define EXC_XFER_EE_LITE(n, hdlr)	\
-	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, COPY_EE, transfer_to_handler, \
-			  ret_from_except)
-
 /* Check for a single step debug exception while in an exception
  * handler before state has been saved.  This is to catch the case
  * where an instruction that we are trying to single step causes
@@ -405,7 +397,7 @@ END_BTB_FLUSH_SECTION
 	mfspr   r4,SPRN_DEAR;           /* Grab the DEAR and save it */	      \
 	stw     r4,_DEAR(r11);						      \
 	addi    r3,r1,STACK_FRAME_OVERHEAD;				      \
-	EXC_XFER_EE(0x0600, alignment_exception)
+	EXC_XFER_STD(0x0600, alignment_exception)
 
 #define PROGRAM_EXCEPTION						      \
 	START_EXCEPTION(Program)					      \
@@ -430,7 +422,7 @@ END_BTB_FLUSH_SECTION
 	bl	load_up_fpu;		/* if from user, just load it up */   \
 	b	fast_exception_return;					      \
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
-	EXC_XFER_EE_LITE(0x800, kernel_fp_unavailable_exception)
+	EXC_XFER_STD(0x800, kernel_fp_unavailable_exception)
 
 #ifndef __ASSEMBLY__
 struct exception_regs {
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index e77a2ed94642..b351851dc73d 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -380,7 +380,7 @@ interrupt_base:
 	EXC_XFER_LITE(0x0300, handle_page_fault)
 1:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_EE_LITE(0x0300, CacheLockingException)
+	EXC_XFER_LITE(0x0300, CacheLockingException)
 
 	/* Instruction Storage Interrupt */
 	INSTRUCTION_STORAGE_EXCEPTION
@@ -401,10 +401,10 @@ interrupt_base:
 #ifdef CONFIG_E200
 	/* E200 treats 'normal' floating point instructions as FP Unavail exception */
 	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, \
-		  program_check_exception, EXC_XFER_EE)
+		  program_check_exception, EXC_XFER_STD)
 #else
 	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, \
-		  unknown_exception, EXC_XFER_EE)
+		  unknown_exception, EXC_XFER_STD)
 #endif
 #endif
 
@@ -415,7 +415,7 @@ interrupt_base:
 
 	/* Auxiliary Processor Unavailable Interrupt */
 	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, \
-		  unknown_exception, EXC_XFER_EE)
+		  unknown_exception, EXC_XFER_STD)
 
 	/* Decrementer Interrupt */
 	DECREMENTER_EXCEPTION
@@ -423,7 +423,7 @@ interrupt_base:
 	/* Fixed Internal Timer Interrupt */
 	/* TODO: Add FIT support */
 	EXCEPTION(0x3100, FIT, FixedIntervalTimer, \
-		  unknown_exception, EXC_XFER_EE)
+		  unknown_exception, EXC_XFER_STD)
 
 	/* Watchdog Timer Interrupt */
 #ifdef CONFIG_BOOKE_WDT
@@ -633,25 +633,25 @@ END_BTB_FLUSH_SECTION
 	bl	load_up_spe
 	b	fast_exception_return
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_EE_LITE(0x2010, KernelSPE)
+	EXC_XFER_LITE(0x2010, KernelSPE)
 #elif defined(CONFIG_SPE_POSSIBLE)
 	EXCEPTION(0x2020, SPE_UNAVAIL, SPEUnavailable, \
-		  unknown_exception, EXC_XFER_EE)
+		  unknown_exception, EXC_XFER_STD)
 #endif /* CONFIG_SPE_POSSIBLE */
 
 	/* SPE Floating Point Data */
 #ifdef CONFIG_SPE
 	EXCEPTION(0x2030, SPE_FP_DATA, SPEFloatingPointData,
-		  SPEFloatingPointException, EXC_XFER_EE)
+		  SPEFloatingPointException, EXC_XFER_STD)
 
 	/* SPE Floating Point Round */
 	EXCEPTION(0x2050, SPE_FP_ROUND, SPEFloatingPointRound, \
-		  SPEFloatingPointRoundException, EXC_XFER_EE)
+		  SPEFloatingPointRoundException, EXC_XFER_STD)
 #elif defined(CONFIG_SPE_POSSIBLE)
 	EXCEPTION(0x2040, SPE_FP_DATA, SPEFloatingPointData,
-		  unknown_exception, EXC_XFER_EE)
+		  unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x2050, SPE_FP_ROUND, SPEFloatingPointRound, \
-		  unknown_exception, EXC_XFER_EE)
+		  unknown_exception, EXC_XFER_STD)
 #endif /* CONFIG_SPE_POSSIBLE */
 
 
@@ -674,10 +674,10 @@ END_BTB_FLUSH_SECTION
 			   unknown_exception)
 
 	/* Hypercall */
-	EXCEPTION(0, HV_SYSCALL, Hypercall, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0, HV_SYSCALL, Hypercall, unknown_exception, EXC_XFER_STD)
 
 	/* Embedded Hypervisor Privilege */
-	EXCEPTION(0, HV_PRIV, Ehvpriv, unknown_exception, EXC_XFER_EE)
+	EXCEPTION(0, HV_PRIV, Ehvpriv, unknown_exception, EXC_XFER_STD)
 
 interrupt_end:
 
-- 
2.13.3

