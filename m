Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00027578
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:31:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dR13cwkzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:31:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="mkcv9ET3"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCq6gCrzDqGY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:59 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b76so2569103pfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LGGVPIzxI40wSzO9GQC0XJd99DGaK5BkBws0m1VowW8=;
 b=mkcv9ET3fjwqBK/+eMP34HRMOnCU9Is//JBOrtc+nSsXSM9nITaKMJaj5RKsyrt9ZD
 jvHfxJlT+yDKLtsFgRlTaoD9jnCRT7ARW08Coy4eOhN1U78bX6HjQjSR0CjOAZR3dqCn
 oRDANQLlXE1hfeoTW0keFXmSWD9XmHKjPo6ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LGGVPIzxI40wSzO9GQC0XJd99DGaK5BkBws0m1VowW8=;
 b=BAYm8DVb5jU4VwPCLsNpv9cYEGrK21seV9x3sxvV6MbAJ3dm/smINGXAzEcuXichR5
 ReFdsfPH90AoEN9+TCgU+VGXRQMXw7/1hhDHE2pHlCBwcufsmp0Pqui7R8w91BGavk0X
 SM7ftGEhJ8RdAFl1dKuS+De841di8LxcL2iY5pLow2bcWuNTavL9drbaSQRjNuM2Giha
 2++cNaSVyItDHUdyFtNwk/UprlyP8yS4LEHspZrVwnftaLmH2JIn91mzt5CPRILpQbeP
 lGb5xjACWiLT/BbdCQgKeGms6I7xEQZVY/x5o/iyq2Kf2JvIg1wV8CaUA62Ml5diMY/D
 Xuxw==
X-Gm-Message-State: APjAAAWIfcY61E1llN6T4PozsWh7+L/eU+KISnIcI4SrQeCEzjM7COrt
 WaeOMSevmOwLfy15w7e41qosnA==
X-Google-Smtp-Source: APXvYqwyfIesMwwLjFUn3yt0eg9SDw8z4/LaNKF3tU98AH5pMCjW79NJ9VA84o3jEJoQqAUM+01WiQ==
X-Received: by 2002:a63:c14:: with SMTP id b20mr94605719pgl.163.1558588917324; 
 Wed, 22 May 2019 22:21:57 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id o6sm56470594pfa.88.2019.05.22.22.21.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:56 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 7/7] powerpc: Book3S 64-bit "heavyweight" KASAN support
Date: Thu, 23 May 2019 15:21:20 +1000
Message-Id: <20190523052120.18459-8-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190523052120.18459-1-dja@axtens.net>
References: <20190523052120.18459-1-dja@axtens.net>
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
   byte (depending on radix/hash mmu) of the address is ignored. To
   make things work, we put the linear mapping at
   0xc000000000000000. This means that a pointer to part of the linear
   mapping will work both in real mode, where it will be interpreted
   as a physical address of the form 0x000..., and out of real mode,
   where it will go via the linear mapping.]

 - Inline instrumentation requires a fixed offset.

 - Because of our running things in real mode, the offset has to
   point to valid memory both in and out of real mode.

This makes finding somewhere to put the KASAN shadow region a bit fun.

One approach is just to give up on inline instrumentation; and this is
what the 64 bit book3e code does. This way we can delay all checks
until after we get everything set up to our satisfaction. However,
we'd really like to do better.

What we can do - if we know _at compile time_ how much physical memory
we have - is to set aside the top 1/8th of the memory and use that.
This is a big hammer (hence the "heavyweight" name) and comes with 2
big consequences:

 - kernels will simply fail to boot on machines with less memory than
   specified when compiling.

 - kernels running on machines with more memory than specified when
   compiling will simply ignore the extra memory.

If you can bear this consequence, you get pretty full support for
KASAN.

This is still pretty WIP but I wanted to get it out there sooner
rather than later. Ongoing work:

 - Currently incompatible with KUAP (top priority to fix)

 - Currently incompatible with ftrace (no idea why yet)

 - Only supports radix at the moment

 - Very minimal testing (boots a Ubuntu VM, test_kasan runs)

 - Extend 'lightweight' outline support from book3e that will work
   without requring memory to be known at compile time.

 - It assumes physical memory is contiguous. I don't really think
   we can get around this, so we should try to ensure it.

Despite the limitations, it can still find bugs,
e.g. http://patchwork.ozlabs.org/patch/1103775/

Massive thanks to mpe, who had the idea for the initial design.

Signed-off-by: Daniel Axtens <dja@axtens.net>

---

Tested on qemu-pseries and qemu-powernv, seems to work on both
of those. Does not work on the talos that I tested on, no idea
why yet.

---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/Kconfig.debug                   | 15 +++++
 arch/powerpc/Makefile                        |  7 ++
 arch/powerpc/include/asm/kasan.h             | 45 +++++++++++++
 arch/powerpc/kernel/prom.c                   | 40 ++++++++++++
 arch/powerpc/mm/kasan/Makefile               |  1 +
 arch/powerpc/mm/kasan/kasan_init_book3s_64.c | 67 ++++++++++++++++++++
 7 files changed, 176 insertions(+)
 create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4e266b019dd7..203cd07cf6e0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -171,6 +171,7 @@ config PPC
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32
 	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 && !SPARSEMEM_VMEMMAP
+	select HAVE_ARCH_KASAN			if PPC_BOOK3S_64 && !CONFIG_FTRACE && !PPC_KUAP
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 23a37facc854..c0916408668c 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -394,6 +394,21 @@ config PPC_FAST_ENDIAN_SWITCH
         help
 	  If you're unsure what this is, say N.
 
+config PHYS_MEM_SIZE_FOR_KASAN
+	int "Physical memory size for KASAN (MB)"
+	depends on KASAN && PPC_BOOK3S_64
+	help
+	  To get inline instrumentation support for KASAN on 64-bit Book3S
+	  machines, you need to specify how much physical memory your system
+	  has. A shadow offset will be calculated based on this figure, which
+	  will be compiled in to the kernel. KASAN will use this offset to
+	  access its shadow region, which is used to verify memory accesses.
+
+	  If you attempt to boot on a system with less memory than you specify
+	  here, your system will fail to boot very early in the process. If you
+	  boot on a system with more memory than you specify, the extra memory
+	  will wasted - it will be reserved and not used.
+
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN && PPC32
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
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index ae410f0e060d..7f75f904998b 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -107,5 +107,50 @@ static inline bool kasan_addr_has_shadow_book3e(const void *ptr)
 
 #endif /* CONFIG_PPC_BOOK3E_64 */
 
+#ifdef CONFIG_PPC_BOOK3S_64
+#include <asm/pgtable.h>
+#include <linux/jump_label.h>
+
+/*
+ * The KASAN shadow offset is such that the linear map (0xc000...) is
+ * shadowed by the last 8th of physical memory. This way, if the code
+ * uses 0xc addresses throughout, accesses work both in in real mode
+ * (where the top nibble is ignored) and outside of real mode.
+ */
+#define KASAN_SHADOW_OFFSET ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * \
+				1024 * 1024 * 7 / 8 + 0xa800000000000000UL)
+
+#define KASAN_SHADOW_SIZE ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * \
+				1024 * 1024 * 1 / 8)
+
+static inline bool kasan_arch_can_register_global_book3s(const void * addr) {
+
+	/*
+	 * We don't define a particular area for modules, we just put them in
+	 * vmalloc space. This means that they live in an area backed entirely
+	 * by our read-only zero page. The global registration system is not
+	 * smart enough to deal with this and attempts to poison it, which
+	 * blows up. Unless we want to split out an area of vmalloc space for
+	 * modules and back it with real shadow memory, just refuse to register
+	 * globals in vmalloc space.
+	 */
+
+	return ((unsigned long)addr < VMALLOC_START);
+}
+#define kasan_arch_can_register_global kasan_arch_can_register_global_book3s
+
+#define ARCH_HAS_KASAN_EARLY_SHADOW
+extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
+
+#define R_PTRS_PER_PTE	(1 << RADIX_PTE_INDEX_SIZE)
+#define R_PTRS_PER_PMD	(1 << RADIX_PMD_INDEX_SIZE)
+#define R_PTRS_PER_PUD	(1 << RADIX_PUD_INDEX_SIZE)
+extern pte_t kasan_early_shadow_pte[R_PTRS_PER_PTE];
+extern pmd_t kasan_early_shadow_pmd[R_PTRS_PER_PMD];
+extern pud_t kasan_early_shadow_pud[R_PTRS_PER_PUD];
+extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
+
+#endif
+
 #endif /* __ASSEMBLY */
 #endif
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 4221527b082f..7ae90942d52f 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -75,6 +75,7 @@ unsigned long tce_alloc_start, tce_alloc_end;
 u64 ppc64_rma_size;
 #endif
 static phys_addr_t first_memblock_size;
+static phys_addr_t top_phys_addr;
 static int __initdata boot_cpu_count;
 
 static int __init early_parse_mem(char *p)
@@ -573,6 +574,9 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		first_memblock_size = size;
 	}
 
+	if (base + size > top_phys_addr)
+		top_phys_addr = base + size;
+
 	/* Add the chunk to the MEMBLOCK list */
 	if (add_mem_to_memblock) {
 		if (validate_mem_limit(base, &size))
@@ -616,6 +620,8 @@ static void __init early_reserve_mem_dt(void)
 static void __init early_reserve_mem(void)
 {
 	__be64 *reserve_map;
+	phys_addr_t kasan_shadow_start __maybe_unused;
+	phys_addr_t kasan_memory_size __maybe_unused;
 
 	reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
 			fdt_off_mem_rsvmap(initial_boot_params));
@@ -654,6 +660,40 @@ static void __init early_reserve_mem(void)
 		return;
 	}
 #endif
+
+#if defined(CONFIG_KASAN) && defined(CONFIG_PPC_BOOK3S_64)
+	kasan_memory_size = (unsigned long long)CONFIG_PHYS_MEM_SIZE_FOR_KASAN
+				 * 1024 * 1024;
+	if (top_phys_addr < kasan_memory_size) {
+		/*
+		 * We are doomed. Attempts to call e.g. panic() are likely to
+		 * fail because they call out into instrumented code, which
+		 * will almost certainly access memory beyond the end of
+		 * physical memory. Hang here so that at least the NIP points
+		 * somewhere that will help you debug it if you look at it in
+		 * qemu.
+		 */
+		while (true) ;
+	} else if (top_phys_addr > kasan_memory_size) {
+		/* print a biiiig warning in hopes people notice */
+		pr_err("==================================================\n"
+		       "Physical memory exceeds compiled-in maximum!\n"
+		       "This kernel was compiled for KASAN with %u MB physical"
+		       "memory\n"
+		       "The actual physical memory detected is %llu MB\n"
+		       "Memory above the compiled limit will be ignored!\n"
+		       "==================================================\n",
+		       CONFIG_PHYS_MEM_SIZE_FOR_KASAN,
+		       top_phys_addr / (1024 * 1024));
+	}
+
+	kasan_shadow_start = _ALIGN_DOWN(kasan_memory_size * 7 / 8, PAGE_SIZE);
+	DBG("reserving %llx -> %llx for KASAN",
+	    kasan_shadow_start, top_phys_addr);
+	memblock_reserve(kasan_shadow_start,
+			 top_phys_addr - kasan_shadow_start);
+#endif
+
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index f8f164ad8ade..1f52f688751d 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -4,3 +4,4 @@ KASAN_SANITIZE := n
 
 obj-$(CONFIG_PPC32)           += kasan_init_32.o
 obj-$(CONFIG_PPC_BOOK3E_64)   += kasan_init_book3e_64.o
+obj-$(CONFIG_PPC_BOOK3S_64)   += kasan_init_book3s_64.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_book3s_64.c b/arch/powerpc/mm/kasan/kasan_init_book3s_64.c
new file mode 100644
index 000000000000..dce34120959b
--- /dev/null
+++ b/arch/powerpc/mm/kasan/kasan_init_book3s_64.c
@@ -0,0 +1,67 @@
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
+	void * k_start = kasan_mem_to_shadow((void *)RADIX_KERN_VIRT_START);
+	void * k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
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
+	memset(kasan_mem_to_shadow((void*)PAGE_OFFSET), KASAN_SHADOW_INIT,
+		KASAN_SHADOW_SIZE);
+
+	kasan_populate_early_shadow(k_start, k_end);
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
2.19.1

