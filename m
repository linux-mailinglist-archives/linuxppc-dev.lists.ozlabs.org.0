Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC16568EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:34:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8cp2JJNz3fJ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:34:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MXuo+L1Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MXuo+L1Z;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8Rn4jJ1z3bfv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:45 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so12706812pjo.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQLrowzttDL0sPsyFIPo4+RMI3hMfkWJU1skhpYSyhU=;
        b=MXuo+L1ZC4SwSc+By9Ao3SXs7AAiMR64Vkam47QevpW/d6iTjmJsiommfYc3K8IgVT
         oaCiUoi2tvJCZO1j4kHSkDhQrB+E3BBLQE6tYdqxynVX7qibz68z8VhWDfa7LKMZK8Z7
         AUzN2KgtXdO4vnrPbsyRc5vs5AEHgUqJH7psS586JdVqQ+HAmXvIDCAypQvBNyxS79NZ
         SPuFTBmRHa8siASYygaltT2POhXzBWmJQwSuE1Kt7Sjfpk8eH+957CPW6DnsI8oebbYW
         dAsFJQT90oZk1G0fULdVQ5sZbfqbzlXBX/aKY/mXfC7dOmBHhFf7HvbVntl+pqHe4Mwz
         7Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQLrowzttDL0sPsyFIPo4+RMI3hMfkWJU1skhpYSyhU=;
        b=Db2x79AK0n0vm3xaN7cY7SrChXHlyiPqiqT+z/5pkt7DUI1yiMNpNeu8b4lSs78B9C
         Y4XakZ1lzAoUQNUkNgnA3zPtRQepBvAozTDnD9e9jqZMlXLTq9/mo2X/UriYCKZvH6GY
         lOOInp4+YD3MNPAiiO2GD00exBG2esL4WeUl8wAyyKTUwCsSKrbsOEtHSXUuN5lRKUFO
         CvAf/wrdxYf6WBOEbcnjV+NMQ66igQqFxpJLnffC+C6F4Z0cgogz8gBrjaMebCtcBS3e
         Q9+6zqgsdQlxyiUezuxqh8uGVZ36PtJl4pgxsQcFAIET9NqdiUIBPPhM1WjaPevFmS9q
         GVlQ==
X-Gm-Message-State: AFqh2kpqhoMS88QxBpMECeHlL7lp7DXu6GPL6izXaIuRq03qEi3HzqFq
	b068BodtuJIkN8wmU3ld5NME77CvGUA=
X-Google-Smtp-Source: AMrXdXsv56Jpn3vfM6iD5lOdIuxf9oTVFxaa2qgnawcoh+u1aqW5EBOdW9W2iJRs4s79odSAREPkOw==
X-Received: by 2002:a17:902:ea0a:b0:192:6b73:ccee with SMTP id s10-20020a170902ea0a00b001926b73cceemr17386847plg.18.1672133202575;
        Tue, 27 Dec 2022 01:26:42 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 8/9] powerpc/64: vmlinux support building with PCREL addresing
Date: Tue, 27 Dec 2022 19:26:08 +1000
Message-Id: <20221227092609.2078908-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221227092609.2078908-1-npiggin@gmail.com>
References: <20221227092609.2078908-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PC-Relative or PCREL addressing is an extension to the ELF ABI which
uses Power ISA v3.1 PC-relative instructions to calculate addresses,
rather than the traditional TOC scheme.

Add an option to build vmlinux using PCREL addressing. Modules continue
to use TOC addressing.

- TOC address helpers and r2 are poisoned with -1 when running vmlinux.
  r2 could be used for something useful once things are ironed out.

- Assembly must call C functions with @notoc annotation, or the linker
  complains aobut a missing nop after the call. This is done with the
  CFUNC macro introduced earlier.

- Boot: with the exception of prom_init, the execution branches to the
  kernel virtual address early in boot, before any addresses are
  generated, which ensures 34-bit pcrel addressing does not miss the
  high PAGE_OFFSET bits. TOC relative addressing has a similar
  requirement. prom_init does not go to the virtual address and its
  addresses should not carry over to the post-prom kernel.

- Ftrace trampolines must be converted from TOC addressing to PCREL
  addressing, including module ftrace trampolines that currently use the
  kernel TOC to find ftrace target functions.

- BPF function prologue and function calling generation must be
  converted from TOC to PCREL (XXX: not well tested yet).

- copypage_64.S has an interesting problem, prefixed instructions have
  alignment restrictions so the linker can add padding, which makes the
  assembler treat the difference between two local labels as
  non-constant even if alignment is arranged so padding is not required.
  This may need toolchain help to solve nicely, for now move the prefix
  instruction out of the alternate patch section to work around it.

This reduces kernel text size by about 6%.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   |  3 ++
 arch/powerpc/Makefile                  |  7 +++
 arch/powerpc/include/asm/paca.h        |  2 +
 arch/powerpc/include/asm/ppc-opcode.h  |  8 ++++
 arch/powerpc/include/asm/ppc_asm.h     | 19 ++++++++
 arch/powerpc/include/asm/sections.h    |  5 +++
 arch/powerpc/kernel/asm-offsets.c      |  2 +
 arch/powerpc/kernel/head_64.S          | 14 ++++++
 arch/powerpc/kernel/irq.c              |  8 ++++
 arch/powerpc/kernel/module_64.c        | 60 +++++++++++++++++++-------
 arch/powerpc/kernel/paca.c             |  2 +
 arch/powerpc/kernel/trace/ftrace.c     | 50 ++++++++++++++++-----
 arch/powerpc/kernel/vector.S           |  6 +++
 arch/powerpc/kernel/vmlinux.lds.S      |  6 +++
 arch/powerpc/lib/copypage_64.S         |  4 +-
 arch/powerpc/net/bpf_jit.h             | 10 +++--
 arch/powerpc/net/bpf_jit_comp64.c      | 35 +++++++++++----
 arch/powerpc/platforms/Kconfig.cputype | 18 ++++++++
 arch/powerpc/xmon/xmon.c               |  2 +
 19 files changed, 221 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f8ee94785f8c..8679f9ac1406 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -7,6 +7,9 @@ config CC_HAS_ELFV2
 config CC_HAS_PREFIXED
 	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)
 
+config CC_HAS_PCREL
+	def_bool PPC64 && $(cc-option, -mcpu=power10 -mpcrel)
+
 config 32BIT
 	bool
 	default y if PPC32
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 5b6c276bb690..7bd83d124c1e 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -107,6 +107,9 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
+ifdef CONFIG_PPC_KERNEL_PCREL
+	KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-pcrel)
+endif
 ifeq ($(call cc-option-yn,-mcmodel=medium),y)
 	# -mcmodel=medium breaks modules because it uses 32bit offsets from
 	# the TOC pointer to create pointers where possible. Pointers into the
@@ -198,7 +201,11 @@ KBUILD_CFLAGS += $(call cc-option,-mprefixed)
 else
 KBUILD_CFLAGS += $(call cc-option,-mno-prefixed)
 endif
+ifdef CONFIG_PPC_KERNEL_PCREL
+KBUILD_CFLAGS += $(call cc-option,-mpcrel)
+else
 KBUILD_CFLAGS += $(call cc-option,-mno-pcrel)
+endif
 
 # No AltiVec or VSX or MMA instructions when building kernel
 KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 09f1790d0ae1..366ce872e6f3 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -88,7 +88,9 @@ struct paca_struct {
 	u16 lock_token;			/* Constant 0x8000, used in locks */
 #endif
 
+#ifndef CONFIG_PPC_KERNEL_PREFIXED
 	u64 kernel_toc;			/* Kernel TOC address */
+#endif
 	u64 kernelbase;			/* Base address of kernel */
 	u64 kernel_msr;			/* MSR while running in kernel */
 	void *emergency_sp;		/* pointer to emergency stack */
diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 21e33e46f4b8..ca5a0da7df4e 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -120,11 +120,18 @@
  * 16-bit immediate helper macros: HA() is for use with sign-extending instrs
  * (e.g. LD, ADDI).  If the bottom 16 bits is "-ve", add another bit into the
  * top half to negate the effect (i.e. 0xffff + 1 = 0x(1)0000).
+ *
+ * XXX: should these mask out possible sign bits?
  */
 #define IMM_H(i)                ((uintptr_t)(i)>>16)
 #define IMM_HA(i)               (((uintptr_t)(i)>>16) +                       \
 					(((uintptr_t)(i) & 0x8000) >> 15))
 
+/*
+ * 18-bit immediate helper for prefix 18-bit upper immediate si0 field.
+ */
+#define IMM_H18(i)              (((uintptr_t)(i)>>16) & 0x3ffff)
+
 
 /* opcode and xopcode for instructions */
 #define OP_PREFIX	1
@@ -306,6 +313,7 @@
 #define PPC_PREFIX_8LS			0x04000000
 
 /* Prefixed instructions */
+#define PPC_INST_PADDI			0x38000000
 #define PPC_INST_PLD			0xe4000000
 #define PPC_INST_PSTD			0xf4000000
 
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 9f64f9a6a897..9315f007d010 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -183,7 +183,11 @@
 /*
  * Used to name C functions called from asm
  */
+#if defined(CONFIG_PPC_KERNEL_PCREL) && !defined(MODULE)
+#define CFUNC(name) name@notoc
+#else
 #define CFUNC(name) name
+#endif
 
 /*
  * We use __powerpc64__ here because we want the compat VDSO to use the 32-bit
@@ -212,6 +216,9 @@
 	.globl name; \
 name:
 
+#if defined(CONFIG_PPC_KERNEL_PCREL) && !defined(MODULE)
+#define _GLOBAL_TOC _GLOBAL
+#else
 #define _GLOBAL_TOC(name) \
 	.align 2 ; \
 	.type name,@function; \
@@ -220,6 +227,7 @@ name: \
 0:	addis r2,r12,(.TOC.-0b)@ha; \
 	addi r2,r2,(.TOC.-0b)@l; \
 	.localentry name,.-name
+#endif
 
 #define DOTSYM(a)	a
 
@@ -351,8 +359,13 @@ GLUE(.,name):
 
 #ifdef __powerpc64__
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+#define __LOAD_PACA_TOC(reg)			\
+	li	reg,-1
+#else
 #define __LOAD_PACA_TOC(reg)			\
 	ld	reg,PACATOC(r13)
+#endif
 
 #define LOAD_PACA_TOC()				\
 	__LOAD_PACA_TOC(r2)
@@ -366,9 +379,15 @@ GLUE(.,name):
 	ori	reg, reg, (expr)@l;		\
 	rldimi	reg, tmp, 32, 0
 
+#if defined(CONFIG_PPC_KERNEL_PCREL) && !defined(MODULE)
+#define LOAD_REG_ADDR(reg,name)			\
+	pla	reg,name@pcrel
+
+#else
 #define LOAD_REG_ADDR(reg,name)			\
 	addis	reg,r2,name@toc@ha;		\
 	addi	reg,reg,name@toc@l
+#endif
 
 #ifdef CONFIG_PPC_BOOK3E_64
 /*
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 9c00c9c0ca8f..4e1f548c8d37 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -46,10 +46,15 @@ extern char end_virt_trampolines[];
  */
 static inline unsigned long kernel_toc_addr(void)
 {
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	BUILD_BUG();
+	return -1UL;
+#else
 	unsigned long toc_ptr;
 
 	asm volatile("mr %0, 2" : "=r" (toc_ptr));
 	return toc_ptr;
+#endif
 }
 
 static inline int overlaps_interrupt_vector_text(unsigned long start,
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index d24a59a98c0c..9f14d95b8b32 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -185,7 +185,9 @@ int main(void)
 				 offsetof(struct task_struct, thread_info));
 	OFFSET(PACASAVEDMSR, paca_struct, saved_msr);
 	OFFSET(PACAR1, paca_struct, saved_r1);
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	OFFSET(PACATOC, paca_struct, kernel_toc);
+#endif
 	OFFSET(PACAKBASE, paca_struct, kernelbase);
 	OFFSET(PACAKMSR, paca_struct, kernel_msr);
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 70e8d653657c..dba3b053ddff 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -330,6 +330,12 @@ _GLOBAL(fsl_secondary_thread_init)
  */
 _GLOBAL(generic_secondary_smp_init)
 	FIXUP_ENDIAN
+
+	li	r13,0
+
+	/* Poison TOC */
+	li	r2,-1
+
 	mr	r24,r3
 	mr	r25,r4
 
@@ -527,6 +533,9 @@ __start_initialization_multiplatform:
 	/* Zero r13 (paca) so early program check / mce don't use it */
 	li	r13,0
 
+	/* Poison TOC */
+	li	r2,-1
+
 	/*
 	 * Are we booted from a PROM Of-type client-interface ?
 	 */
@@ -918,6 +927,10 @@ SYM_FUNC_END(enable_64b_mode)
  * this.
  */
 _GLOBAL(relative_toc)
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	tdnei	r2,-1
+	blr
+#else
 	mflr	r0
 	bcl	20,31,$+4
 0:	mflr	r11
@@ -928,6 +941,7 @@ _GLOBAL(relative_toc)
 
 .balign 8
 p_toc:	.8byte	.TOC. - 0b
+#endif
 
 /*
  * This is where the main kernel code starts.
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index c5b9ce887483..5d1cc78eaea2 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -206,7 +206,11 @@ static __always_inline void call_do_softirq(const void *sp)
 	asm volatile (
 		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
 		"mr		%%r1, %[sp]		;"
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		"bl		%[callee]@notoc		;"
+#else
 		"bl		%[callee]		;"
+#endif
 		 PPC_LL "	%%r1, 0(%%r1)		;"
 		 : // Outputs
 		 : // Inputs
@@ -259,7 +263,11 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
 		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
 		"mr		%%r4, %%r1		;"
 		"mr		%%r1, %[sp]		;"
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		"bl		%[callee]@notoc		;"
+#else
 		"bl		%[callee]		;"
+#endif
 		 PPC_LL "	%%r1, 0(%%r1)		;"
 		 : // Outputs
 		   "+r" (r3)
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index ff045644f13f..de01ded00281 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -101,17 +101,18 @@ static unsigned long stub_func_addr(func_desc_t func)
 /* Like PPC32, we need little trampolines to do > 24-bit jumps (into
    the kernel itself).  But on PPC64, these need to be used for every
    jump, actually, to reset r2 (TOC+0x8000). */
-struct ppc64_stub_entry
-{
-	/* 28 byte jump instruction sequence (7 instructions). We only
-	 * need 6 instructions on ABIv2 but we always allocate 7 so
-	 * so we don't have to modify the trampoline load instruction. */
+struct ppc64_stub_entry {
+	/*
+	 * 28 byte jump instruction sequence (7 instructions) that can
+	 * hold ppc64_stub_insns or stub_insns. Must be 8-byte aligned
+	 * with PCREL kernels that use prefix instructions in the stub.
+	 */
 	u32 jump[7];
 	/* Used by ftrace to identify stubs */
 	u32 magic;
 	/* Data for the above code */
 	func_desc_t funcdata;
-};
+} __aligned(8);
 
 /*
  * PPC64 uses 24 bit jumps, but we need to jump into other modules or
@@ -333,11 +334,21 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 #ifdef CONFIG_MPROFILE_KERNEL
 
 static u32 stub_insns[] = {
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernelbase)),
+	PPC_RAW_NOP(), /* align the prefix insn */
+	/* pli r12,addr */
+	PPC_PREFIX_MLS | __PPC_PRFX_R(0),
+	PPC_INST_PADDI | ___PPC_RT(_R12) | ___PPC_RA(_R12),
+	PPC_RAW_MTCTR(_R12),
+	PPC_RAW_BCTR(),
+#else
 	PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernel_toc)),
 	PPC_RAW_ADDIS(_R12, _R12, 0),
 	PPC_RAW_ADDI(_R12, _R12, 0),
 	PPC_RAW_MTCTR(_R12),
 	PPC_RAW_BCTR(),
+#endif
 };
 
 /*
@@ -358,18 +369,37 @@ static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 {
 	long reladdr;
 
-	memcpy(entry->jump, stub_insns, sizeof(stub_insns));
-
-	/* Stub uses address relative to kernel toc (from the paca) */
-	reladdr = addr - kernel_toc_addr();
-	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-		pr_err("%s: Address of %ps out of range of kernel_toc.\n",
-							me->name, (void *)addr);
+	if ((unsigned long)entry->jump % 8 != 0) {
+		pr_err("%s: Address of stub entry is not 8-byte aligned\n", me->name);
 		return 0;
 	}
 
-	entry->jump[1] |= PPC_HA(reladdr);
-	entry->jump[2] |= PPC_LO(reladdr);
+	BUILD_BUG_ON(sizeof(stub_insns) > sizeof(entry->jump));
+	memcpy(entry->jump, stub_insns, sizeof(stub_insns));
+
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
+		/* Stub uses address relative to kernel base (from the paca) */
+		reladdr = addr - local_paca->kernelbase;
+		if (reladdr > 0x1FFFFFFFFL || reladdr < -0x200000000L) {
+			pr_err("%s: Address of 0x%lx out of range of 34-bit relative address reladdr=0x%lx entry=0x%lx.\n",
+				me->name, addr, reladdr, (unsigned long)entry);
+			return 0;
+		}
+
+		entry->jump[2] |= IMM_H18(reladdr);
+		entry->jump[3] |= IMM_L(reladdr);
+	} else {
+		/* Stub uses address relative to kernel toc (from the paca) */
+		reladdr = addr - kernel_toc_addr();
+		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
+			pr_err("%s: Address of %ps out of range of kernel_toc.\n",
+								me->name, (void *)addr);
+			return 0;
+		}
+
+		entry->jump[1] |= PPC_HA(reladdr);
+		entry->jump[2] |= PPC_LO(reladdr);
+	}
 
 	/* Even though we don't use funcdata in the stub, it's needed elsewhere. */
 	entry->funcdata = func_desc(addr);
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index be8db402e963..cda4e00b67c1 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -191,7 +191,9 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 #endif
 	new_paca->lock_token = 0x8000;
 	new_paca->paca_index = cpu;
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	new_paca->kernel_toc = kernel_toc_addr();
+#endif
 	new_paca->kernelbase = (unsigned long) _stext;
 	/* Only set MSR:IR/DR when MMU is initialized */
 	new_paca->kernel_msr = MSR_KERNEL & ~(MSR_IR | MSR_DR);
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 72864fb7a6cc..78e7250bb6e8 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -727,6 +727,15 @@ int __init ftrace_dyn_arch_init(void)
 {
 	int i;
 	unsigned int *tramp[] = { ftrace_tramp_text, ftrace_tramp_init };
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	u32 stub_insns[] = {
+		/* pla r12,addr */
+		PPC_PREFIX_MLS | __PPC_PRFX_R(1),
+		PPC_INST_PADDI | ___PPC_RT(_R12),
+		PPC_RAW_MTCTR(_R12),
+		PPC_RAW_BCTR()
+	};
+#else
 	u32 stub_insns[] = {
 		PPC_RAW_LD(_R12, _R13, PACATOC),
 		PPC_RAW_ADDIS(_R12, _R12, 0),
@@ -734,6 +743,8 @@ int __init ftrace_dyn_arch_init(void)
 		PPC_RAW_MTCTR(_R12),
 		PPC_RAW_BCTR()
 	};
+#endif
+
 	unsigned long addr;
 	long reladdr;
 
@@ -742,19 +753,36 @@ int __init ftrace_dyn_arch_init(void)
 	else
 		addr = ppc_global_function_entry((void *)ftrace_caller);
 
-	reladdr = addr - kernel_toc_addr();
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
+		for (i = 0; i < 2; i++) {
+			reladdr = addr - (unsigned long)tramp[i];
 
-	if (reladdr >= SZ_2G || reladdr < -(long)SZ_2G) {
-		pr_err("Address of %ps out of range of kernel_toc.\n",
-				(void *)addr);
-		return -1;
-	}
+			if (reladdr >= (long)SZ_8G || reladdr < -(long)SZ_8G) {
+				pr_err("Address of %ps out of range of pcrel address.\n",
+						(void *)addr);
+				return -1;
+			}
+
+			memcpy(tramp[i], stub_insns, sizeof(stub_insns));
+			tramp[i][0] |= IMM_H18(reladdr);
+			tramp[i][1] |= IMM_L(reladdr);
+			add_ftrace_tramp((unsigned long)tramp[i]);
+		}
+	} else {
+		reladdr = addr - kernel_toc_addr();
 
-	for (i = 0; i < 2; i++) {
-		memcpy(tramp[i], stub_insns, sizeof(stub_insns));
-		tramp[i][1] |= PPC_HA(reladdr);
-		tramp[i][2] |= PPC_LO(reladdr);
-		add_ftrace_tramp((unsigned long)tramp[i]);
+		if (reladdr >= (long)SZ_2G || reladdr < -(long)SZ_2G) {
+			pr_err("Address of %ps out of range of kernel_toc.\n",
+					(void *)addr);
+			return -1;
+		}
+
+		for (i = 0; i < 2; i++) {
+			memcpy(tramp[i], stub_insns, sizeof(stub_insns));
+			tramp[i][1] |= PPC_HA(reladdr);
+			tramp[i][2] |= PPC_LO(reladdr);
+			add_ftrace_tramp((unsigned long)tramp[i]);
+		}
 	}
 
 	return 0;
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index ffe5d90abe17..fcc0ad6d9c7b 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -177,9 +177,15 @@ fpone:
 fphalf:
 	.quad	0x3fe0000000000000	/* 0.5 */
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+#define LDCONST(fr, name)		\
+	pla	r11,name@pcrel;		\
+	lfd	fr,0(r11)
+#else
 #define LDCONST(fr, name)		\
 	addis	r11,r2,name@toc@ha;	\
 	lfd	fr,name@toc@l(r11)
+#endif
 #endif
 	.text
 /*
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 8c3862b4c259..ed0dc6ac566c 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -168,12 +168,18 @@ SECTIONS
 	}
 
 #else /* CONFIG_PPC32 */
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	.toc1 : AT(ADDR(.toc1) - LOAD_OFFSET) {
 		*(.toc1)
 	}
+#endif
 
 	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		*(.got)
+#else
 		*(.got .toc)
+#endif
 	}
 
 	SOFT_MASK_TABLE(8)
diff --git a/arch/powerpc/lib/copypage_64.S b/arch/powerpc/lib/copypage_64.S
index 6812cb19d04a..f426a24a955d 100644
--- a/arch/powerpc/lib/copypage_64.S
+++ b/arch/powerpc/lib/copypage_64.S
@@ -18,8 +18,10 @@ FTR_SECTION_ELSE
 #endif
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
 	ori	r5,r5,PAGE_SIZE@l
-BEGIN_FTR_SECTION
+	/* prefixed instructions cause label difference to be non-constant
+	 * so can't go in FTR sections */
 	LOAD_REG_ADDR(r10, ppc64_caches)
+BEGIN_FTR_SECTION
 	lwz	r11,DCACHEL1LOGBLOCKSIZE(r10)	/* log2 of cache block size */
 	lwz     r12,DCACHEL1BLOCKSIZE(r10)	/* get cache block size */
 	li	r9,0
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index a4f7880f959d..31de45f02827 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -19,6 +19,8 @@
 #define FUNCTION_DESCR_SIZE	0
 #endif
 
+#define CTX_NIA(ctx) ((unsigned long)ctx->idx * 4)
+
 #define PLANT_INSTR(d, idx, instr)					      \
 	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
 #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
@@ -26,7 +28,7 @@
 /* Long jump; (unconditional 'branch') */
 #define PPC_JMP(dest)							      \
 	do {								      \
-		long offset = (long)(dest) - (ctx->idx * 4);		      \
+		long offset = (long)(dest) - CTX_NIA(ctx);		      \
 		if ((dest) != 0 && !is_offset_in_branch_range(offset)) {		      \
 			pr_err_ratelimited("Branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);			\
 			return -ERANGE;					      \
@@ -40,7 +42,7 @@
 /* "cond" here covers BO:BI fields. */
 #define PPC_BCC_SHORT(cond, dest)					      \
 	do {								      \
-		long offset = (long)(dest) - (ctx->idx * 4);		      \
+		long offset = (long)(dest) - CTX_NIA(ctx);		      \
 		if ((dest) != 0 && !is_offset_in_cond_branch_range(offset)) {		      \
 			pr_err_ratelimited("Conditional branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);		\
 			return -ERANGE;					      \
@@ -92,12 +94,12 @@
  * state.
  */
 #define PPC_BCC(cond, dest)	do {					      \
-		if (is_offset_in_cond_branch_range((long)(dest) - (ctx->idx * 4))) {	\
+		if (is_offset_in_cond_branch_range((long)(dest) - CTX_NIA(ctx))) {	\
 			PPC_BCC_SHORT(cond, dest);			      \
 			EMIT(PPC_RAW_NOP());				      \
 		} else {						      \
 			/* Flip the 'T or F' bit to invert comparison */      \
-			PPC_BCC_SHORT(cond ^ COND_CMP_TRUE, (ctx->idx+2)*4);  \
+			PPC_BCC_SHORT(cond ^ COND_CMP_TRUE, CTX_NIA(ctx) + 2*4);  \
 			PPC_JMP(dest);					      \
 		} } while(0)
 
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 29ee306d6302..5e5b97383d6e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -126,8 +126,10 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
 
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
+#endif
 
 	/*
 	 * Initialize tail_call_cnt if we do tail calls.
@@ -208,16 +210,31 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 	if (WARN_ON_ONCE(!core_kernel_text(func_addr)))
 		return -EINVAL;
 
-	reladdr = func_addr - kernel_toc_addr();
-	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-		pr_err("eBPF: address of %ps out of range of kernel_toc.\n", (void *)func);
-		return -ERANGE;
-	}
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
+		reladdr = func_addr - CTX_NIA(ctx);
 
-	EMIT(PPC_RAW_ADDIS(_R12, _R2, PPC_HA(reladdr)));
-	EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
-	EMIT(PPC_RAW_MTCTR(_R12));
-	EMIT(PPC_RAW_BCTRL());
+		if (reladdr >= (long)SZ_8G || reladdr < -(long)SZ_8G) {
+			pr_err("eBPF: address of %ps out of range of pcrel address.\n", (void *)func);
+			return -ERANGE;
+		}
+		/* pla r12,addr */
+		EMIT(PPC_PREFIX_MLS | __PPC_PRFX_R(1) | IMM_H18(reladdr));
+		EMIT(PPC_INST_PADDI | ___PPC_RT(_R12) | IMM_L(reladdr));
+		EMIT(PPC_RAW_MTCTR(_R12));
+		EMIT(PPC_RAW_BCTR());
+
+	} else {
+		reladdr = func_addr - kernel_toc_addr();
+		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
+			pr_err("eBPF: address of %ps out of range of kernel_toc.\n", (void *)func);
+			return -ERANGE;
+		}
+
+		EMIT(PPC_RAW_ADDIS(_R12, _R2, PPC_HA(reladdr)));
+		EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
+		EMIT(PPC_RAW_MTCTR(_R12));
+		EMIT(PPC_RAW_BCTRL());
+	}
 
 	return 0;
 }
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 0d9646101caf..ccd871d044ed 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -181,6 +181,7 @@ config POWER10_CPU
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
 	select PPC_HAVE_PREFIXED_SUPPORT
+	select PPC_HAVE_PCREL_SUPPORT
 
 config E5500_CPU
 	bool "Freescale e5500"
@@ -461,6 +462,20 @@ config PPC_KERNEL_PREFIXED
 	  Kernel support for prefixed instructions in applications and guests
           is not affected by this option.
 
+config PPC_KERNEL_PCREL
+	depends on PPC_HAVE_PCREL_SUPPORT
+	depends on PPC_HAVE_PREFIXED_SUPPORT
+	depends on CC_HAS_PCREL
+	default n
+	select PPC_KERNEL_PREFIXED
+	bool "Build Kernel with PC-Relative addressing model"
+	help
+	  POWER10 and later CPUs support pc relative addressing. Recent
+	  compilers have support for an ELF ABI extension for a pc relative
+	  ABI.
+
+	  This option builds the kernel with the pc relative ABI model.
+
 config PPC_KUEP
 	bool "Kernel Userspace Execution Prevention" if !40x
 	default y if !40x
@@ -500,6 +515,9 @@ config PPC_HAVE_PMU_SUPPORT
 config PPC_HAVE_PREFIXED_SUPPORT
 	bool
 
+config PPC_HAVE_PCREL_SUPPORT
+	bool
+
 config PMU_SYSFS
 	bool "Create PMU SPRs sysfs file"
 	default n
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 0da66bc4823d..21284e890d64 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2636,7 +2636,9 @@ static void dump_one_paca(int cpu)
 
 	DUMP(p, lock_token, "%#-*x");
 	DUMP(p, paca_index, "%#-*x");
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	DUMP(p, kernel_toc, "%#-*llx");
+#endif
 	DUMP(p, kernelbase, "%#-*llx");
 	DUMP(p, kernel_msr, "%#-*llx");
 	DUMP(p, emergency_sp, "%-*px");
-- 
2.37.2

