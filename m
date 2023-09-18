Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA27A429E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:32:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TBLQcR1l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpxN33dF3z3cnM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:32:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TBLQcR1l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxKV3ry7z30GC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:30:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D32ADB80BEC;
	Mon, 18 Sep 2023 07:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D537C433C8;
	Mon, 18 Sep 2023 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022234;
	bh=bvwcP2LqH7M0LqBQS8gC0daDhK3BG4ji8BhLvEjeq+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TBLQcR1lAmU6KOalSsJ/oR1o5zZoazG/YXTfJUDqgJb0o6vPktmqTK+vjgO53nDe2
	 wRRsB421t+7jR7di9+tRCC1Vc5UL9ISE3HJXSgRpGXB2AcnDWCxIzabugyKHowlQRM
	 dVtPneEfqW56D4trpvlIHzeEr1S//A3oRTZGBXCHfaluSiZJrflI+JHArvH50+TYYA
	 RgIwhEVFloUsg24G4ybg8nt2Ea/Mr7bBH7Fum/wXH0+jrq62z5TRAralvtFuyV85hy
	 FhD+mpWRLiJSUQyEBvo38Sy93YKxiF+tl1IvR4PCSFVan844bfOzzMlfFZccF2EytU
	 +u0ufqp2nMUIg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
Date: Mon, 18 Sep 2023 10:29:44 +0300
Message-Id: <20230918072955.2507221-3-rppt@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918072955.2507221-1-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis
  Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

module_alloc() is used everywhere as a mean to allocate memory for code.

Beside being semantically wrong, this unnecessarily ties all subsystems
that need to allocate code, such as ftrace, kprobes and BPF to modules
and puts the burden of code allocation to the modules code.

Several architectures override module_alloc() because of various
constraints where the executable memory can be located and this causes
additional obstacles for improvements of code allocation.

Start splitting code allocation from modules by introducing
execmem_text_alloc() and execmem_free() APIs.

Initially, execmem_text_alloc() is a wrapper for module_alloc() and
execmem_free() is a replacement of module_memfree() to allow updating all
call sites to use the new APIs.

Since architectures define different restrictions on placement,
permissions, alignment and other parameters for memory that can be used by
different subsystems that allocate executable memory, execmem_text_alloc()
takes a type argument, that will be used to identify the calling subsystem
and to allow architectures define parameters for ranges suitable for that
subsystem.

The name execmem_text_alloc() emphasizes that the allocated memory is for
executable code, the allocations of the associated data, like data sections
of a module will use execmem_data_alloc() interface that will be added
later.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kernel/kprobes.c    |  4 +--
 arch/s390/kernel/ftrace.c        |  4 +--
 arch/s390/kernel/kprobes.c       |  4 +--
 arch/s390/kernel/module.c        |  5 +--
 arch/sparc/net/bpf_jit_comp_32.c |  8 ++---
 arch/x86/kernel/ftrace.c         |  6 ++--
 arch/x86/kernel/kprobes/core.c   |  4 +--
 include/linux/execmem.h          | 56 ++++++++++++++++++++++++++++++++
 include/linux/moduleloader.h     |  3 --
 kernel/bpf/core.c                |  6 ++--
 kernel/kprobes.c                 |  8 ++---
 kernel/module/Kconfig            |  1 +
 kernel/module/main.c             | 25 +++++---------
 mm/Kconfig                       |  3 ++
 mm/Makefile                      |  1 +
 mm/execmem.c                     | 26 +++++++++++++++
 16 files changed, 120 insertions(+), 44 deletions(-)
 create mode 100644 include/linux/execmem.h
 create mode 100644 mm/execmem.c

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index b20ee72e873a..62228c7072a2 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -19,8 +19,8 @@
 #include <linux/extable.h>
 #include <linux/kdebug.h>
 #include <linux/slab.h>
-#include <linux/moduleloader.h>
 #include <linux/set_memory.h>
+#include <linux/execmem.h>
 #include <asm/code-patching.h>
 #include <asm/cacheflush.h>
 #include <asm/sstep.h>
@@ -130,7 +130,7 @@ void *alloc_insn_page(void)
 {
 	void *page;
 
-	page = module_alloc(PAGE_SIZE);
+	page = execmem_text_alloc(EXECMEM_KPROBES, PAGE_SIZE);
 	if (!page)
 		return NULL;
 
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index c46381ea04ec..4052e10eb6a4 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -7,13 +7,13 @@
  *   Author(s): Martin Schwidefsky <schwidefsky@de.ibm.com>
  */
 
-#include <linux/moduleloader.h>
 #include <linux/hardirq.h>
 #include <linux/uaccess.h>
 #include <linux/ftrace.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/kprobes.h>
+#include <linux/execmem.h>
 #include <trace/syscall.h>
 #include <asm/asm-offsets.h>
 #include <asm/text-patching.h>
@@ -220,7 +220,7 @@ static int __init ftrace_plt_init(void)
 {
 	const char *start, *end;
 
-	ftrace_plt = module_alloc(PAGE_SIZE);
+	ftrace_plt = execmem_text_alloc(EXECMEM_FTRACE, PAGE_SIZE);
 	if (!ftrace_plt)
 		panic("cannot allocate ftrace plt\n");
 
diff --git a/arch/s390/kernel/kprobes.c b/arch/s390/kernel/kprobes.c
index d4b863ed0aa7..48928460dcb9 100644
--- a/arch/s390/kernel/kprobes.c
+++ b/arch/s390/kernel/kprobes.c
@@ -9,7 +9,6 @@
 
 #define pr_fmt(fmt) "kprobes: " fmt
 
-#include <linux/moduleloader.h>
 #include <linux/kprobes.h>
 #include <linux/ptrace.h>
 #include <linux/preempt.h>
@@ -21,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/hardirq.h>
 #include <linux/ftrace.h>
+#include <linux/execmem.h>
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/dis.h>
@@ -38,7 +38,7 @@ void *alloc_insn_page(void)
 {
 	void *page;
 
-	page = module_alloc(PAGE_SIZE);
+	page = execmem_text_alloc(EXECMEM_KPROBES, PAGE_SIZE);
 	if (!page)
 		return NULL;
 	set_memory_rox((unsigned long)page, 1);
diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
index 42215f9404af..db5561d0c233 100644
--- a/arch/s390/kernel/module.c
+++ b/arch/s390/kernel/module.c
@@ -21,6 +21,7 @@
 #include <linux/moduleloader.h>
 #include <linux/bug.h>
 #include <linux/memory.h>
+#include <linux/execmem.h>
 #include <asm/alternative.h>
 #include <asm/nospec-branch.h>
 #include <asm/facility.h>
@@ -76,7 +77,7 @@ void *module_alloc(unsigned long size)
 #ifdef CONFIG_FUNCTION_TRACER
 void module_arch_cleanup(struct module *mod)
 {
-	module_memfree(mod->arch.trampolines_start);
+	execmem_free(mod->arch.trampolines_start);
 }
 #endif
 
@@ -510,7 +511,7 @@ static int module_alloc_ftrace_hotpatch_trampolines(struct module *me,
 
 	size = FTRACE_HOTPATCH_TRAMPOLINES_SIZE(s->sh_size);
 	numpages = DIV_ROUND_UP(size, PAGE_SIZE);
-	start = module_alloc(numpages * PAGE_SIZE);
+	start = execmem_text_alloc(EXECMEM_FTRACE, numpages * PAGE_SIZE);
 	if (!start)
 		return -ENOMEM;
 	set_memory_rox((unsigned long)start, numpages);
diff --git a/arch/sparc/net/bpf_jit_comp_32.c b/arch/sparc/net/bpf_jit_comp_32.c
index a74e5004c6c8..5fa9c45fba0a 100644
--- a/arch/sparc/net/bpf_jit_comp_32.c
+++ b/arch/sparc/net/bpf_jit_comp_32.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/moduleloader.h>
 #include <linux/workqueue.h>
 #include <linux/netdevice.h>
 #include <linux/filter.h>
 #include <linux/cache.h>
 #include <linux/if_vlan.h>
+#include <linux/execmem.h>
 
 #include <asm/cacheflush.h>
 #include <asm/ptrace.h>
@@ -713,7 +713,7 @@ cond_branch:			f_offset = addrs[i + filter[i].jf];
 				if (unlikely(proglen + ilen > oldproglen)) {
 					pr_err("bpb_jit_compile fatal error\n");
 					kfree(addrs);
-					module_memfree(image);
+					execmem_free(image);
 					return;
 				}
 				memcpy(image + proglen, temp, ilen);
@@ -736,7 +736,7 @@ cond_branch:			f_offset = addrs[i + filter[i].jf];
 			break;
 		}
 		if (proglen == oldproglen) {
-			image = module_alloc(proglen);
+			image = execmem_text_alloc(EXECMEM_BPF, proglen);
 			if (!image)
 				goto out;
 		}
@@ -758,7 +758,7 @@ cond_branch:			f_offset = addrs[i + filter[i].jf];
 void bpf_jit_free(struct bpf_prog *fp)
 {
 	if (fp->jited)
-		module_memfree(fp->bpf_func);
+		execmem_free(fp->bpf_func);
 
 	bpf_prog_unlock_free(fp);
 }
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 12df54ff0e81..ae56d79a6a74 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -25,6 +25,7 @@
 #include <linux/memory.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
+#include <linux/execmem.h>
 
 #include <trace/syscall.h>
 
@@ -261,15 +262,14 @@ void arch_ftrace_update_code(int command)
 #ifdef CONFIG_X86_64
 
 #ifdef CONFIG_MODULES
-#include <linux/moduleloader.h>
 /* Module allocation simplifies allocating memory for code */
 static inline void *alloc_tramp(unsigned long size)
 {
-	return module_alloc(size);
+	return execmem_text_alloc(EXECMEM_FTRACE, size);
 }
 static inline void tramp_free(void *tramp)
 {
-	module_memfree(tramp);
+	execmem_free(tramp);
 }
 #else
 /* Trampolines can only be created if modules are supported */
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index e8babebad7b8..c4f58e893efd 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -40,12 +40,12 @@
 #include <linux/kgdb.h>
 #include <linux/ftrace.h>
 #include <linux/kasan.h>
-#include <linux/moduleloader.h>
 #include <linux/objtool.h>
 #include <linux/vmalloc.h>
 #include <linux/pgtable.h>
 #include <linux/set_memory.h>
 #include <linux/cfi.h>
+#include <linux/execmem.h>
 
 #include <asm/text-patching.h>
 #include <asm/cacheflush.h>
@@ -448,7 +448,7 @@ void *alloc_insn_page(void)
 {
 	void *page;
 
-	page = module_alloc(PAGE_SIZE);
+	page = execmem_text_alloc(EXECMEM_KPROBES, PAGE_SIZE);
 	if (!page)
 		return NULL;
 
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
new file mode 100644
index 000000000000..3491bf7e9714
--- /dev/null
+++ b/include/linux/execmem.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_EXECMEM_ALLOC_H
+#define _LINUX_EXECMEM_ALLOC_H
+
+#include <linux/types.h>
+
+/**
+ * enum execmem_type - types of executable memory ranges
+ *
+ * There are several subsystems that allocate executable memory.
+ * Architectures define different restrictions on placement,
+ * permissions, alignment and other parameters for memory that can be used
+ * by these subsystems.
+ * Types in this enum identify subsystems that allocate executable memory
+ * and let architectures define parameters for ranges suitable for
+ * allocations by each subsystem.
+ *
+ * @EXECMEM_DEFAULT: default parameters that would be used for types that
+ * are not explcitly defined.
+ * @EXECMEM_MODULE_TEXT: parameters for module text sections
+ * @EXECMEM_KPROBES: parameters for kprobes
+ * @EXECMEM_FTRACE: parameters for ftrace
+ * @EXECMEM_BPF: parameters for BPF
+ * @EXECMEM_TYPE_MAX:
+ */
+enum execmem_type {
+	EXECMEM_DEFAULT,
+	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
+	EXECMEM_KPROBES,
+	EXECMEM_FTRACE,
+	EXECMEM_BPF,
+	EXECMEM_TYPE_MAX,
+};
+
+/**
+ * execmem_text_alloc - allocate executable memory
+ * @type: type of the allocation
+ * @size: how many bytes of memory are required
+ *
+ * Allocates memory that will contain executable code, either generated or
+ * loaded from kernel modules.
+ *
+ * The memory will have protections defined by architecture for executable
+ * region of the @type.
+ *
+ * Return: a pointer to the allocated memory or %NULL
+ */
+void *execmem_text_alloc(enum execmem_type type, size_t size);
+
+/**
+ * execmem_free - free executable memory
+ * @ptr: pointer to the memory that should be freed
+ */
+void execmem_free(void *ptr);
+
+#endif /* _LINUX_EXECMEM_ALLOC_H */
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 001b2ce83832..a23718aa2f4d 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -29,9 +29,6 @@ unsigned int arch_mod_section_prepend(struct module *mod, unsigned int section);
    sections.  Returns NULL on failure. */
 void *module_alloc(unsigned long size);
 
-/* Free memory returned from module_alloc. */
-void module_memfree(void *module_region);
-
 /* Determines if the section name is an init section (that is only used during
  * module loading).
  */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 4e3ce0542e31..75249f2d9f77 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -22,7 +22,6 @@
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
 #include <linux/random.h>
-#include <linux/moduleloader.h>
 #include <linux/bpf.h>
 #include <linux/btf.h>
 #include <linux/objtool.h>
@@ -37,6 +36,7 @@
 #include <linux/nospec.h>
 #include <linux/bpf_mem_alloc.h>
 #include <linux/memcontrol.h>
+#include <linux/execmem.h>
 
 #include <asm/barrier.h>
 #include <asm/unaligned.h>
@@ -1007,12 +1007,12 @@ void bpf_jit_uncharge_modmem(u32 size)
 
 void *__weak bpf_jit_alloc_exec(unsigned long size)
 {
-	return module_alloc(size);
+	return execmem_text_alloc(EXECMEM_BPF, size);
 }
 
 void __weak bpf_jit_free_exec(void *addr)
 {
-	module_memfree(addr);
+	execmem_free(addr);
 }
 
 struct bpf_binary_header *
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 0c6185aefaef..0ccb4d2ec9a2 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -26,7 +26,6 @@
 #include <linux/slab.h>
 #include <linux/stddef.h>
 #include <linux/export.h>
-#include <linux/moduleloader.h>
 #include <linux/kallsyms.h>
 #include <linux/freezer.h>
 #include <linux/seq_file.h>
@@ -39,6 +38,7 @@
 #include <linux/jump_label.h>
 #include <linux/static_call.h>
 #include <linux/perf_event.h>
+#include <linux/execmem.h>
 
 #include <asm/sections.h>
 #include <asm/cacheflush.h>
@@ -113,17 +113,17 @@ enum kprobe_slot_state {
 void __weak *alloc_insn_page(void)
 {
 	/*
-	 * Use module_alloc() so this page is within +/- 2GB of where the
+	 * Use execmem_text_alloc() so this page is within +/- 2GB of where the
 	 * kernel image and loaded module images reside. This is required
 	 * for most of the architectures.
 	 * (e.g. x86-64 needs this to handle the %rip-relative fixups.)
 	 */
-	return module_alloc(PAGE_SIZE);
+	return execmem_text_alloc(EXECMEM_KPROBES, PAGE_SIZE);
 }
 
 static void free_insn_page(void *page)
 {
-	module_memfree(page);
+	execmem_free(page);
 }
 
 struct kprobe_insn_cache kprobe_insn_slots = {
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 33a2e991f608..813e116bdee6 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -2,6 +2,7 @@
 menuconfig MODULES
 	bool "Enable loadable module support"
 	modules
+	select EXECMEM
 	help
 	  Kernel modules are small pieces of compiled code which can
 	  be inserted in the running kernel, rather than being
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 98fedfdb8db5..4ec982cc943c 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -57,6 +57,7 @@
 #include <linux/audit.h>
 #include <linux/cfi.h>
 #include <linux/debugfs.h>
+#include <linux/execmem.h>
 #include <uapi/linux/module.h>
 #include "internal.h"
 
@@ -1179,16 +1180,6 @@ resolve_symbol_wait(struct module *mod,
 	return ksym;
 }
 
-void __weak module_memfree(void *module_region)
-{
-	/*
-	 * This memory may be RO, and freeing RO memory in an interrupt is not
-	 * supported by vmalloc.
-	 */
-	WARN_ON(in_interrupt());
-	vfree(module_region);
-}
-
 void __weak module_arch_cleanup(struct module *mod)
 {
 }
@@ -1207,7 +1198,7 @@ static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
 {
 	if (mod_mem_use_vmalloc(type))
 		return vzalloc(size);
-	return module_alloc(size);
+	return execmem_text_alloc(EXECMEM_MODULE_TEXT, size);
 }
 
 static void module_memory_free(void *ptr, enum mod_mem_type type)
@@ -1215,7 +1206,7 @@ static void module_memory_free(void *ptr, enum mod_mem_type type)
 	if (mod_mem_use_vmalloc(type))
 		vfree(ptr);
 	else
-		module_memfree(ptr);
+		execmem_free(ptr);
 }
 
 static void free_mod_mem(struct module *mod)
@@ -2479,9 +2470,9 @@ static void do_free_init(struct work_struct *w)
 
 	llist_for_each_safe(pos, n, list) {
 		initfree = container_of(pos, struct mod_initfree, node);
-		module_memfree(initfree->init_text);
-		module_memfree(initfree->init_data);
-		module_memfree(initfree->init_rodata);
+		execmem_free(initfree->init_text);
+		execmem_free(initfree->init_data);
+		execmem_free(initfree->init_rodata);
 		kfree(initfree);
 	}
 }
@@ -2584,10 +2575,10 @@ static noinline int do_init_module(struct module *mod)
 	 * We want to free module_init, but be aware that kallsyms may be
 	 * walking this with preempt disabled.  In all the failure paths, we
 	 * call synchronize_rcu(), but we don't want to slow down the success
-	 * path. module_memfree() cannot be called in an interrupt, so do the
+	 * path. execmem_free() cannot be called in an interrupt, so do the
 	 * work and call synchronize_rcu() in a work queue.
 	 *
-	 * Note that module_alloc() on most architectures creates W+X page
+	 * Note that execmem_text_alloc() on most architectures creates W+X page
 	 * mappings which won't be cleaned up until do_free_init() runs.  Any
 	 * code such as mark_rodata_ro() which depends on those mappings to
 	 * be cleaned up needs to sync with the queued work - ie
diff --git a/mm/Kconfig b/mm/Kconfig
index 264a2df5ecf5..fb12931238e8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1258,6 +1258,9 @@ config LOCK_MM_AND_FIND_VMA
 	bool
 	depends on !STACK_GROWSUP
 
+config EXECMEM
+	bool
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index ec65984e2ade..2e5fec94f09c 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -138,3 +138,4 @@ obj-$(CONFIG_IO_MAPPING) += io-mapping.o
 obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
 obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
+obj-$(CONFIG_EXECMEM) += execmem.o
diff --git a/mm/execmem.c b/mm/execmem.c
new file mode 100644
index 000000000000..638dc2b26a81
--- /dev/null
+++ b/mm/execmem.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/execmem.h>
+#include <linux/moduleloader.h>
+
+static void *execmem_alloc(size_t size)
+{
+	return module_alloc(size);
+}
+
+void *execmem_text_alloc(enum execmem_type type, size_t size)
+{
+	return execmem_alloc(size);
+}
+
+void execmem_free(void *ptr)
+{
+	/*
+	 * This memory may be RO, and freeing RO memory in an interrupt is not
+	 * supported by vmalloc.
+	 */
+	WARN_ON(in_interrupt());
+	vfree(ptr);
+}
-- 
2.39.2

