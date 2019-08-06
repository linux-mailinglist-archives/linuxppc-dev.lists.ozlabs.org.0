Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3983E05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:47:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463BCC2CHBzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 09:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="JicdM7k7"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463B0y52fDzDr3M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 09:38:58 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q10so42345392pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 16:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vKUdQ4OjZKtw2XHy7QMISE99Vq6NOygkV52QoPHeIV8=;
 b=JicdM7k7oH4ZKPbbPfR8g1Zz9lvab2rOskJ+os6y7T9UhZW+84LnQPahnXFFudt8QL
 f31/ieLKHsxsBHIthXlLdLR9nR50/FIveLEv17caiSmhncS56EPm7h+lNBNPFhxmygP4
 IuAAvJhM0zjh3tX0qt+PFhyDjXNPQMqbHau/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vKUdQ4OjZKtw2XHy7QMISE99Vq6NOygkV52QoPHeIV8=;
 b=saEURadlbDtptIeYflBtqNRll2P8/kZM8GTcxN3vDEKmaFFl5W+aUbXpfEBnd38be4
 OaKkDRz2y4iDcT4Nc0LP9duldJc8C4mhc2nFrhh+5wx3TBfa2OkV64z5fkRXjkUVJjGC
 sLBiMsjWIVrG26MgYgM/JB81soX7m8OlgpFFFPLOdcSsifDMLM0bNkBWO6aWYbfBAvbS
 R5vykUM+6aOo+VN3gunVwtDP7or0/smvySB0HU719E/Pw3lf8UXsM4YDCQR1iqvmKzb0
 F58J/T6sEgrwZneFJFHnql/wPP8B9r99fZs+CMs1/lzrgakWHKvZZjoZhVr3U9PkZbqc
 De7A==
X-Gm-Message-State: APjAAAUiYaMwbAWG60myx3x20p5yaDoLr91fR1WFAeWhtkl0PlkgRVOv
 adt/KVFmVtA6g3wWap1wHwBLXQ==
X-Google-Smtp-Source: APXvYqzAXOifKBSO1DE+ZH9D1jXwpi0Xt9qRHL4JuhCHAc2wjw5xF6xHXSWa4W0W3k3LtxP5q0rZcQ==
X-Received: by 2002:a65:5a86:: with SMTP id c6mr4820049pgt.95.1565134735825;
 Tue, 06 Aug 2019 16:38:55 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id z13sm89294339pfa.94.2019.08.06.16.38.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 16:38:55 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [PATCH 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
Date: Wed,  7 Aug 2019 09:38:27 +1000
Message-Id: <20190806233827.16454-5-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806233827.16454-1-dja@axtens.net>
References: <20190806233827.16454-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KASAN support on powerpc64 is interesting:

 - We want to be able to support inline instrumentation so as to be
   able to catch global and stack issues.

 - We run a lot of code at boot in real mode. This includes stuff like
   printk(), so it's not feasible to just disable instrumentation
   around it.

   [For those not immersed in ppc64, in real mode, the top nibble or
   2 bits (depending on radix/hash mmu) of the address is ignored. To
   make things work, we put the linear mapping at
   0xc000000000000000. This means that a pointer to part of the linear
   mapping will work both in real mode, where it will be interpreted
   as a physical address of the form 0x000..., and out of real mode,
   where it will go via the linear mapping.]

 - Inline instrumentation requires a fixed offset.

 - Because of our running things in real mode, the offset has to
   point to valid memory both in and out of real mode.

This makes finding somewhere to put the KASAN shadow region a bit fun.

One approach is just to give up on inline instrumentation and override
the address->shadow calculation. This way we can delay all checking
until after we get everything set up to our satisfaction. However,
we'd really like to do better.

What we can do - if we know _at compile time_ how much contiguous
physical memory we have - is to set aside the top 1/8th of the memory
and use that. This is a big hammer (hence the "heavyweight" name) and
comes with 3 big consequences:

 - kernels will simply fail to boot on machines with less memory than
   specified when compiling.

 - kernels running on machines with more memory than specified when
   compiling will simply ignore the extra memory.

 - there's no nice way to handle physically discontiguous memory, so
   you are restricted to the first physical memory block.

If you can bear all this, you get pretty full support for KASAN.

Despite the limitations, it can still find bugs,
e.g. http://patchwork.ozlabs.org/patch/1103775/

The current implementation is Radix only. I am open to extending
it to hash at some point but I don't think it should hold up v1.

Massive thanks to mpe, who had the idea for the initial design.

Signed-off-by: Daniel Axtens <dja@axtens.net>

---
Changes since the rfc:

 - Boots real and virtual hardware, kvm works.

 - disabled reporting when we're checking the stack for exception
   frames. The behaviour isn't wrong, just incompatible with KASAN.

 - Documentation!

 - Dropped old module stuff in favour of KASAN_VMALLOC.

The bugs with ftrace and kuap were due to kernel bloat pushing
prom_init calls to be done via the plt. Because we did not have
a relocatable kernel, and they are done very early, this caused
everything to explode. Compile with CONFIG_RELOCATABLE!

---
 Documentation/dev-tools/kasan.rst            |   7 +-
 Documentation/powerpc/kasan.txt              | 111 +++++++++++++++++++
 arch/powerpc/Kconfig                         |   4 +
 arch/powerpc/Kconfig.debug                   |  21 ++++
 arch/powerpc/Makefile                        |   7 ++
 arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
 arch/powerpc/include/asm/kasan.h             |  35 +++++-
 arch/powerpc/kernel/process.c                |   8 ++
 arch/powerpc/kernel/prom.c                   |  57 +++++++++-
 arch/powerpc/mm/kasan/Makefile               |   1 +
 arch/powerpc/mm/kasan/kasan_init_book3s_64.c |  76 +++++++++++++
 11 files changed, 326 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 35fda484a672..48d3b669e577 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -22,7 +22,9 @@ global variables yet.
 Tag-based KASAN is only supported in Clang and requires version 7.0.0 or later.
 
 Currently generic KASAN is supported for the x86_64, arm64, xtensa and s390
-architectures, and tag-based KASAN is supported only for arm64.
+architectures. It is also supported on powerpc for 32-bit kernels, and for
+64-bit kernels running under the radix MMU. Tag-based KASAN is supported only
+for arm64.
 
 Usage
 -----
@@ -252,7 +254,8 @@ CONFIG_KASAN_VMALLOC
 ~~~~~~~~~~~~~~~~~~~~
 
 With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
-cost of greater memory usage. Currently this is only supported on x86.
+cost of greater memory usage. Currently this is optional on x86, and
+required on 64-bit powerpc.
 
 This works by hooking into vmalloc and vmap, and dynamically
 allocating real shadow memory to back the mappings.
diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
new file mode 100644
index 000000000000..a5592454353b
--- /dev/null
+++ b/Documentation/powerpc/kasan.txt
@@ -0,0 +1,111 @@
+KASAN is supported on powerpc on 32-bit and 64-bit Radix only.
+
+32 bit support
+==============
+
+KASAN is supported on both hash and nohash MMUs on 32-bit.
+
+The shadow area sits at the top of the kernel virtual memory space above the
+fixmap area and occupies one eighth of the total kernel virtual memory space.
+
+Instrumentation of the vmalloc area is not currently supported, but modules are.
+
+64 bit support
+==============
+
+Currently, only the radix MMU is supported. There have been versions for Book3E
+processors floating around on the mailing list, but nothing has been merged.
+
+KASAN support on Book3S is interesting:
+
+ - We want to be able to support inline instrumentation so as to be able to
+   catch global and stack issues.
+
+ - Inline instrumentation requires a fixed offset.
+
+ - We run a lot of code at boot in real mode. This includes stuff like printk(),
+   so it's not feasible to just disable instrumentation around it.
+
+ - Because of our running things in real mode, the offset has to point to valid
+   memory both in and out of real mode.
+
+This makes finding somewhere to put the KASAN shadow region a bit fun.
+
+One approach is just to give up on inline instrumentation. This way we can delay
+all checks until after we get everything set up to our satisfaction. However,
+we'd really like to do better.
+
+If we know _at compile time_ how much contiguous physical memory we have, we can
+set aside the top 1/8th of physical memory and use that. This is a big hammer
+and comes with 2 big consequences:
+
+ - kernels will simply fail to boot on machines with less memory than specified
+   when compiling.
+
+ - kernels running on machines with more memory than specified when compiling
+   will simply ignore the extra memory.
+
+If you can live with this, you get full support for KASAN.
+
+Tips
+----
+
+ - Compile with CONFIG_RELOCATABLE.
+
+   In development, we found boot hangs when building with ftrace and KUAP. These
+   ended up being due to kernel bloat pushing prom_init calls to be done via the
+   PLT. Because we did not have a relocatable kernel, and they are done very
+   early, this caused us to jump off into somewhere invalid. Enabling relocation
+   fixes this.
+
+NUMA/discontiguous physical memory
+----------------------------------
+
+We currently cannot really deal with discontiguous physical memory. You are
+restricted to the physical memory that is contiguous from physical address zero,
+and must specify the size of that memory, not total memory, when configuring
+your kernel.
+
+Discontiguous memory can occur when you have a machine with memory spread across
+multiple nodes. For example, on a Talos II with 64GB of RAM:
+
+ - 32GB runs from 0x0 to 0x0000_0008_0000_0000,
+ - then there's a gap,
+ - then the final 32GB runs from 0x0000_2000_0000_0000 to 0x0000_2008_0000_0000.
+
+This can create _significant_ issues:
+
+ - If we try to treat the machine as having 64GB of _contiguous_ RAM, we would
+   assume that ran from 0x0 to 0x0000_0010_0000_0000. We'd then reserve the last
+   1/8th - 0x0000_000e_0000_0000 to 0x0000_0010_0000_0000 as the shadow
+   region. But when we try to access any of that, we'll try to access pages that
+   are not physically present.
+
+ - If we try to base the shadow region size on the top address, we'll need to
+   reserve 0x2008_0000_0000 / 8 = 0x0401_0000_0000 bytes = 4100 GB of memory,
+   which will clearly not work on a system with 64GB of RAM.
+
+Therefore, you are restricted to the memory in the node starting at 0x0. For
+this system, that's 32GB. If you specify a contiguous physical memory size
+greater than the size of the first contiguous region of memory, the system will
+be unable to boot or even print an error message warning you.
+
+You can determine the layout of your system's memory by observing the messages
+that the Radix MMU prints on boot. The Talos II discussed earlier has:
+
+radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB pages (exec)
+radix-mmu: Mapped 0x0000000040000000-0x0000000800000000 with 1.00 GiB pages
+radix-mmu: Mapped 0x0000200000000000-0x0000200800000000 with 1.00 GiB pages
+
+As discussed, you'd configure this system for 32768 MB.
+
+Another system prints:
+
+radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB pages (exec)
+radix-mmu: Mapped 0x0000000040000000-0x0000002000000000 with 1.00 GiB pages
+radix-mmu: Mapped 0x0000200000000000-0x0000202000000000 with 1.00 GiB pages
+
+This machine has more memory: 0x0000_0040_0000_0000 total, but only
+0x0000_0020_0000_0000 is physically contiguous from zero, so we'd configure the
+kernel for 131072 MB of physically contiguous memory.
+
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d8dcd8820369..3d6deee100e2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -171,6 +171,10 @@ config PPC
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32
+	select HAVE_ARCH_KASAN			if PPC_BOOK3S_64 && PPC_RADIX_MMU
+	select ARCH_HAS_KASAN_EARLY_SHADOW	if PPC_BOOK3S_64
+	select HAVE_ARCH_KASAN_VMALLOC		if PPC_BOOK3S_64
+	select KASAN_VMALLOC			if KASAN
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index c59920920ddc..2d6fb7b1ba59 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -394,6 +394,27 @@ config PPC_FAST_ENDIAN_SWITCH
         help
 	  If you're unsure what this is, say N.
 
+config PHYS_MEM_SIZE_FOR_KASAN
+	int "Contiguous physical memory size for KASAN (MB)"
+	depends on KASAN && PPC_BOOK3S_64
+	help
+
+	  To get inline instrumentation support for KASAN on 64-bit Book3S
+	  machines, you need to know how much contiguous physical memory your
+	  system has. A shadow offset will be calculated based on this figure,
+	  which will be compiled in to the kernel. KASAN will use this offset
+	  to access its shadow region, which is used to verify memory accesses.
+
+	  If you attempt to boot on a system with less memory than you specify
+	  here, your system will fail to boot very early in the process. If you
+	  boot on a system with more memory than you specify, the extra memory
+	  will wasted - it will be reserved and not used.
+
+	  For systems with discontiguous blocks of physical memory, specify the
+	  size of the block starting at 0x0. You can determine this by looking
+	  at the memory layout info printed to dmesg by the radix MMU code
+	  early in boot. See Documentation/powerpc/kasan.txt.
+
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c345b79414a9..33e7bba4c8db 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -229,6 +229,13 @@ ifdef CONFIG_476FPE_ERR46
 		-T $(srctree)/arch/powerpc/platforms/44x/ppc476_modules.lds
 endif
 
+ifdef CONFIG_KASAN
+ifdef CONFIG_PPC_BOOK3S_64
+# 0xa800000000000000 = 12105675798371893248
+KASAN_SHADOW_OFFSET = $(shell echo 7 \* 1024 \* 1024 \* $(CONFIG_PHYS_MEM_SIZE_FOR_KASAN) / 8 + 12105675798371893248 | bc)
+endif
+endif
+
 # No AltiVec or VSX instructions when building kernel
 KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
 KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index e04a839cb5b9..4c011cc15e05 100644
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
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 296e51c2f066..d6b4028c296b 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -14,13 +14,20 @@
 
 #ifndef __ASSEMBLY__
 
-#include <asm/page.h>
+#ifdef CONFIG_KASAN
+void kasan_init(void);
+#else
+static inline void kasan_init(void) { }
+#endif
 
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
 #define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
 				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))
 
+#ifdef CONFIG_PPC32
+#include <asm/page.h>
+
 #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
 
 #define KASAN_SHADOW_END	0UL
@@ -30,11 +37,33 @@
 #ifdef CONFIG_KASAN
 void kasan_early_init(void);
 void kasan_mmu_init(void);
-void kasan_init(void);
 #else
-static inline void kasan_init(void) { }
 static inline void kasan_mmu_init(void) { }
 #endif
+#endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+#include <asm/pgtable.h>
+
+/*
+ * The KASAN shadow offset is such that linear map (0xc000...) is shadowed by
+ * the last 8th of linearly mapped physical memory. This way, if the code uses
+ * 0xc addresses throughout, accesses work both in in real mode (where the top
+ * 2 bits are ignored) and outside of real mode.
+ */
+#define KASAN_SHADOW_OFFSET ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * \
+				1024 * 1024 * 7 / 8 + 0xa800000000000000UL)
+
+#define KASAN_SHADOW_SIZE ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * \
+				1024 * 1024 * 1 / 8)
+
+extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
+
+extern pte_t kasan_early_shadow_pte[R_PTRS_PER_PTE];
+extern pmd_t kasan_early_shadow_pmd[R_PTRS_PER_PMD];
+extern pud_t kasan_early_shadow_pud[R_PTRS_PER_PUD];
+extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
+#endif /* CONFIG_PPC_BOOK3S_64 */
 
 #endif /* __ASSEMBLY */
 #endif
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8fc4de0d22b4..31602536e72b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2097,7 +2097,14 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 		/*
 		 * See if this is an exception frame.
 		 * We look for the "regshere" marker in the current frame.
+		 *
+		 * KASAN may complain about this. If it is an exception frame,
+		 * we won't have unpoisoned the stack in asm when we set the
+		 * exception marker. If it's not an exception frame, who knows
+		 * how things are laid out - the shadow could be in any state
+		 * at all. Just disable KASAN reporting for now.
 		 */
+		kasan_disable_current();
 		if (validate_sp(sp, tsk, STACK_INT_FRAME_SIZE)
 		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
 			struct pt_regs *regs = (struct pt_regs *)
@@ -2107,6 +2114,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 			       regs->trap, (void *)regs->nip, (void *)lr);
 			firstframe = 1;
 		}
+		kasan_enable_current();
 
 		sp = newsp;
 	} while (count++ < kstack_depth_to_print);
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 7159e791a70d..dde5f2896ab6 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -71,6 +71,7 @@ unsigned long tce_alloc_start, tce_alloc_end;
 u64 ppc64_rma_size;
 #endif
 static phys_addr_t first_memblock_size;
+static phys_addr_t top_phys_addr;
 static int __initdata boot_cpu_count;
 
 static int __init early_parse_mem(char *p)
@@ -448,6 +449,21 @@ static bool validate_mem_limit(u64 base, u64 *size)
 {
 	u64 max_mem = 1UL << (MAX_PHYSMEM_BITS);
 
+#ifdef CONFIG_KASAN
+	/*
+	 * To handle the NUMA/discontiguous memory case, don't allow a block
+	 * to be added if it falls completely beyond the configured physical
+	 * memory.
+	 *
+	 * See Documentation/powerpc/kasan.txt
+	 */
+	if (base >= (u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * 1024 * 1024) {
+		pr_warn("KASAN: not adding mem block at %llx (size %llx)",
+			base, *size);
+		return false;
+	}
+#endif
+
 	if (base >= max_mem)
 		return false;
 	if ((base + *size) > max_mem)
@@ -571,8 +587,11 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 
 	/* Add the chunk to the MEMBLOCK list */
 	if (add_mem_to_memblock) {
-		if (validate_mem_limit(base, &size))
+		if (validate_mem_limit(base, &size)) {
 			memblock_add(base, size);
+			if (base + size > top_phys_addr)
+				top_phys_addr = base + size;
+		}
 	}
 }
 
@@ -612,6 +631,8 @@ static void __init early_reserve_mem_dt(void)
 static void __init early_reserve_mem(void)
 {
 	__be64 *reserve_map;
+	phys_addr_t kasan_shadow_start __maybe_unused;
+	phys_addr_t kasan_memory_size __maybe_unused;
 
 	reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
 			fdt_off_mem_rsvmap(initial_boot_params));
@@ -650,6 +671,40 @@ static void __init early_reserve_mem(void)
 		return;
 	}
 #endif
+
+#if defined(CONFIG_KASAN) && defined(CONFIG_PPC_BOOK3S_64)
+	kasan_memory_size = ((phys_addr_t)CONFIG_PHYS_MEM_SIZE_FOR_KASAN
+		* 1024 * 1024);
+
+	if (top_phys_addr < kasan_memory_size) {
+		/*
+		 * We are doomed. Attempts to call e.g. panic() are likely to
+		 * fail because they call out into instrumented code, which
+		 * will almost certainly access memory beyond the end of
+		 * physical memory. Hang here so that at least the NIP points
+		 * somewhere that will help you debug it if you look at it in
+		 * qemu.
+		 */
+		while (true)
+			;
+	} else if (top_phys_addr > kasan_memory_size) {
+		/* print a biiiig warning in hopes people notice */
+		pr_err("===========================================\n"
+			"Physical memory exceeds compiled-in maximum!\n"
+			"This kernel was compiled for KASAN with %u MB physical memory.\n"
+			"The actual physical memory detected is %llu MB.\n"
+			"Memory above the compiled limit will not be used!\n"
+			"===========================================\n",
+			CONFIG_PHYS_MEM_SIZE_FOR_KASAN,
+			top_phys_addr / (1024 * 1024));
+	}
+
+	kasan_shadow_start = _ALIGN_DOWN(kasan_memory_size * 7 / 8, PAGE_SIZE);
+	DBG("reserving %llx -> %llx for KASAN",
+	    kasan_shadow_start, top_phys_addr);
+	memblock_reserve(kasan_shadow_start,
+			 top_phys_addr - kasan_shadow_start);
+#endif
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 6577897673dd..ff8143ba1e4d 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -3,3 +3,4 @@
 KASAN_SANITIZE := n
 
 obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC_BOOK3S_64)   += kasan_init_book3s_64.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_book3s_64.c b/arch/powerpc/mm/kasan/kasan_init_book3s_64.c
new file mode 100644
index 000000000000..fafda3d5e9a3
--- /dev/null
+++ b/arch/powerpc/mm/kasan/kasan_init_book3s_64.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KASAN for 64-bit Book3S powerpc
+ *
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Daniel Axtens <dja@axtens.net>
+ */
+
+#define DISABLE_BRANCH_PROFILING
+
+#include <linux/kasan.h>
+#include <linux/printk.h>
+#include <linux/sched/task.h>
+#include <asm/pgalloc.h>
+
+unsigned char kasan_early_shadow_page[PAGE_SIZE] __page_aligned_bss;
+
+pte_t kasan_early_shadow_pte[R_PTRS_PER_PTE] __page_aligned_bss;
+pmd_t kasan_early_shadow_pmd[R_PTRS_PER_PMD] __page_aligned_bss;
+pud_t kasan_early_shadow_pud[R_PTRS_PER_PUD] __page_aligned_bss;
+p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __page_aligned_bss;
+
+void __init kasan_init(void)
+{
+	int i;
+	void *k_start = kasan_mem_to_shadow((void *)RADIX_KERN_VIRT_START);
+	void *k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
+
+	unsigned long pte_val = __pa(kasan_early_shadow_page)
+					| pgprot_val(PAGE_KERNEL) | _PAGE_PTE;
+
+	if (!early_radix_enabled())
+		panic("KASAN requires radix!");
+
+	for (i = 0; i < PTRS_PER_PTE; i++)
+		kasan_early_shadow_pte[i] = __pte(pte_val);
+
+	for (i = 0; i < PTRS_PER_PMD; i++)
+		pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
+				    kasan_early_shadow_pte);
+
+	for (i = 0; i < PTRS_PER_PUD; i++)
+		pud_populate(&init_mm, &kasan_early_shadow_pud[i],
+			     kasan_early_shadow_pmd);
+
+
+	memset(kasan_mem_to_shadow((void *)PAGE_OFFSET), KASAN_SHADOW_INIT,
+		KASAN_SHADOW_SIZE);
+
+	kasan_populate_early_shadow(
+		kasan_mem_to_shadow((void *)RADIX_KERN_VIRT_START),
+		kasan_mem_to_shadow((void *)RADIX_VMALLOC_START));
+
+	/* leave a hole here for vmalloc */
+
+	kasan_populate_early_shadow(
+		kasan_mem_to_shadow((void *)RADIX_VMALLOC_END),
+		kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END));
+
+	flush_tlb_kernel_range((unsigned long)k_start, (unsigned long)k_end);
+
+	/* mark early shadow region as RO and wipe */
+	for (i = 0; i < PTRS_PER_PTE; i++)
+		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
+			&kasan_early_shadow_pte[i],
+			pfn_pte(virt_to_pfn(kasan_early_shadow_page),
+			__pgprot(_PAGE_PTE | _PAGE_KERNEL_RO | _PAGE_BASE)),
+			0);
+	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+
+	kasan_init_tags();
+
+	/* Enable error messages */
+	init_task.kasan_depth = 0;
+	pr_info("KASAN init done (64-bit Book3S heavyweight mode)\n");
+}
-- 
2.20.1

