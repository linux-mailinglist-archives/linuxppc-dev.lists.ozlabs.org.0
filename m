Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF7CB2DD6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 04:25:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCs816VwzF4Qp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 12:25:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dq7TUnGx"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBcm4GVMzF3TC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:44 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m29so994778pgc.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPqmLvdaodCYZnduTL6HV3bzRerlqzw5oieFKbEz6QU=;
 b=dq7TUnGxtC1xls+SK26qfVqbpgoAL1IX+lWreUs2C3/wukvNF3O3//G9ED8QpYcvxX
 ZSCZTuvsurdyKyDpJF1MbUtPvp+TQAZ7D+Gmnct41+QGla8AiPghvIAtIUYHEVDHaSYz
 x88MDjQz6OUTSwxG+/F4L7Xtip3/B9GE8P91RmLvQzGQ0SjuFhZQ31nJ+Wtw0lvY/n0v
 f0f5rvDZayavWGaDwNNSDYCU5WAb0kLy/r61rQxs0a/03MQptQQfc2iUZM013uTL+rG3
 WyfwFgYL/H9wVXHbPs3HUKRDLr91GGAVg/dnBFLnIxjr/LEufFX648eUN7SkScRh/NsF
 2dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPqmLvdaodCYZnduTL6HV3bzRerlqzw5oieFKbEz6QU=;
 b=VVSDSB7lRtly6KtiAvsvt/lIS0RbXPAvwQcXD2JqUI3l24pQXQRSjdSiJN4eb99hYM
 6n09+sMZfUr4Ur/6CI3Q4R/M3Yz5kFBupVlWdxBOYH5i/ekB6QRsHmabjgsDubccBIAI
 gaciMytks0wZuuTQ68rqZgIGxRin5TCHOYAqeev4LH7yiYdyjS4Me2XMyeTZ2GP15s2N
 8e1x5IMbYEywS7qzBdbcdplAK7X97PVVmqIKPRS1173yJPvPli/oWxj9DmbX4Hw7PUl9
 LMyc6eWDO7Y3ObJHp7BHhs0JWXMnJFqolateaUBSseCHOHZSHpcWCfla7lZQObEpUjqR
 I9Nw==
X-Gm-Message-State: APjAAAUdIc2ZNOmD8BY1O92E/8715Zybea5ebzt1fgCKk0nghBXbKLg3
 r1DTikoZLzRJcIFHxqWMrEJLcyI4
X-Google-Smtp-Source: APXvYqwmh2RUq2xzL0rfDCqzTiD68iVF/c0+UPfMtkEG4tb47qPyZuu6tj6KlRHkAdokBrNMw09gEw==
X-Received: by 2002:a63:de4f:: with SMTP id y15mr51746234pgi.239.1568510981992; 
 Sat, 14 Sep 2019 18:29:41 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 27/27] powerpc/64s: system call support for scv/rfscv
 instructions
Date: Sun, 15 Sep 2019 11:28:13 +1000
Message-Id: <20190915012813.29317-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for the scv instruction on POWER9 and later CPUs.

For now this implements the zeroth scv vector 'scv 0', as identical
to 'sc' system calls, with the exception that lr is not preserved, and
it is 64-bit only. There may yet be changes made to this ABI, so it's
for testing only.

This also doesn't yet properly handle PR KVM, or the case where a guest
is denied AIL=3 mode. I haven't added real mode entry points, so scv
must not be used when AIL=0, but I haven't cleared the FSCR in this
case.

This also implements a strange hack to handle the non-implemented
vectors, scheduling a decrementer and expecting it to interrupt and
replay pending soft masked interrupts. This is unlikely to be a good
idea, and needs to actually do a proper handler and replay in case an
interrupt is pending.

It may also require some errata handling before it can be safely used
on all POWER9 CPUs, I have to look that up.

rfscv is implemented to return from scv type system calls. It can not
be used to return from sc system calls because those are defined to
preserve lr.

In a comparison of getpid syscall, the test program had scv taking
about 3 more cycles in user mode (92 vs 89 for sc), due to lr handling.
Total cycles taken for a getpid system call on POWER9 are improved from
436 to 345 (26.3% faster), mostly due to reducing mtmsr and mtspr.
---
 arch/powerpc/include/asm/head-64.h    |  2 +-
 arch/powerpc/include/asm/ppc_asm.h    |  2 +
 arch/powerpc/include/asm/processor.h  |  2 +-
 arch/powerpc/kernel/cpu_setup_power.S |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c     |  1 +
 arch/powerpc/kernel/entry_64.S        | 94 +++++++++++++++++++++++++++
 arch/powerpc/kernel/exceptions-64s.S  | 77 ++++++++++++++++++++--
 arch/powerpc/kernel/syscall_64.c      | 72 ++++++++++++++++++++
 8 files changed, 245 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 2dabcf668292..4cb9efa2eb21 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -128,7 +128,7 @@ end_##sname:
 	.if ((start) % (size) != 0);				\
 	.error "Fixed section exception vector misalignment";	\
 	.endif;							\
-	.if ((size) != 0x20) && ((size) != 0x80) && ((size) != 0x100); \
+	.if ((size) != 0x20) && ((size) != 0x80) && ((size) != 0x100) && ((size) != 0x1000); \
 	.error "Fixed section exception vector bad size";	\
 	.endif;							\
 	.if (start) < sname##_start;				\
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 6b03dff61a05..160f3bb77ea4 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -755,6 +755,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define N_SLINE	68
 #define N_SO	100
 
+#define RFSCV	.long 0x4c0000a4
+
 /*
  * Create an endian fixup trampoline
  *
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index a9993e7a443b..bda5667a74df 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -294,7 +294,7 @@ struct thread_struct {
 	.regs = (struct pt_regs *)INIT_SP - 1, /* XXX bogus, I think */ \
 	.addr_limit = KERNEL_DS, \
 	.fpexc_mode = 0, \
-	.fscr = FSCR_TAR | FSCR_EBB \
+	.fscr = FSCR_TAR | FSCR_EBB | FSCR_SCV \
 }
 #endif
 
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index 3239a9fe6c1c..bbdcee752e67 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -178,7 +178,7 @@ __init_LPCR_ISA300:
 
 __init_FSCR:
 	mfspr	r3,SPRN_FSCR
-	ori	r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB
+	ori	r3,r3,FSCR_SCV|FSCR_TAR|FSCR_DSCR|FSCR_EBB
 	mtspr	SPRN_FSCR,r3
 	blr
 
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index bd95318d2202..453f1893906b 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -565,6 +565,7 @@ static struct dt_cpu_feature_match __initdata
 	{"little-endian", feat_enable_le, CPU_FTR_REAL_LE},
 	{"smt", feat_enable_smt, 0},
 	{"interrupt-facilities", feat_enable, 0},
+	{"system-call-vectored", feat_enable, 0},
 	{"timer-facilities", feat_enable, 0},
 	{"timer-facilities-v3", feat_enable, 0},
 	{"debug-facilities", feat_enable, 0},
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 00173cc904ef..360059feec1e 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -62,6 +62,100 @@ exception_marker:
 	.section	".text"
 	.align 7
 
+	.globl system_call_vectored_common
+system_call_vectored_common:
+	mr	r10,r1
+	ld	r1,PACAKSAVE(r13)
+	std	r10,0(r1)
+	std	r11,_NIP(r1)
+	std	r12,_MSR(r1)
+	std	r0,GPR0(r1)
+	std	r10,GPR1(r1)
+	std	r2,GPR2(r1)
+	ld	r2,PACATOC(r13)
+	mfcr	r12
+	li	r11,0
+	/* Can we avoid saving r3-r8 in common case? */
+	std	r3,GPR3(r1)
+	std	r4,GPR4(r1)
+	std	r5,GPR5(r1)
+	std	r6,GPR6(r1)
+	std	r7,GPR7(r1)
+	std	r8,GPR8(r1)
+	/* Zero r9-r12, this should only be required when restoring all GPRs */
+	std	r11,GPR9(r1)
+	std	r11,GPR10(r1)
+	std	r11,GPR11(r1)
+	std	r11,GPR12(r1)
+	std	r9,GPR13(r1)
+	SAVE_NVGPRS(r1)
+	std	r11,_XER(r1)
+	std	r11,_LINK(r1)
+	std	r11,_CTR(r1)
+
+	/*
+	 * This clears CR0.SO (bit 28), which is the error indication on
+	 * return from this system call.
+	 */
+	rldimi	r12,r11,28,(63-28)
+	li	r11,0xc00
+	std	r11,_TRAP(r1)
+	std	r12,_CCR(r1)
+	std	r3,ORIG_GPR3(r1)
+	addi	r10,r1,STACK_FRAME_OVERHEAD
+	ld	r11,exception_marker@toc(r2)
+	std	r11,-16(r10)		/* "regshere" marker */
+
+	/* Calling convention has r9 = orig r0, r10 = regs */
+	mr	r9,r0
+	bl	system_call_vectored_exception
+
+.Lsyscall_vectored_exit:
+	addi    r4,r1,STACK_FRAME_OVERHEAD
+	bl	syscall_exit_prepare
+
+	ld	r2,_CCR(r1)
+	ld	r4,_NIP(r1)
+	ld	r5,_MSR(r1)
+
+BEGIN_FTR_SECTION
+	stdcx.	r0,0,r1			/* to clear the reservation */
+END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
+
+	mtlr	r4
+	mtctr	r5
+
+	cmpdi	r3,0
+	bne	syscall_vectored_restore_regs
+.Lsyscall_vectored_restore_regs_cont:
+
+BEGIN_FTR_SECTION
+	HMT_MEDIUM_LOW
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	/*
+	 * We don't need to restore AMR on the way back to userspace for KUAP.
+	 * The value of AMR only matters while we're in the kernel.
+	 */
+	mtcr	r2
+	ld	r2,GPR2(r1)
+	ld	r3,GPR3(r1)
+	ld	r13,GPR13(r1)
+	ld	r1,GPR1(r1)
+	RFSCV
+	b	.	/* prevent speculative execution */
+_ASM_NOKPROBE_SYMBOL(system_call_vectored_common);
+
+syscall_vectored_restore_regs:
+	ld	r4,_XER(r1)
+	REST_NVGPRS(r1)
+	mtspr	SPRN_XER,r4
+	ld	r0,GPR0(r1)
+	REST_8GPRS(4, r1)
+	ld	r12,GPR12(r1)
+	b	.Lsyscall_vectored_restore_regs_cont
+
+	.balign IFETCH_ALIGN_BYTES
 	.globl system_call_common
 system_call_common:
 	mr	r10,r1
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 07e00f690730..8e7599bc8d9f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -749,6 +749,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * guarantee they will be delivered virtually. Some conditions (see the ISA)
  * cause exceptions to be delivered in real mode.
  *
+ * The scv instructions are a special case. They get a 0x3000 offset applied.
+ * scv exceptions have unique reentrancy properties, see below.
+ *
  * It's impossible to receive interrupts below 0x300 via AIL.
  *
  * KVM: None of the virtual exceptions are from the guest. Anything that
@@ -758,8 +761,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * We layout physical memory as follows:
  * 0x0000 - 0x00ff : Secondary processor spin code
  * 0x0100 - 0x18ff : Real mode pSeries interrupt vectors
- * 0x1900 - 0x3fff : Real mode trampolines
- * 0x4000 - 0x58ff : Relon (IR=1,DR=1) mode pSeries interrupt vectors
+ * 0x1900 - 0x2fff : Real mode trampolines
+ * 0x3000 - 0x58ff : Relon (IR=1,DR=1) mode pSeries interrupt vectors
  * 0x5900 - 0x6fff : Relon mode trampolines
  * 0x7000 - 0x7fff : FWNMI data area
  * 0x8000 -   .... : Common interrupt handlers, remaining early
@@ -770,8 +773,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * vectors there.
  */
 OPEN_FIXED_SECTION(real_vectors,        0x0100, 0x1900)
-OPEN_FIXED_SECTION(real_trampolines,    0x1900, 0x4000)
-OPEN_FIXED_SECTION(virt_vectors,        0x4000, 0x5900)
+OPEN_FIXED_SECTION(real_trampolines,    0x1900, 0x3000)
+OPEN_FIXED_SECTION(virt_vectors,        0x3000, 0x5900)
 OPEN_FIXED_SECTION(virt_trampolines,    0x5900, 0x7000)
 
 #ifdef CONFIG_PPC_POWERNV
@@ -807,6 +810,72 @@ USE_FIXED_SECTION(real_vectors)
 	.globl __start_interrupts
 __start_interrupts:
 
+/**
+ * Interrupt 0x3000 - System Call Vectored Interrupt (syscall).
+ * This is a synchronous interrupt invoked with the "scv" instruction. The
+ * system call does not alter the HV bit, so it is directed to the OS.
+ *
+ * Handling:
+ * scv instructions enter the kernel without changing EE, RI, ME, or HV.
+ * In particular, this means we can take a maskable interrupt at any point
+ * in the scv handler, which is unlike any other interrupt. This is solved
+ * by treating the instruction addresses below __end_interrupts as being
+ * soft-masked.
+ *
+ * AIL-0 mode scv exceptions go to 0x17000-0x17fff, but we set AIL-3 and
+ * ensure scv is never executed with relocation off, which means AIL-0
+ * should never happen. (XXX: must clear FSCR[SCV] if AIL=0)
+ *
+ * Before leaving the below __end_interrupts text, at least of the following
+ * must be true:
+ * - MSR[PR]=1 (i.e., return to userspace)
+ * - MSR_EE|MSR_RI is set (no reentrant exceptions)
+ * - Standard kernel environment is set up (stack, paca, etc)
+ *
+ * Call convention:
+ *
+ * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
+ */
+	.macro scv_ENOSYS
+	li	r3,MSR_RI
+	mtmsrd	r3,1		/* Disable MSR[EE] */
+	li	r3,1
+	mtspr	SPRN_DEC,r3	/* Schedule interrupt in case replay required */
+	li	r3,ENOSYS
+	RFSCV
+	b	.
+	nop
+	.endm
+
+EXC_VIRT_BEGIN(system_call_vectored, 0x3000, 0x1000)
+	/* SCV 0 */
+	mr	r9,r13
+	GET_PACA(r13)
+	mflr	r11
+	mfctr	r12
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+#ifdef CONFIG_RELOCATABLE
+	b	system_call_vectored_tramp
+#else
+	b	system_call_vectored_common
+#endif
+	nop
+
+	/* SCV 1 - 127 */
+	.rept	127
+	scv_ENOSYS
+	.endr
+EXC_VIRT_END(system_call_vectored, 0x3000, 0x1000)
+
+#ifdef CONFIG_RELOCATABLE
+TRAMP_VIRT_BEGIN(system_call_vectored_tramp)
+	__LOAD_HANDLER(r10, system_call_vectored_common)
+	mtctr	r10
+	bctr
+#endif
+
+
 /* No virt vectors corresponding with 0x0..0x100 */
 EXC_VIRT_NONE(0x4000, 0x100)
 
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 034b52d3d78c..3e8aa5ae8ec8 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -15,6 +15,77 @@ extern void __noreturn tabort_syscall(void);
 
 typedef long (*syscall_fn)(long, long, long, long, long, long);
 
+#ifdef CONFIG_PPC_BOOK3S
+long system_call_vectored_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs)
+{
+	unsigned long ti_flags;
+	syscall_fn f;
+
+	BUG_ON(!(regs->msr & MSR_RI));
+	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(!FULL_REGS(regs));
+	BUG_ON(regs->softe != IRQS_ENABLED);
+
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			unlikely(regs->msr & MSR_TS_T))
+		tabort_syscall();
+
+	account_cpu_user_entry();
+
+#ifdef CONFIG_PPC_SPLPAR
+	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
+			firmware_has_feature(FW_FEATURE_SPLPAR)) {
+		struct lppaca *lp = get_lppaca();
+
+		if (unlikely(local_paca->dtl_ridx != lp->dtl_idx))
+			accumulate_stolen_time();
+	}
+#endif
+
+	kuap_check_amr();
+
+	/*
+	 * A syscall should always be called with interrupts enabled
+	 * so we just unconditionally hard-enable here. When some kind
+	 * of irq tracing is used, we additionally check that condition
+	 * is correct
+	 */
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+		WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+	}
+	/*
+	 * This is not required for the syscall exit path, but makes the
+	 * stack frame look nicer. If this was initialised in the first stack
+	 * frame, or if the unwinder was taught the first stack frame always
+	 * returns to user with IRQS_ENABLED, this store could be avoided!
+	 */
+	regs->softe = IRQS_ENABLED;
+
+	local_irq_enable();
+
+	ti_flags = current_thread_info()->flags;
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		/*
+		 * We use the return value of do_syscall_trace_enter() as the
+		 * syscall number. If the syscall was rejected for any reason
+		 * do_syscall_trace_enter() returns an invalid syscall number
+		 * and the test below against NR_syscalls will fail.
+		 */
+		r0 = do_syscall_trace_enter(regs);
+	}
+
+	if (unlikely(r0 >= NR_syscalls))
+		return -ENOSYS;
+
+	/* May be faster to do array_index_nospec? */
+	barrier_nospec();
+
+	f = (void *)sys_call_table[r0];
+
+	return f(r3, r4, r5, r6, r7, r8);
+}
+#endif
+
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs)
 {
 	unsigned long ti_flags;
@@ -174,6 +245,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *reg
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
+	/* XXX: scv need not set RI=0 because SRRs are not used */
 	/* This pattern matches prep_irq_for_idle */
 	__hard_EE_RI_disable();
 	if (unlikely(lazy_irq_pending())) {
-- 
2.23.0

