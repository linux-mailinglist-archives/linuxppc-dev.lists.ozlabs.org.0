Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884F38BC152
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 16:32:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tluomPEa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXRpH0jY1z2xYY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 00:32:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tluomPEa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXRhw2vfzz3cDw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 00:28:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 796BC60C4B;
	Sun,  5 May 2024 14:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC0AC113CC;
	Sun,  5 May 2024 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714919278;
	bh=7676H5vsLo7YGPhbIMyHKAdjbAp86RdXuV9NPMBEK/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tluomPEaR988W/Adela8Fnnudne7eiWo2dfSWTuwNkswxVdHskJQa7gDVRUAZ82hB
	 KP28CfBa2KDnuQJJGS1jBYt76mzqjdfiHp9jaB/vtlGhGTi+e+QGziiWTFN7lAQRoW
	 TUwTNUJuFy/SgvN41WcGQbE2Pqc16kOo+8kaSWJGsR6uq14ia47sE4ojrJtHOQBZJH
	 v/h8xENaP9kxzbuRvuaqlFpoLYoWFepgH54U4jMNiRL6cwWrfN8oZAF2wbmbDuIPLJ
	 //Uu/otnQWnPSwh0HZShhD5ICDhJ/S3Go7BodiKICdxTNc3rh0Qc4SsgMkQVQGiX6M
	 Ralz9S6SKFF7g==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 08/17] mm/execmem, arch: convert remaining overrides of module_alloc to execmem
Date: Sun,  5 May 2024 17:25:51 +0300
Message-ID: <20240505142600.2322517-9-rppt@kernel.org>
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

Extend execmem parameters to accommodate more complex overrides of
module_alloc() by architectures.

This includes specification of a fallback range required by arm, arm64
and powerpc, EXECMEM_MODULE_DATA type required by powerpc, support for
allocation of KASAN shadow required by s390 and x86 and support for
late initialization of execmem required by arm64.

The core implementation of execmem_alloc() takes care of suppressing
warnings when the initial allocation fails but there is a fallback range
defined.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Song Liu <song@kernel.org>
Tested-by: Liviu Dudau <liviu@dudau.co.uk>
---
 arch/Kconfig                 |  8 ++++
 arch/arm/kernel/module.c     | 41 ++++++++++++--------
 arch/arm64/Kconfig           |  1 +
 arch/arm64/kernel/module.c   | 55 ++++++++++++++------------
 arch/powerpc/kernel/module.c | 60 +++++++++++++++++++----------
 arch/s390/kernel/module.c    | 54 +++++++++++---------------
 arch/x86/kernel/module.c     | 70 +++++++++++----------------------
 include/linux/execmem.h      | 30 ++++++++++++++-
 include/linux/moduleloader.h | 12 ------
 kernel/module/main.c         | 26 +++----------
 mm/execmem.c                 | 75 ++++++++++++++++++++++++++++++------
 11 files changed, 247 insertions(+), 185 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 65afb1de48b3..4fd0daa54e6c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -960,6 +960,14 @@ config ARCH_WANTS_MODULES_DATA_IN_VMALLOC
 	  For architectures like powerpc/32 which have constraints on module
 	  allocation and need to allocate module data outside of module area.
 
+config ARCH_WANTS_EXECMEM_LATE
+	bool
+	help
+	  For architectures that do not allocate executable memory early on
+	  boot, but rather require its initialization late when there is
+	  enough entropy for module space randomization, for instance
+	  arm64.
+
 config HAVE_IRQ_EXIT_ON_IRQ_STACK
 	bool
 	help
diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
index e74d84f58b77..a98fdf6ff26c 100644
--- a/arch/arm/kernel/module.c
+++ b/arch/arm/kernel/module.c
@@ -16,6 +16,7 @@
 #include <linux/fs.h>
 #include <linux/string.h>
 #include <linux/gfp.h>
+#include <linux/execmem.h>
 
 #include <asm/sections.h>
 #include <asm/smp_plat.h>
@@ -34,23 +35,31 @@
 #endif
 
 #ifdef CONFIG_MMU
-void *module_alloc(unsigned long size)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
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
+	unsigned long fallback_start = 0, fallback_end = 0;
+
+	if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS)) {
+		fallback_start = VMALLOC_START;
+		fallback_end = VMALLOC_END;
+	}
+
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= MODULES_VADDR,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL_EXEC,
+				.alignment = 1,
+				.fallback_start	= fallback_start,
+				.fallback_end	= fallback_end,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 #endif
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b11c98b3e84..74b34a78b7ac 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -105,6 +105,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANTS_EXECMEM_LATE if EXECMEM
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
 	select ARCH_HAS_UBSAN
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index e92da4da1b2a..b7a7a23f9f8f 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -20,6 +20,7 @@
 #include <linux/random.h>
 #include <linux/scs.h>
 #include <linux/vmalloc.h>
+#include <linux/execmem.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
@@ -108,41 +109,47 @@ static int __init module_init_limits(void)
 
 	return 0;
 }
-subsys_initcall(module_init_limits);
 
-void *module_alloc(unsigned long size)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
 {
-	void *p = NULL;
+	unsigned long fallback_start = 0, fallback_end = 0;
+	unsigned long start = 0, end = 0;
+
+	module_init_limits();
 
 	/*
 	 * Where possible, prefer to allocate within direct branch range of the
 	 * kernel such that no PLTs are necessary.
 	 */
 	if (module_direct_base) {
-		p = __vmalloc_node_range(size, MODULE_ALIGN,
-					 module_direct_base,
-					 module_direct_base + SZ_128M,
-					 GFP_KERNEL | __GFP_NOWARN,
-					 PAGE_KERNEL, 0, NUMA_NO_NODE,
-					 __builtin_return_address(0));
-	}
+		start = module_direct_base;
+		end = module_direct_base + SZ_128M;
 
-	if (!p && module_plt_base) {
-		p = __vmalloc_node_range(size, MODULE_ALIGN,
-					 module_plt_base,
-					 module_plt_base + SZ_2G,
-					 GFP_KERNEL | __GFP_NOWARN,
-					 PAGE_KERNEL, 0, NUMA_NO_NODE,
-					 __builtin_return_address(0));
-	}
-
-	if (!p) {
-		pr_warn_ratelimited("%s: unable to allocate memory\n",
-				    __func__);
+		if (module_plt_base) {
+			fallback_start = module_plt_base;
+			fallback_end = module_plt_base + SZ_2G;
+		}
+	} else if (module_plt_base) {
+		start = module_plt_base;
+		end = module_plt_base + SZ_2G;
 	}
 
-	/* Memory is intended to be executable, reset the pointer tag. */
-	return kasan_reset_tag(p);
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= start,
+				.end	= end,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = 1,
+				.fallback_start	= fallback_start,
+				.fallback_end	= fallback_end,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 
 enum aarch64_reloc_op {
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f6d6ae0a1692..ac80559015a3 100644
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
@@ -89,39 +90,56 @@ int module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-static __always_inline void *
-__module_alloc(unsigned long size, unsigned long start, unsigned long end, bool nowarn)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
 {
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
-	gfp_t gfp = GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
+	unsigned long fallback_start = 0, fallback_end = 0;
+	unsigned long start, end;
 
 	/*
-	 * Don't do huge page allocations for modules yet until more testing
-	 * is done. STRICT_MODULE_RWX may require extra work to support this
-	 * too.
+	 * BOOK3S_32 and 8xx define MODULES_VADDR for text allocations and
+	 * allow allocating data in the entire vmalloc space
 	 */
-	return __vmalloc_node_range(size, 1, start, end, gfp, prot,
-				    VM_FLUSH_RESET_PERMS,
-				    NUMA_NO_NODE, __builtin_return_address(0));
-}
-
-void *module_alloc(unsigned long size)
-{
 #ifdef MODULES_VADDR
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
-	void *ptr = NULL;
 
 	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
 
 	/* First try within 32M limit from _etext to avoid branch trampolines */
-	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
-		ptr = __module_alloc(size, limit, MODULES_END, true);
-
-	if (!ptr)
-		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END, false);
+	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit) {
+		start = limit;
+		fallback_start = MODULES_VADDR;
+		fallback_end = MODULES_END;
+	} else {
+		start = MODULES_VADDR;
+	}
 
-	return ptr;
+	end = MODULES_END;
 #else
-	return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
+	start = VMALLOC_START;
+	end = VMALLOC_END;
 #endif
+
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.start	= start,
+				.end	= end,
+				.pgprot	= prot,
+				.alignment = 1,
+				.fallback_start	= fallback_start,
+				.fallback_end	= fallback_end,
+			},
+			[EXECMEM_MODULE_DATA] = {
+				.start	= VMALLOC_START,
+				.end	= VMALLOC_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = 1,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
index ac97a905e8cd..7fee64fdc1bb 100644
--- a/arch/s390/kernel/module.c
+++ b/arch/s390/kernel/module.c
@@ -37,41 +37,31 @@
 
 #define PLT_ENTRY_SIZE 22
 
-static unsigned long get_module_load_offset(void)
+static struct execmem_info execmem_info __ro_after_init;
+
+struct execmem_info __init *execmem_arch_setup(void)
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
+
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.flags	= EXECMEM_KASAN_SHADOW,
+				.start	= start,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = MODULE_ALIGN,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 
 #ifdef CONFIG_FUNCTION_TRACER
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index e18914c0e38a..45b1a7c03379 100644
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
+static struct execmem_info execmem_info __ro_after_init;
 
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
+struct execmem_info __init *execmem_arch_setup(void)
 {
-	return 0;
-}
-#endif
-
-void *module_alloc(unsigned long size)
-{
-	gfp_t gfp_mask = GFP_KERNEL;
-	void *p;
-
-	if (PAGE_ALIGN(size) > MODULES_LEN)
-		return NULL;
-
-	p = __vmalloc_node_range(size, MODULE_ALIGN,
-				 MODULES_VADDR + get_module_load_offset(),
-				 MODULES_END, gfp_mask, PAGE_KERNEL,
-				 VM_FLUSH_RESET_PERMS | VM_DEFER_KMEMLEAK,
-				 NUMA_NO_NODE, __builtin_return_address(0));
-
-	if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
-		vfree(p);
-		return NULL;
-	}
-
-	return p;
+	unsigned long start, offset = 0;
+
+	if (kaslr_enabled())
+		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
+
+	start = MODULES_VADDR + offset;
+
+	execmem_info = (struct execmem_info){
+		.ranges = {
+			[EXECMEM_DEFAULT] = {
+				.flags	= EXECMEM_KASAN_SHADOW,
+				.start	= start,
+				.end	= MODULES_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = MODULE_ALIGN,
+			},
+		},
+	};
+
+	return &execmem_info;
 }
 
 #ifdef CONFIG_X86_32
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 96fc59258467..32cef1144117 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -5,6 +5,14 @@
 #include <linux/types.h>
 #include <linux/moduleloader.h>
 
+#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
+		!defined(CONFIG_KASAN_VMALLOC)
+#include <linux/kasan.h>
+#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
+#else
+#define MODULE_ALIGN PAGE_SIZE
+#endif
+
 /**
  * enum execmem_type - types of executable memory ranges
  *
@@ -22,6 +30,7 @@
  * @EXECMEM_KPROBES: parameters for kprobes
  * @EXECMEM_FTRACE: parameters for ftrace
  * @EXECMEM_BPF: parameters for BPF
+ * @EXECMEM_MODULE_DATA: parameters for module data sections
  * @EXECMEM_TYPE_MAX:
  */
 enum execmem_type {
@@ -30,22 +39,38 @@ enum execmem_type {
 	EXECMEM_KPROBES,
 	EXECMEM_FTRACE,
 	EXECMEM_BPF,
+	EXECMEM_MODULE_DATA,
 	EXECMEM_TYPE_MAX,
 };
 
+/**
+ * enum execmem_range_flags - options for executable memory allocations
+ * @EXECMEM_KASAN_SHADOW:	allocate kasan shadow
+ */
+enum execmem_range_flags {
+	EXECMEM_KASAN_SHADOW	= (1 << 0),
+};
+
 /**
  * struct execmem_range - definition of an address space suitable for code and
  *			  related data allocations
  * @start:	address space start
  * @end:	address space end (inclusive)
+ * @fallback_start: start of the secondary address space range for fallback
+ *                  allocations on architectures that require it
+ * @fallback_end:   start of the secondary address space (inclusive)
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
@@ -82,6 +107,9 @@ struct execmem_info *execmem_arch_setup(void);
  * Allocates memory that will contain executable code, either generated or
  * loaded from kernel modules.
  *
+ * Allocates memory that will contain data coupled with executable code,
+ * like data sections in kernel modules.
+ *
  * The memory will have protections defined by architecture for executable
  * region of the @type.
  *
@@ -95,7 +123,7 @@ void *execmem_alloc(enum execmem_type type, size_t size);
  */
 void execmem_free(void *ptr);
 
-#ifdef CONFIG_EXECMEM
+#if defined(CONFIG_EXECMEM) && !defined(CONFIG_ARCH_WANTS_EXECMEM_LATE)
 void execmem_init(void);
 #else
 static inline void execmem_init(void) {}
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index a3b8caee9405..e395461d59e5 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -25,10 +25,6 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 /* Additional bytes needed by arch in front of individual sections */
 unsigned int arch_mod_section_prepend(struct module *mod, unsigned int section);
 
-/* Allocator used for allocating struct module, core sections and init
-   sections.  Returns NULL on failure. */
-void *module_alloc(unsigned long size);
-
 /* Determines if the section name is an init section (that is only used during
  * module loading).
  */
@@ -126,12 +122,4 @@ void module_arch_cleanup(struct module *mod);
 /* Any cleanup before freeing mod->module_init */
 void module_arch_freeing_init(struct module *mod);
 
-#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
-		!defined(CONFIG_KASAN_VMALLOC)
-#include <linux/kasan.h>
-#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
-#else
-#define MODULE_ALIGN PAGE_SIZE
-#endif
-
 #endif
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d56b7df0cbb6..91e185607d4b 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1188,24 +1188,20 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
-static bool mod_mem_use_vmalloc(enum mod_mem_type type)
-{
-	return IS_ENABLED(CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC) &&
-		mod_mem_type_is_core_data(type);
-}
-
 static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 {
 	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
+	enum execmem_type execmem_type;
 	void *ptr;
 
 	mod->mem[type].size = size;
 
-	if (mod_mem_use_vmalloc(type))
-		ptr = vmalloc(size);
+	if (mod_mem_type_is_data(type))
+		execmem_type = EXECMEM_MODULE_DATA;
 	else
-		ptr = execmem_alloc(EXECMEM_MODULE_TEXT, size);
+		execmem_type = EXECMEM_MODULE_TEXT;
 
+	ptr = execmem_alloc(execmem_type, size);
 	if (!ptr)
 		return -ENOMEM;
 
@@ -1232,10 +1228,7 @@ static void module_memory_free(struct module *mod, enum mod_mem_type type)
 {
 	void *ptr = mod->mem[type].base;
 
-	if (mod_mem_use_vmalloc(type))
-		vfree(ptr);
-	else
-		execmem_free(ptr);
+	execmem_free(ptr);
 }
 
 static void free_mod_mem(struct module *mod)
@@ -1630,13 +1623,6 @@ static void free_modinfo(struct module *mod)
 	}
 }
 
-void * __weak module_alloc(unsigned long size)
-{
-	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
-			GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
-			NUMA_NO_NODE, __builtin_return_address(0));
-}
-
 bool __weak module_init_section(const char *name)
 {
 	return strstarts(name, ".init");
diff --git a/mm/execmem.c b/mm/execmem.c
index 80e61c1e7319..f6dc3fabc1ca 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -12,27 +12,49 @@
 #include <linux/moduleloader.h>
 
 static struct execmem_info *execmem_info __ro_after_init;
+static struct execmem_info default_execmem_info __ro_after_init;
 
 static void *__execmem_alloc(struct execmem_range *range, size_t size)
 {
+	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
+	unsigned long vm_flags  = VM_FLUSH_RESET_PERMS;
+	gfp_t gfp_flags = GFP_KERNEL | __GFP_NOWARN;
 	unsigned long start = range->start;
 	unsigned long end = range->end;
 	unsigned int align = range->alignment;
 	pgprot_t pgprot = range->pgprot;
+	void *p;
+
+	if (kasan)
+		vm_flags |= VM_DEFER_KMEMLEAK;
+
+	p = __vmalloc_node_range(size, align, start, end, gfp_flags,
+				 pgprot, vm_flags, NUMA_NO_NODE,
+				 __builtin_return_address(0));
+	if (!p && range->fallback_start) {
+		start = range->fallback_start;
+		end = range->fallback_end;
+		p = __vmalloc_node_range(size, align, start, end, gfp_flags,
+					 pgprot, vm_flags, NUMA_NO_NODE,
+					 __builtin_return_address(0));
+	}
+
+	if (!p) {
+		pr_warn_ratelimited("execmem: unable to allocate memory\n");
+		return NULL;
+	}
+
+	if (kasan && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
+		vfree(p);
+		return NULL;
+	}
 
-	return __vmalloc_node_range(size, align, start, end,
-				    GFP_KERNEL, pgprot, VM_FLUSH_RESET_PERMS,
-				    NUMA_NO_NODE, __builtin_return_address(0));
+	return kasan_reset_tag(p);
 }
 
 void *execmem_alloc(enum execmem_type type, size_t size)
 {
-	struct execmem_range *range;
-
-	if (!execmem_info)
-		return module_alloc(size);
-
-	range = &execmem_info->ranges[type];
+	struct execmem_range *range = &execmem_info->ranges[type];
 
 	return __execmem_alloc(range, size);
 }
@@ -67,10 +89,16 @@ static void execmem_init_missing(struct execmem_info *info)
 		struct execmem_range *r = &info->ranges[i];
 
 		if (!r->start) {
-			r->pgprot = default_range->pgprot;
+			if (i == EXECMEM_MODULE_DATA)
+				r->pgprot = PAGE_KERNEL;
+			else
+				r->pgprot = default_range->pgprot;
 			r->alignment = default_range->alignment;
 			r->start = default_range->start;
 			r->end = default_range->end;
+			r->flags = default_range->flags;
+			r->fallback_start = default_range->fallback_start;
+			r->fallback_end = default_range->fallback_end;
 		}
 	}
 }
@@ -80,14 +108,37 @@ struct execmem_info * __weak execmem_arch_setup(void)
 	return NULL;
 }
 
-void __init execmem_init(void)
+static void __init __execmem_init(void)
 {
 	struct execmem_info *info = execmem_arch_setup();
 
-	if (!info || !execmem_validate(info))
+	if (!info) {
+		info = execmem_info = &default_execmem_info;
+		info->ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
+		info->ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
+		info->ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL_EXEC;
+		info->ranges[EXECMEM_DEFAULT].alignment = 1;
+		return;
+	}
+
+	if (!execmem_validate(info))
 		return;
 
 	execmem_init_missing(info);
 
 	execmem_info = info;
 }
+
+#ifdef CONFIG_ARCH_WANTS_EXECMEM_LATE
+static int __init execmem_late_init(void)
+{
+	__execmem_init();
+	return 0;
+}
+core_initcall(execmem_late_init);
+#else
+void __init execmem_init(void)
+{
+	__execmem_init();
+}
+#endif
-- 
2.43.0

