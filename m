Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6A7A42A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:34:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B3MpqZd8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpxQ55yT2z3cjk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:34:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B3MpqZd8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxKs31v2z3c9c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:30:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF9D260F83;
	Mon, 18 Sep 2023 07:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDC9C433B9;
	Mon, 18 Sep 2023 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022253;
	bh=Ab3JxL0vUtd+Dgg9Evr/24yil9x7cJIlVNJ+mIHZ+Fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B3MpqZd8kSnshGSIZk32sAvbfxOLIcvRzx/L6e6twO1GyIkCPbyDJ8YFZK7YV3DYj
	 XGhAnNQsgAWy/xSCUlo5IqNl0WBTUqkmBh0vCS1bt48EfgT1+dVwPuJNvN1ivOBOMn
	 gvH0utW4rdMOUN0nD6KFxNUfq8geoRPWIJ6VKmk1aH2z09LsV+3CM1A5GN8hUlJfXJ
	 ASdeswxXtYTc0LaHjCD2b/Jj+5rTLeYIx1gwiLh7ZEjRZ1XJfx7lSWfp5ovjLk7FgH
	 t/b+tjGlJaBG8XvWXgVzie1/pkYA3m8DAD1W+ztdCKD9/UtdKJD1oiqOVjKdWg5YrB
	 ItW+yxqIqOhzA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides of module_alloc to execmem
Date: Mon, 18 Sep 2023 10:29:46 +0300
Message-Id: <20230918072955.2507221-5-rppt@kernel.org>
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

Extend execmem parameters to accommodate more complex overrides of
module_alloc() by architectures.

This includes specification of a fallback range required by arm, arm64
and powerpc and support for allocation of KASAN shadow required by
arm64, s390 and x86.

The core implementation of execmem_alloc() takes care of suppressing
warnings when the initial allocation fails but there is a fallback range
defined.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm/kernel/module.c     | 38 ++++++++++++---------
 arch/arm64/kernel/module.c   | 57 ++++++++++++++------------------
 arch/powerpc/kernel/module.c | 52 ++++++++++++++---------------
 arch/s390/kernel/module.c    | 52 +++++++++++------------------
 arch/x86/kernel/module.c     | 64 +++++++++++-------------------------
 include/linux/execmem.h      | 14 ++++++++
 mm/execmem.c                 | 43 ++++++++++++++++++++++--
 7 files changed, 167 insertions(+), 153 deletions(-)

diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
index e74d84f58b77..2c7651a2d84c 100644
--- a/arch/arm/kernel/module.c
+++ b/arch/arm/kernel/module.c
@@ -16,6 +16,7 @@
 #include <linux/fs.h>
 #include <linux/string.h>
 #include <linux/gfp.h>
+#include <linux/execmem.h>
 
 #include <asm/sections.h>
 #include <asm/smp_plat.h>
@@ -34,23 +35,28 @@
 #endif
 
 #ifdef CONFIG_MMU
-void *module_alloc(unsigned long size)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.start = MODULES_VADDR,
+			.end = MODULES_END,
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	gfp_t gfp_mask = GFP_KERNEL;
-	void *p;
-
-	/* Silence the initial allocation */
-	if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS))
-		gfp_mask |= __GFP_NOWARN;
-
-	p = __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
-				gfp_mask, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
-	if (!IS_ENABLED(CONFIG_ARM_MODULE_PLTS) || p)
-		return p;
-	return __vmalloc_node_range(size, 1,  VMALLOC_START, VMALLOC_END,
-				GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+	struct execmem_range *r = &execmem_params.ranges[EXECMEM_DEFAULT];
+
+	r->pgprot = PAGE_KERNEL_EXEC;
+
+	if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS)) {
+		r->fallback_start = VMALLOC_START;
+		r->fallback_end = VMALLOC_END;
+	}
+
+	return &execmem_params;
 }
 #endif
 
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index dd851297596e..cd6320de1c54 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -20,6 +20,7 @@
 #include <linux/random.h>
 #include <linux/scs.h>
 #include <linux/vmalloc.h>
+#include <linux/execmem.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
@@ -108,46 +109,38 @@ static int __init module_init_limits(void)
 
 	return 0;
 }
-subsys_initcall(module_init_limits);
 
-void *module_alloc(unsigned long size)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.flags = EXECMEM_KASAN_SHADOW,
+			.alignment = MODULE_ALIGN,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	void *p = NULL;
+	struct execmem_range *r = &execmem_params.ranges[EXECMEM_DEFAULT];
 
-	/*
-	 * Where possible, prefer to allocate within direct branch range of the
-	 * kernel such that no PLTs are necessary.
-	 */
-	if (module_direct_base) {
-		p = __vmalloc_node_range(size, MODULE_ALIGN,
-					 module_direct_base,
-					 module_direct_base + SZ_128M,
-					 GFP_KERNEL | __GFP_NOWARN,
-					 PAGE_KERNEL, 0, NUMA_NO_NODE,
-					 __builtin_return_address(0));
-	}
+	module_init_limits();
 
-	if (!p && module_plt_base) {
-		p = __vmalloc_node_range(size, MODULE_ALIGN,
-					 module_plt_base,
-					 module_plt_base + SZ_2G,
-					 GFP_KERNEL | __GFP_NOWARN,
-					 PAGE_KERNEL, 0, NUMA_NO_NODE,
-					 __builtin_return_address(0));
-	}
+	r->pgprot = PAGE_KERNEL;
 
-	if (!p) {
-		pr_warn_ratelimited("%s: unable to allocate memory\n",
-				    __func__);
-	}
+	if (module_direct_base) {
+		r->start = module_direct_base;
+		r->end = module_direct_base + SZ_128M;
 
-	if (p && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
-		vfree(p);
-		return NULL;
+		if (module_plt_base) {
+			r->fallback_start = module_plt_base;
+			r->fallback_end = module_plt_base + SZ_2G;
+		}
+	} else if (module_plt_base) {
+		r->start = module_plt_base;
+		r->end = module_plt_base + SZ_2G;
 	}
 
-	/* Memory is intended to be executable, reset the pointer tag. */
-	return kasan_reset_tag(p);
+	return &execmem_params;
 }
 
 enum aarch64_reloc_op {
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f6d6ae0a1692..f4dd26f693a3 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -10,6 +10,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
 #include <linux/bug.h>
+#include <linux/execmem.h>
 #include <asm/module.h>
 #include <linux/uaccess.h>
 #include <asm/firmware.h>
@@ -89,39 +90,38 @@ int module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-static __always_inline void *
-__module_alloc(unsigned long size, unsigned long start, unsigned long end, bool nowarn)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.alignment = 1,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
-	gfp_t gfp = GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
-
-	/*
-	 * Don't do huge page allocations for modules yet until more testing
-	 * is done. STRICT_MODULE_RWX may require extra work to support this
-	 * too.
-	 */
-	return __vmalloc_node_range(size, 1, start, end, gfp, prot,
-				    VM_FLUSH_RESET_PERMS,
-				    NUMA_NO_NODE, __builtin_return_address(0));
-}
+	struct execmem_range *range = &execmem_params.ranges[EXECMEM_DEFAULT];
 
-void *module_alloc(unsigned long size)
-{
 #ifdef MODULES_VADDR
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
-	void *ptr = NULL;
-
-	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
 
 	/* First try within 32M limit from _etext to avoid branch trampolines */
-	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
-		ptr = __module_alloc(size, limit, MODULES_END, true);
-
-	if (!ptr)
-		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END, false);
-
-	return ptr;
+	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit) {
+		range->start = limit;
+		range->end = MODULES_END;
+		range->fallback_start = MODULES_VADDR;
+		range->fallback_end = MODULES_END;
+	} else {
+		range->start = MODULES_VADDR;
+		range->end = MODULES_END;
+	}
 #else
-	return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
+	range->start = VMALLOC_START;
+	range->end = VMALLOC_END;
 #endif
+
+	range->pgprot = prot;
+
+	return &execmem_params;
 }
diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
index db5561d0c233..538d5f24af66 100644
--- a/arch/s390/kernel/module.c
+++ b/arch/s390/kernel/module.c
@@ -37,41 +37,29 @@
 
 #define PLT_ENTRY_SIZE 22
 
-static unsigned long get_module_load_offset(void)
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.flags = EXECMEM_KASAN_SHADOW,
+			.alignment = MODULE_ALIGN,
+			.pgprot = PAGE_KERNEL,
+		},
+	},
+};
+
+struct execmem_params __init *execmem_arch_params(void)
 {
-	static DEFINE_MUTEX(module_kaslr_mutex);
-	static unsigned long module_load_offset;
-
-	if (!kaslr_enabled())
-		return 0;
-	/*
-	 * Calculate the module_load_offset the first time this code
-	 * is called. Once calculated it stays the same until reboot.
-	 */
-	mutex_lock(&module_kaslr_mutex);
-	if (!module_load_offset)
+	unsigned long module_load_offset = 0;
+	unsigned long start;
+
+	if (kaslr_enabled())
 		module_load_offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
-	mutex_unlock(&module_kaslr_mutex);
-	return module_load_offset;
-}
 
-void *module_alloc(unsigned long size)
-{
-	gfp_t gfp_mask = GFP_KERNEL;
-	void *p;
-
-	if (PAGE_ALIGN(size) > MODULES_LEN)
-		return NULL;
-	p = __vmalloc_node_range(size, MODULE_ALIGN,
-				 MODULES_VADDR + get_module_load_offset(),
-				 MODULES_END, gfp_mask, PAGE_KERNEL,
-				 VM_FLUSH_RESET_PERMS | VM_DEFER_KMEMLEAK,
-				 NUMA_NO_NODE, __builtin_return_address(0));
-	if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
-		vfree(p);
-		return NULL;
-	}
-	return p;
+	start = MODULES_VADDR + module_load_offset;
+	execmem_params.ranges[EXECMEM_DEFAULT].start = start;
+	execmem_params.ranges[EXECMEM_DEFAULT].end = MODULES_END;
+
+	return &execmem_params;
 }
 
 #ifdef CONFIG_FUNCTION_TRACER
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 5f71a0cf4399..9d37375e2f05 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -19,6 +19,7 @@
 #include <linux/jump_label.h>
 #include <linux/random.h>
 #include <linux/memory.h>
+#include <linux/execmem.h>
 
 #include <asm/text-patching.h>
 #include <asm/page.h>
@@ -36,55 +37,30 @@ do {							\
 } while (0)
 #endif
 
-#ifdef CONFIG_RANDOMIZE_BASE
-static unsigned long module_load_offset;
+static struct execmem_params execmem_params __ro_after_init = {
+	.ranges = {
+		[EXECMEM_DEFAULT] = {
+			.flags = EXECMEM_KASAN_SHADOW,
+			.alignment = MODULE_ALIGN,
+		},
+	},
+};
 
-/* Mutex protects the module_load_offset. */
-static DEFINE_MUTEX(module_kaslr_mutex);
-
-static unsigned long int get_module_load_offset(void)
-{
-	if (kaslr_enabled()) {
-		mutex_lock(&module_kaslr_mutex);
-		/*
-		 * Calculate the module_load_offset the first time this
-		 * code is called. Once calculated it stays the same until
-		 * reboot.
-		 */
-		if (module_load_offset == 0)
-			module_load_offset =
-				get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
-		mutex_unlock(&module_kaslr_mutex);
-	}
-	return module_load_offset;
-}
-#else
-static unsigned long int get_module_load_offset(void)
-{
-	return 0;
-}
-#endif
-
-void *module_alloc(unsigned long size)
+struct execmem_params __init *execmem_arch_params(void)
 {
-	gfp_t gfp_mask = GFP_KERNEL;
-	void *p;
-
-	if (PAGE_ALIGN(size) > MODULES_LEN)
-		return NULL;
+	unsigned long module_load_offset = 0;
+	unsigned long start;
 
-	p = __vmalloc_node_range(size, MODULE_ALIGN,
-				 MODULES_VADDR + get_module_load_offset(),
-				 MODULES_END, gfp_mask, PAGE_KERNEL,
-				 VM_FLUSH_RESET_PERMS | VM_DEFER_KMEMLEAK,
-				 NUMA_NO_NODE, __builtin_return_address(0));
+	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_enabled())
+		module_load_offset =
+			get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
 
-	if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
-		vfree(p);
-		return NULL;
-	}
+	start = MODULES_VADDR + module_load_offset;
+	execmem_params.ranges[EXECMEM_DEFAULT].start = start;
+	execmem_params.ranges[EXECMEM_DEFAULT].end = MODULES_END;
+	execmem_params.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
 
-	return p;
+	return &execmem_params;
 }
 
 #ifdef CONFIG_X86_32
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 44e213625053..806ad1a0088d 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -32,19 +32,33 @@ enum execmem_type {
 	EXECMEM_TYPE_MAX,
 };
 
+/**
+ * enum execmem_module_flags - options for executable memory allocations
+ * @EXECMEM_KASAN_SHADOW:	allocate kasan shadow
+ */
+enum execmem_range_flags {
+	EXECMEM_KASAN_SHADOW	= (1 << 0),
+};
+
 /**
  * struct execmem_range - definition of a memory range suitable for code and
  *			  related data allocations
  * @start:	address space start
  * @end:	address space end (inclusive)
+ * @fallback_start:	start of the range for fallback allocations
+ * @fallback_end:	end of the range for fallback allocations (inclusive)
  * @pgprot:	permissions for memory in this address space
  * @alignment:	alignment required for text allocations
+ * @flags:	options for memory allocations for this range
  */
 struct execmem_range {
 	unsigned long   start;
 	unsigned long   end;
+	unsigned long   fallback_start;
+	unsigned long   fallback_end;
 	pgprot_t        pgprot;
 	unsigned int	alignment;
+	enum execmem_range_flags flags;
 };
 
 /**
diff --git a/mm/execmem.c b/mm/execmem.c
index f25a5e064886..a8c2f44d0133 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -11,12 +11,46 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
 {
 	unsigned long start = range->start;
 	unsigned long end = range->end;
+	unsigned long fallback_start = range->fallback_start;
+	unsigned long fallback_end = range->fallback_end;
 	unsigned int align = range->alignment;
 	pgprot_t pgprot = range->pgprot;
+	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
+	unsigned long vm_flags  = VM_FLUSH_RESET_PERMS;
+	bool fallback  = !!fallback_start;
+	gfp_t gfp_flags = GFP_KERNEL;
+	void *p;
 
-	return __vmalloc_node_range(size, align, start, end,
-				   GFP_KERNEL, pgprot, VM_FLUSH_RESET_PERMS,
-				   NUMA_NO_NODE, __builtin_return_address(0));
+	if (PAGE_ALIGN(size) > (end - start))
+		return NULL;
+
+	if (kasan)
+		vm_flags |= VM_DEFER_KMEMLEAK;
+
+	if (fallback)
+		gfp_flags |= __GFP_NOWARN;
+
+	p = __vmalloc_node_range(size, align, start, end, gfp_flags,
+				 pgprot, vm_flags, NUMA_NO_NODE,
+				 __builtin_return_address(0));
+
+	if (!p && fallback) {
+		start = fallback_start;
+		end = fallback_end;
+		gfp_flags = GFP_KERNEL;
+
+		p = __vmalloc_node_range(size, align, start, end, gfp_flags,
+					 pgprot, vm_flags, NUMA_NO_NODE,
+					 __builtin_return_address(0));
+	}
+
+	if (p && kasan &&
+	    (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
+		vfree(p);
+		return NULL;
+	}
+
+	return kasan_reset_tag(p);
 }
 
 void *execmem_text_alloc(enum execmem_type type, size_t size)
@@ -66,6 +100,9 @@ static void execmem_init_missing(struct execmem_params *p)
 			r->alignment = default_range->alignment;
 			r->start = default_range->start;
 			r->end = default_range->end;
+			r->flags = default_range->flags;
+			r->fallback_start = default_range->fallback_start;
+			r->fallback_end = default_range->fallback_end;
 		}
 	}
 }
-- 
2.39.2

