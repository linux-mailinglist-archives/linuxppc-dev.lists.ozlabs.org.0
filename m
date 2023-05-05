Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF916F7DB6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 09:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCMbd58j8z3fYD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 17:23:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Uk9yq9xs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Uk9yq9xs;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCMWB20WZz3cj8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 17:19:18 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6439e6f5a33so268542b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683271155; x=1685863155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qAXK6f915/2ScPMynOYgBXbFPbgpqT36aGZyJmIg10=;
        b=Uk9yq9xsygZ+6Y5CBQzGh4se6F7BiDwZX3iMKFbu95Z8cnA9W1RWej59I+1R7BSb8Q
         7xE4WFtTxJ5a5lSNBGLluoXXmHHtmQWvCAZ6JexcDSlZMdFBkibxN0+8LGceJHCzTdqQ
         L5PEOtwQvQkbu1AnpYeCkfyAl5NbwrJYsYRb0wqhxtP0nwwlx//zg0l5RLiTBBMOLtQb
         Hf9zZHavJHhzLbX1jxrF+aRjbZ+fbEe4dlnP5jq1zyKTw4+mL6gl6hnN2ri8OlFht3F+
         UJsQxnjGuphgodLw7Hp5z/dBuWR0gvuSCBo+t5pkdTbcocJbLfyUwO3dZ9whb4YBpTQO
         90mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683271155; x=1685863155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qAXK6f915/2ScPMynOYgBXbFPbgpqT36aGZyJmIg10=;
        b=GlS+pvNL98A0pCBZFtaVUAul9a5/8XBTY3YCwx7noHrP4HokS1hChbTVIn+yamE3N5
         sRBNBPRxrdWimMTtsujRL479pClpztzLakUDO1cx6j+yEI/m3KkwyRSwonIreIFDp1Fi
         X4cGO/xiBsxgxFIcWNV8MmtCNzaerH/jDeDlocvbf9yqUrAkG8y2uuEjE+zbrEHMgY85
         ZtMednaSKtrKIE6RzygK5kSNE4vGYtLawk1uXVx/8TjoTb8sn/WBISmUSlAv/+PMPnDP
         cAVt97+38Uohd1NLVTrTv4Hx8WfRUYy1jHdqOMrCJQZ4i2/yq2Kz5/dyQDs023LuYYBB
         wMww==
X-Gm-Message-State: AC+VfDyy5mDZ9ttDKwnTbqBStYaj9qnQD9yO6f6GHkNnaafn7FQbqP34
	pYl+EcCgzZ6hVDYiHpFLrsFjaD+P3/U=
X-Google-Smtp-Source: ACHHUZ7Psmlin30YCuggeE0Vs89SMRxA4hOO+yKL89jO9Y1ae3UzF2Y1bYJzACoPEybw27eMRNthbQ==
X-Received: by 2002:a05:6a20:d687:b0:ef:a696:993a with SMTP id it7-20020a056a20d68700b000efa696993amr596335pzb.22.1683271155032;
        Fri, 05 May 2023 00:19:15 -0700 (PDT)
Received: from wheely.local0.net ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id i10-20020aa78d8a000000b00625d84a0194sm915384pfr.107.2023.05.05.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:19:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/4] powerpc/64: Remove support for kernel's built with ELFv1 ABI
Date: Fri,  5 May 2023 17:18:50 +1000
Message-Id: <20230505071850.228734-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505071850.228734-1-npiggin@gmail.com>
References: <20230505071850.228734-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

User code must still support ELFv1, e.g., see is_elf2_task().

This one should wait a while until ELFv2 fallout settles, so
just posting it out of interest.

Thanks,
Nick
---
 arch/powerpc/Kconfig                     | 19 ------
 arch/powerpc/Makefile                    | 15 +----
 arch/powerpc/boot/Makefile               |  4 +-
 arch/powerpc/include/asm/code-patching.h | 36 ++--------
 arch/powerpc/include/asm/kfence.h        |  4 --
 arch/powerpc/include/asm/linkage.h       |  9 ---
 arch/powerpc/include/asm/module.h        |  3 -
 arch/powerpc/include/asm/ppc_asm.h       | 38 +----------
 arch/powerpc/include/asm/ptrace.h        | 17 +----
 arch/powerpc/include/asm/sections.h      |  4 --
 arch/powerpc/kernel/exceptions-64s.S     |  2 +-
 arch/powerpc/kernel/fadump.c             |  6 +-
 arch/powerpc/kernel/head_64.S            |  5 +-
 arch/powerpc/kernel/interrupt_64.S       |  4 --
 arch/powerpc/kernel/kprobes.c            | 39 +----------
 arch/powerpc/kernel/misc_64.S            |  4 --
 arch/powerpc/kernel/module.c             |  8 ---
 arch/powerpc/kernel/module_64.c          | 84 ++++--------------------
 arch/powerpc/kernel/trace/ftrace.c       | 10 ---
 arch/powerpc/kernel/vdso/Makefile        |  2 +-
 arch/powerpc/kernel/vdso/gettimeofday.S  |  2 +-
 arch/powerpc/kernel/vmlinux.lds.S        |  8 ---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  | 36 +++++-----
 arch/powerpc/kvm/book3s_interrupts.S     | 14 ++--
 arch/powerpc/kvm/book3s_rmhandlers.S     | 12 +---
 arch/powerpc/net/bpf_jit.h               |  6 --
 arch/powerpc/net/bpf_jit_comp.c          | 14 ++--
 arch/powerpc/net/bpf_jit_comp64.c        | 13 ++--
 arch/powerpc/platforms/Kconfig.cputype   |  6 --
 drivers/crypto/vmx/Makefile              |  4 --
 kernel/extable.c                         |  2 +-
 kernel/trace/ftrace.c                    | 12 ----
 32 files changed, 68 insertions(+), 374 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a64bfd9b8a1d..6cbcaf1d01a6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 source "arch/powerpc/platforms/Kconfig.cputype"
 
-config CC_HAS_ELFV2
-	def_bool PPC64 && $(cc-option, -mabi=elfv2)
-
 config CC_HAS_PREFIXED
 	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)
 
@@ -232,7 +229,6 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
-	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
@@ -623,21 +619,6 @@ config KEXEC_FILE
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
-config PPC64_BIG_ENDIAN_ELF_ABI_V2
-	prompt "Build big-endian kernel using ELF ABI V2" if LD_IS_BFD && EXPERT
-	def_bool y
-	depends on PPC64 && CPU_BIG_ENDIAN
-	depends on CC_HAS_ELFV2
-	help
-	  This builds the kernel image using the "Power Architecture 64-Bit ELF
-	  V2 ABI Specification", which has a reduced stack overhead and faster
-	  function calls. This internal kernel ABI option does not affect
-          userspace compatibility.
-
-	  The V2 ABI is standard for 64-bit little-endian, but for big-endian
-	  it is less well tested by kernel and toolchain. However some distros
-	  build userspace this way, and it can produce a functioning kernel.
-
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || PPC_85xx))
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index dca73f673d70..8ddc779e675f 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -72,10 +72,8 @@ endif
 
 ifdef CONFIG_PPC64
 ifndef CONFIG_CC_IS_CLANG
-cflags-$(CONFIG_PPC64_ELF_ABI_V1)	+= $(call cc-option,-mabi=elfv1)
-cflags-$(CONFIG_PPC64_ELF_ABI_V1)	+= $(call cc-option,-mcall-aixdesc)
-aflags-$(CONFIG_PPC64_ELF_ABI_V1)	+= $(call cc-option,-mabi=elfv1)
-aflags-$(CONFIG_PPC64_ELF_ABI_V2)	+= -mabi=elfv2
+#Is this even needed?
+aflags-y				+= -mabi=elfv2
 endif
 endif
 
@@ -125,14 +123,7 @@ endif
 endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
-ifdef CONFIG_PPC64_ELF_ABI_V2
-CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
-else
-ifndef CONFIG_CC_IS_CLANG
-CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
-CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
-endif
-endif
+CFLAGS-$(CONFIG_PPC64)	+= -mabi=elfv2
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mlong-double-128)
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 85cde5bf04b7..e6979f4ea571 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -42,9 +42,7 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTCFLAGS	+= -m64
-ifdef CONFIG_PPC64_ELF_ABI_V2
-BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
-endif
+BOOTCFLAGS	+= -mabi=elfv2
 else
 BOOTCFLAGS	+= -m32
 endif
diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 3f881548fb61..90508151e5f4 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -130,7 +130,7 @@ bool is_conditional_branch(ppc_inst_t instr);
 
 static inline unsigned long ppc_function_entry(void *func)
 {
-#ifdef CONFIG_PPC64_ELF_ABI_V2
+#ifdef CONFIG_PPC64
 	u32 *insn = func;
 
 	/*
@@ -155,13 +155,6 @@ static inline unsigned long ppc_function_entry(void *func)
 		return (unsigned long)(insn + 2);
 	else
 		return (unsigned long)func;
-#elif defined(CONFIG_PPC64_ELF_ABI_V1)
-	/*
-	 * On PPC64 ABIv1 the function pointer actually points to the
-	 * function's descriptor. The first entry in the descriptor is the
-	 * address of the function text.
-	 */
-	return ((struct func_desc *)func)->addr;
 #else
 	return (unsigned long)func;
 #endif
@@ -169,7 +162,7 @@ static inline unsigned long ppc_function_entry(void *func)
 
 static inline unsigned long ppc_global_function_entry(void *func)
 {
-#ifdef CONFIG_PPC64_ELF_ABI_V2
+#ifdef CONFIG_PPC64
 	/* PPC64 ABIv2 the global entry point is at the address */
 	return (unsigned long)func;
 #else
@@ -186,28 +179,7 @@ static inline unsigned long ppc_global_function_entry(void *func)
 static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 {
 	unsigned long addr;
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	/* check for dot variant */
-	char dot_name[1 + KSYM_NAME_LEN];
-	bool dot_appended = false;
-
-	if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
-		return 0;
-
-	if (name[0] != '.') {
-		dot_name[0] = '.';
-		dot_name[1] = '\0';
-		strlcat(dot_name, name, sizeof(dot_name));
-		dot_appended = true;
-	} else {
-		dot_name[0] = '\0';
-		strlcat(dot_name, name, sizeof(dot_name));
-	}
-	addr = kallsyms_lookup_name(dot_name);
-	if (!addr && dot_appended)
-		/* Let's try the original non-dot symbol lookup	*/
-		addr = kallsyms_lookup_name(name);
-#elif defined(CONFIG_PPC64_ELF_ABI_V2)
+#ifdef CONFIG_PPC64
 	addr = kallsyms_lookup_name(name);
 	if (addr)
 		addr = ppc_function_entry((void *)addr);
@@ -223,7 +195,7 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
  */
 
 /* This must match the definition of STK_GOT in <asm/ppc_asm.h> */
-#ifdef CONFIG_PPC64_ELF_ABI_V2
+#ifdef CONFIG_PPC64
 #define R2_STACK_OFFSET         24
 #else
 #define R2_STACK_OFFSET         40
diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index 6fd2b4d486c5..5e79b69b2764 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -11,10 +11,6 @@
 #include <linux/mm.h>
 #include <asm/pgtable.h>
 
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-#define ARCH_FUNC_PREFIX "."
-#endif
-
 static inline bool arch_kfence_init_pool(void)
 {
 	return true;
diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
index b88d1d2cf304..46a2ce031844 100644
--- a/arch/powerpc/include/asm/linkage.h
+++ b/arch/powerpc/include/asm/linkage.h
@@ -7,13 +7,4 @@
 #define __ALIGN		.align 2
 #define __ALIGN_STR	".align 2"
 
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-#define cond_syscall(x) \
-	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\
-	     "\t.weak ." #x "\n\t.set ." #x ", .sys_ni_syscall\n")
-#define SYSCALL_ALIAS(alias, name)					\
-	asm ("\t.globl " #alias "\n\t.set " #alias ", " #name "\n"	\
-	     "\t.globl ." #alias "\n\t.set ." #alias ", ." #name)
-#endif
-
 #endif	/* _ASM_POWERPC_LINKAGE_H */
diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index ac53606c2594..ceb21a65e94b 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -35,9 +35,6 @@ struct mod_arch_specific {
 	bool toc_fixed;			/* Have we fixed up .TOC.? */
 #endif
 
-	/* For module function descriptor dereference */
-	unsigned long start_opd;
-	unsigned long end_opd;
 #else /* powerpc64 */
 	/* Indices of PLT sections within module. */
 	unsigned int core_plt_section;
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 5f05a984b103..7e845597b5c9 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -199,7 +199,7 @@
 #define __STK_REG(i)   (112 + ((i)-14)*8)
 #define STK_REG(i)     __STK_REG(__REG_##i)
 
-#ifdef CONFIG_PPC64_ELF_ABI_V2
+#ifdef CONFIG_PPC64
 #define STK_GOT		24
 #define __STK_PARAM(i)	(32 + ((i)-3)*8)
 #else
@@ -208,8 +208,6 @@
 #endif
 #define STK_PARAM(i)	__STK_PARAM(__REG_##i)
 
-#ifdef CONFIG_PPC64_ELF_ABI_V2
-
 #define _GLOBAL(name) \
 	.align 2 ; \
 	.type name,@function; \
@@ -229,32 +227,6 @@ name: \
 	.localentry name,.-name
 #endif
 
-#define DOTSYM(a)	a
-
-#else
-
-#define XGLUE(a,b) a##b
-#define GLUE(a,b) XGLUE(a,b)
-
-#define _GLOBAL(name) \
-	.align 2 ; \
-	.globl name; \
-	.globl GLUE(.,name); \
-	.pushsection ".opd","aw"; \
-name: \
-	.quad GLUE(.,name); \
-	.quad .TOC.@tocbase; \
-	.quad 0; \
-	.popsection; \
-	.type GLUE(.,name),@function; \
-GLUE(.,name):
-
-#define _GLOBAL_TOC(name) _GLOBAL(name)
-
-#define DOTSYM(a)	GLUE(.,a)
-
-#endif
-
 #else /* 32-bit */
 
 #define _GLOBAL(n)	\
@@ -263,8 +235,6 @@ GLUE(.,name):
 
 #define _GLOBAL_TOC(name) _GLOBAL(name)
 
-#define DOTSYM(a)	a
-
 #endif
 
 /*
@@ -861,11 +831,9 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define BTB_FLUSH(reg)
 #endif /* CONFIG_PPC_E500 */
 
-#if defined(CONFIG_PPC64_ELF_ABI_V1)
-#define STACK_FRAME_PARAMS 48
-#elif defined(CONFIG_PPC64_ELF_ABI_V2)
+#ifdef CONFIG_PPC64
 #define STACK_FRAME_PARAMS 32
-#elif defined(CONFIG_PPC32)
+#else
 #define STACK_FRAME_PARAMS 8
 #endif
 
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 0eb90a013346..56517d9b4b99 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -120,26 +120,15 @@ struct pt_regs
 
 #define STACK_FRAME_LR_SAVE	2	/* Location of LR in stack frame */
 
-#ifdef CONFIG_PPC64_ELF_ABI_V2
+/*
+ * The kernel always uses the ELFv2 ABI even on big-endian builds
+ */
 #define STACK_FRAME_MIN_SIZE	32
 #define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE + 16)
 #define STACK_INT_FRAME_REGS	(STACK_FRAME_MIN_SIZE + 16)
 #define STACK_INT_FRAME_MARKER	STACK_FRAME_MIN_SIZE
 #define STACK_SWITCH_FRAME_SIZE (sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE + 16)
 #define STACK_SWITCH_FRAME_REGS	(STACK_FRAME_MIN_SIZE + 16)
-#else
-/*
- * The ELFv1 ABI specifies 48 bytes plus a minimum 64 byte parameter save
- * area. This parameter area is not used by calls to C from interrupt entry,
- * so the second from last one of those is used for the frame marker.
- */
-#define STACK_FRAME_MIN_SIZE	112
-#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
-#define STACK_INT_FRAME_REGS	STACK_FRAME_MIN_SIZE
-#define STACK_INT_FRAME_MARKER	(STACK_FRAME_MIN_SIZE - 16)
-#define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_MIN_SIZE)
-#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_MIN_SIZE
-#endif
 
 /* Size of dummy stack frame allocated when calling signal handler. */
 #define __SIGNAL_FRAMESIZE	128
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 4e1f548c8d37..89fd5bba93f5 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -6,10 +6,6 @@
 #include <linux/elf.h>
 #include <linux/uaccess.h>
 
-#ifdef CONFIG_HAVE_FUNCTION_DESCRIPTORS
-typedef struct func_desc func_desc_t;
-#endif
-
 #include <asm-generic/sections.h>
 
 extern char __head_end[];
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c33c8ebf8641..281cf280afd5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1043,7 +1043,7 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
 	/* We are waking up from idle, so may clobber any volatile register */
 	cmpwi	cr1,r5,2
 	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
-	__LOAD_FAR_HANDLER(r12, DOTSYM(idle_return_gpr_loss), real_trampolines)
+	__LOAD_FAR_HANDLER(r12, idle_return_gpr_loss, real_trampolines)
 	mtctr	r12
 	bctr
 #endif
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ea0a073abd96..2c770c56d500 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -979,10 +979,8 @@ static int fadump_init_elfcore_header(char *bufp)
 	elf->e_phoff = sizeof(struct elfhdr);
 	elf->e_shoff = 0;
 
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
-		elf->e_flags = 2;
-	else if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))
-		elf->e_flags = 1;
+	if (IS_ENABLED(CONFIG_PPC64))
+		elf->e_flags = 2; /* PPC64 always uses ELFv2 */
 	else
 		elf->e_flags = 0;
 
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index f132d8704263..da7883afdaf5 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -446,9 +446,6 @@ generic_secondary_common_init:
 	ld	r12,CPU_SPEC_RESTORE(r23)
 	cmpdi	0,r12,0
 	beq	3f
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	ld	r12,0(r12)
-#endif
 	mtctr	r12
 	bctrl
 
@@ -1009,7 +1006,7 @@ start_here_multiplatform:
 #endif
 	/* Restore parameters passed from prom_init/kexec */
 	mr	r3,r31
-	LOAD_REG_ADDR(r12, DOTSYM(early_setup))
+	LOAD_REG_ADDR(r12, early_setup)
 	mtctr	r12
 	bctrl		/* also sets r13 and SPRG_PACA */
 
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index bd863702d812..19581e3f4b5f 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -743,9 +743,7 @@ _GLOBAL(ret_from_kernel_user_thread)
 	bl	CFUNC(schedule_tail)
 	mtctr	r14
 	mr	r3,r15
-#ifdef CONFIG_PPC64_ELF_ABI_V2
 	mr	r12,r14
-#endif
 	bctrl
 	li	r3,0
 	/*
@@ -759,9 +757,7 @@ _GLOBAL(start_kernel_thread)
 	bl	CFUNC(schedule_tail)
 	mtctr	r14
 	mr	r3,r15
-#ifdef CONFIG_PPC64_ELF_ABI_V2
 	mr	r12,r14
-#endif
 	bctrl
 	/*
 	 * This must not return. We actually want to BUG here, not WARN,
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index b20ee72e873a..805a45132060 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -45,7 +45,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 {
 	kprobe_opcode_t *addr = NULL;
 
-#ifdef CONFIG_PPC64_ELF_ABI_V2
+#ifdef CONFIG_PPC64
 	/* PPC64 ABIv2 needs local entry point */
 	addr = (kprobe_opcode_t *)kallsyms_lookup_name(name);
 	if (addr && !offset) {
@@ -63,41 +63,6 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 #endif
 			addr = (kprobe_opcode_t *)ppc_function_entry(addr);
 	}
-#elif defined(CONFIG_PPC64_ELF_ABI_V1)
-	/*
-	 * 64bit powerpc ABIv1 uses function descriptors:
-	 * - Check for the dot variant of the symbol first.
-	 * - If that fails, try looking up the symbol provided.
-	 *
-	 * This ensures we always get to the actual symbol and not
-	 * the descriptor.
-	 *
-	 * Also handle <module:symbol> format.
-	 */
-	char dot_name[MODULE_NAME_LEN + 1 + KSYM_NAME_LEN];
-	bool dot_appended = false;
-	const char *c;
-	ssize_t ret = 0;
-	int len = 0;
-
-	if ((c = strnchr(name, MODULE_NAME_LEN, ':')) != NULL) {
-		c++;
-		len = c - name;
-		memcpy(dot_name, name, len);
-	} else
-		c = name;
-
-	if (*c != '\0' && *c != '.') {
-		dot_name[len++] = '.';
-		dot_appended = true;
-	}
-	ret = strscpy(dot_name + len, c, KSYM_NAME_LEN);
-	if (ret > 0)
-		addr = (kprobe_opcode_t *)kallsyms_lookup_name(dot_name);
-
-	/* Fallback to the original non-dot symbol lookup */
-	if (!addr && dot_appended)
-		addr = (kprobe_opcode_t *)kallsyms_lookup_name(name);
 #else
 	addr = (kprobe_opcode_t *)kallsyms_lookup_name(name);
 #endif
@@ -107,7 +72,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 
 static bool arch_kprobe_on_func_entry(unsigned long offset)
 {
-#ifdef CONFIG_PPC64_ELF_ABI_V2
+#ifdef CONFIG_PPC64
 #ifdef CONFIG_KPROBES_ON_FTRACE
 	return offset <= 16;
 #else
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 2c9ac70aaf0c..65fa51e46f3e 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -456,11 +456,7 @@ _GLOBAL(kexec_sequence)
 	beq	1f
 
 	/* clear out hardware hash page table and tlb */
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	ld	r12,0(r27)		/* deref function descriptor */
-#else
 	mr	r12,r27
-#endif
 	mtctr	r12
 	bctrl				/* mmu_hash_ops.hpte_clear_all(void); */
 
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f6d6ae0a1692..d145175ed799 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -64,14 +64,6 @@ int module_finalize(const Elf_Ehdr *hdr,
 				  (void *)sect->sh_addr + sect->sh_size);
 #endif /* CONFIG_PPC64 */
 
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	sect = find_section(hdr, sechdrs, ".opd");
-	if (sect != NULL) {
-		me->arch.start_opd = sect->sh_addr;
-		me->arch.end_opd = sect->sh_addr + sect->sh_size;
-	}
-#endif /* CONFIG_PPC64_ELF_ABI_V1 */
-
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 	sect = find_section(hdr, sechdrs, "__spec_barrier_fixup");
 	if (sect != NULL)
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 92570289ce08..c8e19364a256 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -35,21 +35,7 @@ bool module_elf_check_arch(Elf_Ehdr *hdr)
 {
 	unsigned long abi_level = hdr->e_flags & 0x3;
 
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
-		return abi_level == 2;
-	else
-		return abi_level < 2;
-}
-
-#ifdef CONFIG_PPC64_ELF_ABI_V2
-
-static func_desc_t func_desc(unsigned long addr)
-{
-	func_desc_t desc = {
-		.addr = addr,
-	};
-
-	return desc;
+	return abi_level == 2; /* Require ELFv2 */
 }
 
 /* PowerPC64 specific values for the Elf64_Sym st_other field.  */
@@ -65,36 +51,6 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 	 * of function and try to derive r2 from it). */
 	return PPC64_LOCAL_ENTRY_OFFSET(sym->st_other);
 }
-#else
-
-static func_desc_t func_desc(unsigned long addr)
-{
-	return *(struct func_desc *)addr;
-}
-static unsigned int local_entry_offset(const Elf64_Sym *sym)
-{
-	return 0;
-}
-
-void *dereference_module_function_descriptor(struct module *mod, void *ptr)
-{
-	if (ptr < (void *)mod->arch.start_opd ||
-			ptr >= (void *)mod->arch.end_opd)
-		return ptr;
-
-	return dereference_function_descriptor(ptr);
-}
-#endif
-
-static unsigned long func_addr(unsigned long addr)
-{
-	return func_desc(addr).addr;
-}
-
-static unsigned long stub_func_addr(func_desc_t func)
-{
-	return func.addr;
-}
 
 #define STUB_MAGIC 0x73747562 /* stub */
 
@@ -111,7 +67,7 @@ struct ppc64_stub_entry {
 	/* Used by ftrace to identify stubs */
 	u32 magic;
 	/* Data for the above code */
-	func_desc_t funcdata;
+	u64 target;
 } __aligned(8);
 
 struct ppc64_got_entry {
@@ -122,8 +78,7 @@ struct ppc64_got_entry {
  * PPC64 uses 24 bit jumps, but we need to jump into other modules or
  * the kernel which may be further.  So we jump to a stub.
  *
- * Target address and TOC are loaded from function descriptor in the
- * ppc64_stub_entry.
+ * Target address is loaded from target in the ppc64_stub_entry.
  *
  * r12 is used to generate the target address, which is required for the
  * ELFv2 global entry point calling convention.
@@ -132,7 +87,6 @@ struct ppc64_got_entry {
  * - PCREL does not have a TOC.
  * - ELFv2 non-PCREL just has to save r2, the callee is responsible for
  *   setting its own TOC pointer at the global entry address.
- * - ELFv1 must load the new TOC pointer from the function descriptor.
  */
 static u32 ppc64_stub_insns[] = {
 #ifdef CONFIG_PPC_KERNEL_PCREL
@@ -145,10 +99,6 @@ static u32 ppc64_stub_insns[] = {
 	/* Save current r2 value in magic place on the stack. */
 	PPC_RAW_STD(_R2, _R1, R2_STACK_OFFSET),
 	PPC_RAW_LD(_R12, _R11, 32),
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	/* Set up new r2 from function descriptor */
-	PPC_RAW_LD(_R2, _R11, 40),
-#endif
 #endif
 	PPC_RAW_MTCTR(_R12),
 	PPC_RAW_BCTR(),
@@ -535,8 +485,8 @@ static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 		entry->jump[2] |= PPC_LO(reladdr);
 	}
 
-	/* Even though we don't use funcdata in the stub, it's needed elsewhere. */
-	entry->funcdata = func_desc(addr);
+	/* Even though we don't use target in the stub, it's needed elsewhere. */
+	entry->target = addr;
 	entry->magic = STUB_MAGIC;
 
 	return 1;
@@ -594,7 +544,6 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			      const char *name)
 {
 	long reladdr;
-	func_desc_t desc;
 	int i;
 
 	if (is_mprofile_ftrace_call(name))
@@ -614,7 +563,7 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
 		/* Stub uses address relative to itself! */
-		reladdr = 0 + offsetof(struct ppc64_stub_entry, funcdata);
+		reladdr = 0 + offsetof(struct ppc64_stub_entry, target);
 		BUILD_BUG_ON(reladdr != 32);
 		if (reladdr > 0x1FFFFFFFFL || reladdr < -0x200000000L) {
 			pr_err("%s: Address of %p out of range of 34-bit relative address.\n",
@@ -648,11 +597,10 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			return 0;
 	}
 
-	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
-	desc = func_desc(addr);
-	for (i = 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
-		if (patch_instruction(((u32 *)&entry->funcdata) + i,
-				      ppc_inst(((u32 *)(&desc))[i])))
+	// target is 8 bytes
+	for (i = 0; i < sizeof(u64) / sizeof(u32); i++) {
+		if (patch_instruction(((u32 *)&entry->target) + i,
+				      ppc_inst(((u32 *)(&addr))[i])))
 			return 0;
 	}
 
@@ -676,11 +624,11 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 
 	/* Find this stub, or if that fails, the next avail. entry */
 	stubs = (void *)sechdrs[me->arch.stubs_section].sh_addr;
-	for (i = 0; stub_func_addr(stubs[i].funcdata); i++) {
+	for (i = 0; stubs[i].target; i++) {
 		if (WARN_ON(i >= num_stubs))
 			return 0;
 
-		if (stub_func_addr(stubs[i].funcdata) == func_addr(addr))
+		if (stubs[i].target == addr)
 			return (unsigned long)&stubs[i];
 	}
 
@@ -1054,7 +1002,6 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
 			     unsigned long *target)
 {
 	struct ppc64_stub_entry *stub;
-	func_desc_t funcdata;
 	u32 magic;
 
 	if (!within_module_core(addr, mod)) {
@@ -1075,14 +1022,11 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
 		return -EFAULT;
 	}
 
-	if (copy_from_kernel_nofault(&funcdata, &stub->funcdata,
-			sizeof(funcdata))) {
-		pr_err("%s: fault reading funcdata for stub %lx for %s\n", __func__, addr, mod->name);
+	if (copy_from_kernel_nofault(target, &stub->target, sizeof(*target))) {
+		pr_err("%s: fault reading target for stub %lx for %s\n", __func__, addr, mod->name);
                 return -EFAULT;
 	}
 
-	*target = stub_func_addr(funcdata);
-
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index a47f30373423..81a121b56c4d 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -864,13 +864,3 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 }
 #endif
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
-
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-char *arch_ftrace_match_adjust(char *str, const char *search)
-{
-	if (str[0] == '.' && search[0] != '.')
-		return str + 1;
-	else
-		return str;
-}
-#endif /* CONFIG_PPC64_ELF_ABI_V1 */
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 4c3f34485f08..d558a2dd9b65 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -15,7 +15,7 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o += -DDISABLE_BRANCH_PROFILING
   CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
   CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
-  CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
+  CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv2
   # This flag is supported by clang for 64-bit but not 32-bit so it will cause
   # an unused command line flag warning for this file.
   ifdef CONFIG_CC_IS_CLANG
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 48fc6658053a..88110ec0a5a6 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -39,7 +39,7 @@
 	addi		r4, r5, VDSO_DATA_OFFSET
 	.endif
 #ifdef __powerpc64__
-	bl		CFUNC(DOTSYM(\funct))
+	bl		CFUNC(\funct)
 #else
 	bl		\funct
 #endif
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 13614f0b269c..c3da2dd34691 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -186,14 +186,6 @@ SECTIONS
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
-		__start_opd = .;
-		KEEP(*(.opd))
-		__end_opd = .;
-	}
-#endif
-
 	. = ALIGN(8);
 	__stf_entry_barrier_fixup : AT(ADDR(__stf_entry_barrier_fixup) - LOAD_OFFSET) {
 		__start___stf_entry_barrier_fixup = .;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 870110e3d9b1..50b3cae5e67d 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1790,17 +1790,17 @@ hcall_real_fallback:
 	.globl	hcall_real_table
 hcall_real_table:
 	.long	0		/* 0 - unused */
-	.long	DOTSYM(kvmppc_h_remove) - hcall_real_table
-	.long	DOTSYM(kvmppc_h_enter) - hcall_real_table
-	.long	DOTSYM(kvmppc_h_read) - hcall_real_table
-	.long	DOTSYM(kvmppc_h_clear_mod) - hcall_real_table
-	.long	DOTSYM(kvmppc_h_clear_ref) - hcall_real_table
-	.long	DOTSYM(kvmppc_h_protect) - hcall_real_table
+	.long	kvmppc_h_remove - hcall_real_table
+	.long	kvmppc_h_enter - hcall_real_table
+	.long	kvmppc_h_read - hcall_real_table
+	.long	kvmppc_h_clear_mod - hcall_real_table
+	.long	kvmppc_h_clear_ref - hcall_real_table
+	.long	kvmppc_h_protect - hcall_real_table
 	.long	0		/* 0x1c */
 	.long	0		/* 0x20 */
 	.long	0		/* 0x24 - H_SET_SPRG0 */
-	.long	DOTSYM(kvmppc_h_set_dabr) - hcall_real_table
-	.long	DOTSYM(kvmppc_rm_h_page_init) - hcall_real_table
+	.long	kvmppc_h_set_dabr - hcall_real_table
+	.long	kvmppc_rm_h_page_init - hcall_real_table
 	.long	0		/* 0x30 */
 	.long	0		/* 0x34 */
 	.long	0		/* 0x38 */
@@ -1815,11 +1815,11 @@ hcall_real_table:
 	.long	0		/* 0x5c */
 	.long	0		/* 0x60 */
 #ifdef CONFIG_KVM_XICS
-	.long	DOTSYM(xics_rm_h_eoi) - hcall_real_table
-	.long	DOTSYM(xics_rm_h_cppr) - hcall_real_table
-	.long	DOTSYM(xics_rm_h_ipi) - hcall_real_table
+	.long	xics_rm_h_eoi - hcall_real_table
+	.long	xics_rm_h_cppr - hcall_real_table
+	.long	xics_rm_h_ipi - hcall_real_table
 	.long	0		/* 0x70 - H_IPOLL */
-	.long	DOTSYM(xics_rm_h_xirr) - hcall_real_table
+	.long	xics_rm_h_xirr - hcall_real_table
 #else
 	.long	0		/* 0x64 - H_EOI */
 	.long	0		/* 0x68 - H_CPPR */
@@ -1853,8 +1853,8 @@ hcall_real_table:
 	.long	0		/* 0xd4 */
 	.long	0		/* 0xd8 */
 	.long	0		/* 0xdc */
-	.long	DOTSYM(kvmppc_h_cede) - hcall_real_table
-	.long	DOTSYM(kvmppc_rm_h_confer) - hcall_real_table
+	.long	kvmppc_h_cede - hcall_real_table
+	.long	kvmppc_rm_h_confer - hcall_real_table
 	.long	0		/* 0xe8 */
 	.long	0		/* 0xec */
 	.long	0		/* 0xf0 */
@@ -1870,11 +1870,11 @@ hcall_real_table:
 	.long	0		/* 0x118 */
 	.long	0		/* 0x11c */
 	.long	0		/* 0x120 */
-	.long	DOTSYM(kvmppc_h_bulk_remove) - hcall_real_table
+	.long	kvmppc_h_bulk_remove - hcall_real_table
 	.long	0		/* 0x128 */
 	.long	0		/* 0x12c */
 	.long	0		/* 0x130 */
-	.long	DOTSYM(kvmppc_h_set_xdabr) - hcall_real_table
+	.long	kvmppc_h_set_xdabr - hcall_real_table
 	.long	0		/* 0x138 */
 	.long	0		/* 0x13c */
 	.long	0		/* 0x140 */
@@ -1989,11 +1989,11 @@ hcall_real_table:
 	.long	0		/* 0x2f4 */
 	.long	0		/* 0x2f8 */
 #ifdef CONFIG_KVM_XICS
-	.long	DOTSYM(xics_rm_h_xirr_x) - hcall_real_table
+	.long	xics_rm_h_xirr_x - hcall_real_table
 #else
 	.long	0		/* 0x2fc - H_XIRR_X*/
 #endif
-	.long	DOTSYM(kvmppc_rm_h_random) - hcall_real_table
+	.long	kvmppc_rm_h_random - hcall_real_table
 	.globl	hcall_real_table_end
 hcall_real_table_end:
 
diff --git a/arch/powerpc/kvm/book3s_interrupts.S b/arch/powerpc/kvm/book3s_interrupts.S
index f4bec2fc51aa..d65d405dabdc 100644
--- a/arch/powerpc/kvm/book3s_interrupts.S
+++ b/arch/powerpc/kvm/book3s_interrupts.S
@@ -15,15 +15,9 @@
 #include <asm/asm-compat.h>
 
 #if defined(CONFIG_PPC_BOOK3S_64)
-#ifdef CONFIG_PPC64_ELF_ABI_V2
-#define FUNC(name) 		name
-#else
-#define FUNC(name) 		GLUE(.,name)
-#endif
 #define GET_SHADOW_VCPU(reg)    addi	reg, r13, PACA_SVCPU
 
 #elif defined(CONFIG_PPC_BOOK3S_32)
-#define FUNC(name)		name
 #define GET_SHADOW_VCPU(reg)	lwz     reg, (THREAD + THREAD_KVM_SVCPU)(r2)
 
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -85,7 +79,7 @@ kvm_start_entry:
 
 kvm_start_lightweight:
 	/* Copy registers into shadow vcpu so we can access them in real mode */
-	bl	FUNC(kvmppc_copy_to_svcpu)
+	bl	kvmppc_copy_to_svcpu
 	nop
 	REST_GPR(3, r1)
 
@@ -123,7 +117,7 @@ after_sprg3_load:
 	PPC_LL	r4, VCPU_SHADOW_MSR(r3)	/* get shadow_msr */
 
 	/* Jump to segment patching handler and into our guest */
-	bl	FUNC(kvmppc_entry_trampoline)
+	bl	kvmppc_entry_trampoline
 	nop
 
 /*
@@ -154,7 +148,7 @@ after_sprg3_load:
 
 	/* Transfer reg values from shadow vcpu back to vcpu struct */
 
-	bl	FUNC(kvmppc_copy_from_svcpu)
+	bl	kvmppc_copy_from_svcpu
 	nop
 
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -193,7 +187,7 @@ after_sprg3_load:
 
 	/* Restore r3 (vcpu) */
 	REST_GPR(3, r1)
-	bl	FUNC(kvmppc_handle_exit_pr)
+	bl	kvmppc_handle_exit_pr
 
 	/* If RESUME_GUEST, get back in the loop */
 	cmpwi	r3, RESUME_GUEST
diff --git a/arch/powerpc/kvm/book3s_rmhandlers.S b/arch/powerpc/kvm/book3s_rmhandlers.S
index 0a557ffca9fe..415802bedfdf 100644
--- a/arch/powerpc/kvm/book3s_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_rmhandlers.S
@@ -24,17 +24,7 @@
  *                                                                           *
  ****************************************************************************/
 
-#if defined(CONFIG_PPC_BOOK3S_64)
-
-#ifdef CONFIG_PPC64_ELF_ABI_V2
-#define FUNC(name) 		name
-#else
-#define FUNC(name) 		GLUE(.,name)
-#endif
-
-#elif defined(CONFIG_PPC_BOOK3S_32)
-
-#define FUNC(name)		name
+#if defined(CONFIG_PPC_BOOK3S_32)
 
 #define RFI_TO_KERNEL	rfi
 #define RFI_TO_GUEST	rfi
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 72b7bb34fade..65f1b80ae589 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -13,12 +13,6 @@
 #include <asm/types.h>
 #include <asm/ppc-opcode.h>
 
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-#define FUNCTION_DESCR_SIZE	24
-#else
-#define FUNCTION_DESCR_SIZE	0
-#endif
-
 #define CTX_NIA(ctx) ((unsigned long)ctx->idx * 4)
 
 #define PLANT_INSTR(d, idx, instr)					      \
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index e93aefcfb83f..dec3119e2bdb 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -152,7 +152,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	extable_len = fp->aux->num_exentries * sizeof(struct exception_table_entry);
 
 	proglen = cgctx.idx * 4;
-	alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
+	alloclen = proglen + fixup_len + extable_len;
 
 	bpf_hdr = bpf_jit_binary_alloc(alloclen, &image, 4, bpf_jit_fill_ill_insns);
 	if (!bpf_hdr) {
@@ -161,10 +161,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	}
 
 	if (extable_len)
-		fp->aux->extable = (void *)image + FUNCTION_DESCR_SIZE + proglen + fixup_len;
+		fp->aux->extable = (void *)image + proglen + fixup_len;
 
 skip_init_ctx:
-	code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
+	code_base = (u32 *)image;
 
 	/* Code generation passes 1-2 */
 	for (pass = 1; pass < 3; pass++) {
@@ -191,15 +191,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		 */
 		bpf_jit_dump(flen, proglen, pass, code_base);
 
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	/* Function descriptor nastiness: Address + TOC */
-	((u64 *)image)[0] = (u64)code_base;
-	((u64 *)image)[1] = local_paca->kernel_toc;
-#endif
-
 	fp->bpf_func = (void *)image;
 	fp->jited = 1;
-	fp->jited_len = proglen + FUNCTION_DESCR_SIZE;
+	fp->jited_len = proglen;
 
 	bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + bpf_hdr->size);
 	if (!fp->is_func || extra_pass) {
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 0f8048f6dad6..4a5cc7acf21e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -127,8 +127,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	int i;
 
 #ifndef CONFIG_PPC_KERNEL_PCREL
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
-		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
+	EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
 #endif
 
 	/*
@@ -247,9 +246,6 @@ int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func
 	if (WARN_ON_ONCE(func && is_module_text_address(func)))
 		return -EINVAL;
 
-	/* skip past descriptor if elf v1 */
-	func += FUNCTION_DESCR_SIZE;
-
 	/* Load function address into r12 */
 	PPC_LI64(_R12, func);
 
@@ -285,8 +281,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	int b2p_index = bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size = 8;
 
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
-		bpf_tailcall_prologue_size += 4; /* skip past the toc load */
+	bpf_tailcall_prologue_size += 4; /* skip past the toc load */
 
 	/*
 	 * if (index >= array->map.max_entries)
@@ -326,7 +321,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	/* goto *(prog->bpf_func + prologue_size); */
 	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), offsetof(struct bpf_prog, bpf_func)));
 	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
-			FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
+			  bpf_tailcall_prologue_size));
 	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_1)));
 
 	/* tear down stack, restore NVRs, ... */
@@ -743,7 +738,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				break;
 			case STF_BARRIER_FALLBACK:
 				ctx->seen |= SEEN_FUNC;
-				PPC_LI64(_R12, dereference_kernel_function_descriptor(bpf_stf_barrier));
+				PPC_LI64(_R12, bpf_stf_barrier);
 				EMIT(PPC_RAW_MTCTR(_R12));
 				EMIT(PPC_RAW_BCTRL());
 				break;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 45fd975ef521..51d00f5aadc7 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -627,12 +627,6 @@ config CPU_LITTLE_ENDIAN
 
 endchoice
 
-config PPC64_ELF_ABI_V1
-	def_bool PPC64 && (CPU_BIG_ENDIAN && !PPC64_BIG_ENDIAN_ELF_ABI_V2)
-
-config PPC64_ELF_ABI_V2
-	def_bool PPC64 && !PPC64_ELF_ABI_V1
-
 config PPC64_BOOT_WRAPPER
 	def_bool n
 	depends on CPU_LITTLE_ENDIAN
diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 7257b8c44626..8e7e559d6098 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -5,11 +5,7 @@ vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
 else
-ifdef CONFIG_PPC64_ELF_ABI_V2
 override flavour := linux-ppc64-elfv2
-else
-override flavour := linux-ppc64
-endif
 endif
 
 quiet_cmd_perl = PERL    $@
diff --git a/kernel/extable.c b/kernel/extable.c
index 71f482581cab..3b559b2d55a9 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -133,7 +133,7 @@ int kernel_text_address(unsigned long addr)
 }
 
 /*
- * On some architectures (PPC64, IA64, PARISC) function pointers
+ * On some architectures (IA64, PARISC) function pointers
  * are actually only tokens to some data that then holds the
  * real function address. As a result, to find if a function
  * pointer is part of the kernel text, we need to do some
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 76973a70ab9d..d50ca738d408 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -4122,23 +4122,11 @@ struct ftrace_glob {
 	int type;
 };
 
-/*
- * If symbols in an architecture don't correspond exactly to the user-visible
- * name of what they represent, it is possible to define this function to
- * perform the necessary adjustments.
-*/
-char * __weak arch_ftrace_match_adjust(char *str, const char *search)
-{
-	return str;
-}
-
 static int ftrace_match(char *str, struct ftrace_glob *g)
 {
 	int matched = 0;
 	int slen;
 
-	str = arch_ftrace_match_adjust(str, g->search);
-
 	switch (g->type) {
 	case MATCH_FULL:
 		if (strcmp(str, g->search) == 0)
-- 
2.40.1

