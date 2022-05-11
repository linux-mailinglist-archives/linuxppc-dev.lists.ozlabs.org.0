Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ADC522D5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 09:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kymlj0vWZz3dPl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 17:30:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IGx78TnA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kymjn1Mqpz3byT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 17:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=IGx78TnA; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4Kymjn133nz4xXS; Wed, 11 May 2022 17:28:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4Kymjn0xRMz4xXk; Wed, 11 May 2022 17:28:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652254125;
 bh=8BTsPshvwTe//bGr2peLkz7sriKq9Sdk9MZ2lEN9siA=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=IGx78TnAY7ovbTsHjJwnWtO0tsKwK9YlpJjPr2DLfisUpE0zqWfX/wTpD7xZpWFJY
 C/WZHyDhwHRLmDNhbJ4Z1mlH97LYvSil7ooqIcjXobNXMIdiFdfyPBU6aY/2v4gi7n
 1ElPjGwGqQ43i1hNf8xfaBvfr4LgYX62Piha4pl320CoKsO4JUAHA+3/a1ezY85xCE
 LLbN0SKdUTlyGxmhWdocPv1XEwbfuDb05y6jn1TnpVInDwRMrmwp5YOUsjcXC0jozl
 E9IGmraTRGkWhOD6/nRg5bbI1ALp9mBC0Qnh7QUjqmuj0u5JwXtOfXao3BbXlwYaSc
 THN5p/UP6scKQ==
Date: Wed, 11 May 2022 17:28:38 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/3] [RFC] powerpc: Book3S 64-bit outline-only KASAN support
Message-ID: <YntlprNj9jNOsi/I@cleo>
References: <Yntk7oERGce44+Sd@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yntk7oERGce44+Sd@cleo>
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

 - Document KASAN in both generic and powerpc docs.

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

[paulus@ozlabs.org - Rebased onto 5.17.  Still RFC because:

 (a) A kernel with CONFIG_KASAN=y will crash during boot on a machine
 using HPT translation because not all the entry points to the generic
 KASAN code are protected with a call to kasan_arch_is_ready() -- at
 least __kasan_kfree_large() and __kasan_check_byte() need such a
 guard, and probably others.  Previous versions of this code had a
 panic() call in kasan_init() to prevent a KASAN-enabled kernel from
 booting on a HPT machine, but unfortunately the panic string doesn't
 actually get printed to the console, because kasan_init gets called
 very early.

 (b) Of the KASAN tests included in the kernel source, all the
 relevant ones pass except for the "global_oob_right" test, and it
 only fails when CONFIG_KASAN_KUNIT_TEST=m; it passes when the kunit
 tests are built in.  That is, KASAN is not detecting out-of-bounds
 accesses to module-global data.
]

Originally-by: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix version
Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 Documentation/dev-tools/kasan.rst            |  11 +-
 Documentation/powerpc/kasan.txt              |  48 ++++++++-
 arch/powerpc/Kconfig                         |   5 +-
 arch/powerpc/Kconfig.debug                   |   3 +-
 arch/powerpc/include/asm/book3s/64/hash.h    |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h |   3 +
 arch/powerpc/include/asm/book3s/64/radix.h   |  13 ++-
 arch/powerpc/include/asm/interrupt.h         |  52 +++++++---
 arch/powerpc/include/asm/kasan.h             |  22 ++++
 arch/powerpc/include/asm/ptrace.h            |   6 --
 arch/powerpc/kernel/Makefile                 |  11 ++
 arch/powerpc/kernel/process.c                |  16 +--
 arch/powerpc/kernel/smp.c                    |  22 ++--
 arch/powerpc/kernel/traps.c                  |   6 +-
 arch/powerpc/kexec/Makefile                  |   2 +
 arch/powerpc/kvm/Makefile                    |   5 +
 arch/powerpc/lib/Makefile                    |   3 +
 arch/powerpc/mm/book3s64/Makefile            |   9 ++
 arch/powerpc/mm/kasan/Makefile               |   1 +
 arch/powerpc/mm/kasan/init_book3s_64.c       | 103 +++++++++++++++++++
 arch/powerpc/mm/ptdump/ptdump.c              |   3 +-
 arch/powerpc/platforms/Kconfig.cputype       |   1 +
 arch/powerpc/platforms/powernv/Makefile      |   8 ++
 arch/powerpc/platforms/powernv/smp.c         |   2 +-
 arch/powerpc/platforms/pseries/Makefile      |   6 ++
 arch/powerpc/sysdev/xics/xics-common.c       |   4 +-
 arch/powerpc/sysdev/xive/common.c            |   4 +-
 27 files changed, 318 insertions(+), 55 deletions(-)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 8e5cd26d59cb..448995c11bee 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -36,8 +36,9 @@ Both software KASAN modes work with SLUB and SLAB memory allocators,
 while the hardware tag-based KASAN currently only supports SLUB.
 
 Currently, generic KASAN is supported for the x86_64, arm, arm64, xtensa, s390,
-and riscv architectures. It is also supported on 32-bit powerpc kernels.
-Tag-based KASAN modes are supported only for arm64.
+and riscv architectures. It is also supported on powerpc for 32-bit kernels and
+for 64-bit kernels running under the Radix MMU. Tag-based KASAN modes are
+supported only for arm64.
 
 Usage
 -----
@@ -350,10 +351,10 @@ CONFIG_KASAN_VMALLOC
 
 With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
 cost of greater memory usage. Currently, this is supported on x86,
-riscv, s390, and 32-bit powerpc.
+riscv, s390, and powerpc.
 
-It is optional, except on 32-bit powerpc kernels with module support,
-where it is required.
+It is optional, except on 64-bit powerpc kernels, and on 32-bit
+powerpc kernels with module support, where it is required.
 
 This works by hooking into vmalloc and vmap and dynamically
 allocating real shadow memory to back the mappings.
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
index d090d9612348..bafc9869afcd 100644
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
+ * +------------------------------+  Highest address (0xc010000000000000)
+ * +------------------------------+  KASAN shadow end (0xc00fc00000000000)
  * |                              |
  * |                              |
- * |                              |
- * +------------------------------+  Kernel vmemmap end (0xc010000000000000)
+ * +------------------------------+  Kernel vmemmap end/shadow start (0xc00e000000000000)
  * |                              |
  * |           512TB		  |
  * |                              |
@@ -126,6 +131,8 @@
 #define RADIX_VMEMMAP_SIZE	RADIX_KERN_MAP_SIZE
 #define RADIX_VMEMMAP_END	(RADIX_VMEMMAP_START + RADIX_VMEMMAP_SIZE)
 
+/* For the sizes of the shadow area, see kasan.h */
+
 #ifndef __ASSEMBLY__
 #define RADIX_PTE_TABLE_SIZE	(sizeof(pte_t) << RADIX_PTE_INDEX_SIZE)
 #define RADIX_PMD_TABLE_SIZE	(sizeof(pmd_t) << RADIX_PMD_INDEX_SIZE)
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index fc28f46d2f9d..fb244b6ca7f0 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -327,22 +327,46 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	}
 #endif
 
+	/* If data relocations are enabled, it's safe to use nmi_enter() */
+	if (mfmsr() & MSR_DR) {
+		nmi_enter();
+		return;
+	}
+
 	/*
-	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
+	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
 	 * NMI because not everything it touches is within the RMA limit.
 	 */
-	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
-			!firmware_has_feature(FW_FEATURE_LPAR) ||
-			radix_enabled() || (mfmsr() & MSR_DR))
-		nmi_enter();
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+	    firmware_has_feature(FW_FEATURE_LPAR) &&
+	    !radix_enabled())
+		return;
+
+	/*
+	 * Likewise, don't use it if we have some form of instrumentation (like
+	 * KASAN shadow) that is not safe to access in real mode (even on radix)
+	 */
+	if (IS_ENABLED(CONFIG_KASAN))
+		return;
+
+	/* Otherwise, it should be safe to call it */
+	nmi_enter();
 }
 
 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
-	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
-			!firmware_has_feature(FW_FEATURE_LPAR) ||
-			radix_enabled() || (mfmsr() & MSR_DR))
+	if (mfmsr() & MSR_DR) {
+		// nmi_exit if relocations are on
 		nmi_exit();
+	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+		   firmware_has_feature(FW_FEATURE_LPAR) &&
+		   !radix_enabled()) {
+		// no nmi_exit for a pseries hash guest taking a real mode exception
+	} else if (IS_ENABLED(CONFIG_KASAN)) {
+		// no nmi_exit for KASAN in real mode
+	} else {
+		nmi_exit();
+	}
 
 	/*
 	 * nmi does not call nap_adjust_return because nmi should not create
@@ -410,7 +434,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
  * Specific handlers may have additional restrictions.
  */
 #define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
-static __always_inline long ____##func(struct pt_regs *regs);		\
+static __always_inline __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs);					\
 									\
 interrupt_handler long func(struct pt_regs *regs)			\
 {									\
@@ -424,7 +449,8 @@ interrupt_handler long func(struct pt_regs *regs)			\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
-static __always_inline long ____##func(struct pt_regs *regs)
+static __always_inline __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs)
 
 /**
  * DECLARE_INTERRUPT_HANDLER - Declare synchronous interrupt handler function
@@ -549,7 +575,8 @@ static __always_inline void ____##func(struct pt_regs *regs)
  * body with a pair of curly brackets.
  */
 #define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
-static __always_inline long ____##func(struct pt_regs *regs);		\
+static __always_inline __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs);					\
 									\
 interrupt_handler long func(struct pt_regs *regs)			\
 {									\
@@ -566,7 +593,8 @@ interrupt_handler long func(struct pt_regs *regs)			\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
-static __always_inline long ____##func(struct pt_regs *regs)
+static __always_inline  __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs)
 
 
 /* Interrupt handlers */
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 3c478e5ef24c..6efc822e70fd 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -30,9 +30,31 @@
 
 #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
 
+#ifdef CONFIG_PPC32
 #define KASAN_SHADOW_END	(-(-KASAN_SHADOW_START >> KASAN_SHADOW_SCALE_SHIFT))
+#endif
 
 #ifdef CONFIG_KASAN
+#ifdef CONFIG_PPC_BOOK3S_64
+/*
+ * The shadow ends before the highest accessible address
+ * because we don't need a shadow for the shadow. Instead:
+ * c00e000000000000 << 3 + a80e000000000000 = c00fc00000000000
+ */
+#define KASAN_SHADOW_END 0xc00fc00000000000UL
+
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
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 42f89e2d8f04..d4d547b4ed28 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -305,12 +305,6 @@ static inline void regs_set_recoverable(struct pt_regs *regs)
 		regs_set_return_msr(regs, regs->msr | MSR_RI);
 }
 
-static inline void regs_set_unrecoverable(struct pt_regs *regs)
-{
-	if (cpu_has_msr_ri())
-		regs_set_return_msr(regs, regs->msr & ~MSR_RI);
-}
-
 #define arch_has_single_step()	(1)
 #define arch_has_block_step()	(true)
 #define ARCH_HAS_USER_SINGLE_STEP_REPORT
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
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 984813a4d5dc..c962f9bfc7d4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2220,8 +2220,8 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 			break;
 
 		stack = (unsigned long *) sp;
-		newsp = stack[0];
-		ip = stack[STACK_FRAME_LR_SAVE];
+		newsp = READ_ONCE_NOCHECK(stack[0]);
+		ip = READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
 		if (!firstframe || ip != lr) {
 			printk("%s["REG"] ["REG"] %pS",
 				loglvl, sp, ip, (void *)ip);
@@ -2239,17 +2239,19 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 		 * See if this is an exception frame.
 		 * We look for the "regshere" marker in the current frame.
 		 */
-		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
-		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
+		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS) &&
+		    (READ_ONCE_NOCHECK(stack[STACK_FRAME_MARKER]) ==
+		     STACK_FRAME_REGS_MARKER)) {
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_FRAME_OVERHEAD);
 
-			lr = regs->link;
+			lr = READ_ONCE_NOCHECK(regs->link);
 			printk("%s--- interrupt: %lx at %pS\n",
-			       loglvl, regs->trap, (void *)regs->nip);
+			       loglvl, READ_ONCE_NOCHECK(regs->trap),
+			       (void *)READ_ONCE_NOCHECK(regs->nip));
 			__show_regs(regs);
 			printk("%s--- interrupt: %lx\n",
-			       loglvl, regs->trap);
+			       loglvl, READ_ONCE_NOCHECK(regs->trap));
 
 			firstframe = 1;
 		}
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b7fd6a72aa76..5fedadc27952 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -413,32 +413,32 @@ static struct cpumask nmi_ipi_pending_mask;
 static bool nmi_ipi_busy = false;
 static void (*nmi_ipi_function)(struct pt_regs *) = NULL;
 
-static void nmi_ipi_lock_start(unsigned long *flags)
+noinstr static void nmi_ipi_lock_start(unsigned long *flags)
 {
 	raw_local_irq_save(*flags);
 	hard_irq_disable();
-	while (atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1) {
+	while (arch_atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1) {
 		raw_local_irq_restore(*flags);
-		spin_until_cond(atomic_read(&__nmi_ipi_lock) == 0);
+		spin_until_cond(arch_atomic_read(&__nmi_ipi_lock) == 0);
 		raw_local_irq_save(*flags);
 		hard_irq_disable();
 	}
 }
 
-static void nmi_ipi_lock(void)
+noinstr static void nmi_ipi_lock(void)
 {
-	while (atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1)
-		spin_until_cond(atomic_read(&__nmi_ipi_lock) == 0);
+	while (arch_atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1)
+		spin_until_cond(arch_atomic_read(&__nmi_ipi_lock) == 0);
 }
 
-static void nmi_ipi_unlock(void)
+noinstr static void nmi_ipi_unlock(void)
 {
 	smp_mb();
-	WARN_ON(atomic_read(&__nmi_ipi_lock) != 1);
-	atomic_set(&__nmi_ipi_lock, 0);
+	WARN_ON(arch_atomic_read(&__nmi_ipi_lock) != 1);
+	arch_atomic_set(&__nmi_ipi_lock, 0);
 }
 
-static void nmi_ipi_unlock_end(unsigned long *flags)
+noinstr static void nmi_ipi_unlock_end(unsigned long *flags)
 {
 	nmi_ipi_unlock();
 	raw_local_irq_restore(*flags);
@@ -447,7 +447,7 @@ static void nmi_ipi_unlock_end(unsigned long *flags)
 /*
  * Platform NMI handler calls this to ack
  */
-int smp_handle_nmi_ipi(struct pt_regs *regs)
+noinstr int smp_handle_nmi_ipi(struct pt_regs *regs)
 {
 	void (*fn)(struct pt_regs *) = NULL;
 	unsigned long flags;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a08bb7cefdc5..3aaa50e5c72f 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -393,7 +393,7 @@ void _exception(int signr, struct pt_regs *regs, int code, unsigned long addr)
  * Builds that do not support KVM could take this second option to increase
  * the recoverability of NMIs.
  */
-void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
+noinstr void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_POWERNV
 	unsigned long kbase = (unsigned long)_stext;
@@ -433,7 +433,9 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 	return;
 
 nonrecoverable:
-	regs_set_unrecoverable(regs);
+	regs->msr &= ~MSR_RI;
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 #endif
 }
 DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index b6c52608cb49..0c2abe7f9908 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -13,3 +13,5 @@ obj-$(CONFIG_KEXEC_FILE)	+= file_load.o ranges.o file_load_$(BITS).o elf_$(BITS)
 GCOV_PROFILE_core_$(BITS).o := n
 KCOV_INSTRUMENT_core_$(BITS).o := n
 UBSAN_SANITIZE_core_$(BITS).o := n
+KASAN_SANITIZE_core.o := n
+KASAN_SANITIZE_core_$(BITS) := n
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
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 5d1881d2e39a..8560c912186d 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -13,6 +13,9 @@ CFLAGS_REMOVE_feature-fixups.o = $(CC_FLAGS_FTRACE)
 
 KASAN_SANITIZE_code-patching.o := n
 KASAN_SANITIZE_feature-fixups.o := n
+# restart_table.o contains functions called in the NMI interrupt path
+# which can be in real mode. Disable KASAN.
+KASAN_SANITIZE_restart_table.o := n
 
 ifdef CONFIG_KASAN
 CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
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
index 000000000000..cb96e16e57a1
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
+	pr_info("KASAN init done (64-bit Book3S)\n");
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
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index cbb67813cd5d..9e1a25398f98 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -345,7 +345,7 @@ static void __init pnv_smp_probe(void)
 	}
 }
 
-static int pnv_system_reset_exception(struct pt_regs *regs)
+noinstr static int pnv_system_reset_exception(struct pt_regs *regs)
 {
 	if (smp_handle_nmi_ipi(regs))
 		return 1;
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index ee60b59024b4..98e878c32a21 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -32,3 +32,9 @@ obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_PPC_VAS)		+= vas.o
 
 obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
+
+# nothing that operates in real mode is safe for KASAN
+KASAN_SANITIZE_ras.o := n
+KASAN_SANITIZE_kexec.o := n
+#machine_kexec
+KASAN_SANITIZE_setup.o := n
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index f3fb2a12124c..322b2b8bd467 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -146,7 +146,7 @@ void __init xics_smp_probe(void)
 
 #endif /* CONFIG_SMP */
 
-void xics_teardown_cpu(void)
+noinstr void xics_teardown_cpu(void)
 {
 	struct xics_cppr *os_cppr = this_cpu_ptr(&xics_cppr);
 
@@ -159,7 +159,7 @@ void xics_teardown_cpu(void)
 	icp_ops->teardown_cpu();
 }
 
-void xics_kexec_teardown_cpu(int secondary)
+noinstr void xics_kexec_teardown_cpu(int secondary)
 {
 	xics_teardown_cpu();
 
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 1ca5564bda9d..87b825b7401d 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1241,7 +1241,7 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
 	return 0;
 }
 
-static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
+noinstr static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
 {
 	unsigned int xive_ipi_irq = xive_ipi_cpu_to_irq(cpu);
 
@@ -1634,7 +1634,7 @@ void xive_flush_interrupt(void)
 
 #endif /* CONFIG_SMP */
 
-void xive_teardown_cpu(void)
+noinstr void xive_teardown_cpu(void)
 {
 	struct xive_cpu *xc = __this_cpu_read(xive_cpu);
 	unsigned int cpu = smp_processor_id();
-- 
2.35.3

