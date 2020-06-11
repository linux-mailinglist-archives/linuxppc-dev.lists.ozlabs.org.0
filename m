Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD381F636B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 10:18:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jGvL74FSzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 18:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d2qzZjGp; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jGmw5Xj4zDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 18:12:32 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id u13so4109340wml.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M1V//POuzCUHBjSunFPZBgyViT/cOLxpUR/ZeNxZomk=;
 b=d2qzZjGpwTsoX+UUOtYb+gxuLoLk/jCo20dzOjCnuahLlXN4IyKIEip9G8N2b7w48x
 vkaJdN3s6rOXGP7rqNUgrVlsceIDjDBQYTO0z9+ZgeorBA2YF9K1djPnilg34Uu2/93B
 6chcVc0TLLT9JL8doYRcj8Iq+VIHZSdvBVcjjBsAQM6EXw98h2gBN74Ff4Y0F0GJPmXB
 V9POdK3F2PsCBqHdDXx0zWkJIby1Ya8KRZoaj/fTPmIw0WAefOghsXYd0HymtHLJBPWg
 WYAypNUkl5F95NdPrg2drCxGKxse6wDfD6mAaYs1Ds0s/7GzjkIgHT0aFJZzZ6CPA3bZ
 4ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M1V//POuzCUHBjSunFPZBgyViT/cOLxpUR/ZeNxZomk=;
 b=n3n794lpXutZvxxBhqJP+kKrzpQi6M5kEPGD07ayuqjE4q5Sakcb8xkUpIwdmsUC+D
 BNf5R4phK5mkGkx6VvgjhixNedfaIXGSYvIhEOt0jVyLTHIDt0ukzG71G/zrDPY8K+us
 pw6mDG9YkFjbJUBXduTujbwpU8ziynTi+VEitGBd1HGkuR2q9Vpn1t/cF9lQ65f7yHJR
 D3HZddeRwllKEv1TX1rAs2itUP9oBV3O3kfcDGazZVdXpBL4qtrdqwQytBUVIO/cPnTd
 jDve0Q5o7grrYcnslCsBSObNe0t0tEZCDBl7Ds1LUOybvKCfQ9mDEexqxuOdSWt48wbS
 TwOA==
X-Gm-Message-State: AOAM5338svW+zx5gDwitibZ/zYi8QFlJahzDCPs0BuiYTKYxzttsAiTM
 IfvqlCvQ6GmDD6OUXt+ou5Gv/6RO
X-Google-Smtp-Source: ABdhPJwpBng1d68NZBuHs+BA6dq4BcN4FSmNm8fZTIWaPyVmFjWKRNcCSWj0gE0Rv37nWx0xzydpfA==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr6650183wmb.138.1591863146945; 
 Thu, 11 Jun 2020 01:12:26 -0700 (PDT)
Received: from bobo.ibm.com (193-116-110-116.tpgi.com.au. [193.116.110.116])
 by smtp.gmail.com with ESMTPSA id w17sm3604826wra.71.2020.06.11.01.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 01:12:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: system call support for scv/rfscv
 instructions
Date: Thu, 11 Jun 2020 18:12:03 +1000
Message-Id: <20200611081203.995112-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200611081203.995112-1-npiggin@gmail.com>
References: <20200611081203.995112-1-npiggin@gmail.com>
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
Cc: libc-dev@lists.llvm.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for the scv instruction on POWER9 and later CPUs.

For now this implements the zeroth scv vector 'scv 0', as identical to
'sc' system calls, with the exception that lr is not preserved, nor are
volatile cr registers, and error is not indicated with CR0[SO], but by
returning a negative errno.

rfscv is implemented to return from scv type system calls. It can not be
used to return from sc system calls because those are defined to
preserve lr.

getpid syscall throughput on POWER9 is improved by 26% (428 to 318
cycles), largely due to reducing mtmsr and mtspr.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/powerpc/syscall64-abi.rst   |  42 ++++--
 arch/powerpc/include/asm/asm-prototypes.h |   2 +-
 arch/powerpc/include/asm/exception-64s.h  |   6 +
 arch/powerpc/include/asm/head-64.h        |   2 +-
 arch/powerpc/include/asm/ppc-opcode.h     |   2 +
 arch/powerpc/include/asm/ppc_asm.h        |   2 +
 arch/powerpc/include/asm/ptrace.h         |   7 +-
 arch/powerpc/include/asm/setup.h          |   4 +-
 arch/powerpc/include/asm/sstep.h          |   1 +
 arch/powerpc/kernel/cpu_setup_power.S     |  10 +-
 arch/powerpc/kernel/cputable.c            |   3 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c         |   1 +
 arch/powerpc/kernel/entry_64.S            | 171 +++++++++++++++++++++-
 arch/powerpc/kernel/exceptions-64s.S      | 123 +++++++++++++++-
 arch/powerpc/kernel/process.c             |  10 +-
 arch/powerpc/kernel/setup_64.c            |   5 +-
 arch/powerpc/kernel/signal.c              |  19 ++-
 arch/powerpc/kernel/syscall_64.c          |  32 +++-
 arch/powerpc/lib/sstep.c                  |  14 ++
 arch/powerpc/platforms/pseries/setup.c    |   8 +-
 arch/powerpc/xmon/xmon.c                  |   1 +
 21 files changed, 421 insertions(+), 44 deletions(-)

diff --git a/Documentation/powerpc/syscall64-abi.rst b/Documentation/powerpc/syscall64-abi.rst
index e49f69f941b9..46caaadbb029 100644
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
+scv 0 instruction is an alternative that may provide better performance,
+with some differences to calling sequence.
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
+- For the sc instruction, both a value and an error condition are returned.
+  cr0.SO is the error condition, and r3 is the return value. When cr0.SO is
+  clear, the syscall succeeded and r3 is the return value. When cr0.SO is set,
+  the syscall failed and r3 is the error value (that normally corresponds to
+  errno).
+
+- For the scv 0 instruction, the return value indicates failure if it is
+  -4095..-1 (i.e., it is >= -MAX_ERRNO (-4095) as an unsigned comparison),
+  in which case the error value is the negated return value.
 
 Stack
 -----
@@ -34,22 +50,23 @@ Register preservation rules match the ELF ABI calling sequence with the
 following differences:
 
 =========== ============= ========================================
+--- For the sc instruction, differences with the ELF ABI ---
 r0          Volatile      (System call number.)
 r3          Volatile      (Parameter 1, and return value.)
 r4-r8       Volatile      (Parameters 2-6.)
-cr0         Volatile      (cr0.SO is the return error condition)
+cr0         Volatile      (cr0.SO is the return error condition.)
 cr1, cr5-7  Nonvolatile
 lr          Nonvolatile
+
+--- For the scv 0 instruction, differences with the ELF ABI ---
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
index 7d81e86a1e5d..fb47bf5818c8 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -98,7 +98,7 @@ unsigned long __init early_init(unsigned long dt_ptr);
 void __init machine_init(u64 dt_ptr);
 #endif
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
-notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs);
+notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
 notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
 
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
diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 2a39c716c343..b2bdc4de1292 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -257,6 +257,7 @@
 #define PPC_INST_MFVSRD			0x7c000066
 #define PPC_INST_MTVSRD			0x7c000166
 #define PPC_INST_SC			0x44000002
+#define PPC_INST_SCV			0x44000001
 #define PPC_INST_SLBFEE			0x7c0007a7
 #define PPC_INST_SLBIA			0x7c0003e4
 
@@ -411,6 +412,7 @@
 #define __PPC_CT(t)	(((t) & 0x0f) << 21)
 #define __PPC_SPR(r)	((((r) & 0x1f) << 16) | ((((r) >> 5) & 0x1f) << 11))
 #define __PPC_RC21	(0x1 << 10)
+#define __PPC_LEV(l)	(((l) & 0x7f) << 5)
 
 /*
  * Both low and high 16 bits are added as SIGNED additions, so if low 16 bits
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
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index ac3970fff0d5..f194339cef3b 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -222,9 +222,14 @@ static inline void set_trap(struct pt_regs *regs, unsigned long val)
 	regs->trap = (regs->trap & TRAP_FLAGS_MASK) | (val & ~TRAP_FLAGS_MASK);
 }
 
+static inline bool trap_is_scv(struct pt_regs *regs)
+{
+	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) == 0x3000);
+}
+
 static inline bool trap_is_syscall(struct pt_regs *regs)
 {
-	return TRAP(regs) == 0xc00;
+	return (trap_is_scv(regs) || TRAP(regs) == 0xc00);
 }
 
 static inline bool trap_norestart(struct pt_regs *regs)
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
diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 3b01c69a44aa..eaa4fb6c8960 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -40,6 +40,7 @@ enum instruction_type {
 	CACHEOP,
 	BARRIER,
 	SYSCALL,
+	SYSCALL_VECTORED_0,
 	MFMSR,
 	MTMSR,
 	RFI,
diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index efdcfa714106..86527d19348c 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -98,7 +98,7 @@ _GLOBAL(__setup_cpu_power10)
 
 _GLOBAL(__setup_cpu_power9)
 	mflr	r11
-	bl	__init_FSCR
+	bl	__init_FSCR_power9
 1:	bl	__init_PMU
 	bl	__init_hvmode_206
 	mtlr	r11
@@ -128,7 +128,7 @@ _GLOBAL(__restore_cpu_power10)
 
 _GLOBAL(__restore_cpu_power9)
 	mflr	r11
-	bl	__init_FSCR
+	bl	__init_FSCR_power9
 1:	bl	__init_PMU
 	mfmsr	r3
 	rldicl.	r0,r3,4,63
@@ -198,6 +198,12 @@ __init_FSCR_power10:
 	mtspr	SPRN_FSCR, r3
 	// fall through
 
+__init_FSCR_power9:
+	mfspr	r3, SPRN_FSCR
+	ori	r3, r3, FSCR_SCV
+	mtspr	SPRN_FSCR, r3
+	// fall through
+
 __init_FSCR:
 	mfspr	r3,SPRN_FSCR
 	ori	r3,r3,FSCR_TAR|FSCR_EBB
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index b4066354f073..3d406a9626e8 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -120,7 +120,8 @@ extern void __restore_cpu_e6500(void);
 #define COMMON_USER2_POWER9	(COMMON_USER2_POWER8 | \
 				 PPC_FEATURE2_ARCH_3_00 | \
 				 PPC_FEATURE2_HAS_IEEE128 | \
-				 PPC_FEATURE2_DARN )
+				 PPC_FEATURE2_DARN | \
+				 PPC_FEATURE2_SCV)
 #define COMMON_USER_POWER10	COMMON_USER_POWER9
 #define COMMON_USER2_POWER10	(COMMON_USER2_POWER9 | \
 				 PPC_FEATURE2_ARCH_3_1 | \
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 3a409517c031..50b2d544361e 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -587,6 +587,7 @@ static struct dt_cpu_feature_match __initdata
 	{"little-endian", feat_enable_le, CPU_FTR_REAL_LE},
 	{"smt", feat_enable_smt, 0},
 	{"interrupt-facilities", feat_enable, 0},
+	{"system-call-vectored", feat_enable, 0},
 	{"timer-facilities", feat_enable, 0},
 	{"timer-facilities-v3", feat_enable, 0},
 	{"debug-facilities", feat_enable, 0},
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 9d49338e0c85..223c4f008e63 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -64,15 +64,173 @@ exception_marker:
 	.section	".text"
 	.align 7
 
+#ifdef CONFIG_PPC_BOOK3S
+.macro system_call_vectored name trapnr
+	.globl system_call_vectored_\name
+system_call_vectored_\name:
+_ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+BEGIN_FTR_SECTION
+	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
+	bne	.Ltabort_syscall
+END_FTR_SECTION_IFSET(CPU_FTR_TM)
+#endif
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
+	li	r11,\trapnr
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
+	 * scv enters with MSR[EE]=1, so don't set PACA_IRQ_HARD_DIS. The
+	 * entry vector already sets PACAIRQSOFTMASK to IRQS_ALL_DISABLED.
+	 */
+
+	/* Calling convention has r9 = orig r0, r10 = regs */
+	mr	r9,r0
+	bl	system_call_exception
+
+.Lsyscall_vectored_\name\()_exit:
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
+BEGIN_FTR_SECTION
+	HMT_MEDIUM_LOW
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	cmpdi	r3,0
+	bne	.Lsyscall_vectored_\name\()_restore_regs
+
+	/* rfscv returns with LR->NIA and CTR->MSR */
+	mtlr	r4
+	mtctr	r5
+
+	/* Could zero these as per ABI, but we may consider a stricter ABI
+	 * which preserves these if libc implementations can benefit, so
+	 * restore them for now until further measurement is done. */
+	ld	r0,GPR0(r1)
+	ld	r4,GPR4(r1)
+	ld	r5,GPR5(r1)
+	ld	r6,GPR6(r1)
+	ld	r7,GPR7(r1)
+	ld	r8,GPR8(r1)
+	/* Zero volatile regs that may contain sensitive kernel data */
+	li	r9,0
+	li	r10,0
+	li	r11,0
+	li	r12,0
+	mtspr	SPRN_XER,r0
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
+
+.Lsyscall_vectored_\name\()_restore_regs:
+	li	r3,0
+	mtmsrd	r3,1
+	mtspr	SPRN_SRR0,r4
+	mtspr	SPRN_SRR1,r5
+
+	ld	r3,_CTR(r1)
+	ld	r4,_LINK(r1)
+	ld	r5,_XER(r1)
+
+	REST_NVGPRS(r1)
+	ld	r0,GPR0(r1)
+	mtcr	r2
+	mtctr	r3
+	mtlr	r4
+	mtspr	SPRN_XER,r5
+	REST_10GPRS(2, r1)
+	REST_2GPRS(12, r1)
+	ld	r1,GPR1(r1)
+	RFI_TO_USER
+.endm
+
+system_call_vectored common 0x3000
+/*
+ * We instantiate another entry copy for the SIGILL variant, with TRAP=0x7ff0
+ * which is tested by system_call_exception when r0 is -1 (as set by vector
+ * entry code).
+ */
+system_call_vectored sigill 0x7ff0
+
+
+/*
+ * Entered via kernel return set up by kernel/sstep.c, must match entry regs
+ */
+	.globl system_call_vectored_emulate
+system_call_vectored_emulate:
+_ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+	b	system_call_vectored_common
+#endif
+
+	.balign IFETCH_ALIGN_BYTES
 	.globl system_call_common
 system_call_common:
+_ASM_NOKPROBE_SYMBOL(system_call_common)
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 BEGIN_FTR_SECTION
 	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
 	bne	.Ltabort_syscall
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
-_ASM_NOKPROBE_SYMBOL(system_call_common)
 	mr	r10,r1
 	ld	r1,PACAKSAVE(r13)
 	std	r10,0(r1)
@@ -138,6 +296,7 @@ END_BTB_FLUSH_SECTION
 
 .Lsyscall_exit:
 	addi    r4,r1,STACK_FRAME_OVERHEAD
+	li	r5,0 /* !scv */
 	bl	syscall_exit_prepare
 
 	ld	r2,_CCR(r1)
@@ -224,10 +383,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	b	.	/* prevent speculative execution */
 #endif
 
+#ifdef CONFIG_PPC_BOOK3S
+_GLOBAL(ret_from_fork_scv)
+	bl	schedule_tail
+	REST_NVGPRS(r1)
+	li	r3,0	/* fork() return value */
+	b	.Lsyscall_vectored_common_exit
+#endif
+
 _GLOBAL(ret_from_fork)
 	bl	schedule_tail
 	REST_NVGPRS(r1)
-	li	r3,0
+	li	r3,0	/* fork() return value */
 	b	.Lsyscall_exit
 
 _GLOBAL(ret_from_kernel_thread)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 388e34665b4a..f5f24e6c685f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -756,6 +756,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * guarantee they will be delivered virtually. Some conditions (see the ISA)
  * cause exceptions to be delivered in real mode.
  *
+ * The scv instructions are a special case. They get a 0x3000 offset applied.
+ * scv exceptions have unique reentrancy properties, see below.
+ *
  * It's impossible to receive interrupts below 0x300 via AIL.
  *
  * KVM: None of the virtual exceptions are from the guest. Anything that
@@ -765,8 +768,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
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
@@ -777,8 +780,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  * vectors there.
  */
 OPEN_FIXED_SECTION(real_vectors,        0x0100, 0x1900)
-OPEN_FIXED_SECTION(real_trampolines,    0x1900, 0x4000)
-OPEN_FIXED_SECTION(virt_vectors,        0x4000, 0x5900)
+OPEN_FIXED_SECTION(real_trampolines,    0x1900, 0x3000)
+OPEN_FIXED_SECTION(virt_vectors,        0x3000, 0x5900)
 OPEN_FIXED_SECTION(virt_trampolines,    0x5900, 0x7000)
 
 #ifdef CONFIG_PPC_POWERNV
@@ -814,6 +817,77 @@ USE_FIXED_SECTION(real_vectors)
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
+	mr	r9,r13
+	GET_PACA(r13)
+	mflr	r11
+	mfctr	r12
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+	li	r0,-1 /* cause failure */
+#ifdef CONFIG_RELOCATABLE
+	b	system_call_vectored_sigill_tramp
+#else
+	b	system_call_vectored_sigill
+#endif
+	.endr
+EXC_VIRT_END(system_call_vectored, 0x3000, 0x1000)
+
+#ifdef CONFIG_RELOCATABLE
+TRAMP_VIRT_BEGIN(system_call_vectored_tramp)
+	__LOAD_HANDLER(r10, system_call_vectored_common)
+	mtctr	r10
+	bctr
+
+TRAMP_VIRT_BEGIN(system_call_vectored_sigill_tramp)
+	__LOAD_HANDLER(r10, system_call_vectored_sigill)
+	mtctr	r10
+	bctr
+#endif
+
+
 /* No virt vectors corresponding with 0x0..0x100 */
 EXC_VIRT_NONE(0x4000, 0x100)
 
@@ -2963,6 +3037,47 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
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
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 7bb7faf84490..a0c2746f8c11 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1596,6 +1596,7 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 {
 	struct pt_regs *childregs, *kregs;
 	extern void ret_from_fork(void);
+	extern void ret_from_fork_scv(void);
 	extern void ret_from_kernel_thread(void);
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
@@ -1632,7 +1633,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 		if (usp)
 			childregs->gpr[1] = usp;
 		p->thread.regs = childregs;
-		childregs->gpr[3] = 0;  /* Result from fork() */
+		/* 64s sets this in ret_from_fork */
+		if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+			childregs->gpr[3] = 0;  /* Result from fork() */
 		if (clone_flags & CLONE_SETTLS) {
 			if (!is_32bit_task())
 				childregs->gpr[13] = tls;
@@ -1640,7 +1643,10 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 				childregs->gpr[2] = tls;
 		}
 
-		f = ret_from_fork;
+		if (trap_is_scv(regs))
+			f = ret_from_fork_scv;
+		else
+			f = ret_from_fork;
 	}
 	childregs->msr &= ~(MSR_FP|MSR_VEC|MSR_VSX);
 	sp -= STACK_FRAME_OVERHEAD;
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 0ba1ed77dc68..6be430107c6f 100644
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
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index b4143b6ff093..d15a98c758b8 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -205,8 +205,14 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 		return;
 
 	/* error signalled ? */
-	if (!(regs->ccr & 0x10000000))
+	if (trap_is_scv(regs)) {
+		/* 32-bit compat mode sign extend? */
+		if (!IS_ERR_VALUE(ret))
+			return;
+		ret = -ret;
+	} else if (!(regs->ccr & 0x10000000)) {
 		return;
+	}
 
 	switch (ret) {
 	case ERESTART_RESTARTBLOCK:
@@ -239,9 +245,14 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 		regs->nip -= 4;
 		regs->result = 0;
 	} else {
-		regs->result = -EINTR;
-		regs->gpr[3] = EINTR;
-		regs->ccr |= 0x10000000;
+		if (trap_is_scv(regs)) {
+			regs->result = -EINTR;
+			regs->gpr[3] = -EINTR;
+		} else {
+			regs->result = -EINTR;
+			regs->gpr[3] = EINTR;
+			regs->ccr |= 0x10000000;
+		}
 	}
 }
 
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 79edba3ab312..a783fd324cb0 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -60,6 +60,11 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	local_irq_enable();
 
 	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
+		if (unlikely(regs->trap == 0x7ff0)) {
+			/* Unsupported scv vector */
+			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
+			return regs->gpr[3];
+		}
 		/*
 		 * We use the return value of do_syscall_trace_enter() as the
 		 * syscall number. If the syscall was rejected for any reason
@@ -78,6 +83,11 @@ notrace long system_call_exception(long r3, long r4, long r5,
 		r8 = regs->gpr[8];
 
 	} else if (unlikely(r0 >= NR_syscalls)) {
+		if (unlikely(regs->trap == 0x7ff0)) {
+			/* Unsupported scv vector */
+			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
+			return regs->gpr[3];
+		}
 		return -ENOSYS;
 	}
 
@@ -105,16 +115,20 @@ notrace long system_call_exception(long r3, long r4, long r5,
  * local irqs must be disabled. Returns false if the caller must re-enable
  * them, check for new work, and try again.
  */
-static notrace inline bool prep_irq_for_enabled_exit(void)
+static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri)
 {
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
 	/* This pattern matches prep_irq_for_idle */
-	__hard_EE_RI_disable();
+	if (clear_ri)
+		__hard_EE_RI_disable();
+	else
+		__hard_irq_disable();
 	if (unlikely(lazy_irq_pending_nocheck())) {
 		/* Took an interrupt, may have more exit work to do. */
-		__hard_RI_enable();
+		if (clear_ri)
+			__hard_RI_enable();
 		trace_hardirqs_off();
 		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
@@ -136,7 +150,8 @@ static notrace inline bool prep_irq_for_enabled_exit(void)
  * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
  */
 notrace unsigned long syscall_exit_prepare(unsigned long r3,
-					   struct pt_regs *regs)
+					   struct pt_regs *regs,
+					   long scv)
 {
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long ti_flags;
@@ -151,7 +166,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	ti_flags = *ti_flagsp;
 
-	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO)) {
+	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && !scv) {
 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
 			r3 = -r3;
 			regs->ccr |= 0x10000000; /* Set SO bit in CR */
@@ -211,7 +226,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
-	if (unlikely(!prep_irq_for_enabled_exit())) {
+	/* scv need not set RI=0 because SRRs are not used */
+	if (unlikely(!prep_irq_for_enabled_exit(!scv))) {
 		local_irq_enable();
 		goto again;
 	}
@@ -282,7 +298,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
-	if (unlikely(!prep_irq_for_enabled_exit())) {
+	if (unlikely(!prep_irq_for_enabled_exit(true))) {
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -345,7 +361,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 			}
 		}
 
-		if (unlikely(!prep_irq_for_enabled_exit())) {
+		if (unlikely(!prep_irq_for_enabled_exit(true))) {
 			/*
 			 * Can't local_irq_restore to replay if we were in
 			 * interrupt context. Must replay directly.
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 5abe98216dc2..161bfccbc309 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -16,6 +16,7 @@
 #include <asm/disassemble.h>
 
 extern char system_call_common[];
+extern char system_call_vectored_emulate[];
 
 #ifdef CONFIG_PPC64
 /* Bits in SRR1 that are copied from MSR */
@@ -1236,6 +1237,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	case 17:	/* sc */
 		if ((word & 0xfe2) == 2)
 			op->type = SYSCALL;
+		else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+				(word & 0xfe3) == 1)
+			op->type = SYSCALL_VECTORED_0;
 		else
 			op->type = UNKNOWN;
 		return 0;
@@ -3378,6 +3382,16 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 		regs->msr = MSR_KERNEL;
 		return 1;
 
+	case SYSCALL_VECTORED_0:	/* scv 0 */
+		regs->gpr[9] = regs->gpr[13];
+		regs->gpr[10] = MSR_KERNEL;
+		regs->gpr[11] = regs->nip + 4;
+		regs->gpr[12] = regs->msr & MSR_MASK;
+		regs->gpr[13] = (unsigned long) get_paca();
+		regs->nip = (unsigned long) &system_call_vectored_emulate;
+		regs->msr = MSR_KERNEL;
+		return 1;
+
 	case RFI:
 		return -1;
 #endif
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 2db8469e475f..8c85466e0dd8 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -358,7 +358,7 @@ static void pseries_lpar_idle(void)
  * to ever be a problem in practice we can move this into a kernel thread to
  * finish off the process later in boot.
  */
-void pseries_enable_reloc_on_exc(void)
+bool pseries_enable_reloc_on_exc(void)
 {
 	long rc;
 	unsigned int delay, total_delay = 0;
@@ -369,11 +369,13 @@ void pseries_enable_reloc_on_exc(void)
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
@@ -382,7 +384,7 @@ void pseries_enable_reloc_on_exc(void)
 			pr_warn("Warning: Giving up waiting to enable "
 				"relocation on exceptions (%u msec)!\n",
 				total_delay);
-			return;
+			return false;
 		}
 
 		mdelay(delay);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7efe4bc3ccf6..3203c3606737 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1593,6 +1593,7 @@ const char *getvecname(unsigned long vec)
 	case 0x1300:	ret = "(Instruction Breakpoint)"; break;
 	case 0x1500:	ret = "(Denormalisation)"; break;
 	case 0x1700:	ret = "(Altivec Assist)"; break;
+	case 0x3000:	ret = "(System Call Vectored)"; break;
 	default: ret = "";
 	}
 	return ret;
-- 
2.23.0

