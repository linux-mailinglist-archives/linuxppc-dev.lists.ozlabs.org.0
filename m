Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DD28BC144
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 16:32:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LSSt4Ewf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXRnV6tnlz3fmx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 00:31:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LSSt4Ewf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXRhh1TgVz3cTD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 00:27:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C5A360C85;
	Sun,  5 May 2024 14:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7864BC4DDE7;
	Sun,  5 May 2024 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714919265;
	bh=H1Yrs9oS3D7w/IH5Du6/u6WvPsm3z4WLJALiS8Y8DQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LSSt4EwfvDD3GPhr0nYusowjz27cE76sHhlRvra+h/g7hpmqrKivZMXjoL74wsU/R
	 nk+9f0tdIRNIpNOS5Ii5ciiuiMh0oFRfRz59hnE5UlytkIjxynFQTwLcn8R5m1bEL4
	 KTLUGzs2rlkl1ZF3D2QN+kaDRkqHwsIMmh869vQt/DR8ujFh/oJsWWYbZilK7zfhb1
	 +n9APhCbcO1Vrd6bAMzUPSWKFzPPw9xWML5zkzAlJlqc3kQekHHtRAYpGIsXd5Jgb/
	 5dYmL7OIbIP3ZU91csKV+DMnL6cFaZkH0m49Lx9HIncQzRdgqbHzdKZXZnxmMPPldO
	 tu9BNmcS0OeBQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 07/17] mm/execmem, arch: convert simple overrides of module_alloc to execmem
Date: Sun,  5 May 2024 17:25:50 +0300
Message-ID: <20240505142600.2322517-8-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240505142600.2322517-1-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu@dudau.co.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, =?UTF-8?q?Philippe=20Mathieu-D
 aud=C3=A9?= <philmd@linaro.org>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Several architectures override module_alloc() only to define address
range for code allocations different than VMALLOC address space.

Provide a generic implementation in execmem that uses the parameters for
address space ranges, required alignment and page protections provided
by architectures.

The architectures must fill execmem_info structure and implement
execmem_arch_setup() that returns a pointer to that structure. This way the
execmem initialization won't be called from every architecture, but rather
from a central place, namely a core_initcall() in execmem.

The execmem provides execmem_alloc() API that wraps __vmalloc_node_range()
with the parameters defined by the architectures.  If an architecture does
not implement execmem_arch_setup(), execmem_alloc() will fall back to
module_alloc().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Song Liu <song@kernel.org>
---
 arch/loongarch/kernel/module.c | 19 ++++++++--
 arch/mips/kernel/module.c      | 20 ++++++++--
 arch/nios2/kernel/module.c     | 21 ++++++++---
 arch/parisc/kernel/module.c    | 24 ++++++++----
 arch/riscv/kernel/module.c     | 24 ++++++++----
 arch/sparc/kernel/module.c     | 20 ++++++++--
 include/linux/execmem.h        | 47 ++++++++++++++++++++++++
 mm/execmem.c                   | 67 ++++++++++++++++++++++++++++++++--
 mm/mm_init.c                   |  2 +
 9 files changed, 210 insertions(+), 34 deletions(-)

diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
index c7d0338d12c1..ca6dd7ea1610 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -18,6 +18,7 @@
 #include <linux/ftrace.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/execmem.h>
 #include <asm/alternative.h>
 #include <asm/inst.h>
 #include <asm/unwind.h>
@@ -490,10 +491,22 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	return 0;
 }
 
-void *module_alloc(unsigned long size)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-			GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE, __builtin_return_address(0));
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= MODULES_VADDR,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = 1,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 
 static void module_init_ftrace_plt(const Elf_Ehdr *hdr,
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 9a6c96014904..59225a3cf918 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/jump_label.h>
+#include <linux/execmem.h>
 #include <asm/jump_label.h>
 
 struct mips_hi16 {
@@ -32,11 +33,22 @@ static LIST_HEAD(dbe_list);
 static DEFINE_SPINLOCK(dbe_lock);
 
 #ifdef MODULES_VADDR
-void *module_alloc(unsigned long size)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= MODULES_VADDR,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = 1,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 #endif
 
diff --git a/arch/nios2/kernel/module.c b/arch/nios2/kernel/module.c
index 9c97b7513853..0d1ee86631fc 100644
--- a/arch/nios2/kernel/module.c
+++ b/arch/nios2/kernel/module.c
@@ -18,15 +18,26 @@
 #include <linux/fs.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/execmem.h>
 
 #include <asm/cacheflush.h>
 
-void *module_alloc(unsigned long size)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-				    GFP_KERNEL, PAGE_KERNEL_EXEC,
-				    VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= MODULES_VADDR,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL_EXEC,
+				.alignment = 1,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 
 int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index d214bbe3c2af..bdfa85e10c1b 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -49,6 +49,7 @@
 #include <linux/bug.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/execmem.h>
 
 #include <asm/unwind.h>
 #include <asm/sections.h>
@@ -173,15 +174,22 @@ static inline int reassemble_22(int as22)
 		((as22 & 0x0003ff) << 3));
 }
 
-void *module_alloc(unsigned long size)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
 {
-	/* using RWX means less protection for modules, but it's
-	 * easier than trying to map the text, data, init_text and
-	 * init_data correctly */
-	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
-				    GFP_KERNEL,
-				    PAGE_KERNEL_RWX, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= VMALLOC_START,
+				.end	= VMALLOC_END,
+				.pgprot	= PAGE_KERNEL_RWX,
+				.alignment = 1,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 
 #ifndef CONFIG_64BIT
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 5e5a82644451..182904127ba0 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -14,6 +14,7 @@
 #include <linux/vmalloc.h>
 #include <linux/sizes.h>
 #include <linux/pgtable.h>
+#include <linux/execmem.h>
 #include <asm/alternative.h>
 #include <asm/sections.h>
 
@@ -906,13 +907,22 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 }
 
 #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
-void *module_alloc(unsigned long size)
-{
-	return __vmalloc_node_range(size, 1, MODULES_VADDR,
-				    MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL, VM_FLUSH_RESET_PERMS,
-				    NUMA_NO_NODE,
-				    __builtin_return_address(0));
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
+{
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= MODULES_VADDR,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = 1,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 #endif
 
diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
index d37adb2a0b54..8b7ee45defc3 100644
--- a/arch/sparc/kernel/module.c
+++ b/arch/sparc/kernel/module.c
@@ -14,6 +14,7 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/mm.h>
+#include <linux/execmem.h>
 
 #include <asm/processor.h>
 #include <asm/spitfire.h>
@@ -21,11 +22,22 @@
 
 #include "entry.h"
 
-void *module_alloc(unsigned long size)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= MODULES_VADDR,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = 1,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 
 /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 8eebc8ef66e7..96fc59258467 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -33,6 +33,47 @@ enum execmem_type {
 	EXECMEM_TYPE_MAX,
 };
 
+/**
+ * struct execmem_range - definition of an address space suitable for code and
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
+ * struct execmem_info - architecture parameters for code allocations
+ * @ranges: array of parameter sets defining architecture specific
+ * parameters for executable memory allocations. The ranges that are not
+ * explicitly initialized by an architecture use parameters defined for
+ * @EXECMEM_DEFAULT.
+ */
+struct execmem_info {
+	struct execmem_range	ranges[EXECMEM_TYPE_MAX];
+};
+
+/**
+ * execmem_arch_setup - define parameters for allocations of executable memory
+ *
+ * A hook for architectures to define parameters for allocations of
+ * executable memory. These parameters should be filled into the
+ * @execmem_info structure.
+ *
+ * For architectures that do not implement this method a default set of
+ * parameters will be used
+ *
+ * Return: a structure defining architecture parameters and restrictions
+ * for allocations of executable memory
+ */
+struct execmem_info *execmem_arch_setup(void);
+
 /**
  * execmem_alloc - allocate executable memory
  * @type: type of the allocation
@@ -54,4 +95,10 @@ void *execmem_alloc(enum execmem_type type, size_t size);
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
index 480adc69b20d..80e61c1e7319 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -11,14 +11,30 @@
 #include <linux/execmem.h>
 #include <linux/moduleloader.h>
 
-static void *__execmem_alloc(size_t size)
+static struct execmem_info *execmem_info __ro_after_init;
+
+static void *__execmem_alloc(struct execmem_range *range, size_t size)
 {
-	return module_alloc(size);
+	unsigned long start = range->start;
+	unsigned long end = range->end;
+	unsigned int align = range->alignment;
+	pgprot_t pgprot = range->pgprot;
+
+	return __vmalloc_node_range(size, align, start, end,
+				    GFP_KERNEL, pgprot, VM_FLUSH_RESET_PERMS,
+				    NUMA_NO_NODE, __builtin_return_address(0));
 }
 
 void *execmem_alloc(enum execmem_type type, size_t size)
 {
-	return __execmem_alloc(size);
+	struct execmem_range *range;
+
+	if (!execmem_info)
+		return module_alloc(size);
+
+	range = &execmem_info->ranges[type];
+
+	return __execmem_alloc(range, size);
 }
 
 void execmem_free(void *ptr)
@@ -30,3 +46,48 @@ void execmem_free(void *ptr)
 	WARN_ON(in_interrupt());
 	vfree(ptr);
 }
+
+static bool execmem_validate(struct execmem_info *info)
+{
+	struct execmem_range *r = &info->ranges[EXECMEM_DEFAULT];
+
+	if (!r->alignment || !r->start || !r->end || !pgprot_val(r->pgprot)) {
+		pr_crit("Invalid parameters for execmem allocator, module loading will fail");
+		return false;
+	}
+
+	return true;
+}
+
+static void execmem_init_missing(struct execmem_info *info)
+{
+	struct execmem_range *default_range = &info->ranges[EXECMEM_DEFAULT];
+
+	for (int i = EXECMEM_DEFAULT + 1; i < EXECMEM_TYPE_MAX; i++) {
+		struct execmem_range *r = &info->ranges[i];
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
+struct execmem_info * __weak execmem_arch_setup(void)
+{
+	return NULL;
+}
+
+void __init execmem_init(void)
+{
+	struct execmem_info *info = execmem_arch_setup();
+
+	if (!info || !execmem_validate(info))
+		return;
+
+	execmem_init_missing(info);
+
+	execmem_info = info;
+}
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 549e76af8f82..b6a1fcf6e13a 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -27,6 +27,7 @@
 #include <linux/swap.h>
 #include <linux/cma.h>
 #include <linux/crash_dump.h>
+#include <linux/execmem.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -2793,4 +2794,5 @@ void __init mm_core_init(void)
 	pti_init();
 	kmsan_init_runtime();
 	mm_cache_init();
+	execmem_init();
 }
-- 
2.43.0

