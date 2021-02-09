Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C6314DB6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:00:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZg0Z4d2fzDrNX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 22:00:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdbJ4hNWzDsTW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:57:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdbC5w1tz9txgZ;
 Tue,  9 Feb 2021 10:56:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UehKWlA3wBVt; Tue,  9 Feb 2021 10:56:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdbC4v3gz9txg8;
 Tue,  9 Feb 2021 10:56:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A3EC88B7D6;
 Tue,  9 Feb 2021 10:56:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tFbNvZ2vi_Qu; Tue,  9 Feb 2021 10:56:56 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 39D1D8B7D4;
 Tue,  9 Feb 2021 10:56:56 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 11E1067342; Tue,  9 Feb 2021 09:56:56 +0000 (UTC)
Message-Id: <e895592c2fdafe3ae5dfd3a824361951097b0975.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 31/41] powerpc/32: Remove the xfer parameter in
 EXCEPTION() macro
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:56 +0000 (UTC)
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

The xfer parameter is not used anymore, remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h        |  2 +-
 arch/powerpc/kernel/head_40x.S       | 42 ++++++++--------
 arch/powerpc/kernel/head_44x.S       | 10 ++--
 arch/powerpc/kernel/head_8xx.S       | 14 +++---
 arch/powerpc/kernel/head_book3s_32.S | 72 ++++++++++++++--------------
 arch/powerpc/kernel/head_booke.h     |  2 +-
 arch/powerpc/kernel/head_fsl_booke.S | 28 +++++------
 7 files changed, 81 insertions(+), 89 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 412ede8610f7..84e6251622e8 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -186,7 +186,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 
 #endif
 
-#define EXCEPTION(n, label, hdlr, xfer)		\
+#define EXCEPTION(n, label, hdlr)		\
 	START_EXCEPTION(n, label)		\
 	EXCEPTION_PROLOG n label;		\
 	prepare_transfer_to_handler;		\
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 7eb49ebd6000..52b40bf529c6 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -228,7 +228,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	b	interrupt_return
 
 /* 0x0500 - External Interrupt Exception */
-	EXCEPTION(0x0500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
+	EXCEPTION(0x0500, HardwareInterrupt, do_IRQ)
 
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
@@ -246,19 +246,19 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	REST_NVGPRS(r1)
 	b	interrupt_return
 
-	EXCEPTION(0x0800, Trap_08, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0900, Trap_09, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0A00, Trap_0A, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0B00, Trap_0B, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x0800, Trap_08, unknown_exception)
+	EXCEPTION(0x0900, Trap_09, unknown_exception)
+	EXCEPTION(0x0A00, Trap_0A, unknown_exception)
+	EXCEPTION(0x0B00, Trap_0B, unknown_exception)
 
 /* 0x0C00 - System Call Exception */
 	START_EXCEPTION(0x0C00,	SystemCall)
 	SYSCALL_ENTRY	0xc00
 /*	Trap_0D is commented out to get more space for system call exception */
 
-/*	EXCEPTION(0x0D00, Trap_0D, unknown_exception, EXC_XFER_STD) */
-	EXCEPTION(0x0E00, Trap_0E, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0F00, Trap_0F, unknown_exception, EXC_XFER_STD)
+/*	EXCEPTION(0x0D00, Trap_0D, unknown_exception) */
+	EXCEPTION(0x0E00, Trap_0E, unknown_exception)
+	EXCEPTION(0x0F00, Trap_0F, unknown_exception)
 
 /* 0x1000 - Programmable Interval Timer (PIT) Exception */
 	START_EXCEPTION(0x1000, DecrementerTrap)
@@ -433,19 +433,19 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	mfspr	r10, SPRN_SPRG_SCRATCH5
 	b	InstructionAccess
 
-	EXCEPTION(0x1300, Trap_13, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1400, Trap_14, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1600, Trap_16, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1700, Trap_17, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1A00, Trap_1A, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1B00, Trap_1B, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1C00, Trap_1C, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1D00, Trap_1D, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1E00, Trap_1E, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1F00, Trap_1F, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1300, Trap_13, unknown_exception)
+	EXCEPTION(0x1400, Trap_14, unknown_exception)
+	EXCEPTION(0x1500, Trap_15, unknown_exception)
+	EXCEPTION(0x1600, Trap_16, unknown_exception)
+	EXCEPTION(0x1700, Trap_17, unknown_exception)
+	EXCEPTION(0x1800, Trap_18, unknown_exception)
+	EXCEPTION(0x1900, Trap_19, unknown_exception)
+	EXCEPTION(0x1A00, Trap_1A, unknown_exception)
+	EXCEPTION(0x1B00, Trap_1B, unknown_exception)
+	EXCEPTION(0x1C00, Trap_1C, unknown_exception)
+	EXCEPTION(0x1D00, Trap_1D, unknown_exception)
+	EXCEPTION(0x1E00, Trap_1E, unknown_exception)
+	EXCEPTION(0x1F00, Trap_1F, unknown_exception)
 
 /* Check for a single step debug exception while in an exception
  * handler before state has been saved.  This is to catch the case
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 813fa305c33b..5c106ac36626 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -263,8 +263,7 @@ interrupt_base:
 	INSTRUCTION_STORAGE_EXCEPTION
 
 	/* External Input Interrupt */
-	EXCEPTION(0x0500, BOOKE_INTERRUPT_EXTERNAL, ExternalInput, \
-		  do_IRQ, EXC_XFER_LITE)
+	EXCEPTION(0x0500, BOOKE_INTERRUPT_EXTERNAL, ExternalInput, do_IRQ)
 
 	/* Alignment Interrupt */
 	ALIGNMENT_EXCEPTION
@@ -277,7 +276,7 @@ interrupt_base:
 	FP_UNAVAILABLE_EXCEPTION
 #else
 	EXCEPTION(0x2010, BOOKE_INTERRUPT_FP_UNAVAIL, \
-		  FloatingPointUnavailable, unknown_exception, EXC_XFER_STD)
+		  FloatingPointUnavailable, unknown_exception)
 #endif
 	/* System Call Interrupt */
 	START_EXCEPTION(SystemCall)
@@ -285,15 +284,14 @@ interrupt_base:
 
 	/* Auxiliary Processor Unavailable Interrupt */
 	EXCEPTION(0x2020, BOOKE_INTERRUPT_AP_UNAVAIL, \
-		  AuxillaryProcessorUnavailable, unknown_exception, EXC_XFER_STD)
+		  AuxillaryProcessorUnavailable, unknown_exception)
 
 	/* Decrementer Interrupt */
 	DECREMENTER_EXCEPTION
 
 	/* Fixed Internal Timer Interrupt */
 	/* TODO: Add FIT support */
-	EXCEPTION(0x1010, BOOKE_INTERRUPT_FIT, FixedIntervalTimer, \
-		  unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1010, BOOKE_INTERRUPT_FIT, FixedIntervalTimer, unknown_exception)
 
 	/* Watchdog Timer Interrupt */
 	/* TODO: Add watchdog support */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 4d73549722a1..34feb628c88d 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -118,7 +118,7 @@ instruction_counter:
 #endif
 
 /* System reset */
-	EXCEPTION(0x100, Reset, system_reset_exception, EXC_XFER_STD)
+	EXCEPTION(0x100, Reset, system_reset_exception)
 
 /* Machine check */
 	START_EXCEPTION(0x200, MachineCheck)
@@ -128,7 +128,7 @@ instruction_counter:
 	b	interrupt_return
 
 /* External interrupt */
-	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
+	EXCEPTION(0x500, HardwareInterrupt, do_IRQ)
 
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
@@ -147,14 +147,14 @@ instruction_counter:
 	b	interrupt_return
 
 /* Decrementer */
-	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
+	EXCEPTION(0x900, Decrementer, timer_interrupt)
 
 /* System call */
 	START_EXCEPTION(0xc00, SystemCall)
 	SYSCALL_ENTRY	0xc00
 
 /* Single step - not used on 601 */
-	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
+	EXCEPTION(0xd00, SingleStep, single_step_exception)
 
 /* On the MPC8xx, this is a software emulation interrupt.  It occurs
  * for all unimplemented and illegal instructions.
@@ -384,10 +384,10 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	rfi
 #else
-	EXCEPTION(0x1d00, Trap_1d, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1d00, Trap_1d, unknown_exception)
 #endif
-	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1e00, Trap_1e, unknown_exception)
+	EXCEPTION(0x1f00, Trap_1f, unknown_exception)
 
 	__HEAD
 	. = 0x2000
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 0082342f0ae6..055441646f27 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -239,7 +239,7 @@ __secondary_hold_acknowledge:
 /* System reset */
 /* core99 pmac starts the seconary here by changing the vector, and
    putting it back to what it was (unknown_async_exception) when done.  */
-	EXCEPTION(0x100, Reset, unknown_async_exception, EXC_XFER_STD)
+	EXCEPTION(0x100, Reset, unknown_async_exception)
 
 /* Machine check */
 /*
@@ -339,7 +339,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	b	interrupt_return
 
 /* External interrupt */
-	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
+	EXCEPTION(0x500, HardwareInterrupt, do_IRQ)
 
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
@@ -379,17 +379,17 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 #endif
 
 /* Decrementer */
-	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
+	EXCEPTION(0x900, Decrementer, timer_interrupt)
 
-	EXCEPTION(0xa00, Trap_0a, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0xb00, Trap_0b, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0xa00, Trap_0a, unknown_exception)
+	EXCEPTION(0xb00, Trap_0b, unknown_exception)
 
 /* System call */
 	START_EXCEPTION(0xc00, SystemCall)
 	SYSCALL_ENTRY	0xc00
 
-	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
-	EXCEPTION(0xe00, Trap_0e, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0xd00, SingleStep, single_step_exception)
+	EXCEPTION(0xe00, Trap_0e, unknown_exception)
 
 /*
  * The Altivec unavailable trap is at 0x0f20.  Foo.
@@ -615,35 +615,35 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 #define TAUException	unknown_async_exception
 #endif
 
-	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception, EXC_XFER_STD)
-	EXCEPTION(0x1400, SMI, SMIException, EXC_XFER_STD)
-	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1600, Trap_16, altivec_assist_exception, EXC_XFER_STD)
-	EXCEPTION(0x1700, Trap_17, TAUException, EXC_XFER_STD)
-	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1a00, Trap_1a, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1b00, Trap_1b, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1c00, Trap_1c, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1d00, Trap_1d, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2000, RunMode, RunModeException, EXC_XFER_STD)
-	EXCEPTION(0x2100, Trap_21, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2200, Trap_22, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2300, Trap_23, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2400, Trap_24, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2500, Trap_25, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2600, Trap_26, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2700, Trap_27, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2800, Trap_28, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2900, Trap_29, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2a00, Trap_2a, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2b00, Trap_2b, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2c00, Trap_2c, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2d00, Trap_2d, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2e00, Trap_2e, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2f00, Trap_2f, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception)
+	EXCEPTION(0x1400, SMI, SMIException)
+	EXCEPTION(0x1500, Trap_15, unknown_exception)
+	EXCEPTION(0x1600, Trap_16, altivec_assist_exception)
+	EXCEPTION(0x1700, Trap_17, TAUException)
+	EXCEPTION(0x1800, Trap_18, unknown_exception)
+	EXCEPTION(0x1900, Trap_19, unknown_exception)
+	EXCEPTION(0x1a00, Trap_1a, unknown_exception)
+	EXCEPTION(0x1b00, Trap_1b, unknown_exception)
+	EXCEPTION(0x1c00, Trap_1c, unknown_exception)
+	EXCEPTION(0x1d00, Trap_1d, unknown_exception)
+	EXCEPTION(0x1e00, Trap_1e, unknown_exception)
+	EXCEPTION(0x1f00, Trap_1f, unknown_exception)
+	EXCEPTION(0x2000, RunMode, RunModeException)
+	EXCEPTION(0x2100, Trap_21, unknown_exception)
+	EXCEPTION(0x2200, Trap_22, unknown_exception)
+	EXCEPTION(0x2300, Trap_23, unknown_exception)
+	EXCEPTION(0x2400, Trap_24, unknown_exception)
+	EXCEPTION(0x2500, Trap_25, unknown_exception)
+	EXCEPTION(0x2600, Trap_26, unknown_exception)
+	EXCEPTION(0x2700, Trap_27, unknown_exception)
+	EXCEPTION(0x2800, Trap_28, unknown_exception)
+	EXCEPTION(0x2900, Trap_29, unknown_exception)
+	EXCEPTION(0x2a00, Trap_2a, unknown_exception)
+	EXCEPTION(0x2b00, Trap_2b, unknown_exception)
+	EXCEPTION(0x2c00, Trap_2c, unknown_exception)
+	EXCEPTION(0x2d00, Trap_2d, unknown_exception)
+	EXCEPTION(0x2e00, Trap_2e, unknown_exception)
+	EXCEPTION(0x2f00, Trap_2f, unknown_exception)
 
 	__HEAD
 	. = 0x3000
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index ae6ce924b49a..7c8195ae95c4 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -299,7 +299,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
         .align 5;              						     \
 label:
 
-#define EXCEPTION(n, intno, label, hdlr, xfer)			\
+#define EXCEPTION(n, intno, label, hdlr)			\
 	START_EXCEPTION(label);					\
 	NORMAL_EXCEPTION_PROLOG(n, intno);			\
 	prepare_transfer_to_handler;				\
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 48d022b1f508..3efc5baa801a 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -382,7 +382,7 @@ interrupt_base:
 	INSTRUCTION_STORAGE_EXCEPTION
 
 	/* External Input Interrupt */
-	EXCEPTION(0x0500, EXTERNAL, ExternalInput, do_IRQ, EXC_XFER_LITE)
+	EXCEPTION(0x0500, EXTERNAL, ExternalInput, do_IRQ)
 
 	/* Alignment Interrupt */
 	ALIGNMENT_EXCEPTION
@@ -394,8 +394,7 @@ interrupt_base:
 #ifdef CONFIG_PPC_FPU
 	FP_UNAVAILABLE_EXCEPTION
 #else
-	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, \
-		  unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, unknown_exception)
 #endif
 
 	/* System Call Interrupt */
@@ -403,16 +402,14 @@ interrupt_base:
 	SYSCALL_ENTRY   0xc00 BOOKE_INTERRUPT_SYSCALL SPRN_SRR1
 
 	/* Auxiliary Processor Unavailable Interrupt */
-	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, \
-		  unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, unknown_exception)
 
 	/* Decrementer Interrupt */
 	DECREMENTER_EXCEPTION
 
 	/* Fixed Internal Timer Interrupt */
 	/* TODO: Add FIT support */
-	EXCEPTION(0x3100, FIT, FixedIntervalTimer, \
-		  unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x3100, FIT, FixedIntervalTimer, unknown_exception)
 
 	/* Watchdog Timer Interrupt */
 #ifdef CONFIG_BOOKE_WDT
@@ -625,8 +622,7 @@ END_BTB_FLUSH_SECTION
 	bl	KernelSPE
 	b	interrupt_return
 #elif defined(CONFIG_SPE_POSSIBLE)
-	EXCEPTION(0x2020, SPE_UNAVAIL, SPEUnavailable, \
-		  unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2020, SPE_UNAVAIL, SPEUnavailable, unknown_exception)
 #endif /* CONFIG_SPE_POSSIBLE */
 
 	/* SPE Floating Point Data */
@@ -646,18 +642,16 @@ END_BTB_FLUSH_SECTION
 	REST_NVGPRS(r1)
 	b	interrupt_return
 #elif defined(CONFIG_SPE_POSSIBLE)
-	EXCEPTION(0x2040, SPE_FP_DATA, SPEFloatingPointData,
-		  unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x2050, SPE_FP_ROUND, SPEFloatingPointRound, \
-		  unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0x2040, SPE_FP_DATA, SPEFloatingPointData, unknown_exception)
+	EXCEPTION(0x2050, SPE_FP_ROUND, SPEFloatingPointRound, unknown_exception)
 #endif /* CONFIG_SPE_POSSIBLE */
 
 
 	/* Performance Monitor */
 	EXCEPTION(0x2060, PERFORMANCE_MONITOR, PerformanceMonitor, \
-		  performance_monitor_exception, EXC_XFER_STD)
+		  performance_monitor_exception)
 
-	EXCEPTION(0x2070, DOORBELL, Doorbell, doorbell_exception, EXC_XFER_STD)
+	EXCEPTION(0x2070, DOORBELL, Doorbell, doorbell_exception)
 
 	CRITICAL_EXCEPTION(0x2080, DOORBELL_CRITICAL, \
 			   CriticalDoorbell, unknown_exception)
@@ -672,10 +666,10 @@ END_BTB_FLUSH_SECTION
 			   unknown_exception)
 
 	/* Hypercall */
-	EXCEPTION(0, HV_SYSCALL, Hypercall, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0, HV_SYSCALL, Hypercall, unknown_exception)
 
 	/* Embedded Hypervisor Privilege */
-	EXCEPTION(0, HV_PRIV, Ehvpriv, unknown_exception, EXC_XFER_STD)
+	EXCEPTION(0, HV_PRIV, Ehvpriv, unknown_exception)
 
 interrupt_end:
 
-- 
2.25.0

