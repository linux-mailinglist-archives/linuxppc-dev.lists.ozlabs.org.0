Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A647A42A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:33:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sSCiLbiN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpxP872zJz3cSf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:33:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sSCiLbiN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxKh6X68z3c18
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:30:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 19782CE0B82;
	Mon, 18 Sep 2023 07:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1667C433AB;
	Mon, 18 Sep 2023 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022244;
	bh=sRqJHHj6sN+zVuxAlEgaERQMpk9iFfs+P0v/5bsjzqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sSCiLbiNncF007b8yg/PCaamnCR3IktSTan43cauE8/7iFy9m2xixDIpEVuIJReLP
	 jrggUxEzdIvYURXnGZUsrjawe2u27YGN2kA82YiX1l3NRKgcmaNnhRD4rJ3lwcYZFH
	 kcsyJaoBejSzi/mjeTbKUXDpZatwwEE68FNOT2kvW74EcuAw7/7pEI72l1dj86JMJG
	 tO7yZMu8nliG1qmp1eySQMtAnE8tCUfbmYaCkFhY/eq4QY0IuzpNmP6jmRXX4716Qz
	 r28qd7FAGP4eyZIrKeBmxc2Zjbl6SHjAiWIHvssIlogTeakI1PofbFTxkyfvNtlbRA
	 f8aCB2/C6EHLw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of module_alloc to execmem
Date: Mon, 18 Sep 2023 10:29:45 +0300
Message-Id: <20230918072955.2507221-4-rppt@kernel.org>
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

Several architectures override module_alloc() only to define address
range for code allocations different than VMALLOC address space.

Provide a generic implementation in execmem that uses the parameters
for address space ranges, required alignment and page protections
provided by architectures.

The architectures must fill execmem_params structure and implement
execmem_arch_params() that returns a pointer to that structure. This
way the execmem initialization won't be called from every architecture,
but rather from a central place, namely initialization of the core
memory management.

The execmem provides execmem_text_alloc() API that wraps
__vmalloc_node_range() with the parameters defined by the architectures.
If an architecture does not implement execmem_arch_params(),
execmem_text_alloc() will fall back to module_alloc().

The name execmem_text_alloc() emphasizes that the allocated memory is
for executable code, the allocations of the associated data, like data
sections of a module will use execmem_data_alloc() interface that will
be added later.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/loongarch/kernel/module.c | 18 ++++++++--
 arch/mips/kernel/module.c      | 19 +++++++---
 arch/nios2/kernel/module.c     | 19 +++++++---
 arch/parisc/kernel/module.c    | 23 +++++++-----
 arch/riscv/kernel/module.c     | 20 ++++++++---
 arch/sparc/kernel/module.c     | 44 +++++++++++------------
 include/linux/execmem.h        | 44 +++++++++++++++++++++++
 mm/execmem.c                   | 66 ++++++++++++++++++++++++++++++++--
 mm/mm_init.c                   |  2 ++
 9 files changed, 203 insertions(+), 52 deletions(-)

diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
index b8b86088b2dd..a1d8fe9796fa 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -18,6 +18,7 @@
 #include <linux/ftrace.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/execmem.h>
 #include <asm/alternative.h>
 #include <asm/inst.h>
 
@@ -469,10 +470,21 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	return 0;
 }
 
-void *module_alloc(unsigned long size)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.pgprot = PAGE_KERNEL,
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-			GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE, __builtin_return_address(0));
+	execmem_params.ranges[EXECMEM_DEFAULT].start = MODULES_VADDR;
+	execmem_params.ranges[EXECMEM_DEFAULT].end = MODULES_END;
+
+	return &execmem_params;
 }
 
 static void module_init_ftrace_plt(const Elf_Ehdr *hdr,
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 0c936cbf20c5..1c959074b35f 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/jump_label.h>
+#include <linux/execmem.h>
 
 extern void jump_label_apply_nops(struct module *mod);
 
@@ -33,11 +34,21 @@ static LIST_HEAD(dbe_list);
 static DEFINE_SPINLOCK(dbe_lock);
 
 #ifdef MODULE_START
-void *module_alloc(unsigned long size)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.start = MODULE_START,
+			.end = MODULE_END,
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
-				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+	execmem_params.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
+
+	return &execmem_params;
 }
 #endif
 
diff --git a/arch/nios2/kernel/module.c b/arch/nios2/kernel/module.c
index 9c97b7513853..5a8df4f9c04e 100644
--- a/arch/nios2/kernel/module.c
+++ b/arch/nios2/kernel/module.c
@@ -18,15 +18,24 @@
 #include <linux/fs.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/execmem.h>
 
 #include <asm/cacheflush.h>
 
-void *module_alloc(unsigned long size)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.start = MODULES_VADDR,
+			.end = MODULES_END,
+			.pgprot = PAGE_KERNEL_EXEC,
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-				    GFP_KERNEL, PAGE_KERNEL_EXEC,
-				    VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	return &execmem_params;
 }
 
 int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index d214bbe3c2af..0c6dfd1daef3 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -49,6 +49,7 @@
 #include <linux/bug.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/execmem.h>
 
 #include <asm/unwind.h>
 #include <asm/sections.h>
@@ -173,15 +174,21 @@ static inline int reassemble_22(int as22)
 		((as22 & 0x0003ff) << 3));
 }
 
-void *module_alloc(unsigned long size)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.pgprot = PAGE_KERNEL_RWX,
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	/* using RWX means less protection for modules, but it's
-	 * easier than trying to map the text, data, init_text and
-	 * init_data correctly */
-	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
-				    GFP_KERNEL,
-				    PAGE_KERNEL_RWX, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	execmem_params.ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
+	execmem_params.ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
+
+	return &execmem_params;
 }
 
 #ifndef CONFIG_64BIT
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d55fcbd..343a0edfb6dd 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -11,6 +11,7 @@
 #include <linux/vmalloc.h>
 #include <linux/sizes.h>
 #include <linux/pgtable.h>
+#include <linux/execmem.h>
 #include <asm/alternative.h>
 #include <asm/sections.h>
 
@@ -436,12 +437,21 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 }
 
 #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
-void *module_alloc(unsigned long size)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.pgprot = PAGE_KERNEL,
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR,
-				    MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	execmem_params.ranges[EXECMEM_DEFAULT].start = MODULES_VADDR;
+	execmem_params.ranges[EXECMEM_DEFAULT].end = MODULES_END;
+
+	return &execmem_params;
 }
 #endif
 
diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
index 66c45a2764bc..1d8d1fba95b9 100644
--- a/arch/sparc/kernel/module.c
+++ b/arch/sparc/kernel/module.c
@@ -14,6 +14,10 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/mm.h>
+#include <linux/execmem.h>
+#ifdef CONFIG_SPARC64
+#include <linux/jump_label.h>
+#endif
 
 #include <asm/processor.h>
 #include <asm/spitfire.h>
@@ -21,34 +25,26 @@
 
 #include "entry.h"
 
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
 #ifdef CONFIG_SPARC64
-
-#include <linux/jump_label.h>
-
-static void *module_map(unsigned long size)
-{
-	if (PAGE_ALIGN(size) > MODULES_LEN)
-		return NULL;
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
-}
+			.start = MODULES_VADDR,
+			.end = MODULES_END,
 #else
-static void *module_map(unsigned long size)
-{
-	return vmalloc(size);
-}
-#endif /* CONFIG_SPARC64 */
-
-void *module_alloc(unsigned long size)
+			.start = VMALLOC_START,
+			.end = VMALLOC_END,
+#endif
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	void *ret;
-
-	ret = module_map(size);
-	if (ret)
-		memset(ret, 0, size);
+	execmem_params.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
 
-	return ret;
+	return &execmem_params;
 }
 
 /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 3491bf7e9714..44e213625053 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -32,6 +32,44 @@ enum execmem_type {
 	EXECMEM_TYPE_MAX,
 };
 
+/**
+ * struct execmem_range - definition of a memory range suitable for code and
+ *			  related data allocations
+ * @start:	address space start
+ * @end:	address space end (inclusive)
+ * @pgprot:	permissions for memory in this address space
+ * @alignment:	alignment required for text allocations
+ */
+struct execmem_range {
+	unsigned long   start;
+	unsigned long   end;
+	pgprot_t        pgprot;
+	unsigned int	alignment;
+};
+
+/**
+ * struct execmem_params - architecture parameters for code allocations
+ * @ranges: array of ranges defining architecture specific parameters for
+ * each type of executable memory allocations
+ */
+struct execmem_params {
+	struct execmem_range	ranges[EXECMEM_TYPE_MAX];
+};
+
+/**
+ * execmem_arch_params - supply parameters for allocations of executable memory
+ *
+ * A hook for architectures to define parameters for allocations of
+ * executable memory described by struct execmem_params
+ *
+ * For architectures that do not implement this method a default set of
+ * parameters will be used
+ *
+ * Return: a structure defining architecture parameters and restrictions
+ * for allocations of executable memory
+ */
+struct execmem_params *execmem_arch_params(void);
+
 /**
  * execmem_text_alloc - allocate executable memory
  * @type: type of the allocation
@@ -53,4 +91,10 @@ void *execmem_text_alloc(enum execmem_type type, size_t size);
  */
 void execmem_free(void *ptr);
 
+#ifdef CONFIG_EXECMEM
+void execmem_init(void);
+#else
+static inline void execmem_init(void) {}
+#endif
+
 #endif /* _LINUX_EXECMEM_ALLOC_H */
diff --git a/mm/execmem.c b/mm/execmem.c
index 638dc2b26a81..f25a5e064886 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -5,14 +5,26 @@
 #include <linux/execmem.h>
 #include <linux/moduleloader.h>
 
-static void *execmem_alloc(size_t size)
+static struct execmem_params execmem_params;
+
+static void *execmem_alloc(size_t size, struct execmem_range *range)
 {
-	return module_alloc(size);
+	unsigned long start = range->start;
+	unsigned long end = range->end;
+	unsigned int align = range->alignment;
+	pgprot_t pgprot = range->pgprot;
+
+	return __vmalloc_node_range(size, align, start, end,
+				   GFP_KERNEL, pgprot, VM_FLUSH_RESET_PERMS,
+				   NUMA_NO_NODE, __builtin_return_address(0));
 }
 
 void *execmem_text_alloc(enum execmem_type type, size_t size)
 {
-	return execmem_alloc(size);
+	if (!execmem_params.ranges[type].start)
+		return module_alloc(size);
+
+	return execmem_alloc(size, &execmem_params.ranges[type]);
 }
 
 void execmem_free(void *ptr)
@@ -24,3 +36,51 @@ void execmem_free(void *ptr)
 	WARN_ON(in_interrupt());
 	vfree(ptr);
 }
+
+struct execmem_params * __weak execmem_arch_params(void)
+{
+	return NULL;
+}
+
+static bool execmem_validate_params(struct execmem_params *p)
+{
+	struct execmem_range *r = &p->ranges[EXECMEM_DEFAULT];
+
+	if (!r->alignment || !r->start || !r->end || !pgprot_val(r->pgprot)) {
+		pr_crit("Invalid parameters for execmem allocator, module loading will fail");
+		return false;
+	}
+
+	return true;
+}
+
+static void execmem_init_missing(struct execmem_params *p)
+{
+	struct execmem_range *default_range = &p->ranges[EXECMEM_DEFAULT];
+
+	for (int i = EXECMEM_DEFAULT + 1; i < EXECMEM_TYPE_MAX; i++) {
+		struct execmem_range *r = &p->ranges[i];
+
+		if (!r->start) {
+			r->pgprot = default_range->pgprot;
+			r->alignment = default_range->alignment;
+			r->start = default_range->start;
+			r->end = default_range->end;
+		}
+	}
+}
+
+void __init execmem_init(void)
+{
+	struct execmem_params *p = execmem_arch_params();
+
+	if (!p)
+		return;
+
+	if (!execmem_validate_params(p))
+		return;
+
+	execmem_init_missing(p);
+
+	execmem_params = *p;
+}
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 50f2f34745af..7c002b36da21 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -26,6 +26,7 @@
 #include <linux/pgtable.h>
 #include <linux/swap.h>
 #include <linux/cma.h>
+#include <linux/execmem.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -2797,4 +2798,5 @@ void __init mm_core_init(void)
 	pti_init();
 	kmsan_init_runtime();
 	mm_cache_init();
+	execmem_init();
 }
-- 
2.39.2

