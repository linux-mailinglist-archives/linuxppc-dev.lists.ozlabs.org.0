Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B97A16ADE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 18:42:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R8Xq3ZrYzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 04:42:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LLX9RUic; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R8VN0ztNzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 04:40:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48R8V82vcmz9v9jS;
 Mon, 24 Feb 2020 18:40:32 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LLX9RUic; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 17qRj5xI27jf; Mon, 24 Feb 2020 18:40:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48R8V81PmGz9v9jR;
 Mon, 24 Feb 2020 18:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582566032; bh=hxhX0XzwMMyDwU2JwdmpXBSw3a3CupxHPkjV2ov3TDs=;
 h=From:Subject:To:Cc:Date:From;
 b=LLX9RUicsY805oo56N31D/hpM0djjLdwdr+RZdZdSI47xJc6/GH4Vj8gNwRA1rhw+
 p0PvhJSRgLD4uuTC3EA+5vdO2AGQx9In+AV2673f0pZ5GqXAwZPz5KJFslTQNn8vuX
 7k4519EP/fjOHd0qqGvjw8sxkW4U984PwJ1tgFYY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FD858B803;
 Mon, 24 Feb 2020 18:40:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id viOSOwd9TShB; Mon, 24 Feb 2020 18:40:37 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36F8A8B7FC;
 Mon, 24 Feb 2020 18:40:37 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D68EB653B3; Mon, 24 Feb 2020 17:40:36 +0000 (UTC)
Message-Id: <3ada1af1b479c5a88bf9f3b8955bf5ba3f32f1ba.1582565849.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc/kprobes: Blacklist functions running with MMU
 disabled on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Mon, 24 Feb 2020 17:40:36 +0000 (UTC)
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

kprobe does not handle events happening in real mode, all
functions running with MMU disabled have to be blacklisted.

As already done for PPC64, do it for PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2:
- Don't rename nonrecoverable as local, mark it noprobe instead.
- Add missing linux/kprobes.h include in pq2.c
---
 arch/powerpc/include/asm/ppc_asm.h           | 10 +++
 arch/powerpc/kernel/cpu_setup_6xx.S          |  4 +-
 arch/powerpc/kernel/entry_32.S               | 65 ++++++++------------
 arch/powerpc/kernel/fpu.S                    |  1 +
 arch/powerpc/kernel/idle_6xx.S               |  2 +-
 arch/powerpc/kernel/idle_e500.S              |  2 +-
 arch/powerpc/kernel/l2cr_6xx.S               |  2 +-
 arch/powerpc/kernel/misc.S                   |  2 +
 arch/powerpc/kernel/misc_32.S                |  4 +-
 arch/powerpc/kernel/swsusp_32.S              |  6 +-
 arch/powerpc/kernel/vector.S                 |  1 +
 arch/powerpc/mm/book3s32/hash_low.S          | 38 ++++++------
 arch/powerpc/mm/mem.c                        |  2 +
 arch/powerpc/platforms/52xx/lite5200_sleep.S |  2 +
 arch/powerpc/platforms/82xx/pq2.c            |  3 +
 arch/powerpc/platforms/83xx/suspend-asm.S    |  1 +
 arch/powerpc/platforms/powermac/cache.S      |  2 +
 arch/powerpc/platforms/powermac/sleep.S      | 13 ++--
 18 files changed, 86 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 6b03dff61a05..e8f34ba89497 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -267,8 +267,18 @@ GLUE(.,name):
 	.pushsection "_kprobe_blacklist","aw";		\
 	PPC_LONG (entry) ;				\
 	.popsection
+#define _NOKPROBE_ENTRY(entry)				\
+	_ASM_NOKPROBE_SYMBOL(entry)				\
+	_ENTRY(entry)
+#define _NOKPROBE_GLOBAL(entry)				\
+	_ASM_NOKPROBE_SYMBOL(entry)				\
+	_GLOBAL(entry)
 #else
 #define _ASM_NOKPROBE_SYMBOL(entry)
+#define _NOKPROBE_ENTRY(entry)				\
+	_ENTRY(entry)
+#define _NOKPROBE_GLOBAL(entry)				\
+	_GLOBAL(entry)
 #endif
 
 #define FUNC_START(name)	_GLOBAL(name)
diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S b/arch/powerpc/kernel/cpu_setup_6xx.S
index f6517f67265a..1cb947268546 100644
--- a/arch/powerpc/kernel/cpu_setup_6xx.S
+++ b/arch/powerpc/kernel/cpu_setup_6xx.S
@@ -276,7 +276,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_NO_DPM)
  * in some 750 cpus where using a not yet initialized FPU register after
  * power on reset may hang the CPU
  */
-_GLOBAL(__init_fpu_registers)
+_NOKPROBE_GLOBAL(__init_fpu_registers)
 	mfmsr	r10
 	ori	r11,r10,MSR_FP
 	mtmsr	r11
@@ -381,7 +381,7 @@ _GLOBAL(__save_cpu_setup)
  * restore CPU state as backed up by the previous
  * function. This does not include cache setting
  */
-_GLOBAL(__restore_cpu_setup)
+_NOKPROBE_GLOBAL(__restore_cpu_setup)
 	/* Some CR fields are volatile, we back it up all */
 	mfcr	r7
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 16af0d8d90a8..f788d586254d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -44,24 +44,21 @@
 	.align	12
 
 #ifdef CONFIG_BOOKE
-	.globl	mcheck_transfer_to_handler
-mcheck_transfer_to_handler:
+_NOKPROBE_ENTRY(mcheck_transfer_to_handler)
 	mfspr	r0,SPRN_DSRR0
 	stw	r0,_DSRR0(r11)
 	mfspr	r0,SPRN_DSRR1
 	stw	r0,_DSRR1(r11)
 	/* fall through */
 
-	.globl	debug_transfer_to_handler
-debug_transfer_to_handler:
+_NOKPROBE_ENTRY(debug_transfer_to_handler)
 	mfspr	r0,SPRN_CSRR0
 	stw	r0,_CSRR0(r11)
 	mfspr	r0,SPRN_CSRR1
 	stw	r0,_CSRR1(r11)
 	/* fall through */
 
-	.globl	crit_transfer_to_handler
-crit_transfer_to_handler:
+_NOKPROBE_ENTRY(crit_transfer_to_handler)
 #ifdef CONFIG_PPC_BOOK3E_MMU
 	mfspr	r0,SPRN_MAS0
 	stw	r0,MAS0(r11)
@@ -97,8 +94,7 @@ crit_transfer_to_handler:
 #endif
 
 #ifdef CONFIG_40x
-	.globl	crit_transfer_to_handler
-crit_transfer_to_handler:
+_NOKPROBE_ENTRY(crit_transfer_to_handler)
 	lwz	r0,crit_r10@l(0)
 	stw	r0,GPR10(r11)
 	lwz	r0,crit_r11@l(0)
@@ -124,13 +120,11 @@ crit_transfer_to_handler:
  * Note that we rely on the caller having set cr0.eq iff the exception
  * occurred in kernel mode (i.e. MSR:PR = 0).
  */
-	.globl	transfer_to_handler_full
-transfer_to_handler_full:
+_NOKPROBE_ENTRY(transfer_to_handler_full)
 	SAVE_NVGPRS(r11)
 	/* fall through */
 
-	.globl	transfer_to_handler
-transfer_to_handler:
+_NOKPROBE_ENTRY(transfer_to_handler)
 	stw	r2,GPR2(r11)
 	stw	r12,_NIP(r11)
 	stw	r9,_MSR(r11)
@@ -194,8 +188,7 @@ transfer_to_handler:
 	bt-	31-TLF_NAPPING,4f
 	bt-	31-TLF_SLEEPING,7f
 #endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
-	.globl transfer_to_handler_cont
-transfer_to_handler_cont:
+_NOKPROBE_ENTRY(transfer_to_handler_cont)
 3:
 	mflr	r9
 	tovirt_novmstack r2, r2 	/* set r2 to current */
@@ -297,6 +290,7 @@ reenable_mmu:
  * On kernel stack overflow, load up an initial stack pointer
  * and call StackOverflow(regs), which should not return.
  */
+_ASM_NOKPROBE_SYMBOL(stack_ovf)
 stack_ovf:
 	/* sometimes we use a statically-allocated stack, which is OK. */
 	lis	r12,_end@h
@@ -460,6 +454,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	lwz	r7,_NIP(r1)
 	lwz	r2,GPR2(r1)
 	lwz	r1,GPR1(r1)
+syscall_exit_finish:
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
 	mtspr	SPRN_NRI, r0
 #endif
@@ -467,6 +462,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	mtspr	SPRN_SRR1,r8
 	SYNC
 	RFI
+_ASM_NOKPROBE_SYMBOL(syscall_exit_finish)
 #ifdef CONFIG_44x
 2:	li	r7,0
 	iccci	r0,r0
@@ -750,8 +746,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPE)
 	addi	r1,r1,INT_FRAME_SIZE
 	blr
 
-	.globl	fast_exception_return
-fast_exception_return:
+_NOKPROBE_ENTRY(fast_exception_return)
 #if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
 	andi.	r10,r9,MSR_RI		/* check for recoverable interrupt */
 	beq	1f			/* if not, we've got problems */
@@ -780,8 +775,8 @@ fast_exception_return:
 
 #if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
 /* check if the exception happened in a restartable section */
-1:	lis	r3,exc_exit_restart_end@ha
-	addi	r3,r3,exc_exit_restart_end@l
+1:	lis	r3,.Lexc_exit_restart_end@ha
+	addi	r3,r3,.Lexc_exit_restart_end@l
 	cmplw	r12,r3
 #ifdef CONFIG_PPC_BOOK3S_601
 	bge	2b
@@ -1005,15 +1000,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL & ~MSR_RI)
 	SYNC
 	mtmsr	r10		/* clear the RI bit */
-	.globl exc_exit_restart
-exc_exit_restart:
+_NOKPROBE_ENTRY(exc_exit_restart)
 	lwz	r12,_NIP(r1)
 	mtspr	SPRN_SRR0,r12
 	mtspr	SPRN_SRR1,r9
 	REST_4GPRS(9, r1)
 	lwz	r1,GPR1(r1)
-	.globl exc_exit_restart_end
-exc_exit_restart_end:
+.Lexc_exit_restart_end:
 	SYNC
 	RFI
 
@@ -1033,17 +1026,15 @@ exc_exit_restart_end:
 	li	r10, 0
 	stw	r10, 8(r1)
 	REST_2GPRS(9, r1)
-	.globl exc_exit_restart
+_NOKPROBE_ENTRY(exc_exit_restart)
 exc_exit_restart:
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
-exc_exit_start:
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
 	REST_2GPRS(11, r1)
 	lwz	r1,GPR1(r1)
-	.globl exc_exit_restart_end
-exc_exit_restart_end:
+.Lexc_exit_restart_end:
 	PPC405_ERR77_SYNC
 	rfi
 	b	.			/* prevent prefetch past rfi */
@@ -1146,8 +1137,7 @@ exc_exit_restart_end:
 #endif
 
 #ifdef CONFIG_40x
-	.globl	ret_from_crit_exc
-ret_from_crit_exc:
+_NOKPROBE_ENTRY(ret_from_crit_exc)
 	mfspr	r9,SPRN_SPRG_THREAD
 	lis	r10,saved_ksp_limit@ha;
 	lwz	r10,saved_ksp_limit@l(r10);
@@ -1163,8 +1153,7 @@ ret_from_crit_exc:
 #endif /* CONFIG_40x */
 
 #ifdef CONFIG_BOOKE
-	.globl	ret_from_crit_exc
-ret_from_crit_exc:
+_NOKPROBE_ENTRY(ret_from_crit_exc)
 	mfspr	r9,SPRN_SPRG_THREAD
 	lwz	r10,SAVED_KSP_LIMIT(r1)
 	stw	r10,KSP_LIMIT(r9)
@@ -1172,8 +1161,7 @@ ret_from_crit_exc:
 	RESTORE_MMU_REGS;
 	RET_FROM_EXC_LEVEL(SPRN_CSRR0, SPRN_CSRR1, PPC_RFCI)
 
-	.globl	ret_from_debug_exc
-ret_from_debug_exc:
+_NOKPROBE_ENTRY(ret_from_debug_exc)
 	mfspr	r9,SPRN_SPRG_THREAD
 	lwz	r10,SAVED_KSP_LIMIT(r1)
 	stw	r10,KSP_LIMIT(r9)
@@ -1182,8 +1170,7 @@ ret_from_debug_exc:
 	RESTORE_MMU_REGS;
 	RET_FROM_EXC_LEVEL(SPRN_DSRR0, SPRN_DSRR1, PPC_RFDI)
 
-	.globl	ret_from_mcheck_exc
-ret_from_mcheck_exc:
+_NOKPROBE_ENTRY(ret_from_mcheck_exc)
 	mfspr	r9,SPRN_SPRG_THREAD
 	lwz	r10,SAVED_KSP_LIMIT(r1)
 	stw	r10,KSP_LIMIT(r9)
@@ -1277,9 +1264,10 @@ do_user_signal:			/* r10 contains MSR_KERNEL here */
  * that occurred at a place where taking an exception will lose
  * state information, such as the contents of SRR0 and SRR1.
  */
+_ASM_NOKPROBE_SYMBOL(nonrecoverable)
 nonrecoverable:
-	lis	r10,exc_exit_restart_end@ha
-	addi	r10,r10,exc_exit_restart_end@l
+	lis	r10,.Lexc_exit_restart_end@ha
+	addi	r10,r10,.Lexc_exit_restart_end@l
 	cmplw	r12,r10
 #ifdef CONFIG_PPC_BOOK3S_601
 	bgelr
@@ -1332,7 +1320,7 @@ ee_restarts:
  * On CHRP, the Run-Time Abstraction Services (RTAS) have to be
  * called with the MMU off.
  */
-_GLOBAL(enter_rtas)
+_NOKPROBE_GLOBAL(enter_rtas)
 	stwu	r1,-INT_FRAME_SIZE(r1)
 	mflr	r0
 	stw	r0,INT_FRAME_SIZE+4(r1)
@@ -1370,8 +1358,7 @@ _GLOBAL(enter_rtas)
 	mtspr	SPRN_SRR1,r9
 	RFI			/* return to caller */
 
-	.globl	machine_check_in_rtas
-machine_check_in_rtas:
+_NOKPROBE_ENTRY(machine_check_in_rtas)
 	twi	31,0,0
 	/* XXX load up BATs and panic */
 
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 3235a8da6af7..1dfccf58fbb1 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -119,6 +119,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	/* restore registers and return */
 	/* we haven't used ctr or xer or lr */
 	blr
+_ASM_NOKPROBE_SYMBOL(load_up_fpu)
 
 /*
  * save_fpu(tsk)
diff --git a/arch/powerpc/kernel/idle_6xx.S b/arch/powerpc/kernel/idle_6xx.S
index 433d97bea1f3..37ca62fa0b75 100644
--- a/arch/powerpc/kernel/idle_6xx.S
+++ b/arch/powerpc/kernel/idle_6xx.S
@@ -149,7 +149,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  * address of current.  R11 points to the exception frame (physical
  * address).  We have to preserve r10.
  */
-_GLOBAL(power_save_ppc32_restore)
+_NOKPROBE_GLOBAL(power_save_ppc32_restore)
 	lwz	r9,_LINK(r11)		/* interrupted in ppc6xx_idle: */
 	stw	r9,_NIP(r11)		/* make it do a blr */
 
diff --git a/arch/powerpc/kernel/idle_e500.S b/arch/powerpc/kernel/idle_e500.S
index 308f499e146c..8c9a781b7c11 100644
--- a/arch/powerpc/kernel/idle_e500.S
+++ b/arch/powerpc/kernel/idle_e500.S
@@ -78,7 +78,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * r11 points to the exception frame (physical address).
  * We have to preserve r10.
  */
-_GLOBAL(power_save_ppc32_restore)
+_NOKPROBE_GLOBAL(power_save_ppc32_restore)
 	lwz	r9,_LINK(r11)		/* interrupted in e500_idle */
 	stw	r9,_NIP(r11)		/* make it do a blr */
 
diff --git a/arch/powerpc/kernel/l2cr_6xx.S b/arch/powerpc/kernel/l2cr_6xx.S
index 2020d255585f..75e00baf0146 100644
--- a/arch/powerpc/kernel/l2cr_6xx.S
+++ b/arch/powerpc/kernel/l2cr_6xx.S
@@ -443,7 +443,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  *
  * clobbers r3
  */
-_GLOBAL(__inval_enable_L1)
+_NOKPROBE_GLOBAL(__inval_enable_L1)
 	/* Enable and then Flash inval the instruction & data cache */
 	mfspr	r3,SPRN_HID0
 	ori	r3,r3, HID0_ICE|HID0_ICFI|HID0_DCE|HID0_DCI
diff --git a/arch/powerpc/kernel/misc.S b/arch/powerpc/kernel/misc.S
index 974f65f79a8e..dae46463fc81 100644
--- a/arch/powerpc/kernel/misc.S
+++ b/arch/powerpc/kernel/misc.S
@@ -36,6 +36,8 @@ _GLOBAL(add_reloc_offset)
 	add	r3,r3,r5
 	mtlr	r0
 	blr
+_ASM_NOKPROBE_SYMBOL(reloc_offset)
+_ASM_NOKPROBE_SYMBOL(add_reloc_offset)
 
 	.align	3
 2:	PPC_LONG 1b
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index d80212be8698..07a2a303f0d9 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -233,7 +233,7 @@ _GLOBAL(_nmask_and_or_msr)
 /*
  * Do an IO access in real mode
  */
-_GLOBAL(real_readb)
+_NOKPROBE_GLOBAL(real_readb)
 	mfmsr	r7
 	rlwinm	r0,r7,0,~MSR_DR
 	sync
@@ -250,7 +250,7 @@ _GLOBAL(real_readb)
 	/*
  * Do an IO access in real mode
  */
-_GLOBAL(real_writeb)
+_NOKPROBE_GLOBAL(real_writeb)
 	mfmsr	r7
 	rlwinm	r0,r7,0,~MSR_DR
 	sync
diff --git a/arch/powerpc/kernel/swsusp_32.S b/arch/powerpc/kernel/swsusp_32.S
index cbdf86228eaa..2dfe1afd7fc1 100644
--- a/arch/powerpc/kernel/swsusp_32.S
+++ b/arch/powerpc/kernel/swsusp_32.S
@@ -176,7 +176,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 
 /* Resume code */
-_GLOBAL(swsusp_arch_resume)
+_NOKPROBE_GLOBAL(swsusp_arch_resume)
 
 #ifdef CONFIG_ALTIVEC
 	/* Stop pending alitvec streams and memory accesses */
@@ -367,7 +367,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 	/* restore the MSR and turn on the MMU */
 	lwz	r3,SL_MSR(r11)
-	bl	turn_on_mmu
+	bl	.Lturn_on_mmu
 	tovirt(r11,r11)
 
 	/* Restore TB */
@@ -399,7 +399,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 /* FIXME:This construct is actually not useful since we don't shut
  * down the instruction MMU, we could just flip back MSR-DR on.
  */
-turn_on_mmu:
+.Lturn_on_mmu:
 	mflr	r4
 	mtsrr0	r4
 	mtsrr1	r3
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 25c14a0981bf..403ab2c32dc8 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -89,6 +89,7 @@ _GLOBAL(load_up_altivec)
 	REST_32VRS(0,r4,r6)
 	/* restore registers and return */
 	blr
+_ASM_NOKPROBE_SYMBOL(load_up_altivec)
 
 /*
  * save_altivec(tsk)
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 2015c4f96238..004825d7070c 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -45,7 +45,7 @@ mmu_hash_lock:
  * Uses r0, r3 - r6, r8, r10, ctr, lr.
  */
 	.text
-_GLOBAL(hash_page)
+_NOKPROBE_GLOBAL(hash_page)
 #ifdef CONFIG_SMP
 	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@h
 	ori	r8, r8, (mmu_hash_lock - PAGE_OFFSET)@l
@@ -81,7 +81,7 @@ _GLOBAL(hash_page)
 	rlwinm.	r8,r8,0,0,20		/* extract pt base address */
 #endif
 #ifdef CONFIG_SMP
-	beq-	hash_page_out		/* return if no mapping */
+	beq-	.Lhash_page_out		/* return if no mapping */
 #else
 	/* XXX it seems like the 601 will give a machine fault on the
 	   rfi if its alignment is wrong (bottom 4 bits of address are
@@ -109,11 +109,11 @@ _GLOBAL(hash_page)
 #if (PTE_FLAGS_OFFSET != 0)
 	addi	r8,r8,PTE_FLAGS_OFFSET
 #endif
-retry:
+.Lretry:
 	lwarx	r6,0,r8			/* get linux-style pte, flag word */
 	andc.	r5,r3,r6		/* check access & ~permission */
 #ifdef CONFIG_SMP
-	bne-	hash_page_out		/* return if access not permitted */
+	bne-	.Lhash_page_out		/* return if access not permitted */
 #else
 	bnelr-
 #endif
@@ -128,7 +128,7 @@ retry:
 #endif /* CONFIG_SMP */
 #endif /* CONFIG_PTE_64BIT */
 	stwcx.	r5,0,r8			/* attempt to update PTE */
-	bne-	retry			/* retry if someone got there first */
+	bne-	.Lretry			/* retry if someone got there first */
 
 	mfsrin	r3,r4			/* get segment reg for segment */
 #ifndef CONFIG_VMAP_STACK
@@ -156,7 +156,7 @@ retry:
 #endif
 
 #ifdef CONFIG_SMP
-hash_page_out:
+.Lhash_page_out:
 	eieio
 	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@ha
 	li	r0,0
@@ -173,7 +173,7 @@ hash_page_out:
  * the accessed bit) have already been done and that there is actually
  * a hash table in use (i.e. we're not on a 603).
  */
-_GLOBAL(add_hash_page)
+_NOKPROBE_GLOBAL(add_hash_page)
 	mflr	r0
 	stw	r0,4(r1)
 
@@ -308,7 +308,7 @@ Hash_msk = (((1 << Hash_bits) - 1) * 64)
 #define HASH_LEFT	31-(LG_PTEG_SIZE+Hash_bits-1)
 #define HASH_RIGHT	31-LG_PTEG_SIZE
 
-_GLOBAL(create_hpte)
+_NOKPROBE_GLOBAL(create_hpte)
 	/* Convert linux-style PTE (r5) to low word of PPC-style PTE (r8) */
 	rlwinm	r8,r5,32-9,30,30	/* _PAGE_RW -> PP msb */
 	rlwinm	r0,r5,32-6,30,30	/* _PAGE_DIRTY -> PP msb */
@@ -360,7 +360,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 1:	LDPTEu	r6,HPTE_SIZE(r4)	/* get next PTE */
 	CMPPTE	0,r6,r5
 	bdnzf	2,1b			/* loop while ctr != 0 && !cr0.eq */
-	beq+	found_slot
+	beq+	.Lfound_slot
 
 	patch_site	0f, patch__hash_page_B
 	/* Search the secondary PTEG for a matching PTE */
@@ -372,7 +372,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 2:	LDPTEu	r6,HPTE_SIZE(r4)
 	CMPPTE	0,r6,r5
 	bdnzf	2,2b
-	beq+	found_slot
+	beq+	.Lfound_slot
 	xori	r5,r5,PTE_H		/* clear H bit again */
 
 	/* Search the primary PTEG for an empty slot */
@@ -381,7 +381,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 1:	LDPTEu	r6,HPTE_SIZE(r4)	/* get next PTE */
 	TST_V(r6)			/* test valid bit */
 	bdnzf	2,1b			/* loop while ctr != 0 && !cr0.eq */
-	beq+	found_empty
+	beq+	.Lfound_empty
 
 	/* update counter of times that the primary PTEG is full */
 	lis	r4, (primary_pteg_full - PAGE_OFFSET)@ha
@@ -399,7 +399,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 2:	LDPTEu	r6,HPTE_SIZE(r4)
 	TST_V(r6)
 	bdnzf	2,2b
-	beq+	found_empty
+	beq+	.Lfound_empty
 	xori	r5,r5,PTE_H		/* clear H bit again */
 
 	/*
@@ -437,9 +437,9 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 
 #ifndef CONFIG_SMP
 	/* Store PTE in PTEG */
-found_empty:
+.Lfound_empty:
 	STPTE	r5,0(r4)
-found_slot:
+.Lfound_slot:
 	STPTE	r8,HPTE_SIZE/2(r4)
 
 #else /* CONFIG_SMP */
@@ -460,8 +460,8 @@ found_slot:
  * We do however have to make sure that the PTE is never in an invalid
  * state with the V bit set.
  */
-found_empty:
-found_slot:
+.Lfound_empty:
+.Lfound_slot:
 	CLR_V(r5,r0)		/* clear V (valid) bit in PTE */
 	STPTE	r5,0(r4)
 	sync
@@ -493,7 +493,7 @@ htab_hash_searches:
  *
  * We assume that there is a hash table in use (Hash != 0).
  */
-_GLOBAL(flush_hash_pages)
+_NOKPROBE_GLOBAL(flush_hash_pages)
 	/*
 	 * We disable interrupts here, even on UP, because we want
 	 * the _PAGE_HASHPTE bit to be a reliable indication of
@@ -634,7 +634,7 @@ EXPORT_SYMBOL(flush_hash_pages)
 /*
  * Flush an entry from the TLB
  */
-_GLOBAL(_tlbie)
+_NOKPROBE_GLOBAL(_tlbie)
 #ifdef CONFIG_SMP
 	lwz	r8,TASK_CPU(r2)
 	oris	r8,r8,11
@@ -671,7 +671,7 @@ _GLOBAL(_tlbie)
 /*
  * Flush the entire TLB. 603/603e only
  */
-_GLOBAL(_tlbia)
+_NOKPROBE_GLOBAL(_tlbia)
 #if defined(CONFIG_SMP)
 	lwz	r8,TASK_CPU(r2)
 	oris	r8,r8,10
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ef7b1119b2e2..7a4083a62efe 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -32,6 +32,7 @@
 #include <linux/vmalloc.h>
 #include <linux/memremap.h>
 #include <linux/dma-direct.h>
+#include <linux/kprobes.h>
 
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
@@ -470,6 +471,7 @@ static void flush_dcache_icache_phys(unsigned long physaddr)
 		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
 		: "ctr", "memory");
 }
+NOKPROBE_SYMBOL(flush_dcache_icache_phys)
 #endif // !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
 
 /*
diff --git a/arch/powerpc/platforms/52xx/lite5200_sleep.S b/arch/powerpc/platforms/52xx/lite5200_sleep.S
index 3a9969c429b3..8ced276a6b47 100644
--- a/arch/powerpc/platforms/52xx/lite5200_sleep.S
+++ b/arch/powerpc/platforms/52xx/lite5200_sleep.S
@@ -193,6 +193,7 @@ sram_code_end:
 
 
 /* uboot jumps here on resume */
+_ASM_NOKPROBE_SYMBOL(lite5200_wakeup)
 lite5200_wakeup:
 	bl	restore_regs
 
@@ -335,6 +336,7 @@ save_regs:
 	LOAD_SR(n+2, addr+2);	\
 	LOAD_SR(n+3, addr+3);
 
+_ASM_NOKPROBE_SYMBOL(restore_regs)
 restore_regs:
 	lis	r4, registers@h
 	ori	r4, r4, registers@l
diff --git a/arch/powerpc/platforms/82xx/pq2.c b/arch/powerpc/platforms/82xx/pq2.c
index 1cdd5ed9d896..3b5cb39a564c 100644
--- a/arch/powerpc/platforms/82xx/pq2.c
+++ b/arch/powerpc/platforms/82xx/pq2.c
@@ -10,6 +10,8 @@
  * Copyright (c) 2006 MontaVista Software, Inc.
  */
 
+#include <linux/kprobes.h>
+
 #include <asm/cpm2.h>
 #include <asm/io.h>
 #include <asm/pci-bridge.h>
@@ -29,6 +31,7 @@ void __noreturn pq2_restart(char *cmd)
 
 	panic("Restart failed\n");
 }
+NOKPROBE_SYMBOL(pq2_restart)
 
 #ifdef CONFIG_PCI
 static int pq2_pci_exclude_device(struct pci_controller *hose,
diff --git a/arch/powerpc/platforms/83xx/suspend-asm.S b/arch/powerpc/platforms/83xx/suspend-asm.S
index 3acd7470dc5e..a7ba0f41ac34 100644
--- a/arch/powerpc/platforms/83xx/suspend-asm.S
+++ b/arch/powerpc/platforms/83xx/suspend-asm.S
@@ -365,6 +365,7 @@ boot_low:
 	isync
 1:	b	1b
 
+_ASM_NOKPROBE_SYMBOL(mpc83xx_deep_resume)
 mpc83xx_deep_resume:
 	lis	r4, 1f@h
 	ori	r4, r4, 1f@l
diff --git a/arch/powerpc/platforms/powermac/cache.S b/arch/powerpc/platforms/powermac/cache.S
index da69e0fcb4f1..e15f4aa22e9a 100644
--- a/arch/powerpc/platforms/powermac/cache.S
+++ b/arch/powerpc/platforms/powermac/cache.S
@@ -35,6 +35,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_L2CR)
 	b	__flush_disable_L1
 
 /* This is the code for G3 and 74[01]0 */
+_ASM_NOKPROBE_SYMBOL(flush_disable_75x)
 flush_disable_75x:
 	mflr	r10
 
@@ -186,6 +187,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	blr
 
 /* This code is for 745x processors */
+_ASM_NOKPROBE_SYMBOL(flush_disable_745x)
 flush_disable_745x:
 	/* Turn off EE and DR in MSR */
 	mfmsr	r11
diff --git a/arch/powerpc/platforms/powermac/sleep.S b/arch/powerpc/platforms/powermac/sleep.S
index bd6085b470b7..2a6de1b345c0 100644
--- a/arch/powerpc/platforms/powermac/sleep.S
+++ b/arch/powerpc/platforms/powermac/sleep.S
@@ -177,8 +177,8 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	 *    at address 0x84. I've have some trouble with those
 	 *    parameters however and I no longer use them.
 	 */
-	lis	r5,grackle_wake_up@ha
-	addi	r5,r5,grackle_wake_up@l
+	lis	r5,.Lgrackle_wake_up@ha
+	addi	r5,r5,.Lgrackle_wake_up@l
 	tophys(r5,r5)
 	stw	r5,SL_PC(r1)
 	lis	r4,KERNELBASE@h
@@ -202,6 +202,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	stw r5,0(r3)
 
 	.globl	low_cpu_die
+_ASM_NOKPROBE_SYMBOL(low_cpu_die)
 low_cpu_die:
 	/* Flush & disable all caches */
 	bl	flush_disable_caches
@@ -244,7 +245,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPEC7450)
 	mtmsr	r2
 	isync
 	b	1b
-
 /*
  * Here is the resume code.
  */
@@ -255,6 +255,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPEC7450)
  * r4 has the physical address of SL_PC(sp) (unused)
  */
 _GLOBAL(core99_wake_up)
+_ASM_NOKPROBE_SYMBOL(core99_wake_up)
 	/* Make sure HID0 no longer contains any sleep bit and that data cache
 	 * is disabled
 	 */
@@ -287,7 +288,7 @@ _GLOBAL(core99_wake_up)
  * r1 has the physical address of SL_PC(sp).
  */
 
-grackle_wake_up:
+.Lgrackle_wake_up:
 
 	/* Restore the kernel's segment registers before
 	 * we do any r1 memory access as we are not sure they
@@ -407,7 +408,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 	/* restore the MSR and turn on the MMU */
 	lwz	r3,SL_MSR(r1)
-	bl	turn_on_mmu
+	bl	.Lturn_on_mmu
 
 	/* get back the stack pointer */
 	tovirt(r1,r1)
@@ -430,7 +431,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	mtlr	r0
 	blr
 
-turn_on_mmu:
+.Lturn_on_mmu:
 	mflr	r4
 	tovirt(r4,r4)
 	mtsrr0	r4
-- 
2.25.0

