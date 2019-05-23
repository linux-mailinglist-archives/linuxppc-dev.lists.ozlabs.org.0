Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD327575
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:27:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dLW0v42zDqWx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="oAv+/z2j"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCZ3B4QzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:46 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w7so2188523plz.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvP5oPwjqbAX/bEXmLdpE4Ur4fPSKjQ3so3j2BcFboA=;
 b=oAv+/z2jla8RDx0rIQ29x5Ta1f92lGQKxYSzLxbQQQ17jXquU7oz+XETAimrxCKaST
 5kycVEW1vjISdSVrU0KwCa0uoqgKwVwx6YJmPtVOAyrlFoy12X203HerokdT7dJtBBvL
 8bgOvABAPtbi7Uy+rfqThZBc1nDoEXSaB/Wg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvP5oPwjqbAX/bEXmLdpE4Ur4fPSKjQ3so3j2BcFboA=;
 b=s+ggXqbL7Vw42KDS48sE8OMau4aJ+Kzg8HgE9QbvuZ0TjRAKbf5qlIeOC9VRW8WKGm
 UJcN7U2IvOBJs7JAButtvp/5NkgRAP5Y2MWGCaD0lnMhToRtHEgU5TDubGCgJvWRLmm/
 9kMxFDY5EOqXRnWFgcsBGN8wJAS60b1inxvgwka6zK7iV9octT7CsWlTzmh/vX00HHAE
 N8aLQFjx3oBJtDWJZM5j2Z7cNct1ecYdw66xU3xFWLwSKoxa44x2mYS7QfoTwz0eWOOH
 lxf3TZ452NZlPmIsvRay6tpvdgWKJKhSxVCv4xyC/3ahn6I6dmvCOgx4E2mIIaz/sDEh
 rskA==
X-Gm-Message-State: APjAAAXM5vSHA0oQeCKnthY66VlIvW3tk1Wtc99ucZF4pny82MJPsBzS
 /fvY9c6d+1ogGmWV4ZVNufhHlA==
X-Google-Smtp-Source: APXvYqxZj5pE/s6m0H9p0DxfCS+dM38NdNFmgUnbVg3AKWYV8WHbbpVtdJFlpO0gbV9HhOnsDp9eMQ==
X-Received: by 2002:a17:902:446:: with SMTP id
 64mr95255617ple.322.1558588904706; 
 Wed, 22 May 2019 22:21:44 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id b18sm52001748pfp.32.2019.05.22.22.21.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:44 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 4/7] powerpc: KASAN for 64bit Book3E
Date: Thu, 23 May 2019 15:21:17 +1000
Message-Id: <20190523052120.18459-5-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
 kasan-dev@googlegroups.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wire up KASAN. Only outline instrumentation is supported.

The KASAN shadow area is mapped into vmemmap space:
0x8000 0400 0000 0000 to 0x8000 0600 0000 0000.
To do this we require that vmemmap be disabled. (This is the default
in the kernel config that QorIQ provides for the machine in their
SDK anyway - they use flat memory.)

Only the kernel linear mapping (0xc000...) is checked. The vmalloc and
ioremap areas (also in 0x800...) are all mapped to the zero page. As
with the Book3S hash series, this requires overriding the memory <->
shadow mapping.

Also, as with both previous 64-bit series, early instrumentation is not
supported.  It would allow us to drop the check_return_arch_not_ready()
hook in the KASAN core, but it's tricky to get it set up early enough:
we need it setup before the first call to instrumented code like printk().
Perhaps in the future.

Only KASAN_MINIMAL works.

Tested on e6500. KVM, kexec and xmon have not been tested.

The test_kasan module fires warnings as expected, except for the
following tests:

 - Expected/by design:
kasan test: memcg_accounted_kmem_cache allocate memcg accounted object

 - Due to only supporting KASAN_MINIMAL:
kasan test: kasan_stack_oob out-of-bounds on stack
kasan test: kasan_global_oob out-of-bounds global variable
kasan test: kasan_alloca_oob_left out-of-bounds to left on alloca
kasan test: kasan_alloca_oob_right out-of-bounds to right on alloca
kasan test: use_after_scope_test use-after-scope on int
kasan test: use_after_scope_test use-after-scope on array

Thanks to those who have done the heavy lifting over the past several
years:
 - Christophe's 32 bit series: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-February/185379.html
 - Aneesh's Book3S hash series: https://lwn.net/Articles/655642/
 - Balbir's Book3S radix series: https://patchwork.ozlabs.org/patch/795211/

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Cc: Balbir Singh <bsingharora@gmail.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
[- Removed EXPORT_SYMBOL of the static key
 - Fixed most checkpatch problems
 - Replaced kasan_zero_page[] by kasan_early_shadow_page[]
 - Reduced casting mess by using intermediate locals
 - Fixed build failure on pmac32_defconfig]
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/Kconfig.debug                   |  2 +-
 arch/powerpc/include/asm/kasan.h             | 71 ++++++++++++++++++++
 arch/powerpc/mm/kasan/Makefile               |  1 +
 arch/powerpc/mm/kasan/kasan_init_book3e_64.c | 50 ++++++++++++++
 arch/powerpc/mm/nohash/Makefile              |  5 ++
 6 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3e_64.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6a66a2da5b1a..4e266b019dd7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -170,6 +170,7 @@ config PPC
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32
+	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 && !SPARSEMEM_VMEMMAP
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index c59920920ddc..23a37facc854 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -396,5 +396,5 @@ config PPC_FAST_ENDIAN_SWITCH
 
 config KASAN_SHADOW_OFFSET
 	hex
-	depends on KASAN
+	depends on KASAN && PPC32
 	default 0xe0000000
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 296e51c2f066..ae410f0e060d 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -21,12 +21,15 @@
 #define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
 				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))
 
+#ifdef CONFIG_PPC32
 #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
 
 #define KASAN_SHADOW_END	0UL
 
 #define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
 
+#endif /* CONFIG_PPC32 */
+
 #ifdef CONFIG_KASAN
 void kasan_early_init(void);
 void kasan_mmu_init(void);
@@ -36,5 +39,73 @@ static inline void kasan_init(void) { }
 static inline void kasan_mmu_init(void) { }
 #endif
 
+#ifdef CONFIG_PPC_BOOK3E_64
+#include <asm/pgtable.h>
+#include <linux/jump_label.h>
+
+/*
+ * We don't put this in Kconfig as we only support KASAN_MINIMAL, and
+ * that will be disabled if the symbol is available in Kconfig
+ */
+#define KASAN_SHADOW_OFFSET	ASM_CONST(0x6800040000000000)
+
+#define KASAN_SHADOW_SIZE	(KERN_VIRT_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
+
+extern struct static_key_false powerpc_kasan_enabled_key;
+extern unsigned char kasan_early_shadow_page[];
+
+static inline bool kasan_arch_is_ready_book3e(void)
+{
+	if (static_branch_likely(&powerpc_kasan_enabled_key))
+		return true;
+	return false;
+}
+#define kasan_arch_is_ready kasan_arch_is_ready_book3e
+
+static inline void *kasan_mem_to_shadow_book3e(const void *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+
+	if (addr >= KERN_VIRT_START && addr < KERN_VIRT_START + KERN_VIRT_SIZE)
+		return kasan_early_shadow_page;
+
+	return (void *)(addr >> KASAN_SHADOW_SCALE_SHIFT) + KASAN_SHADOW_OFFSET;
+}
+#define kasan_mem_to_shadow kasan_mem_to_shadow_book3e
+
+static inline void *kasan_shadow_to_mem_book3e(const void *shadow_addr)
+{
+	/*
+	 * We map the entire non-linear virtual mapping onto the zero page so if
+	 * we are asked to map the zero page back just pick the beginning of that
+	 * area.
+	 */
+	if (shadow_addr >= (void *)kasan_early_shadow_page &&
+	    shadow_addr < (void *)(kasan_early_shadow_page + PAGE_SIZE))
+		return (void *)KERN_VIRT_START;
+
+	return (void *)(((unsigned long)shadow_addr - KASAN_SHADOW_OFFSET) <<
+			KASAN_SHADOW_SCALE_SHIFT);
+}
+#define kasan_shadow_to_mem kasan_shadow_to_mem_book3e
+
+static inline bool kasan_addr_has_shadow_book3e(const void *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+
+	/*
+	 * We want to specifically assert that the addresses in the 0x8000...
+	 * region have a shadow, otherwise they are considered by the kasan
+	 * core to be wild pointers
+	 */
+	if (addr >= KERN_VIRT_START && addr < (KERN_VIRT_START + KERN_VIRT_SIZE))
+		return true;
+
+	return (ptr >= kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
+}
+#define kasan_addr_has_shadow kasan_addr_has_shadow_book3e
+
+#endif /* CONFIG_PPC_BOOK3E_64 */
+
 #endif /* __ASSEMBLY */
 #endif
diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 6577897673dd..f8f164ad8ade 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -3,3 +3,4 @@
 KASAN_SANITIZE := n
 
 obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC_BOOK3E_64)   += kasan_init_book3e_64.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_book3e_64.c b/arch/powerpc/mm/kasan/kasan_init_book3e_64.c
new file mode 100644
index 000000000000..f116c211d83c
--- /dev/null
+++ b/arch/powerpc/mm/kasan/kasan_init_book3e_64.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define DISABLE_BRANCH_PROFILING
+
+#include <linux/kasan.h>
+#include <linux/printk.h>
+#include <linux/memblock.h>
+#include <linux/sched/task.h>
+#include <asm/pgalloc.h>
+
+DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
+
+static void __init kasan_init_region(struct memblock_region *reg)
+{
+	void *start = __va(reg->base);
+	void *end = __va(reg->base + reg->size);
+	unsigned long k_start, k_end, k_cur;
+
+	if (start >= end)
+		return;
+
+	k_start = (unsigned long)kasan_mem_to_shadow(start);
+	k_end = (unsigned long)kasan_mem_to_shadow(end);
+
+	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE) {
+		void *va = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+
+		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
+	}
+	flush_tlb_kernel_range(k_start, k_end);
+}
+
+void __init kasan_init(void)
+{
+	struct memblock_region *reg;
+
+	for_each_memblock(memory, reg)
+		kasan_init_region(reg);
+
+	/* map the zero page RO */
+	map_kernel_page((unsigned long)kasan_early_shadow_page,
+			__pa(kasan_early_shadow_page), PAGE_KERNEL_RO);
+
+	/* Turn on checking */
+	static_branch_inc(&powerpc_kasan_enabled_key);
+
+	/* Enable error messages */
+	init_task.kasan_depth = 0;
+	pr_info("KASAN init done (64-bit Book3E)\n");
+}
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index 33b6f6f29d3f..310149f217d7 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -16,3 +16,8 @@ endif
 # This is necessary for booting with kcov enabled on book3e machines
 KCOV_INSTRUMENT_tlb.o := n
 KCOV_INSTRUMENT_fsl_booke.o := n
+
+ifdef CONFIG_KASAN
+CFLAGS_fsl_booke_mmu.o		+= -DDISABLE_BRANCH_PROFILING
+CFLAGS_tlb.o			+= -DDISABLE_BRANCH_PROFILING
+endif
-- 
2.19.1

