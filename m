Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC016EE8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 20:01:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RpDd5N5lzDqLw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 06:01:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SaLXMPE1; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSc1X2bzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:20 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id h8so592578pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x9o4vxj2s0bPjZolfTV52SsZDnME5qXbfWFBN+2vAKY=;
 b=SaLXMPE1HodnQnFEoaXveO98bfsDMCQtC4WwEalUTvRAyoPKldTHYaDN6R4jUQF3/A
 xMO/pto4SKECEyMzFjZESfkscTD3KuencJ/9ppiy+ryS67EqKCTGYr6ag2TsRY1/JQN3
 EcItzltTFoTKLJZ5pdLlL5FA0clVcilfDwZPEGriIFpincxjnzRUvg3nYKy5M6Xsar6l
 BsO2SYDiHlv33b9Wc0yPOC7UCM+RUJI0g0gZPpvKQyIVuMmwwjoE81oxupbZfodHUpd8
 8lhpASEwX7j4uHeaJzyZNgmcKD4PtaKYamEWG0ABBz8MyaEgUNTjsdjYo+H8d6n+5RBp
 YuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x9o4vxj2s0bPjZolfTV52SsZDnME5qXbfWFBN+2vAKY=;
 b=f1+VNMeq1732yTpWWNpMDM3B89QNzf0wJst4YgVKVKxdyp57LRyrpY7c0JT6R7lPED
 ggQtWbpAoL2RLKECVAuKzOZTXPP/sW4Coc6h91yL3wFJq1+t0bXc8xvOuZHC91Qzyxyc
 8MpnqxJbrdIy9PhSAzB6YtEJXD+fIzO41v8QCgqDhPKoCUTvB03PhhmOW7+ERQfamPs2
 UFZUoiy+EmzlwvwQNaLADNrc3sKfa6d6Al5WCP3GYwdiu3p6wycpRM5n0lWvTpe2g6qQ
 rjHMogmK3ePkkZw4bGhEl43txoiWchjTrDzjMLl+L85E3X84pAJaUNR+OP6Fha3SVQ0M
 1cOg==
X-Gm-Message-State: APjAAAU/IKUx72q5ztMOUhqm7ZnILivZn8ebI1/+dJSUliFRKy+9zFF4
 hKMXHNLAToH1wjAnSVU8wzPQFLiT
X-Google-Smtp-Source: APXvYqwfpDe3KibHYFxueh48la8PBHNf10BWk/4KmvIW/iJAv9QsGjDrPJUl0K9Nd/q8W8YhDwKZFA==
X-Received: by 2002:a62:7683:: with SMTP id
 r125mr58841059pfc.132.1582652475975; 
 Tue, 25 Feb 2020 09:41:15 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:41:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 32/32] powerpc/64s: system call support for scv/rfscv
 instructions
Date: Wed, 26 Feb 2020 03:35:41 +1000
Message-Id: <20200225173541.1549955-33-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for the scv instruction on POWER9 and later CPUs.

For now this implements the zeroth scv vector 'scv 0', as identical
to 'sc' system calls, with the exception that lr is not preserved, and
it is 64-bit only. There may yet be changes made to this ABI, so it's
for testing only.

rfscv is implemented to return from scv type system calls. It can not
be used to return from sc system calls because those are defined to
preserve lr.

In a comparison of getpid syscall, the test program had scv taking
about 3 more cycles in user mode (92 vs 89 for sc), due to lr handling.
getpid syscall throughput on POWER9 is improved by 33%, mostly due to
reducing mtmsr and mtspr.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/powerpc/syscall64-abi.rst   |  42 +++++---
 arch/powerpc/include/asm/asm-prototypes.h |   2 +-
 arch/powerpc/include/asm/exception-64s.h  |   6 ++
 arch/powerpc/include/asm/head-64.h        |   2 +-
 arch/powerpc/include/asm/ppc_asm.h        |   2 +
 arch/powerpc/include/asm/processor.h      |   2 +-
 arch/powerpc/include/asm/setup.h          |   4 +-
 arch/powerpc/kernel/cpu_setup_power.S     |   2 +-
 arch/powerpc/kernel/cputable.c            |   3 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c         |   1 +
 arch/powerpc/kernel/entry_64.S            | 114 +++++++++++++++++++++
 arch/powerpc/kernel/exceptions-64s.S      | 119 +++++++++++++++++++++-
 arch/powerpc/kernel/setup_64.c            |   5 +-
 arch/powerpc/kernel/syscall_64.c          |  14 ++-
 arch/powerpc/platforms/pseries/setup.c    |   8 +-
 15 files changed, 295 insertions(+), 31 deletions(-)

diff --git a/Documentation/powerpc/syscall64-abi.rst b/Documentation/powerpc/syscall64-abi.rst
index e49f69f941b9..30c045e8726e 100644
--- a/Documentation/powerpc/syscall64-abi.rst
+++ b/Documentation/powerpc/syscall64-abi.rst
@@ -5,6 +5,15 @@ Power Architecture 64-bit Linux system call ABI
 syscall
 =======
 
+Invocation
+----------
+The syscall is made with the sc instruction, and returns with execution
+continuing at the instruction following the sc instruction.
+
+If PPC_FEATURE2_SCV appears in the AT_HWCAP2 ELF auxiliary vector, the
+scv 0 instruction is an alternative that may be used, with some differences
+to calling sequence.
+
 syscall calling sequence\ [1]_ matches the Power Architecture 64-bit ELF ABI
 specification C function calling sequence, including register preservation
 rules, with the following differences.
@@ -12,16 +21,23 @@ rules, with the following differences.
 .. [1] Some syscalls (typically low-level management functions) may have
        different calling sequences (e.g., rt_sigreturn).
 
-Parameters and return value
----------------------------
+Parameters
+----------
 The system call number is specified in r0.
 
 There is a maximum of 6 integer parameters to a syscall, passed in r3-r8.
 
-Both a return value and a return error code are returned. cr0.SO is the return
-error code, and r3 is the return value or error code. When cr0.SO is clear,
-the syscall succeeded and r3 is the return value. When cr0.SO is set, the
-syscall failed and r3 is the error code that generally corresponds to errno.
+Return value
+------------
+- For the sc instruction, both a return value and a return error code are
+  returned. cr0.SO is the return error code, and r3 is the return value or
+  error code. When cr0.SO is clear, the syscall succeeded and r3 is the return
+  value. When cr0.SO is set, the syscall failed and r3 is the error code that
+  generally corresponds to errno.
+
+- For the scv 0 instruction, there is a return value indicates failure if it
+  is >= -MAX_ERRNO (-4095) as an unsigned comparison, in which case it is the
+  negated return error code. Otherwise it is the successful return value.
 
 Stack
 -----
@@ -34,22 +50,23 @@ Register preservation rules match the ELF ABI calling sequence with the
 following differences:
 
 =========== ============= ========================================
+--- For the sc instruction ---
 r0          Volatile      (System call number.)
 r3          Volatile      (Parameter 1, and return value.)
 r4-r8       Volatile      (Parameters 2-6.)
-cr0         Volatile      (cr0.SO is the return error condition)
+cr0         Volatile      (cr0.SO is the return error condition.)
 cr1, cr5-7  Nonvolatile
 lr          Nonvolatile
+
+--- For the scv 0 instruction ---
+r0          Volatile      (System call number.)
+r3          Volatile      (Parameter 1, and return value.)
+r4-r8       Volatile      (Parameters 2-6.)
 =========== ============= ========================================
 
 All floating point and vector data registers as well as control and status
 registers are nonvolatile.
 
-Invocation
-----------
-The syscall is performed with the sc instruction, and returns with execution
-continuing at the instruction following the sc instruction.
-
 Transactional Memory
 --------------------
 Syscall behavior can change if the processor is in transactional or suspended
@@ -75,6 +92,7 @@ auxiliary vector.
   returning to the caller. This case is not well defined or supported, so this
   behavior should not be relied upon.
 
+scv 0 syscalls will always behave as PPC_FEATURE2_HTM_NOSC.
 
 vsyscall
 ========
diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 4b3609554e76..2ea43e4afdff 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -99,7 +99,7 @@ void __init machine_init(u64 dt_ptr);
 #endif
 #ifdef CONFIG_PPC64
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
-notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs);
+notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
 notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
 #endif
diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 47bd4ea0837d..0c2fe7f042d1 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -123,6 +123,12 @@
 	hrfid;								\
 	b	hrfi_flush_fallback
 
+#define RFSCV_TO_USER							\
+	STF_EXIT_BARRIER_SLOT;						\
+	RFI_FLUSH_SLOT;							\
+	RFSCV;								\
+	b	rfscv_flush_fallback
+
 #endif /* __ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_EXCEPTION_H */
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
index eedcbfb9a6ff..414569940c3f 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -304,7 +304,7 @@ struct thread_struct {
 	.regs = (struct pt_regs *)INIT_SP - 1, /* XXX bogus, I think */ \
 	.addr_limit = KERNEL_DS, \
 	.fpexc_mode = 0, \
-	.fscr = FSCR_TAR | FSCR_EBB \
+	.fscr = FSCR_TAR | FSCR_EBB | FSCR_SCV \
 }
 #endif
 
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 65676e2325b8..9efbddee2bca 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -30,12 +30,12 @@ void setup_panic(void);
 #define ARCH_PANIC_TIMEOUT 180
 
 #ifdef CONFIG_PPC_PSERIES
-extern void pseries_enable_reloc_on_exc(void);
+extern bool pseries_enable_reloc_on_exc(void);
 extern void pseries_disable_reloc_on_exc(void);
 extern void pseries_big_endian_exceptions(void);
 extern void pseries_little_endian_exceptions(void);
 #else
-static inline void pseries_enable_reloc_on_exc(void) {}
+static inline bool pseries_enable_reloc_on_exc(void) { return false; }
 static inline void pseries_disable_reloc_on_exc(void) {}
 static inline void pseries_big_endian_exceptions(void) {}
 static inline void pseries_little_endian_exceptions(void) {}
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index a460298c7ddb..6b087275d499 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -184,7 +184,7 @@ __init_LPCR_ISA300:
 
 __init_FSCR:
 	mfspr	r3,SPRN_FSCR
-	ori	r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB
+	ori	r3,r3,FSCR_SCV|FSCR_TAR|FSCR_DSCR|FSCR_EBB
 	mtspr	SPRN_FSCR,r3
 	blr
 
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index e745abc5457a..286d896546fb 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -118,7 +118,8 @@ extern void __restore_cpu_e6500(void);
 #define COMMON_USER2_POWER9	(COMMON_USER2_POWER8 | \
 				 PPC_FEATURE2_ARCH_3_00 | \
 				 PPC_FEATURE2_HAS_IEEE128 | \
-				 PPC_FEATURE2_DARN )
+				 PPC_FEATURE2_DARN | \
+				 PPC_FEATURE2_SCV)
 
 #ifdef CONFIG_PPC_BOOK3E_64
 #define COMMON_USER_BOOKE	(COMMON_USER_PPC64 | PPC_FEATURE_BOOKE)
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 182b4047c1ef..48340d288825 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -566,6 +566,7 @@ static struct dt_cpu_feature_match __initdata
 	{"little-endian", feat_enable_le, CPU_FTR_REAL_LE},
 	{"smt", feat_enable_smt, 0},
 	{"interrupt-facilities", feat_enable, 0},
+	{"system-call-vectored", feat_enable, 0},
 	{"timer-facilities", feat_enable, 0},
 	{"timer-facilities-v3", feat_enable, 0},
 	{"debug-facilities", feat_enable, 0},
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 8406812c9734..4c0d0400e93d 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -62,6 +62,119 @@ exception_marker:
 	.section	".text"
 	.align 7
 
+	.globl system_call_vectored_common
+system_call_vectored_common:
+	INTERRUPT_TO_KERNEL
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
+	li	r11,0xc00
+	std	r11,_TRAP(r1)
+	std	r12,_CCR(r1)
+	std	r3,ORIG_GPR3(r1)
+	addi	r10,r1,STACK_FRAME_OVERHEAD
+	ld	r11,exception_marker@toc(r2)
+	std	r11,-16(r10)		/* "regshere" marker */
+
+	/*
+	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
+	 * would clobber syscall parameters. Also we always enter with IRQs
+	 * enabled and nothing pending. system_call_exception() will call
+	 * trace_hardirqs_off().
+	 *
+	 * scv enters with MSR[EE]=1, so don't set PACA_IRQ_HARD_DIS.
+	 */
+	li	r9,IRQS_ALL_DISABLED
+	stb	r9,PACAIRQSOFTMASK(r13)
+
+	/* Calling convention has r9 = orig r0, r10 = regs */
+	mr	r9,r0
+	bl	system_call_exception
+
+.Lsyscall_vectored_exit:
+	addi    r4,r1,STACK_FRAME_OVERHEAD
+	li	r5,1 /* scv */
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
+	li	r0,0
+	li	r4,0
+	li	r5,0
+	li	r6,0
+	li	r7,0
+	li	r8,0
+	li	r9,0
+	li	r10,0
+	li	r11,0
+	li	r12,0
+	mtspr	SPRN_XER,r0
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
+	RFSCV_TO_USER
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
 _ASM_NOKPROBE_SYMBOL(system_call_common)
@@ -130,6 +243,7 @@ END_BTB_FLUSH_SECTION
 
 .Lsyscall_exit:
 	addi    r4,r1,STACK_FRAME_OVERHEAD
+	li	r5,0 /* !scv */
 	bl	syscall_exit_prepare
 
 	ld	r2,_CCR(r1)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 7a6be3f32973..6a936c9199d6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -742,6 +742,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * guarantee they will be delivered virtually. Some conditions (see the ISA)
  * cause exceptions to be delivered in real mode.
  *
+ * The scv instructions are a special case. They get a 0x3000 offset applied.
+ * scv exceptions have unique reentrancy properties, see below.
+ *
  * It's impossible to receive interrupts below 0x300 via AIL.
  *
  * KVM: None of the virtual exceptions are from the guest. Anything that
@@ -751,8 +754,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
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
@@ -763,8 +766,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * vectors there.
  */
 OPEN_FIXED_SECTION(real_vectors,        0x0100, 0x1900)
-OPEN_FIXED_SECTION(real_trampolines,    0x1900, 0x4000)
-OPEN_FIXED_SECTION(virt_vectors,        0x4000, 0x5900)
+OPEN_FIXED_SECTION(real_trampolines,    0x1900, 0x3000)
+OPEN_FIXED_SECTION(virt_vectors,        0x3000, 0x5900)
 OPEN_FIXED_SECTION(virt_trampolines,    0x5900, 0x7000)
 
 #ifdef CONFIG_PPC_POWERNV
@@ -800,6 +803,73 @@ USE_FIXED_SECTION(real_vectors)
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
+ * should never happen.
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
+EXC_VIRT_BEGIN(system_call_vectored, 0x3000, 0x1000)
+	/* SCV 0 */
+.L_scv0:
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
+	/*
+	 * cause scv to return -ENOSYS.
+	 * This may look a bit funny to tracing.
+	 */
+	li	r0,-1
+	b	.L_scv0
+	nop
+	nop
+	nop
+	nop
+	nop
+	nop
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
 
@@ -2916,6 +2986,47 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
 	GET_SCRATCH0(r13);
 	hrfid
 
+TRAMP_REAL_BEGIN(rfscv_flush_fallback)
+	/* system call volatile */
+	mr	r7,r13
+	GET_PACA(r13);
+	mr	r8,r1
+	ld	r1,PACAKSAVE(r13)
+	mfctr	r9
+	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
+	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
+	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
+	mtctr	r11
+	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r11) /* Stop prefetch streams */
+
+	/* order ld/st prior to dcbt stop all streams with flushing */
+	sync
+
+	/*
+	 * The load adresses are at staggered offsets within cachelines,
+	 * which suits some pipelines better (on others it should not
+	 * hurt).
+	 */
+1:
+	ld	r11,(0x80 + 8)*0(r10)
+	ld	r11,(0x80 + 8)*1(r10)
+	ld	r11,(0x80 + 8)*2(r10)
+	ld	r11,(0x80 + 8)*3(r10)
+	ld	r11,(0x80 + 8)*4(r10)
+	ld	r11,(0x80 + 8)*5(r10)
+	ld	r11,(0x80 + 8)*6(r10)
+	ld	r11,(0x80 + 8)*7(r10)
+	addi	r10,r10,0x80*8
+	bdnz	1b
+
+	mtctr	r9
+	li	r9,0
+	li	r10,0
+	li	r11,0
+	mr	r1,r8
+	mr	r13,r7
+	RFSCV
+
 USE_TEXT_SECTION()
 	MASKED_INTERRUPT
 	MASKED_INTERRUPT hsrr=1
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e05e6dd67ae6..3bf03666ee09 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -196,7 +196,10 @@ static void __init configure_exceptions(void)
 	/* Under a PAPR hypervisor, we need hypercalls */
 	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
 		/* Enable AIL if possible */
-		pseries_enable_reloc_on_exc();
+		if (!pseries_enable_reloc_on_exc()) {
+			init_task.thread.fscr &= ~FSCR_SCV;
+			cur_cpu_spec->cpu_user_features2 &= ~PPC_FEATURE2_SCV;
+		}
 
 		/*
 		 * Tell the hypervisor that we want our exceptions to
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 32601a572ff0..87d95b455b83 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -121,7 +121,8 @@ notrace long system_call_exception(long r3, long r4, long r5,
  * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
  */
 notrace unsigned long syscall_exit_prepare(unsigned long r3,
-					   struct pt_regs *regs)
+					   struct pt_regs *regs,
+					   long scv)
 {
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long ti_flags;
@@ -134,7 +135,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	ti_flags = *ti_flagsp;
 
-	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO)) {
+	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && !scv) {
 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
 			r3 = -r3;
 			regs->ccr |= 0x10000000; /* Set SO bit in CR */
@@ -191,9 +192,14 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	trace_hardirqs_on();
 
 	/* This pattern matches prep_irq_for_idle */
-	__hard_EE_RI_disable();
+	/* scv need not set RI=0 because SRRs are not used */
+	if (scv)
+		__hard_irq_disable();
+	else
+		__hard_EE_RI_disable();
 	if (unlikely(lazy_irq_pending())) {
-		__hard_RI_enable();
+		if (!scv)
+			__hard_RI_enable();
 		trace_hardirqs_off();
 		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 		local_irq_enable();
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0c8421dd01ab..17d17f064a2d 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -349,7 +349,7 @@ static void pseries_lpar_idle(void)
  * to ever be a problem in practice we can move this into a kernel thread to
  * finish off the process later in boot.
  */
-void pseries_enable_reloc_on_exc(void)
+bool pseries_enable_reloc_on_exc(void)
 {
 	long rc;
 	unsigned int delay, total_delay = 0;
@@ -360,11 +360,13 @@ void pseries_enable_reloc_on_exc(void)
 			if (rc == H_P2) {
 				pr_info("Relocation on exceptions not"
 					" supported\n");
+				return false;
 			} else if (rc != H_SUCCESS) {
 				pr_warn("Unable to enable relocation"
 					" on exceptions: %ld\n", rc);
+				return false;
 			}
-			break;
+			return true;
 		}
 
 		delay = get_longbusy_msecs(rc);
@@ -373,7 +375,7 @@ void pseries_enable_reloc_on_exc(void)
 			pr_warn("Warning: Giving up waiting to enable "
 				"relocation on exceptions (%u msec)!\n",
 				total_delay);
-			return;
+			return false;
 		}
 
 		mdelay(delay);
-- 
2.23.0

