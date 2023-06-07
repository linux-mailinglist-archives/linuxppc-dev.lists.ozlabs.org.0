Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8E7266AD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:05:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbtxr0PFqz3fl0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:05:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fo+lWdgx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fo+lWdgx;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbtrM4fnKz3dxc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8C9B64017;
	Wed,  7 Jun 2023 17:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D96C4339B;
	Wed,  7 Jun 2023 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157217;
	bh=YwdyMOFiMM4b+Oq4263LspVmP2AelPho5rnnpwWdmh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fo+lWdgxhxlSD3N1QkTZwi89/m6iR4G6k8jatenF6dlOxeuh1kqa1UZvRG/NdbVwM
	 P1NyU+o4sf77fnuS9Dliz4FcXct12JObIk0TYt4onBqF5SGWnz8OccbWfZ9JxOY2bK
	 bX+cEqqCj3Zmu9v7irEbKh/P9lFKJMK4wRsNRlN7L8/UcFuEltOIrNTVL7SY+4gged
	 pDXOcCchM17ApEsc6N1XvIdVj/nRmUEC9Wo5CqICdwfVHOsP/tzyUSfnGF2TrfqBdY
	 5PR1VgcYZ3RndtEdWGt/uZcL3iecTgtZmQpSbJlTr6512RrDzH5fGhJCHU20N8VOcm
	 tsRNOKu5AftkA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 15/15] powerpc/ftrace: Add support for -fpatchable-function-entry
Date: Wed,  7 Jun 2023 22:25:30 +0530
Message-Id: <d8f6feb3d9a72ecfe1df279e99e6e7f29d634c5e.1686151854.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686151854.git.naveen@kernel.org>
References: <cover.1686151854.git.naveen@kernel.org>
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

GCC v13.1 updated support for -fpatchable-function-entry on ppc64le to
emit nops after the local entry point, rather than before it. This
allows us to use this in the kernel for ftrace purposes. A new script is
added under arch/powerpc/tools/ to help detect if nops are emitted after
the function local entry point, or before the global entry point.

With -fpatchable-function-entry, we no longer have the profiling
instructions generated at function entry, so we only need to validate
the presence of two nops at the ftrace location in ftrace_init_nop(). We
patch the preceding instruction with 'mflr r0' to match the
-mprofile-kernel ABI for subsequent ftrace use.

This changes the profiling instructions used on ppc32. The default -pg
option emits an additional 'stw' instruction after 'mflr r0' and before
the branch to _mcount 'bl _mcount'. This is very similar to the original
-mprofile-kernel implementation on ppc64le, where an additional 'std'
instruction was used to save LR to its save location in the caller's
stackframe. Subsequently, this additional store was removed in later
compiler versions for performance reasons. The same reasons apply for
ppc32 so we only patch in a 'mflr r0'.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                          | 14 +++++++---
 arch/powerpc/Makefile                         |  5 ++++
 arch/powerpc/include/asm/ftrace.h             |  6 +++--
 arch/powerpc/include/asm/vermagic.h           |  4 ++-
 arch/powerpc/kernel/module_64.c               |  2 +-
 arch/powerpc/kernel/trace/ftrace.c            | 14 ++++++++--
 arch/powerpc/kernel/trace/ftrace_entry.S      |  2 ++
 .../gcc-check-fpatchable-function-entry.sh    | 26 +++++++++++++++++++
 8 files changed, 64 insertions(+), 9 deletions(-)
 create mode 100755 arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda14..9352d8e68152e1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -187,6 +187,7 @@ config PPC
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
 	select EDAC_ATOMIC_SCRUB
 	select EDAC_SUPPORT
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	select GENERIC_ATOMIC64			if PPC32
 	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
 	select GENERIC_CMOS_UPDATE
@@ -227,8 +228,8 @@ config PPC
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
-	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if MPROFILE_KERNEL || PPC32
-	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if MPROFILE_KERNEL || PPC32
+	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_FAST_GUP
@@ -256,7 +257,7 @@ config PPC
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
-	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
+	select HAVE_OBJTOOL			if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
@@ -550,6 +551,13 @@ config MPROFILE_KERNEL
 	depends on PPC64 && CPU_LITTLE_ENDIAN && FUNCTION_TRACER
 	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -I$(srctree)/include -D__KERNEL__)
 
+config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
+	depends on $(cc-option,-fpatchable-function-entry=2)
+	def_bool y if PPC32
+	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
+	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
+
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
 	depends on SMP && (PPC_PSERIES || \
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index dca73f673d7046..de39478b1c9e9f 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -148,11 +148,16 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
 ifdef CONFIG_FUNCTION_TRACER
+ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+else
 CC_FLAGS_FTRACE := -pg
 ifdef CONFIG_MPROFILE_KERNEL
 CC_FLAGS_FTRACE += -mprofile-kernel
 endif
 endif
+endif
 
 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 89fbae3caa1fc2..0d61e8080cece5 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -11,7 +11,7 @@
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
 /* Ignore unused weak functions which will have larger offsets */
-#ifdef CONFIG_MPROFILE_KERNEL
+#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
 #define FTRACE_MCOUNT_MAX_OFFSET	12
 #elif defined(CONFIG_PPC32)
 #define FTRACE_MCOUNT_MAX_OFFSET	8
@@ -22,7 +22,9 @@ extern void _mcount(void);
 
 static inline unsigned long ftrace_call_adjust(unsigned long addr)
 {
-       /* relocation of mcount call site is the same as the address */
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
+		addr += MCOUNT_INSN_SIZE;
+
        return addr;
 }
 
diff --git a/arch/powerpc/include/asm/vermagic.h b/arch/powerpc/include/asm/vermagic.h
index b054a8576e5deb..6f250fe506bd1c 100644
--- a/arch/powerpc/include/asm/vermagic.h
+++ b/arch/powerpc/include/asm/vermagic.h
@@ -2,7 +2,9 @@
 #ifndef _ASM_VERMAGIC_H
 #define _ASM_VERMAGIC_H
 
-#ifdef CONFIG_MPROFILE_KERNEL
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+#define MODULE_ARCH_VERMAGIC_FTRACE	"patchable-function-entry "
+#elif defined(CONFIG_MPROFILE_KERNEL)
 #define MODULE_ARCH_VERMAGIC_FTRACE	"mprofile-kernel "
 #else
 #define MODULE_ARCH_VERMAGIC_FTRACE	""
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 92570289ce08f5..7112adc597a80b 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -465,7 +465,7 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 	return 0;
 }
 
-#ifdef CONFIG_MPROFILE_KERNEL
+#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
 
 static u32 stub_insns[] = {
 #ifdef CONFIG_PPC_KERNEL_PCREL
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index fd1ef350c62c42..a03aa4fd7a08ba 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -220,7 +220,12 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	int ret = 0;
 
 	/* Verify instructions surrounding the ftrace location */
-	if (IS_ENABLED(CONFIG_PPC32)) {
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
+		/* Expect nops */
+		ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
+		if (!ret)
+			ret = ftrace_validate_inst(ip, ppc_inst(PPC_RAW_NOP()));
+	} else if (IS_ENABLED(CONFIG_PPC32)) {
 		/* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mcount' */
 		ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
 		if (!ret)
@@ -250,7 +255,12 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	/* Nop-out the ftrace location */
 	new = ppc_inst(PPC_RAW_NOP());
 	addr = MCOUNT_ADDR;
-	if (is_offset_in_branch_range(addr - ip)) {
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
+		/* we instead patch-in the 'mflr r0' */
+		old = ppc_inst(PPC_RAW_NOP());
+		new = ppc_inst(PPC_RAW_MFLR(_R0));
+		ret = ftrace_modify_code(ip - 4, old, new);
+	} else if (is_offset_in_branch_range(addr - ip)) {
 		/* Within range */
 		old = ftrace_create_branch_inst(ip, addr, 1);
 		ret = ftrace_modify_code(ip, old, new);
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index e8339706e735b1..bab3ab1368a33f 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -250,6 +250,7 @@ livepatch_handler:
 	blr
 #endif /* CONFIG_LIVEPATCH */
 
+#ifndef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 _GLOBAL(mcount)
 _GLOBAL(_mcount)
 EXPORT_SYMBOL(_mcount)
@@ -257,6 +258,7 @@ EXPORT_SYMBOL(_mcount)
 	mtctr	r12
 	mtlr	r0
 	bctr
+#endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(return_to_handler)
diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
new file mode 100755
index 00000000000000..06706903503b6c
--- /dev/null
+++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+set -o pipefail
+
+# To debug, uncomment the following line
+# set -x
+
+# Output from -fpatchable-function-entry can only vary on ppc64 elfv2, so this
+# should not be invoked for other targets. Therefore we can pass in -m64 and
+# -mabi explicitly, to take care of toolchains defaulting to other targets.
+
+# Test whether the compile option -fpatchable-function-entry exists and
+# generates appropriate code
+echo "int func() { return 0; }" | \
+    $* -m64 -mabi=elfv2 -S -x c -O2 -fpatchable-function-entry=2 - -o - 2> /dev/null | \
+    grep -q "__patchable_function_entries"
+
+# Test whether nops are generated after the local entry point
+echo "int x; int func() { return x; }" | \
+    $* -m64 -mabi=elfv2 -S -x c -O2 -fpatchable-function-entry=2 - -o - 2> /dev/null | \
+    awk 'BEGIN { RS = ";" } /\.localentry.*nop.*\n[[:space:]]*nop/ { print $0 }' | \
+    grep -q "func:"
+
+exit 0
-- 
2.40.1

