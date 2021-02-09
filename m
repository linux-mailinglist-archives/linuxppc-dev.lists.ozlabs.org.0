Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803C314D9B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:57:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfwX5FvBzDqJm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:57:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdbG2ZrqzDsTW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdbB0xRsz9txgX;
 Tue,  9 Feb 2021 10:56:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xlTO6cSzGJWo; Tue,  9 Feb 2021 10:56:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdbB0BYBz9txg8;
 Tue,  9 Feb 2021 10:56:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E752F8B7D8;
 Tue,  9 Feb 2021 10:56:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 137AUj46PgC2; Tue,  9 Feb 2021 10:56:54 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 28B5B8B7D7;
 Tue,  9 Feb 2021 10:56:54 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 03D8F67342; Tue,  9 Feb 2021 09:56:54 +0000 (UTC)
Message-Id: <2eec585c9d60177a135924b5562dcf54a9463e05.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 29/41] powerpc/32: Only restore non volatile registers
 when required
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:54 +0000 (UTC)
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

Until now, non volatile registers were restored everytime they
were saved, ie using EXC_XFER_STD meant saving and restoring
them while EXC_XFER_LITE meant neither saving not restoring them.

Now that they are always saved, EXC_XFER_STD means to restore
them and EXC_XFER_LITE means to not restore them.

Most of the users of EXC_XFER_STD only need to retrieve the
non volatile registers. For them there is no need to restore
the non volatile registers as they have not been modified.

Only very few exceptions require non volatile registers restore.

Opencode the few places which require saving of non volatile
registers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       |  1 -
 arch/powerpc/kernel/head_40x.S       | 10 ++++++++--
 arch/powerpc/kernel/head_8xx.S       | 24 ++++++++++++++++++++----
 arch/powerpc/kernel/head_book3s_32.S | 17 ++++++++++++++---
 arch/powerpc/kernel/head_booke.h     | 10 ++++++++--
 arch/powerpc/kernel/head_fsl_booke.S | 16 ++++++++++++----
 6 files changed, 62 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 03f4d07f4176..d8a913f850ef 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -335,7 +335,6 @@ _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 
 	.globl	ret_from_except_full
 ret_from_except_full:
-	REST_NVGPRS(r1)
 	/* fall through */
 
 	.globl	ret_from_except
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 7270caff665c..f3e5b462113f 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -228,12 +228,18 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
 	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
-	EXC_XFER_STD(0x600, alignment_exception)
+	prepare_transfer_to_handler
+	bl	alignment_exception
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
 	EXCEPTION_PROLOG 0x700 ProgramCheck handle_dar_dsisr=1
-	EXC_XFER_STD(0x700, program_check_exception)
+	prepare_transfer_to_handler
+	bl	program_check_exception
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 	EXCEPTION(0x0800, Trap_08, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x0900, Trap_09, unknown_exception, EXC_XFER_STD)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index c48de97f42fc..86f844eb0e5a 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -131,10 +131,18 @@ instruction_counter:
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
-	EXC_XFER_STD(0x600, alignment_exception)
+	prepare_transfer_to_handler
+	bl	alignment_exception
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 /* Program check exception */
-	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
+	START_EXCEPTION(0x700, ProgramCheck)
+	EXCEPTION_PROLOG 0x700 ProgramCheck
+	prepare_transfer_to_handler
+	bl	program_check_exception
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 /* Decrementer */
 	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
@@ -149,7 +157,12 @@ instruction_counter:
 /* On the MPC8xx, this is a software emulation interrupt.  It occurs
  * for all unimplemented and illegal instructions.
  */
-	EXCEPTION(0x1000, SoftEmu, emulation_assist_interrupt, EXC_XFER_STD)
+	START_EXCEPTION(0x1000, SoftEmu)
+	EXCEPTION_PROLOG 0x1000 SoftEmu
+	prepare_transfer_to_handler
+	bl	emulation_assist_interrupt
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 /*
  * For the MPC8xx, this is a software tablewalk to load the instruction
@@ -348,7 +361,10 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	EXCEPTION_PROLOG_2 0x1c00 DataBreakpoint handle_dar_dsisr=1
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
-	EXC_XFER_STD(0x1c00, do_break)
+	prepare_transfer_to_handler
+	bl	do_break
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 #ifdef CONFIG_PERF_EVENTS
 	START_EXCEPTION(0x1d00, InstructionBreakpoint)
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 67dac65b8ec3..609b2eedd4f9 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -300,7 +300,10 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
 	EXC_XFER_LITE(0x300, do_page_fault)
-1:	EXC_XFER_STD(0x300, do_break)
+1:	prepare_transfer_to_handler
+	bl	do_break
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 
 /* Instruction access exception. */
@@ -336,10 +339,18 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
-	EXC_XFER_STD(0x600, alignment_exception)
+	prepare_transfer_to_handler
+	bl	alignment_exception
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 /* Program check exception */
-	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
+	START_EXCEPTION(0x700, ProgramCheck)
+	EXCEPTION_PROLOG 0x700 ProgramCheck
+	prepare_transfer_to_handler
+	bl	program_check_exception
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 /* Floating-point unavailable */
 	START_EXCEPTION(0x800, FPUnavailable)
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 9bc86aab65ef..809d1c6c9af9 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -483,14 +483,20 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	NORMAL_EXCEPTION_PROLOG(0x600, ALIGNMENT);		      \
 	mfspr   r4,SPRN_DEAR;           /* Grab the DEAR and save it */	      \
 	stw     r4,_DEAR(r11);						      \
-	EXC_XFER_STD(0x0600, alignment_exception)
+	prepare_transfer_to_handler;					      \
+	bl	alignment_exception;					      \
+	REST_NVGPRS(r1);						      \
+	b	interrupt_return
 
 #define PROGRAM_EXCEPTION						      \
 	START_EXCEPTION(Program)					      \
 	NORMAL_EXCEPTION_PROLOG(0x700, PROGRAM);		      \
 	mfspr	r4,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r4,_ESR(r11);						      \
-	EXC_XFER_STD(0x0700, program_check_exception)
+	prepare_transfer_to_handler;					      \
+	bl	program_check_exception;				      \
+	REST_NVGPRS(r1);						      \
+	b	interrupt_return
 
 #define DECREMENTER_EXCEPTION						      \
 	START_EXCEPTION(Decrementer)					      \
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index bf2730b4e43b..210871b2eb41 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -625,12 +625,20 @@ END_BTB_FLUSH_SECTION
 
 	/* SPE Floating Point Data */
 #ifdef CONFIG_SPE
-	EXCEPTION(0x2030, SPE_FP_DATA, SPEFloatingPointData,
-		  SPEFloatingPointException, EXC_XFER_STD)
+	START_EXCEPTION(SPEFloatingPointData)
+	NORMAL_EXCEPTION_PROLOG(0x2030, SPE_FP_DATA)
+	prepare_transfer_to_handler
+	bl	SPEFloatingPointException
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 	/* SPE Floating Point Round */
-	EXCEPTION(0x2050, SPE_FP_ROUND, SPEFloatingPointRound, \
-		  SPEFloatingPointRoundException, EXC_XFER_STD)
+	START_EXCEPTION(SPEFloatingPointRound)
+	NORMAL_EXCEPTION_PROLOG(0x2050, SPE_FP_ROUND)
+	prepare_transfer_to_handler
+	bl	SPEFloatingPointRoundException
+	REST_NVGPRS(r1)
+	b	interrupt_return
 #elif defined(CONFIG_SPE_POSSIBLE)
 	EXCEPTION(0x2040, SPE_FP_DATA, SPEFloatingPointData,
 		  unknown_exception, EXC_XFER_STD)
-- 
2.25.0

