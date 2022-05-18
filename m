Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC852B6B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L381N4ydcz3f0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=inYI7Y9J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37wv1rLpz3bwr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:08:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=inYI7Y9J; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4L37ws3tt9z4xcN; Wed, 18 May 2022 20:08:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4L37ws3jsJz4xc4; Wed, 18 May 2022 20:08:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652868509;
 bh=LPyUj7mw6pKe86exxwQIQ4dC9ooRTDm3Ukd5pSfem0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=inYI7Y9JE+X+yr2glo03uddC30MLE/eH6R1Q7xX57XQKRzh8l6rU4cOzbm366vt4m
 SI7mLYxeiqw7Lw3IHCNu13JxjKcQIgrfW2PxYEaryOdFwML1leeEHQXLC91VTHre1X
 HWHhDSdbSKqleufYhSE1HV5gDDsoMYVT/8qSNNMKHpzaoC9uJQHaXzwztT/YJ9OKvS
 rbfEwa0PxOoE8F53QSCsnNMwQICwNwS91SpGt8IKfqqKT4g0W8aCyiXjeiaKKg2gJM
 Flx32jdoDFkz+l8YgR2oHXOj9T3l0sR6D2ae3WvaGfr/6qCAqVmI0lCDEQpnKYgXX1
 92tiWaTr7b+0Q==
Date: Wed, 18 May 2022 20:05:31 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 3/6] powerpc: Book3S 64-bit outline-only KASAN support
Message-ID: <YoTE69OQwiG7z+Gu@cleo>
References: <YoTEb2BaH3MDkH+2@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoTEb2BaH3MDkH+2@cleo>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

Implement a limited form of KASAN for Book3S 64-bit machines running under
the Radix MMU, supporting only outline mode.

 - Enable the compiler instrumentation to check addresses and maintain the
   shadow region. (This is the guts of KASAN which we can easily reuse.)

 - Require kasan-vmalloc support to handle modules and anything else in
   vmalloc space.

 - KASAN needs to be able to validate all pointer accesses, but we can't
   instrument all kernel addresses - only linear map and vmalloc. On boot,
   set up a single page of read-only shadow that marks all iomap and
   vmemmap accesses as valid.

 - Document KASAN in powerpc docs.

Background
----------

KASAN support on Book3S is a bit tricky to get right:

 - It would be good to support inline instrumentation so as to be able to
   catch stack issues that cannot be caught with outline mode.

 - Inline instrumentation requires a fixed offset.

 - Book3S runs code with translations off ("real mode") during boot,
   including a lot of generic device-tree parsing code which is used to
   determine MMU features.

    [ppc64 mm note: The kernel installs a linear mapping at effective
    address c000...-c008.... This is a one-to-one mapping with physical
    memory from 0000... onward. Because of how memory accesses work on
    powerpc 64-bit Book3S, a kernel pointer in the linear map accesses the
    same memory both with translations on (accessing as an 'effective
    address'), and with translations off (accessing as a 'real
    address'). This works in both guests and the hypervisor. For more
    details, see s5.7 of Book III of version 3 of the ISA, in particular
    the Storage Control Overview, s5.7.3, and s5.7.5 - noting that this
    KASAN implementation currently only supports Radix.]

 - Some code - most notably a lot of KVM code - also runs with translations
   off after boot.

 - Therefore any offset has to point to memory that is valid with
   translations on or off.

One approach is just to give up on inline instrumentation. This way
boot-time checks can be delayed until after the MMU is set is up, and we
can just not instrument any code that runs with translations off after
booting. Take this approach for now and require outline instrumentation.

Previous attempts allowed inline instrumentation. However, they came with
some unfortunate restrictions: only physically contiguous memory could be
used and it had to be specified at compile time. Maybe we can do better in
the future.

[paulus@ozlabs.org - Rebased onto 5.17.  Note that a kernel with
 CONFIG_KASAN=y will crash during boot on a machine using HPT
 translation because not all the entry points to the generic
 KASAN code are protected with a call to kasan_arch_is_ready().]

Originally-by: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix version
Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 Documentation/powerpc/kasan.txt              |  48 ++++++++-
 arch/powerpc/Kconfig                         |   5 +-
 arch/powerpc/Kconfig.debug                   |   3 +-
 arch/powerpc/include/asm/book3s/64/hash.h    |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h |   3 +
 arch/powerpc/include/asm/book3s/64/radix.h   |  12 ++-
 arch/powerpc/include/asm/kasan.h             |  22 ++++
 arch/powerpc/kernel/Makefile                 |  11 ++
 arch/powerpc/kvm/Makefile                    |   5 +
 arch/powerpc/mm/book3s64/Makefile            |   9 ++
 arch/powerpc/mm/kasan/Makefile               |   1 +
 arch/powerpc/mm/kasan/init_book3s_64.c       | 103 +++++++++++++++++++
 arch/powerpc/mm/ptdump/ptdump.c              |   3 +-
 arch/powerpc/platforms/Kconfig.cputype       |   1 +
 arch/powerpc/platforms/powernv/Makefile      |   8 ++
 arch/powerpc/platforms/pseries/Makefile      |   3 +
 16 files changed, 234 insertions(+), 7 deletions(-)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
index 26bb0e8bb18c..f032b4eaf205 100644
--- a/Documentation/powerpc/kasan.txt
+++ b/Documentation/powerpc/kasan.txt
@@ -1,4 +1,4 @@
-KASAN is supported on powerpc on 32-bit only.
+KASAN is supported on powerpc on 32-bit and Radix 64-bit only.
 
 32 bit support
 ==============
@@ -10,3 +10,49 @@ fixmap area and occupies one eighth of the total kernel virtual memory space.
 
 Instrumentation of the vmalloc area is optional, unless built with modules,
 in which case it is required.
+
+64 bit support
+==============
+
+Currently, only the radix MMU is supported. There have been versions for hash
+and Book3E processors floating around on the mailing list, but nothing has been
+merged.
+
+KASAN support on Book3S is a bit tricky to get right:
+
+ - It would be good to support inline instrumentation so as to be able to catch
+   stack issues that cannot be caught with outline mode.
+
+ - Inline instrumentation requires a fixed offset.
+
+ - Book3S runs code with translations off ("real mode") during boot, including a
+   lot of generic device-tree parsing code which is used to determine MMU
+   features.
+
+ - Some code - most notably a lot of KVM code - also runs with translations off
+   after boot.
+
+ - Therefore any offset has to point to memory that is valid with
+   translations on or off.
+
+One approach is just to give up on inline instrumentation. This way boot-time
+checks can be delayed until after the MMU is set is up, and we can just not
+instrument any code that runs with translations off after booting. This is the
+current approach.
+
+To avoid this limitiation, the KASAN shadow would have to be placed inside the
+linear mapping, using the same high-bits trick we use for the rest of the linear
+mapping. This is tricky:
+
+ - We'd like to place it near the start of physical memory. In theory we can do
+   this at run-time based on how much physical memory we have, but this requires
+   being able to arbitrarily relocate the kernel, which is basically the tricky
+   part of KASLR. Not being game to implement both tricky things at once, this
+   is hopefully something we can revisit once we get KASLR for Book3S.
+
+ - Alternatively, we can place the shadow at the _end_ of memory, but this
+   requires knowing how much contiguous physical memory a system has _at compile
+   time_. This is a big hammer, and has some unfortunate consequences: inablity
+   to handle discontiguous physical memory, total failure to boot on machines
+   with less memory than specified, and that machines with more memory than
+   specified can't use it. This was deemed unacceptable.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..0bf76e40c9c2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -105,6 +105,7 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 	select ARCH_32BIT_OFF_T if PPC32
+	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_COPY_MC			if PPC64
@@ -152,6 +153,7 @@ config PPC
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANTS_NO_INSTR
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
@@ -183,7 +185,8 @@ config PPC
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
-	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
+	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
+	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KFENCE			if PPC_BOOK3S_32 || PPC_8xx || 40x
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 192f0ed0097f..9f363c143d86 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -374,4 +374,5 @@ config PPC_FAST_ENDIAN_SWITCH
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
-	default 0xe0000000
+	default 0xe0000000 if PPC32
+	default 0xa80e000000000000 if PPC64
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index a7a0572f3846..17e7a778c856 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -18,6 +18,10 @@
 #include <asm/book3s/64/hash-4k.h>
 #endif
 
+#define H_PTRS_PER_PTE		(1 << H_PTE_INDEX_SIZE)
+#define H_PTRS_PER_PMD		(1 << H_PMD_INDEX_SIZE)
+#define H_PTRS_PER_PUD		(1 << H_PUD_INDEX_SIZE)
+
 /* Bits to set in a PMD/PUD/PGD entry valid bit*/
 #define HASH_PMD_VAL_BITS		(0x8000000000000000UL)
 #define HASH_PUD_VAL_BITS		(0x8000000000000000UL)
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 875730d5af40..010eb373fcb3 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -232,6 +232,9 @@ extern unsigned long __pmd_frag_size_shift;
 #define PTRS_PER_PUD	(1 << PUD_INDEX_SIZE)
 #define PTRS_PER_PGD	(1 << PGD_INDEX_SIZE)
 
+#define MAX_PTRS_PER_PTE ((H_PTRS_PER_PTE > R_PTRS_PER_PTE) ? H_PTRS_PER_PTE : R_PTRS_PER_PTE)
+#define MAX_PTRS_PER_PMD ((H_PTRS_PER_PMD > R_PTRS_PER_PMD) ? H_PTRS_PER_PMD : R_PTRS_PER_PMD)
+#define MAX_PTRS_PER_PUD ((H_PTRS_PER_PUD > R_PTRS_PER_PUD) ? H_PTRS_PER_PUD : R_PTRS_PER_PUD)
 #define MAX_PTRS_PER_PGD	(1 << (H_PGD_INDEX_SIZE > RADIX_PGD_INDEX_SIZE ? \
 				       H_PGD_INDEX_SIZE : RADIX_PGD_INDEX_SIZE))
 
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index d090d9612348..686001eda936 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -35,6 +35,11 @@
 #define RADIX_PMD_SHIFT		(PAGE_SHIFT + RADIX_PTE_INDEX_SIZE)
 #define RADIX_PUD_SHIFT		(RADIX_PMD_SHIFT + RADIX_PMD_INDEX_SIZE)
 #define RADIX_PGD_SHIFT		(RADIX_PUD_SHIFT + RADIX_PUD_INDEX_SIZE)
+
+#define R_PTRS_PER_PTE		(1 << RADIX_PTE_INDEX_SIZE)
+#define R_PTRS_PER_PMD		(1 << RADIX_PMD_INDEX_SIZE)
+#define R_PTRS_PER_PUD		(1 << RADIX_PUD_INDEX_SIZE)
+
 /*
  * Size of EA range mapped by our pagetables.
  */
@@ -68,11 +73,11 @@
  *
  *
  * 3rd quadrant expanded:
- * +------------------------------+
- * |                              |
+ * +------------------------------+  Highest address (0xc010000000000000)
+ * +------------------------------+  KASAN shadow end (0xc00fc00000000000)
  * |                              |
  * |                              |
- * +------------------------------+  Kernel vmemmap end (0xc010000000000000)
+ * +------------------------------+  Kernel vmemmap end/shadow start (0xc00e000000000000)
  * |                              |
  * |           512TB		  |
  * |                              |
@@ -91,6 +96,7 @@
  * +------------------------------+  Kernel linear (0xc.....)
  */
 
+/* For the sizes of the shadow area, see kasan.h */
 
 /*
  * If we store section details in page->flags we can't increase the MAX_PHYSMEM_BITS
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 3c478e5ef24c..a6be4025cba2 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -30,9 +30,31 @@
 
 #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
 
+#ifdef CONFIG_PPC32
 #define KASAN_SHADOW_END	(-(-KASAN_SHADOW_START >> KASAN_SHADOW_SCALE_SHIFT))
+#elif defined(CONFIG_PPC_BOOK3S_64)
+/*
+ * The shadow ends before the highest accessible address
+ * because we don't need a shadow for the shadow. Instead:
+ * c00e000000000000 << 3 + a80e000000000000 = c00fc00000000000
+ */
+#define KASAN_SHADOW_END 0xc00fc00000000000UL
+#endif
 
 #ifdef CONFIG_KASAN
+#ifdef CONFIG_PPC_BOOK3S_64
+DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
+
+static __always_inline bool kasan_arch_is_ready(void)
+{
+	if (static_branch_likely(&powerpc_kasan_enabled_key))
+		return true;
+	return false;
+}
+
+#define kasan_arch_is_ready kasan_arch_is_ready
+#endif
+
 void kasan_early_init(void);
 void kasan_mmu_init(void);
 void kasan_init(void);
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4d7829399570..e46335da7f72 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -33,6 +33,17 @@ KASAN_SANITIZE_early_32.o := n
 KASAN_SANITIZE_cputable.o := n
 KASAN_SANITIZE_prom_init.o := n
 KASAN_SANITIZE_btext.o := n
+KASAN_SANITIZE_paca.o := n
+KASAN_SANITIZE_setup_64.o := n
+KASAN_SANITIZE_mce.o := n
+KASAN_SANITIZE_mce_power.o := n
+
+# we have to be particularly careful in ppc64 to exclude code that
+# runs with translations off, as we cannot access the shadow with
+# translations off. However, ppc32 can sanitize this.
+ifdef CONFIG_PPC64
+KASAN_SANITIZE_traps.o := n
+endif
 
 ifdef CONFIG_KASAN
 CFLAGS_early_32.o += -DDISABLE_BRANCH_PROFILING
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 9bdfc8b50899..ed0569b2a3d4 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -134,3 +134,8 @@ obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
 obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o
 
 obj-y += $(kvm-book3s_64-builtin-objs-y)
+
+# KVM does a lot in real-mode, and 64-bit Book3S KASAN doesn't support that
+ifdef CONFIG_PPC_BOOK3S_64
+KASAN_SANITIZE := n
+endif
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 2d50cac499c5..3150159e5121 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -24,3 +24,12 @@ obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
 
 # Instrumenting the SLB fault path can lead to duplicate SLB entries
 KCOV_INSTRUMENT_slb.o := n
+
+# Parts of these can run in real mode and therefore are
+# not safe with the current outline KASAN implementation
+KASAN_SANITIZE_mmu_context.o := n
+KASAN_SANITIZE_pgtable.o := n
+KASAN_SANITIZE_radix_pgtable.o := n
+KASAN_SANITIZE_radix_tlb.o := n
+KASAN_SANITIZE_slb.o := n
+KASAN_SANITIZE_pkeys.o := n
diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index bcbfd6f2eca3..4999aadb1867 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -5,3 +5,4 @@ KASAN_SANITIZE := n
 obj-$(CONFIG_PPC32)		+= init_32.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= init_book3s_64.o
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
new file mode 100644
index 000000000000..afe551b03db9
--- /dev/null
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KASAN for 64-bit Book3S powerpc
+ *
+ * Copyright (C) 2019-2020 IBM Corporation
+ * Author: Daniel Axtens <dja@axtens.net>
+ */
+
+/*
+# ppc64 turns on virtual memory late in boot, after calling into generic code
+# like the device-tree parser, so it uses this in conjunction with a hook in
+# outline mode to avoid invalid access early in boot.
+*/
+
+#define DISABLE_BRANCH_PROFILING
+
+#include <linux/kasan.h>
+#include <linux/printk.h>
+#include <linux/sched/task.h>
+#include <linux/memblock.h>
+#include <asm/pgalloc.h>
+
+DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
+
+static void __init kasan_init_phys_region(void *start, void *end)
+{
+	unsigned long k_start, k_end, k_cur;
+	void *va;
+
+	if (start >= end)
+		return;
+
+	k_start = ALIGN_DOWN((unsigned long)kasan_mem_to_shadow(start), PAGE_SIZE);
+	k_end = ALIGN((unsigned long)kasan_mem_to_shadow(end), PAGE_SIZE);
+
+	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
+	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
+		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
+}
+
+void __init kasan_init(void)
+{
+	/*
+	 * We want to do the following things:
+	 *  1) Map real memory into the shadow for all physical memblocks
+	 *     This takes us from c000... to c008...
+	 *  2) Leave a hole over the shadow of vmalloc space. KASAN_VMALLOC
+	 *     will manage this for us.
+	 *     This takes us from c008... to c00a...
+	 *  3) Map the 'early shadow'/zero page over iomap and vmemmap space.
+	 *     This takes us up to where we start at c00e...
+	 */
+
+	void *k_start = kasan_mem_to_shadow((void *)RADIX_VMALLOC_END);
+	void *k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
+	phys_addr_t start, end;
+	u64 i;
+	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
+
+	if (!early_radix_enabled()) {
+		pr_warn("KASAN not enabled as it requires radix!");
+		return;
+	}
+
+	for_each_mem_range(i, &start, &end)
+		kasan_init_phys_region((void *)start, (void *)end);
+
+	for (i = 0; i < PTRS_PER_PTE; i++)
+		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
+			     &kasan_early_shadow_pte[i], zero_pte, 0);
+
+	for (i = 0; i < PTRS_PER_PMD; i++)
+		pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
+				    kasan_early_shadow_pte);
+
+	for (i = 0; i < PTRS_PER_PUD; i++)
+		pud_populate(&init_mm, &kasan_early_shadow_pud[i],
+			     kasan_early_shadow_pmd);
+
+	/* map the early shadow over the iomap and vmemmap space */
+	kasan_populate_early_shadow(k_start, k_end);
+
+	/* mark early shadow region as RO and wipe it */
+	zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
+	for (i = 0; i < PTRS_PER_PTE; i++)
+		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
+			     &kasan_early_shadow_pte[i], zero_pte, 0);
+
+	/*
+	 * clear_page relies on some cache info that hasn't been set up yet.
+	 * It ends up looping ~forever and blows up other data.
+	 * Use memset instead.
+	 */
+	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+
+	static_branch_inc(&powerpc_kasan_enabled_key);
+
+	/* Enable error messages */
+	init_task.kasan_depth = 0;
+	pr_info("KASAN init done\n");
+}
+
+void __init kasan_late_init(void) { }
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 8c846982766f..2313053fe679 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -21,6 +21,7 @@
 #include <linux/seq_file.h>
 #include <asm/fixmap.h>
 #include <linux/const.h>
+#include <linux/kasan.h>
 #include <asm/page.h>
 #include <asm/hugetlb.h>
 
@@ -289,11 +290,11 @@ static void populate_markers(void)
 #endif
 	address_markers[i++].start_address = FIXADDR_START;
 	address_markers[i++].start_address = FIXADDR_TOP;
+#endif /* CONFIG_PPC64 */
 #ifdef CONFIG_KASAN
 	address_markers[i++].start_address = KASAN_SHADOW_START;
 	address_markers[i++].start_address = KASAN_SHADOW_END;
 #endif
-#endif /* CONFIG_PPC64 */
 }
 
 static int ptdump_show(struct seq_file *m, void *v)
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 87bc1929ee5a..b6562d39b9c4 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -104,6 +104,7 @@ config PPC_BOOK3S_64
 	select HAVE_MOVE_PUD
 	select IRQ_WORK
 	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
+	select KASAN_VMALLOC if KASAN
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index dc7b37c23b60..6488b3842199 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -1,4 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# nothing that deals with real mode is safe to KASAN
+# in particular, idle code runs a bunch of things in real mode
+KASAN_SANITIZE_idle.o := n
+KASAN_SANITIZE_pci-ioda.o := n
+# pnv_machine_check_early
+KASAN_SANITIZE_setup.o := n
+
 obj-y			+= setup.o opal-call.o opal-wrappers.o opal.o opal-async.o
 obj-y			+= idle.o opal-rtc.o opal-nvram.o opal-lpc.o opal-flash.o
 obj-y			+= rng.o opal-elog.o opal-dump.o opal-sysparam.o opal-sensor.o
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index ee60b59024b4..b407fdeb6e78 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -32,3 +32,6 @@ obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_PPC_VAS)		+= vas.o
 
 obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
+
+# nothing that operates in real mode is safe for KASAN
+KASAN_SANITIZE_ras.o := n
-- 
2.35.3

