Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE819ED3A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 20:02:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wM2q3DL8zDqW9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 04:02:43 +1000 (AEST)
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
 header.s=mail header.b=bITFvj00; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wLf91B8nzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 03:44:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wLf24kFYz9ty3K;
 Sun,  5 Apr 2020 19:44:42 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bITFvj00; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id J20sx8hNkfGD; Sun,  5 Apr 2020 19:44:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wLf23Fywz9ty2y;
 Sun,  5 Apr 2020 19:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586108682; bh=DeHOMI7BiGmDQtIzBqdQKP9nmxijvSk0qQyVXvdXeKQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=bITFvj00aQu2UdVo8PhR3jLcO4m68sOXJzlW04SOCD6+SGYPG24qW57wBHhd6Fc71
 Hcak5VYm6lA+2gXnx/A/WrMfFxinI23b0VZz3TFXv7T/RSX6Rorcr7aRyoYhxQb24G
 fy/h+S3UhtrC8XNO9Qmn0Dku7NzskzRDel0d/m4k=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 11DD28B783;
 Sun,  5 Apr 2020 19:44:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CPwRraAJPwFK; Sun,  5 Apr 2020 19:44:45 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC8628B774;
 Sun,  5 Apr 2020 19:44:45 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7E86E6571C; Sun,  5 Apr 2020 17:44:45 +0000 (UTC)
Message-Id: <a54b7bda7c533387e10488bc75a37c3f431c0455.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 10/13] powerpc/syscall: system call implement
 entry/exit logic in C for PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Sun,  5 Apr 2020 17:44:45 +0000 (UTC)
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

That's port of PPC64 syscall entry/exit logic in C to PPC32.

Performancewise:
Before : 311 cycles on null_syscall
After  : 353 cycles on null_syscall

Note: before the patch, if calling NVGPRS all the time as well,
we have 335 cycles on null_syscall

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 259 ++++-----------------------------
 arch/powerpc/kernel/head_32.h  |  16 +-
 2 files changed, 29 insertions(+), 246 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index a6371fb8f761..103f5158bc44 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -315,162 +315,37 @@ stack_ovf:
 	RFI
 #endif
 
-#ifdef CONFIG_TRACE_IRQFLAGS
-trace_syscall_entry_irq_off:
-	/*
-	 * Syscall shouldn't happen while interrupts are disabled,
-	 * so let's do a warning here.
-	 */
-0:	trap
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
-	bl	trace_hardirqs_on
-
-	/* Now enable for real */
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
-	mtmsr	r10
-
-	REST_GPR(0, r1)
-	REST_4GPRS(3, r1)
-	REST_2GPRS(7, r1)
-	b	DoSyscall
-#endif /* CONFIG_TRACE_IRQFLAGS */
-
 	.globl	transfer_to_syscall
 transfer_to_syscall:
-#ifdef CONFIG_TRACE_IRQFLAGS
-	andi.	r12,r9,MSR_EE
-	beq-	trace_syscall_entry_irq_off
-#endif /* CONFIG_TRACE_IRQFLAGS */
-
-/*
- * Handle a system call.
- */
-	.stabs	"arch/powerpc/kernel/",N_SO,0,0,0f
-	.stabs	"entry_32.S",N_SO,0,0,0f
-0:
-
-_GLOBAL(DoSyscall)
-	stw	r3,ORIG_GPR3(r1)
-	li	r12,0
-	stw	r12,RESULT(r1)
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* Make sure interrupts are enabled */
-	mfmsr	r11
-	andi.	r12,r11,MSR_EE
-	/* We came in with interrupts disabled, we WARN and mark them enabled
-	 * for lockdep now */
-0:	tweqi	r12, 0
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
-#endif /* CONFIG_TRACE_IRQFLAGS */
-	lwz	r11,TI_FLAGS(r2)
-	andi.	r11,r11,_TIF_SYSCALL_DOTRACE
-	bne-	syscall_dotrace
-syscall_dotrace_cont:
-	cmplwi	0,r0,NR_syscalls
-	lis	r10,sys_call_table@h
-	ori	r10,r10,sys_call_table@l
-	slwi	r0,r0,2
-	bge-	66f
-
-	barrier_nospec_asm
-	/*
-	 * Prevent the load of the handler below (based on the user-passed
-	 * system call number) being speculatively executed until the test
-	 * against NR_syscalls and branch to .66f above has
-	 * committed.
-	 */
-
-	lwzx	r10,r10,r0	/* Fetch system call handler [ptr] */
-	mtlr	r10
-	addi	r9,r1,STACK_FRAME_OVERHEAD
-	PPC440EP_ERR42
-	blrl			/* Call handler */
-	.globl	ret_from_syscall
+	mr	r9, r0
+	addi	r10, r1, STACK_FRAME_OVERHEAD
+	bl	system_call_exception
 ret_from_syscall:
-#ifdef CONFIG_DEBUG_RSEQ
-	/* Check whether the syscall is issued inside a restartable sequence */
-	stw	r3,GPR3(r1)
-	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl      rseq_syscall
-	lwz	r3,GPR3(r1)
-#endif
-	mr	r6,r3
-	/* disable interrupts so current_thread_info()->flags can't change */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)	/* doesn't include MSR_EE */
-	/* Note: We don't bother telling lockdep about it */
-	SYNC
-	mtmsr	r10
-	lwz	r9,TI_FLAGS(r2)
-	li	r8,-MAX_ERRNO
-	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP|_TIF_USER_WORK_MASK|_TIF_PERSYSCALL_MASK)
-	bne-	syscall_exit_work
-	cmplw	0,r3,r8
-	blt+	syscall_exit_cont
-	lwz	r11,_CCR(r1)			/* Load CR */
-	neg	r3,r3
-	oris	r11,r11,0x1000	/* Set SO bit in CR */
-	stw	r11,_CCR(r1)
-syscall_exit_cont:
-	lwz	r8,_MSR(r1)
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* If we are going to return from the syscall with interrupts
-	 * off, we trace that here. It shouldn't normally happen.
-	 */
-	andi.	r10,r8,MSR_EE
-	bne+	1f
-	stw	r3,GPR3(r1)
-	bl      trace_hardirqs_off
-	lwz	r3,GPR3(r1)
-1:
-#endif /* CONFIG_TRACE_IRQFLAGS */
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
-	/* If the process has its own DBCR0 value, load it up.  The internal
-	   debug mode bit tells us that dbcr0 should be loaded. */
-	lwz	r0,THREAD+THREAD_DBCR0(r2)
-	andis.	r10,r0,DBCR0_IDM@h
-	bnel-	load_dbcr0
-#endif
-#ifdef CONFIG_44x
-BEGIN_MMU_FTR_SECTION
-	lis	r4,icache_44x_need_flush@ha
-	lwz	r5,icache_44x_need_flush@l(r4)
-	cmplwi	cr0,r5,0
-	bne-	2f
-1:
-END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_47x)
-#endif /* CONFIG_44x */
-BEGIN_FTR_SECTION
-	lwarx	r7,0,r1
-END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
-	stwcx.	r0,0,r1			/* to clear the reservation */
-	ACCOUNT_CPU_USER_EXIT(r2, r5, r7)
-#ifdef CONFIG_PPC_BOOK3S_32
-	kuep_unlock r5, r7
-#endif
-	kuap_check r2, r4
-	lwz	r4,_LINK(r1)
-	lwz	r5,_CCR(r1)
-	mtlr	r4
-	mtcr	r5
-	lwz	r7,_NIP(r1)
-	lwz	r2,GPR2(r1)
-	lwz	r1,GPR1(r1)
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
-	mtspr	SPRN_SRR0,r7
-	mtspr	SPRN_SRR1,r8
-	SYNC
-	RFI
-#ifdef CONFIG_44x
-2:	li	r7,0
-	iccci	r0,r0
-	stw	r7,icache_44x_need_flush@l(r4)
+	addi    r4, r1, STACK_FRAME_OVERHEAD
+	bl	syscall_exit_prepare
+	lwz	r2, _CCR(r1)
+	lwz	r4, _NIP(r1)
+	lwz	r5, _MSR(r1)
+	lwz	r6, _LINK(r1)
+	mtspr	SPRN_SRR0, r4
+	mtspr	SPRN_SRR1, r5
+	mtlr	r6
+	cmpwi	r3, 0
+	bne	2f
+1:	mtcr	r2
+	REST_GPR(2, r1)
+	REST_GPR(3, r1)
+	REST_GPR(1, r1)
+	rfi
+2:	lwz	r3, _CTR(r1)
+	lwz	r4, _XER(r1)
+	REST_NVGPRS(r1)
+	mtctr	r3
+	mtspr	SPRN_XER, r4
+	REST_GPR(0, r1)
+	REST_8GPRS(4, r1)
+	REST_GPR(12, r1)
 	b	1b
-#endif  /* CONFIG_44x */
-
-66:	li	r3,-ENOSYS
-	b	ret_from_syscall
 
 	.globl	ret_from_fork
 ret_from_fork:
@@ -490,86 +365,6 @@ ret_from_kernel_thread:
 	li	r3,0
 	b	ret_from_syscall
 
-/* Traced system call support */
-syscall_dotrace:
-	SAVE_NVGPRS(r1)
-	li	r0,0xc00
-	stw	r0,_TRAP(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_syscall_trace_enter
-	/*
-	 * Restore argument registers possibly just changed.
-	 * We use the return value of do_syscall_trace_enter
-	 * for call number to look up in the table (r0).
-	 */
-	mr	r0,r3
-	lwz	r3,GPR3(r1)
-	lwz	r4,GPR4(r1)
-	lwz	r5,GPR5(r1)
-	lwz	r6,GPR6(r1)
-	lwz	r7,GPR7(r1)
-	lwz	r8,GPR8(r1)
-	REST_NVGPRS(r1)
-
-	cmplwi	r0,NR_syscalls
-	/* Return code is already in r3 thanks to do_syscall_trace_enter() */
-	bge-	ret_from_syscall
-	b	syscall_dotrace_cont
-
-syscall_exit_work:
-	andi.	r0,r9,_TIF_RESTOREALL
-	beq+	0f
-	REST_NVGPRS(r1)
-	b	2f
-0:	cmplw	0,r3,r8
-	blt+	1f
-	andi.	r0,r9,_TIF_NOERROR
-	bne-	1f
-	lwz	r11,_CCR(r1)			/* Load CR */
-	neg	r3,r3
-	oris	r11,r11,0x1000	/* Set SO bit in CR */
-	stw	r11,_CCR(r1)
-
-1:	stw	r6,RESULT(r1)	/* Save result */
-	stw	r3,GPR3(r1)	/* Update return value */
-2:	andi.	r0,r9,(_TIF_PERSYSCALL_MASK)
-	beq	4f
-
-	/* Clear per-syscall TIF flags if any are set.  */
-
-	li	r11,_TIF_PERSYSCALL_MASK
-	addi	r12,r2,TI_FLAGS
-3:	lwarx	r8,0,r12
-	andc	r8,r8,r11
-#ifdef CONFIG_IBM405_ERR77
-	dcbt	0,r12
-#endif
-	stwcx.	r8,0,r12
-	bne-	3b
-	
-4:	/* Anything which requires enabling interrupts? */
-	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP)
-	beq	ret_from_except
-
-	/* Re-enable interrupts. There is no need to trace that with
-	 * lockdep as we are supposed to have IRQs on at this point
-	 */
-	ori	r10,r10,MSR_EE
-	SYNC
-	mtmsr	r10
-
-	/* Save NVGPRS if they're not saved already */
-	lwz	r4,_TRAP(r1)
-	andi.	r4,r4,1
-	beq	5f
-	SAVE_NVGPRS(r1)
-	li	r4,0xc00
-	stw	r4,_TRAP(r1)
-5:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_syscall_trace_leave
-	b	ret_from_except_full
-
 	/*
 	 * System call was called from kernel. We get here with SRR1 in r9.
 	 * Mark the exception as recoverable once we have retrieved SRR0,
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 9abec6cd099c..c301d666a3e5 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -174,12 +174,13 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r11)
-	li	r2, \trapno + 1
+	li	r2, \trapno
 	stw	r10,8(r11)
 	stw	r2,_TRAP(r11)
 	SAVE_GPR(0, r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
+	SAVE_NVGPRS(r11)
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
@@ -188,9 +189,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	   internal debug mode bit to do this. */
 	lwz	r12,THREAD_DBCR0(r12)
 	andis.	r12,r12,DBCR0_IDM@h
-#endif
-	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
-#if defined(CONFIG_40x)
 	beq+	3f
 	/* From user and task is ptraced - load up global dbcr0 */
 	li	r12,-1			/* clear all pending debug events */
@@ -209,17 +207,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	tovirt_novmstack r2, r2 	/* set r2 to current */
 	lis	r11, transfer_to_syscall@h
 	ori	r11, r11, transfer_to_syscall@l
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/*
-	 * If MSR is changing we need to keep interrupts disabled at this point
-	 * otherwise we might risk taking an interrupt before we tell lockdep
-	 * they are enabled.
-	 */
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL)
-	rlwimi	r10, r9, 0, MSR_EE
-#else
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
-#endif
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
 	mtspr	SPRN_NRI, r0
 #endif
-- 
2.25.0

