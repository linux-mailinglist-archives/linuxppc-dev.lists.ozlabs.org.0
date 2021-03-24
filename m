Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE0347BB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 16:09:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5BV32LDFz3bt1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 02:09:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fIFI2Iiz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=fIFI2Iiz; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5BTY10TRz304P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 02:09:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=DJkQy6spt0Jvft4awJMxLjWTDOz2eZ8MofXf2mIP8So=; b=fIFI2IizT8RvO0FHQL7H3OYjc+
 SeV85MXlaELUHATnLiJkW5TFXu5QdZyvZabHpe8wW4m0rMAJegTFGOkTD8HMo3Nva6hNzAsucJpBd
 qvigqGk1CtqroGIxI5Zkw/EIDKN6EvY0QSaQeWlXhet9+q15Zk5Db1GE+I5ovvjsuMtDDWorVA5Ap
 fC5LwgtY70DTpKMEPZIXB19vmoNzItfGjjKHnIXmnYkFvdjnNIZsLtNpFvoCXNEnc11F+QnPm1Adm
 0cFzVEjG87oQ5sfOrSXtBta0Azrez5lpSphcuRn03ge5sbt2cBDzEd++NomMh/DuLsdvieqRaJar4
 HuK+YRzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lP55Q-00BTsW-VX; Wed, 24 Mar 2021 15:06:32 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Subject: [PATCH v2 1/4] mm/vmalloc: Change the 'caller' type to unsigned long
Date: Wed, 24 Mar 2021 15:05:15 +0000
Message-Id: <20210324150518.2734402-2-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324150518.2734402-1-willy@infradead.org>
References: <20210324150518.2734402-1-willy@infradead.org>
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
Cc: linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Pekka Enberg <penberg@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kmalloc uses an unsigned long while vmalloc uses const void * to
represent the address of the caller.  _RET_IP_ is more popular than
__builtin_return_address (429 to 258), so switch vmalloc to match kmalloc
(which changes the score to 504 to 183).  Also lets us use _THIS_IP_
instead of the explicit function name.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 arch/arm/include/asm/io.h                 |  6 +--
 arch/arm/include/asm/mach/map.h           |  3 --
 arch/arm/kernel/module.c                  |  4 +-
 arch/arm/mach-imx/mm-imx3.c               |  2 +-
 arch/arm/mach-ixp4xx/common.c             |  2 +-
 arch/arm/mach-mvebu/coherency.c           |  2 +-
 arch/arm/mm/ioremap.c                     | 27 +++++-------
 arch/arm/mm/mmu.c                         | 10 ++---
 arch/arm/mm/nommu.c                       | 16 +++----
 arch/arm64/include/asm/vmap_stack.h       |  2 +-
 arch/arm64/kernel/module.c                |  4 +-
 arch/arm64/kernel/probes/kprobes.c        |  2 +-
 arch/arm64/mm/ioremap.c                   |  7 ++-
 arch/arm64/mm/mmu.c                       |  2 +-
 arch/arm64/net/bpf_jit_comp.c             |  2 +-
 arch/mips/kernel/module.c                 |  2 +-
 arch/nds32/kernel/module.c                |  2 +-
 arch/parisc/kernel/module.c               |  2 +-
 arch/powerpc/include/asm/io-workarounds.h |  2 +-
 arch/powerpc/include/asm/io.h             |  6 +--
 arch/powerpc/kernel/io-workarounds.c      |  2 +-
 arch/powerpc/kernel/irq.c                 |  2 +-
 arch/powerpc/kernel/module.c              |  3 +-
 arch/powerpc/kernel/pci_64.c              |  3 +-
 arch/powerpc/mm/ioremap.c                 | 10 ++---
 arch/powerpc/mm/ioremap_32.c              |  8 ++--
 arch/powerpc/mm/ioremap_64.c              |  4 +-
 arch/riscv/kernel/module.c                |  2 +-
 arch/riscv/net/bpf_jit_comp64.c           |  2 +-
 arch/s390/kernel/module.c                 |  2 +-
 arch/s390/kernel/setup.c                  |  3 +-
 arch/sh/include/asm/io.h                  | 11 ++---
 arch/sh/kernel/cpu/sh4/sq.c               |  2 +-
 arch/sh/mm/ioremap.c                      |  2 +-
 arch/sh/mm/pmb.c                          |  2 +-
 arch/sparc/kernel/module.c                |  2 +-
 arch/x86/hyperv/hv_init.c                 |  2 +-
 arch/x86/kernel/module.c                  |  3 +-
 arch/x86/mm/ioremap.c                     | 20 ++++-----
 include/linux/vmalloc.h                   | 22 +++++-----
 kernel/bpf/syscall.c                      |  2 +-
 kernel/fork.c                             |  2 +-
 kernel/module.c                           |  2 +-
 kernel/scs.c                              |  3 +-
 lib/test_vmalloc.c                        |  7 ++-
 mm/ioremap.c                              |  3 +-
 mm/kasan/shadow.c                         |  5 +--
 mm/nommu.c                                |  4 +-
 mm/util.c                                 |  3 +-
 mm/vmalloc.c                              | 52 ++++++++++-------------
 50 files changed, 130 insertions(+), 165 deletions(-)

diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index fc748122f1e0..8c8699b0820f 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -131,17 +131,17 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
 /*
  * __arm_ioremap takes CPU physical address.
  * __arm_ioremap_pfn takes a Page Frame Number and an offset into that page
- * The _caller variety takes a __builtin_return_address(0) value for
+ * The _caller variety takes a _RET_IP_ value for
  * /proc/vmalloc to use - and should only be used in non-inline functions.
  */
 extern void __iomem *__arm_ioremap_caller(phys_addr_t, size_t, unsigned int,
-	void *);
+		unsigned long);
 extern void __iomem *__arm_ioremap_pfn(unsigned long, unsigned long, size_t, unsigned int);
 extern void __iomem *__arm_ioremap_exec(phys_addr_t, size_t, bool cached);
 extern void __iounmap(volatile void __iomem *addr);
 
 extern void __iomem * (*arch_ioremap_caller)(phys_addr_t, size_t,
-	unsigned int, void *);
+	unsigned int, unsigned long);
 extern void (*arch_iounmap)(volatile void __iomem *);
 
 /*
diff --git a/arch/arm/include/asm/mach/map.h b/arch/arm/include/asm/mach/map.h
index 92282558caf7..56968451349d 100644
--- a/arch/arm/include/asm/mach/map.h
+++ b/arch/arm/include/asm/mach/map.h
@@ -37,8 +37,6 @@ enum {
 
 #ifdef CONFIG_MMU
 extern void iotable_init(struct map_desc *, int);
-extern void vm_reserve_area_early(unsigned long addr, unsigned long size,
-				  void *caller);
 extern void create_mapping_late(struct mm_struct *mm, struct map_desc *md,
 				bool ng);
 
@@ -58,7 +56,6 @@ extern int ioremap_page(unsigned long virt, unsigned long phys,
 			const struct mem_type *mtype);
 #else
 #define iotable_init(map,num)	do { } while (0)
-#define vm_reserve_area_early(a,s,c)	do { } while (0)
 #endif
 
 #endif
diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
index beac45e89ba6..0fb7e10a0ca7 100644
--- a/arch/arm/kernel/module.c
+++ b/arch/arm/kernel/module.c
@@ -45,12 +45,12 @@ void *module_alloc(unsigned long size)
 
 	p = __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
 				gfp_mask, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+				_RET_IP_);
 	if (!IS_ENABLED(CONFIG_ARM_MODULE_PLTS) || p)
 		return p;
 	return __vmalloc_node_range(size, 1,  VMALLOC_START, VMALLOC_END,
 				GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+				_RET_IP_);
 }
 #endif
 
diff --git a/arch/arm/mach-imx/mm-imx3.c b/arch/arm/mach-imx/mm-imx3.c
index 28db97289ee8..3b68da4814d0 100644
--- a/arch/arm/mach-imx/mm-imx3.c
+++ b/arch/arm/mach-imx/mm-imx3.c
@@ -54,7 +54,7 @@ static void imx3_idle(void)
 }
 
 static void __iomem *imx3_ioremap_caller(phys_addr_t phys_addr, size_t size,
-					 unsigned int mtype, void *caller)
+		unsigned int mtype, unsigned long caller)
 {
 	if (mtype == MT_DEVICE) {
 		/*
diff --git a/arch/arm/mach-ixp4xx/common.c b/arch/arm/mach-ixp4xx/common.c
index 000f672a94c9..2e9ae7717c42 100644
--- a/arch/arm/mach-ixp4xx/common.c
+++ b/arch/arm/mach-ixp4xx/common.c
@@ -337,7 +337,7 @@ EXPORT_SYMBOL(dma_set_coherent_mask);
  */
 
 static void __iomem *ixp4xx_ioremap_caller(phys_addr_t addr, size_t size,
-					   unsigned int mtype, void *caller)
+		unsigned int mtype, unsigned long caller)
 {
 	if (!is_pci_memory(addr))
 		return __arm_ioremap_caller(addr, size, mtype, caller);
diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index 49e3c8d20c2f..f213ea920418 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -162,7 +162,7 @@ static void __init armada_370_coherency_init(struct device_node *np)
  */
 static void __iomem *
 armada_wa_ioremap_caller(phys_addr_t phys_addr, size_t size,
-			 unsigned int mtype, void *caller)
+			 unsigned int mtype, unsigned long caller)
 {
 	mtype = MT_UNCACHED;
 	return __arm_ioremap_caller(phys_addr, size, mtype, caller);
diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 000e8210000b..134340f6e7c5 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -241,7 +241,8 @@ remap_area_supersections(unsigned long virt, unsigned long pfn,
 #endif
 
 static void __iomem * __arm_ioremap_pfn_caller(unsigned long pfn,
-	unsigned long offset, size_t size, unsigned int mtype, void *caller)
+		unsigned long offset, size_t size, unsigned int mtype,
+		unsigned long caller)
 {
 	const struct mem_type *type;
 	int err;
@@ -318,7 +319,7 @@ static void __iomem * __arm_ioremap_pfn_caller(unsigned long pfn,
 }
 
 void __iomem *__arm_ioremap_caller(phys_addr_t phys_addr, size_t size,
-	unsigned int mtype, void *caller)
+		unsigned int mtype, unsigned long caller)
 {
 	phys_addr_t last_addr;
  	unsigned long offset = phys_addr & ~PAGE_MASK;
@@ -348,33 +349,30 @@ void __iomem *
 __arm_ioremap_pfn(unsigned long pfn, unsigned long offset, size_t size,
 		  unsigned int mtype)
 {
-	return __arm_ioremap_pfn_caller(pfn, offset, size, mtype,
-					__builtin_return_address(0));
+	return __arm_ioremap_pfn_caller(pfn, offset, size, mtype, _RET_IP_);
 }
 EXPORT_SYMBOL(__arm_ioremap_pfn);
 
 void __iomem * (*arch_ioremap_caller)(phys_addr_t, size_t,
-				      unsigned int, void *) =
+				      unsigned int, unsigned long) =
 	__arm_ioremap_caller;
 
 void __iomem *ioremap(resource_size_t res_cookie, size_t size)
 {
-	return arch_ioremap_caller(res_cookie, size, MT_DEVICE,
-				   __builtin_return_address(0));
+	return arch_ioremap_caller(res_cookie, size, MT_DEVICE, _RET_IP_);
 }
 EXPORT_SYMBOL(ioremap);
 
 void __iomem *ioremap_cache(resource_size_t res_cookie, size_t size)
 {
 	return arch_ioremap_caller(res_cookie, size, MT_DEVICE_CACHED,
-				   __builtin_return_address(0));
+				   _RET_IP_);
 }
 EXPORT_SYMBOL(ioremap_cache);
 
 void __iomem *ioremap_wc(resource_size_t res_cookie, size_t size)
 {
-	return arch_ioremap_caller(res_cookie, size, MT_DEVICE_WC,
-				   __builtin_return_address(0));
+	return arch_ioremap_caller(res_cookie, size, MT_DEVICE_WC, _RET_IP_);
 }
 EXPORT_SYMBOL(ioremap_wc);
 
@@ -395,15 +393,13 @@ __arm_ioremap_exec(phys_addr_t phys_addr, size_t size, bool cached)
 	else
 		mtype = MT_MEMORY_RWX_NONCACHED;
 
-	return __arm_ioremap_caller(phys_addr, size, mtype,
-			__builtin_return_address(0));
+	return __arm_ioremap_caller(phys_addr, size, mtype, _RET_IP_);
 }
 
 void *arch_memremap_wb(phys_addr_t phys_addr, size_t size)
 {
 	return (__force void *)arch_ioremap_caller(phys_addr, size,
-						   MT_MEMORY_RW,
-						   __builtin_return_address(0));
+						   MT_MEMORY_RW, _RET_IP_);
 }
 
 void __iounmap(volatile void __iomem *io_addr)
@@ -464,8 +460,7 @@ EXPORT_SYMBOL_GPL(pci_ioremap_io);
 
 void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size)
 {
-	return arch_ioremap_caller(res_cookie, size, MT_UNCACHED,
-				   __builtin_return_address(0));
+	return arch_ioremap_caller(res_cookie, size, MT_UNCACHED, _RET_IP_);
 }
 EXPORT_SYMBOL_GPL(pci_remap_cfgspace);
 #endif
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index a25b660c3017..26c224c3a33c 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -1002,13 +1002,13 @@ void __init iotable_init(struct map_desc *io_desc, int nr)
 		vm->phys_addr = __pfn_to_phys(md->pfn);
 		vm->flags = VM_IOREMAP | VM_ARM_STATIC_MAPPING;
 		vm->flags |= VM_ARM_MTYPE(md->type);
-		vm->caller = iotable_init;
+		vm->caller = _THIS_IP_;
 		add_static_vm_early(svm++);
 	}
 }
 
-void __init vm_reserve_area_early(unsigned long addr, unsigned long size,
-				  void *caller)
+static void __init vm_reserve_area_early(unsigned long addr, unsigned long size,
+				  unsigned long caller)
 {
 	struct vm_struct *vm;
 	struct static_vm *svm;
@@ -1043,7 +1043,7 @@ void __init vm_reserve_area_early(unsigned long addr, unsigned long size,
 
 static void __init pmd_empty_section_gap(unsigned long addr)
 {
-	vm_reserve_area_early(addr, SECTION_SIZE, pmd_empty_section_gap);
+	vm_reserve_area_early(addr, SECTION_SIZE, _THIS_IP_);
 }
 
 static void __init fill_pmd_gaps(void)
@@ -1100,7 +1100,7 @@ static void __init pci_reserve_io(void)
 	if (svm)
 		return;
 
-	vm_reserve_area_early(PCI_IO_VIRT_BASE, SZ_2M, pci_reserve_io);
+	vm_reserve_area_early(PCI_IO_VIRT_BASE, SZ_2M, _THIS_IP_);
 }
 #else
 #define pci_reserve_io() do { } while (0)
diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
index 8b3d7191e2b8..b80eaf13e398 100644
--- a/arch/arm/mm/nommu.c
+++ b/arch/arm/mm/nommu.c
@@ -191,31 +191,30 @@ void __iomem *__arm_ioremap_pfn(unsigned long pfn, unsigned long offset,
 EXPORT_SYMBOL(__arm_ioremap_pfn);
 
 void __iomem *__arm_ioremap_caller(phys_addr_t phys_addr, size_t size,
-				   unsigned int mtype, void *caller)
+				   unsigned int mtype, unsigned long caller)
 {
 	return (void __iomem *)phys_addr;
 }
 
-void __iomem * (*arch_ioremap_caller)(phys_addr_t, size_t, unsigned int, void *);
+void __iomem * (*arch_ioremap_caller)(phys_addr_t, size_t, unsigned int,
+					unsigned long);
 
 void __iomem *ioremap(resource_size_t res_cookie, size_t size)
 {
-	return __arm_ioremap_caller(res_cookie, size, MT_DEVICE,
-				    __builtin_return_address(0));
+	return __arm_ioremap_caller(res_cookie, size, MT_DEVICE, _RET_IP_);
 }
 EXPORT_SYMBOL(ioremap);
 
 void __iomem *ioremap_cache(resource_size_t res_cookie, size_t size)
 {
 	return __arm_ioremap_caller(res_cookie, size, MT_DEVICE_CACHED,
-				    __builtin_return_address(0));
+				    _RET_IP_);
 }
 EXPORT_SYMBOL(ioremap_cache);
 
 void __iomem *ioremap_wc(resource_size_t res_cookie, size_t size)
 {
-	return __arm_ioremap_caller(res_cookie, size, MT_DEVICE_WC,
-				    __builtin_return_address(0));
+	return __arm_ioremap_caller(res_cookie, size, MT_DEVICE_WC, _RET_IP_);
 }
 EXPORT_SYMBOL(ioremap_wc);
 
@@ -225,8 +224,7 @@ EXPORT_SYMBOL(ioremap_wc);
 
 void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size)
 {
-	return arch_ioremap_caller(res_cookie, size, MT_UNCACHED,
-				   __builtin_return_address(0));
+	return arch_ioremap_caller(res_cookie, size, MT_UNCACHED, _RET_IP_);
 }
 EXPORT_SYMBOL_GPL(pci_remap_cfgspace);
 #endif
diff --git a/arch/arm64/include/asm/vmap_stack.h b/arch/arm64/include/asm/vmap_stack.h
index 894e031b28d2..1a525f04257c 100644
--- a/arch/arm64/include/asm/vmap_stack.h
+++ b/arch/arm64/include/asm/vmap_stack.h
@@ -20,7 +20,7 @@ static inline unsigned long *arch_alloc_vmap_stack(size_t stack_size, int node)
 	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
 
 	return __vmalloc_node(stack_size, THREAD_ALIGN, THREADINFO_GFP, node,
-			__builtin_return_address(0));
+			_RET_IP_);
 }
 
 #endif /* __ASM_VMAP_STACK_H */
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index fe21e0f06492..fa4186459927 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -37,7 +37,7 @@ void *module_alloc(unsigned long size)
 
 	p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
 				module_alloc_end, gfp_mask, PAGE_KERNEL, 0,
-				NUMA_NO_NODE, __builtin_return_address(0));
+				NUMA_NO_NODE, _RET_IP_);
 
 	if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
 	    !IS_ENABLED(CONFIG_KASAN_GENERIC) &&
@@ -54,7 +54,7 @@ void *module_alloc(unsigned long size)
 		p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
 				module_alloc_base + SZ_2G, GFP_KERNEL,
 				PAGE_KERNEL, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+				_RET_IP_);
 
 	if (p && (kasan_module_alloc(p, size) < 0)) {
 		vfree(p);
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 66aac2881ba8..a3180aeb3aa0 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -113,7 +113,7 @@ void *alloc_insn_page(void)
 {
 	return __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
 			GFP_KERNEL, PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS,
-			NUMA_NO_NODE, __builtin_return_address(0));
+			NUMA_NO_NODE, _RET_IP_);
 }
 
 /* arm kprobe: install breakpoint in text */
diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
index b5e83c46b23e..7b8a67514314 100644
--- a/arch/arm64/mm/ioremap.c
+++ b/arch/arm64/mm/ioremap.c
@@ -18,7 +18,7 @@
 #include <asm/tlbflush.h>
 
 static void __iomem *__ioremap_caller(phys_addr_t phys_addr, size_t size,
-				      pgprot_t prot, void *caller)
+				      pgprot_t prot, unsigned long caller)
 {
 	unsigned long last_addr;
 	unsigned long offset = phys_addr & ~PAGE_MASK;
@@ -63,8 +63,7 @@ static void __iomem *__ioremap_caller(phys_addr_t phys_addr, size_t size,
 
 void __iomem *__ioremap(phys_addr_t phys_addr, size_t size, pgprot_t prot)
 {
-	return __ioremap_caller(phys_addr, size, prot,
-				__builtin_return_address(0));
+	return __ioremap_caller(phys_addr, size, prot, _RET_IP_);
 }
 EXPORT_SYMBOL(__ioremap);
 
@@ -88,7 +87,7 @@ void __iomem *ioremap_cache(phys_addr_t phys_addr, size_t size)
 		return (void __iomem *)__phys_to_virt(phys_addr);
 
 	return __ioremap_caller(phys_addr, size, __pgprot(PROT_NORMAL),
-				__builtin_return_address(0));
+				_RET_IP_);
 }
 EXPORT_SYMBOL(ioremap_cache);
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index f6ef5a37a6c7..0a7ae4f09af0 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -590,7 +590,7 @@ static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 	vma->phys_addr	= pa_start;
 	vma->size	= size;
 	vma->flags	= VM_MAP | vm_flags;
-	vma->caller	= __builtin_return_address(0);
+	vma->caller	= _RET_IP_;
 
 	vm_area_add_early(vma);
 }
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index f7b194878a99..8aca5bf74685 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1134,7 +1134,7 @@ void *bpf_jit_alloc_exec(unsigned long size)
 	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
 				    BPF_JIT_REGION_END, GFP_KERNEL,
 				    PAGE_KERNEL, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    _RET_IP_);
 }
 
 void bpf_jit_free_exec(void *addr)
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 14f46d17500a..7541e9533de6 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -36,7 +36,7 @@ void *module_alloc(unsigned long size)
 {
 	return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
 				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+				_RET_IP_);
 }
 #endif
 
diff --git a/arch/nds32/kernel/module.c b/arch/nds32/kernel/module.c
index 3897fd14a21d..d05cd7f38af6 100644
--- a/arch/nds32/kernel/module.c
+++ b/arch/nds32/kernel/module.c
@@ -11,7 +11,7 @@ void *module_alloc(unsigned long size)
 {
 	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
 				    GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    _RET_IP_);
 }
 
 void module_free(struct module *module, void *region)
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 7df140545b22..320807f755a7 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -200,7 +200,7 @@ void *module_alloc(unsigned long size)
 	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
 				    GFP_KERNEL,
 				    PAGE_KERNEL_RWX, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    _RET_IP_);
 }
 
 #ifndef CONFIG_64BIT
diff --git a/arch/powerpc/include/asm/io-workarounds.h b/arch/powerpc/include/asm/io-workarounds.h
index 3cce499fbe27..38d0bd31fd67 100644
--- a/arch/powerpc/include/asm/io-workarounds.h
+++ b/arch/powerpc/include/asm/io-workarounds.h
@@ -50,6 +50,6 @@ static inline bool iowa_is_active(void)
 #endif
 
 void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
-			   pgprot_t prot, void *caller);
+			   pgprot_t prot, unsigned long caller);
 
 #endif /* _IO_WORKAROUNDS_H */
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 273edd208ec5..0e87e59dd047 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -839,7 +839,7 @@ static inline void iosync(void)
  * * iounmap undoes such a mapping and can be hooked
  *
  * * __ioremap_caller is the same as above but takes an explicit caller
- *   reference rather than using __builtin_return_address(0)
+ *   reference rather than using _RET_IP_
  *
  */
 extern void __iomem *ioremap(phys_addr_t address, unsigned long size);
@@ -865,10 +865,10 @@ void __iomem *ioremap_phb(phys_addr_t paddr, unsigned long size);
 int early_ioremap_range(unsigned long ea, phys_addr_t pa,
 			unsigned long size, pgprot_t prot);
 void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
-			 pgprot_t prot, void *caller);
+			 pgprot_t prot, unsigned long caller);
 
 extern void __iomem *__ioremap_caller(phys_addr_t, unsigned long size,
-				      pgprot_t prot, void *caller);
+				      pgprot_t prot, unsigned long caller);
 
 /*
  * When CONFIG_PPC_INDIRECT_PIO is set, we use the generic iomap implementation
diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
index 51bbaae94ccc..a52b3625512c 100644
--- a/arch/powerpc/kernel/io-workarounds.c
+++ b/arch/powerpc/kernel/io-workarounds.c
@@ -150,7 +150,7 @@ static const struct ppc_pci_io iowa_pci_io = {
 
 #ifdef CONFIG_PPC_INDIRECT_MMIO
 void __iomem *iowa_ioremap(phys_addr_t addr, unsigned long size,
-			   pgprot_t prot, void *caller)
+			   pgprot_t prot, unsigned long caller)
 {
 	struct iowa_bus *bus;
 	void __iomem *res = __ioremap_caller(addr, size, prot, caller);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index d71fd10a1dd4..046bb5fd8d6f 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -719,7 +719,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
 static void *__init alloc_vm_stack(void)
 {
 	return __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, THREADINFO_GFP,
-			      NUMA_NO_NODE, (void *)_RET_IP_);
+			      NUMA_NO_NODE, _RET_IP_);
 }
 
 static void __init vmap_irqstack_init(void)
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index cdb2d88c54e7..dabaa3d7c182 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -108,6 +108,5 @@ void *module_alloc(unsigned long size)
 	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
 				    PAGE_KERNEL_EXEC,
 				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
-				    NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    NUMA_NO_NODE, _RET_IP_);
 }
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 9312e6eda7ff..71beacdd1808 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -132,8 +132,7 @@ void __iomem *ioremap_phb(phys_addr_t paddr, unsigned long size)
 	 * address decoding but I'd rather not deal with those outside of the
 	 * reserved 64K legacy region.
 	 */
-	area = __get_vm_area_caller(size, 0, PHB_IO_BASE, PHB_IO_END,
-				    __builtin_return_address(0));
+	area = __get_vm_area_caller(size, 0, PHB_IO_BASE, PHB_IO_END, _RET_IP_);
 	if (!area)
 		return NULL;
 
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index b1a0aebe8c48..2b5a599a127f 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -12,7 +12,7 @@ EXPORT_SYMBOL(ioremap_bot);
 void __iomem *ioremap(phys_addr_t addr, unsigned long size)
 {
 	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
-	void *caller = __builtin_return_address(0);
+	unsigned long caller = _RET_IP_;
 
 	if (iowa_is_active())
 		return iowa_ioremap(addr, size, prot, caller);
@@ -23,7 +23,7 @@ EXPORT_SYMBOL(ioremap);
 void __iomem *ioremap_wc(phys_addr_t addr, unsigned long size)
 {
 	pgprot_t prot = pgprot_noncached_wc(PAGE_KERNEL);
-	void *caller = __builtin_return_address(0);
+	unsigned long caller = _RET_IP_;
 
 	if (iowa_is_active())
 		return iowa_ioremap(addr, size, prot, caller);
@@ -34,7 +34,7 @@ EXPORT_SYMBOL(ioremap_wc);
 void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
 {
 	pgprot_t prot = pgprot_cached(PAGE_KERNEL);
-	void *caller = __builtin_return_address(0);
+	unsigned long caller = _RET_IP_;
 
 	if (iowa_is_active())
 		return iowa_ioremap(addr, size, prot, caller);
@@ -44,7 +44,7 @@ void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
 void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
 {
 	pte_t pte = __pte(flags);
-	void *caller = __builtin_return_address(0);
+	unsigned long caller = _RET_IP_;
 
 	/* writeable implies dirty for kernel addresses */
 	if (pte_write(pte))
@@ -76,7 +76,7 @@ int early_ioremap_range(unsigned long ea, phys_addr_t pa,
 }
 
 void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
-			 pgprot_t prot, void *caller)
+			 pgprot_t prot, unsigned long caller)
 {
 	struct vm_struct *area;
 	int ret;
diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
index 743e11384dea..f86c76539c90 100644
--- a/arch/powerpc/mm/ioremap_32.c
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -10,12 +10,12 @@ void __iomem *ioremap_wt(phys_addr_t addr, unsigned long size)
 {
 	pgprot_t prot = pgprot_cached_wthru(PAGE_KERNEL);
 
-	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
+	return __ioremap_caller(addr, size, prot, _RET_IP_);
 }
 EXPORT_SYMBOL(ioremap_wt);
 
-void __iomem *
-__ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
+void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
+		pgprot_t prot, unsigned long caller)
 {
 	unsigned long v;
 	phys_addr_t p, offset;
@@ -68,7 +68,7 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	/*
 	 * Should check if it is a candidate for a BAT mapping
 	 */
-	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", caller);
+	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", (void *)caller);
 
 	err = early_ioremap_range(ioremap_bot - size, p, size, prot);
 	if (err)
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index ba5cbb0d66bd..6ff114416612 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -5,7 +5,7 @@
 #include <linux/vmalloc.h>
 
 void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
-			       pgprot_t prot, void *caller)
+			       pgprot_t prot, unsigned long caller)
 {
 	phys_addr_t paligned, offset;
 	void __iomem *ret;
@@ -31,7 +31,7 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 	if (slab_is_available())
 		return do_ioremap(paligned, offset, size, prot, caller);
 
-	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", caller);
+	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", (void *)caller);
 
 	err = early_ioremap_range(ioremap_bot, paligned, size, prot);
 	if (err)
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 104fba889cf7..141de853f661 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -415,6 +415,6 @@ void *module_alloc(unsigned long size)
 	return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
 				    VMALLOC_END, GFP_KERNEL,
 				    PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    _RET_IP_);
 }
 #endif
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index b44ff52f84a6..7f61c69115ab 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1154,7 +1154,7 @@ void *bpf_jit_alloc_exec(unsigned long size)
 	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
 				    BPF_JIT_REGION_END, GFP_KERNEL,
 				    PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    _RET_IP_);
 }
 
 void bpf_jit_free_exec(void *addr)
diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
index 4055f1c49814..1e051ac66ecd 100644
--- a/arch/s390/kernel/module.c
+++ b/arch/s390/kernel/module.c
@@ -40,7 +40,7 @@ void *module_alloc(unsigned long size)
 		return NULL;
 	p = __vmalloc_node_range(size, MODULE_ALIGN, MODULES_VADDR, MODULES_END,
 				 GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
-				 __builtin_return_address(0));
+				 _RET_IP_);
 	if (p && (kasan_module_alloc(p, size) < 0)) {
 		vfree(p);
 		return NULL;
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 60da976eee6f..719ee2bcdf67 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -311,8 +311,7 @@ unsigned long stack_alloc(void)
 {
 #ifdef CONFIG_VMAP_STACK
 	return (unsigned long)__vmalloc_node(THREAD_SIZE, THREAD_SIZE,
-			THREADINFO_GFP, NUMA_NO_NODE,
-			__builtin_return_address(0));
+			THREADINFO_GFP, NUMA_NO_NODE, _RET_IP_);
 #else
 	return __get_free_pages(GFP_KERNEL, THREAD_SIZE_ORDER);
 #endif
diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index 6d5c6463bc07..91aa68466c69 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -245,19 +245,17 @@ unsigned long long poke_real_address_q(unsigned long long addr,
 #ifdef CONFIG_MMU
 void iounmap(void __iomem *addr);
 void __iomem *__ioremap_caller(phys_addr_t offset, unsigned long size,
-			       pgprot_t prot, void *caller);
+			       pgprot_t prot, unsigned long caller);
 
 static inline void __iomem *ioremap(phys_addr_t offset, unsigned long size)
 {
-	return __ioremap_caller(offset, size, PAGE_KERNEL_NOCACHE,
-			__builtin_return_address(0));
+	return __ioremap_caller(offset, size, PAGE_KERNEL_NOCACHE, _RET_IP_);
 }
 
 static inline void __iomem *
 ioremap_cache(phys_addr_t offset, unsigned long size)
 {
-	return __ioremap_caller(offset, size, PAGE_KERNEL,
-			__builtin_return_address(0));
+	return __ioremap_caller(offset, size, PAGE_KERNEL, _RET_IP_);
 }
 #define ioremap_cache ioremap_cache
 
@@ -265,8 +263,7 @@ ioremap_cache(phys_addr_t offset, unsigned long size)
 static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
 		unsigned long flags)
 {
-	return __ioremap_caller(offset, size, __pgprot(flags),
-			__builtin_return_address(0));
+	return __ioremap_caller(offset, size, __pgprot(flags), _RET_IP_);
 }
 #endif /* CONFIG_HAVE_IOREMAP_PROT */
 
diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index d432164b23b7..bc16e3818db1 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -104,7 +104,7 @@ static int __sq_remap(struct sq_mapping *map, pgprot_t prot)
 	struct vm_struct *vma;
 
 	vma = __get_vm_area_caller(map->size, VM_ALLOC, map->sq_addr,
-			SQ_ADDRMAX, __builtin_return_address(0));
+			SQ_ADDRMAX, _RET_IP_);
 	if (!vma)
 		return -ENOMEM;
 
diff --git a/arch/sh/mm/ioremap.c b/arch/sh/mm/ioremap.c
index 21342581144d..aaabb40526ef 100644
--- a/arch/sh/mm/ioremap.c
+++ b/arch/sh/mm/ioremap.c
@@ -83,7 +83,7 @@ __ioremap_29bit(phys_addr_t offset, unsigned long size, pgprot_t prot)
  */
 void __iomem * __ref
 __ioremap_caller(phys_addr_t phys_addr, unsigned long size,
-		 pgprot_t pgprot, void *caller)
+		 pgprot_t pgprot, unsigned long caller)
 {
 	struct vm_struct *area;
 	unsigned long offset, last_addr, addr, orig_addr;
diff --git a/arch/sh/mm/pmb.c b/arch/sh/mm/pmb.c
index 68eb7cc6e564..7d006958db11 100644
--- a/arch/sh/mm/pmb.c
+++ b/arch/sh/mm/pmb.c
@@ -408,7 +408,7 @@ int pmb_bolt_mapping(unsigned long vaddr, phys_addr_t phys,
 }
 
 void __iomem *pmb_remap_caller(phys_addr_t phys, unsigned long size,
-			       pgprot_t prot, void *caller)
+			       pgprot_t prot, unsigned long caller)
 {
 	unsigned long vaddr;
 	phys_addr_t offset, last_addr;
diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
index df39580f398d..a9b79ba194fb 100644
--- a/arch/sparc/kernel/module.c
+++ b/arch/sparc/kernel/module.c
@@ -31,7 +31,7 @@ static void *module_map(unsigned long size)
 		return NULL;
 	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
 				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
-				__builtin_return_address(0));
+				_RET_IP_);
 }
 #else
 static void *module_map(unsigned long size)
diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index d930ecf92805..4866351282b0 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -428,7 +428,7 @@ void __init hyperv_init(void)
 	hv_hypercall_pg = __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START,
 			VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_ROX,
 			VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-			__builtin_return_address(0));
+			_RET_IP_);
 	if (hv_hypercall_pg == NULL) {
 		wrmsrl(HV_X64_MSR_GUEST_OS_ID, 0);
 		goto remove_cpuhp_state;
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 5e9a34b5bd74..7d4dff41ca73 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -75,8 +75,7 @@ void *module_alloc(unsigned long size)
 	p = __vmalloc_node_range(size, MODULE_ALIGN,
 				    MODULES_VADDR + get_module_load_offset(),
 				    MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    PAGE_KERNEL, 0, NUMA_NO_NODE, _RET_IP_);
 	if (p && (kasan_module_alloc(p, size) < 0)) {
 		vfree(p);
 		return NULL;
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 12c686c65ea9..a2954a6591cc 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -174,7 +174,7 @@ static void __ioremap_check_mem(resource_size_t addr, unsigned long size,
  */
 static void __iomem *
 __ioremap_caller(resource_size_t phys_addr, unsigned long size,
-		 enum page_cache_mode pcm, void *caller, bool encrypted)
+		 enum page_cache_mode pcm, unsigned long caller, bool encrypted)
 {
 	unsigned long offset, vaddr;
 	resource_size_t last_addr;
@@ -290,7 +290,7 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
 	 * tree.
 	 */
 	if (iomem_map_sanity_check(unaligned_phys_addr, unaligned_size))
-		pr_warn("caller %pS mapping multiple BARs\n", caller);
+		pr_warn("caller %pS mapping multiple BARs\n", (void *)caller);
 
 	return ret_addr;
 err_free_area:
@@ -333,8 +333,7 @@ void __iomem *ioremap(resource_size_t phys_addr, unsigned long size)
 	 */
 	enum page_cache_mode pcm = _PAGE_CACHE_MODE_UC_MINUS;
 
-	return __ioremap_caller(phys_addr, size, pcm,
-				__builtin_return_address(0), false);
+	return __ioremap_caller(phys_addr, size, pcm, _RET_IP_, false);
 }
 EXPORT_SYMBOL(ioremap);
 
@@ -366,8 +365,7 @@ void __iomem *ioremap_uc(resource_size_t phys_addr, unsigned long size)
 {
 	enum page_cache_mode pcm = _PAGE_CACHE_MODE_UC;
 
-	return __ioremap_caller(phys_addr, size, pcm,
-				__builtin_return_address(0), false);
+	return __ioremap_caller(phys_addr, size, pcm, _RET_IP_, false);
 }
 EXPORT_SYMBOL_GPL(ioremap_uc);
 
@@ -384,7 +382,7 @@ EXPORT_SYMBOL_GPL(ioremap_uc);
 void __iomem *ioremap_wc(resource_size_t phys_addr, unsigned long size)
 {
 	return __ioremap_caller(phys_addr, size, _PAGE_CACHE_MODE_WC,
-					__builtin_return_address(0), false);
+					_RET_IP_, false);
 }
 EXPORT_SYMBOL(ioremap_wc);
 
@@ -401,21 +399,21 @@ EXPORT_SYMBOL(ioremap_wc);
 void __iomem *ioremap_wt(resource_size_t phys_addr, unsigned long size)
 {
 	return __ioremap_caller(phys_addr, size, _PAGE_CACHE_MODE_WT,
-					__builtin_return_address(0), false);
+					_RET_IP_, false);
 }
 EXPORT_SYMBOL(ioremap_wt);
 
 void __iomem *ioremap_encrypted(resource_size_t phys_addr, unsigned long size)
 {
 	return __ioremap_caller(phys_addr, size, _PAGE_CACHE_MODE_WB,
-				__builtin_return_address(0), true);
+				_RET_IP_, true);
 }
 EXPORT_SYMBOL(ioremap_encrypted);
 
 void __iomem *ioremap_cache(resource_size_t phys_addr, unsigned long size)
 {
 	return __ioremap_caller(phys_addr, size, _PAGE_CACHE_MODE_WB,
-				__builtin_return_address(0), false);
+				_RET_IP_, false);
 }
 EXPORT_SYMBOL(ioremap_cache);
 
@@ -424,7 +422,7 @@ void __iomem *ioremap_prot(resource_size_t phys_addr, unsigned long size,
 {
 	return __ioremap_caller(phys_addr, size,
 				pgprot2cachemode(__pgprot(prot_val)),
-				__builtin_return_address(0), false);
+				_RET_IP_, false);
 }
 EXPORT_SYMBOL(ioremap_prot);
 
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index b4c82f2d40dc..8705952b03f9 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -60,7 +60,7 @@ struct vm_struct {
 #endif
 	unsigned int		nr_pages;
 	phys_addr_t		phys_addr;
-	const void		*caller;
+	unsigned long		caller;
 };
 
 struct vmap_area {
@@ -132,9 +132,9 @@ extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
 extern void *__vmalloc_node_range(unsigned long size, unsigned long align,
 			unsigned long start, unsigned long end, gfp_t gfp_mask,
 			pgprot_t prot, unsigned long vm_flags, int node,
-			const void *caller);
+			unsigned long caller);
 void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
-		int node, const void *caller);
+		int node, unsigned long caller);
 
 extern void vfree(const void *addr);
 extern void vfree_atomic(const void *addr);
@@ -181,16 +181,14 @@ static inline size_t get_vm_area_size(const struct vm_struct *area)
 
 }
 
-extern struct vm_struct *get_vm_area(unsigned long size, unsigned long flags);
-extern struct vm_struct *get_vm_area_caller(unsigned long size,
-					unsigned long flags, const void *caller);
-extern struct vm_struct *__get_vm_area_caller(unsigned long size,
-					unsigned long flags,
-					unsigned long start, unsigned long end,
-					const void *caller);
+struct vm_struct *get_vm_area(unsigned long size, unsigned long flags);
+struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
+		unsigned long caller);
+struct vm_struct *__get_vm_area_caller(unsigned long size, unsigned long flags,
+		unsigned long start, unsigned long end, unsigned long caller);
 void free_vm_area(struct vm_struct *area);
-extern struct vm_struct *remove_vm_area(const void *addr);
-extern struct vm_struct *find_vm_area(const void *addr);
+struct vm_struct *remove_vm_area(const void *addr);
+struct vm_struct *find_vm_area(const void *addr);
 
 static inline bool is_vm_area_hugepages(const void *addr)
 {
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 250503482cda..81ad2e97e49e 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -305,7 +305,7 @@ static void *__bpf_map_area_alloc(u64 size, int numa_node, bool mmapable)
 
 	return __vmalloc_node_range(size, align, VMALLOC_START, VMALLOC_END,
 			gfp | GFP_KERNEL | __GFP_RETRY_MAYFAIL, PAGE_KERNEL,
-			flags, numa_node, __builtin_return_address(0));
+			flags, numa_node, _RET_IP_);
 }
 
 void *bpf_map_area_alloc(u64 size, int numa_node)
diff --git a/kernel/fork.c b/kernel/fork.c
index fa77820649b4..cb446d2596d7 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -246,7 +246,7 @@ static unsigned long *alloc_thread_stack_node(struct task_struct *tsk, int node)
 				     VMALLOC_START, VMALLOC_END,
 				     THREADINFO_GFP & ~__GFP_ACCOUNT,
 				     PAGE_KERNEL,
-				     0, node, __builtin_return_address(0));
+				     0, node, _RET_IP_);
 
 	/*
 	 * We can't call find_vm_area() in interrupt context, and
diff --git a/kernel/module.c b/kernel/module.c
index 30479355ab85..bfc8ca90c870 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2797,7 +2797,7 @@ void * __weak module_alloc(unsigned long size)
 {
 	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
 			GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
-			NUMA_NO_NODE, __builtin_return_address(0));
+			NUMA_NO_NODE, _RET_IP_);
 }
 
 bool __weak module_init_section(const char *name)
diff --git a/kernel/scs.c b/kernel/scs.c
index e2a71fc82fa0..e84321db1924 100644
--- a/kernel/scs.c
+++ b/kernel/scs.c
@@ -39,8 +39,7 @@ static void *__scs_alloc(int node)
 	}
 
 	return __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
-				    GFP_SCS, PAGE_KERNEL, 0, node,
-				    __builtin_return_address(0));
+				    GFP_SCS, PAGE_KERNEL, 0, node, _RET_IP_);
 }
 
 void *scs_alloc(int node)
diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 5cf2fe9aab9e..3ce421078906 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -98,7 +98,7 @@ static int random_size_align_alloc_test(void)
 		size = ((rnd % 10) + 1) * PAGE_SIZE;
 
 		ptr = __vmalloc_node(size, align, GFP_KERNEL | __GFP_ZERO, 0,
-				__builtin_return_address(0));
+				_RET_IP_);
 		if (!ptr)
 			return -1;
 
@@ -121,7 +121,7 @@ static int align_shift_alloc_test(void)
 		align = ((unsigned long) 1) << i;
 
 		ptr = __vmalloc_node(PAGE_SIZE, align, GFP_KERNEL|__GFP_ZERO, 0,
-				__builtin_return_address(0));
+				_RET_IP_);
 		if (!ptr)
 			return -1;
 
@@ -138,8 +138,7 @@ static int fix_align_alloc_test(void)
 
 	for (i = 0; i < test_loop_count; i++) {
 		ptr = __vmalloc_node(5 * PAGE_SIZE, THREAD_ALIGN << 1,
-				GFP_KERNEL | __GFP_ZERO, 0,
-				__builtin_return_address(0));
+				GFP_KERNEL | __GFP_ZERO, 0, _RET_IP_);
 		if (!ptr)
 			return -1;
 
diff --git a/mm/ioremap.c b/mm/ioremap.c
index d1dcc7e744ac..fe3ecc5e0952 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -51,8 +51,7 @@ void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot)
 	addr -= offset;
 	size = PAGE_ALIGN(size + offset);
 
-	area = get_vm_area_caller(size, VM_IOREMAP,
-			__builtin_return_address(0));
+	area = get_vm_area_caller(size, VM_IOREMAP, _RET_IP_);
 	if (!area)
 		return NULL;
 	vaddr = (unsigned long)area->addr;
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 727ad4629173..2a10b9437066 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -204,7 +204,7 @@ static int __meminit kasan_mem_notifier(struct notifier_block *nb,
 					shadow_end, GFP_KERNEL,
 					PAGE_KERNEL, VM_NO_GUARD,
 					pfn_to_nid(mem_data->start_pfn),
-					__builtin_return_address(0));
+					_RET_IP_);
 		if (!ret)
 			return NOTIFY_BAD;
 
@@ -505,8 +505,7 @@ int kasan_module_alloc(void *addr, size_t size)
 	ret = __vmalloc_node_range(shadow_size, 1, shadow_start,
 			shadow_start + shadow_size,
 			GFP_KERNEL,
-			PAGE_KERNEL, VM_NO_GUARD, NUMA_NO_NODE,
-			__builtin_return_address(0));
+			PAGE_KERNEL, VM_NO_GUARD, NUMA_NO_NODE, _RET_IP_);
 
 	if (ret) {
 		__memset(ret, KASAN_SHADOW_INIT, shadow_size);
diff --git a/mm/nommu.c b/mm/nommu.c
index 5c9ab799c0e6..515b3e528985 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -153,13 +153,13 @@ EXPORT_SYMBOL(__vmalloc);
 void *__vmalloc_node_range(unsigned long size, unsigned long align,
 		unsigned long start, unsigned long end, gfp_t gfp_mask,
 		pgprot_t prot, unsigned long vm_flags, int node,
-		const void *caller)
+		unsigned long caller)
 {
 	return __vmalloc(size, gfp_mask);
 }
 
 void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
-		int node, const void *caller)
+		int node, unsigned long caller)
 {
 	return __vmalloc(size, gfp_mask);
 }
diff --git a/mm/util.c b/mm/util.c
index 0b6dd9d81da7..5c2304bb02ae 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -593,8 +593,7 @@ void *kvmalloc_node(size_t size, gfp_t flags, int node)
 	if (ret || size <= PAGE_SIZE)
 		return ret;
 
-	return __vmalloc_node(size, 1, flags, node,
-			__builtin_return_address(0));
+	return __vmalloc_node(size, 1, flags, node, _RET_IP_);
 }
 EXPORT_SYMBOL(kvmalloc_node);
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 4b415b4bb7ae..a22241e9c363 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2344,7 +2344,7 @@ void unmap_kernel_range(unsigned long addr, unsigned long size)
 }
 
 static inline void setup_vmalloc_vm_locked(struct vm_struct *vm,
-	struct vmap_area *va, unsigned long flags, const void *caller)
+		struct vmap_area *va, unsigned long flags, unsigned long caller)
 {
 	vm->flags = flags;
 	vm->addr = (void *)va->va_start;
@@ -2354,7 +2354,7 @@ static inline void setup_vmalloc_vm_locked(struct vm_struct *vm,
 }
 
 static void setup_vmalloc_vm(struct vm_struct *vm, struct vmap_area *va,
-			      unsigned long flags, const void *caller)
+			      unsigned long flags, unsigned long caller)
 {
 	spin_lock(&vmap_area_lock);
 	setup_vmalloc_vm_locked(vm, va, flags, caller);
@@ -2374,7 +2374,8 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
 
 static struct vm_struct *__get_vm_area_node(unsigned long size,
 		unsigned long align, unsigned long flags, unsigned long start,
-		unsigned long end, int node, gfp_t gfp_mask, const void *caller)
+		unsigned long end, int node, gfp_t gfp_mask,
+		unsigned long caller)
 {
 	struct vmap_area *va;
 	struct vm_struct *area;
@@ -2411,7 +2412,7 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
 
 struct vm_struct *__get_vm_area_caller(unsigned long size, unsigned long flags,
 				       unsigned long start, unsigned long end,
-				       const void *caller)
+				       unsigned long caller)
 {
 	return __get_vm_area_node(size, 1, flags, start, end, NUMA_NO_NODE,
 				  GFP_KERNEL, caller);
@@ -2431,12 +2432,11 @@ struct vm_struct *__get_vm_area_caller(unsigned long size, unsigned long flags,
 struct vm_struct *get_vm_area(unsigned long size, unsigned long flags)
 {
 	return __get_vm_area_node(size, 1, flags, VMALLOC_START, VMALLOC_END,
-				  NUMA_NO_NODE, GFP_KERNEL,
-				  __builtin_return_address(0));
+				  NUMA_NO_NODE, GFP_KERNEL, _RET_IP_);
 }
 
 struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
-				const void *caller)
+				unsigned long caller)
 {
 	return __get_vm_area_node(size, 1, flags, VMALLOC_START, VMALLOC_END,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
@@ -2720,7 +2720,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = get_vm_area_caller(size, flags, _RET_IP_);
 	if (!area)
 		return NULL;
 
@@ -2769,8 +2769,7 @@ void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot)
 	struct vmap_pfn_data data = { .pfns = pfns, .prot = pgprot_nx(prot) };
 	struct vm_struct *area;
 
-	area = get_vm_area_caller(count * PAGE_SIZE, VM_IOREMAP,
-			__builtin_return_address(0));
+	area = get_vm_area_caller(count * PAGE_SIZE, VM_IOREMAP, _RET_IP_);
 	if (!area)
 		return NULL;
 	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
@@ -2880,7 +2879,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 void *__vmalloc_node_range(unsigned long size, unsigned long align,
 			unsigned long start, unsigned long end, gfp_t gfp_mask,
 			pgprot_t prot, unsigned long vm_flags, int node,
-			const void *caller)
+			unsigned long caller)
 {
 	struct vm_struct *area;
 	void *addr;
@@ -2972,7 +2971,7 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
  * Return: pointer to the allocated memory or %NULL on error
  */
 void *__vmalloc_node(unsigned long size, unsigned long align,
-			    gfp_t gfp_mask, int node, const void *caller)
+			    gfp_t gfp_mask, int node, unsigned long caller)
 {
 	return __vmalloc_node_range(size, align, VMALLOC_START, VMALLOC_END,
 				gfp_mask, PAGE_KERNEL, 0, node, caller);
@@ -2988,8 +2987,7 @@ EXPORT_SYMBOL_GPL(__vmalloc_node);
 
 void *__vmalloc(unsigned long size, gfp_t gfp_mask)
 {
-	return __vmalloc_node(size, 1, gfp_mask, NUMA_NO_NODE,
-				__builtin_return_address(0));
+	return __vmalloc_node(size, 1, gfp_mask, NUMA_NO_NODE, _RET_IP_);
 }
 EXPORT_SYMBOL(__vmalloc);
 
@@ -3007,8 +3005,7 @@ EXPORT_SYMBOL(__vmalloc);
  */
 void *vmalloc(unsigned long size)
 {
-	return __vmalloc_node(size, 1, GFP_KERNEL, NUMA_NO_NODE,
-				__builtin_return_address(0));
+	return __vmalloc_node(size, 1, GFP_KERNEL, NUMA_NO_NODE, _RET_IP_);
 }
 EXPORT_SYMBOL(vmalloc);
 
@@ -3028,7 +3025,7 @@ EXPORT_SYMBOL(vmalloc);
 void *vzalloc(unsigned long size)
 {
 	return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_ZERO, NUMA_NO_NODE,
-				__builtin_return_address(0));
+				_RET_IP_);
 }
 EXPORT_SYMBOL(vzalloc);
 
@@ -3045,8 +3042,7 @@ void *vmalloc_user(unsigned long size)
 {
 	return __vmalloc_node_range(size, SHMLBA,  VMALLOC_START, VMALLOC_END,
 				    GFP_KERNEL | __GFP_ZERO, PAGE_KERNEL,
-				    VM_USERMAP, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    VM_USERMAP, NUMA_NO_NODE, _RET_IP_);
 }
 EXPORT_SYMBOL(vmalloc_user);
 
@@ -3065,8 +3061,7 @@ EXPORT_SYMBOL(vmalloc_user);
  */
 void *vmalloc_node(unsigned long size, int node)
 {
-	return __vmalloc_node(size, 1, GFP_KERNEL, node,
-			__builtin_return_address(0));
+	return __vmalloc_node(size, 1, GFP_KERNEL, node, _RET_IP_);
 }
 EXPORT_SYMBOL(vmalloc_node);
 
@@ -3083,8 +3078,7 @@ EXPORT_SYMBOL(vmalloc_node);
  */
 void *vzalloc_node(unsigned long size, int node)
 {
-	return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_ZERO, node,
-				__builtin_return_address(0));
+	return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_ZERO, node, _RET_IP_);
 }
 EXPORT_SYMBOL(vzalloc_node);
 
@@ -3111,8 +3105,7 @@ EXPORT_SYMBOL(vzalloc_node);
  */
 void *vmalloc_32(unsigned long size)
 {
-	return __vmalloc_node(size, 1, GFP_VMALLOC32, NUMA_NO_NODE,
-			__builtin_return_address(0));
+	return __vmalloc_node(size, 1, GFP_VMALLOC32, NUMA_NO_NODE, _RET_IP_);
 }
 EXPORT_SYMBOL(vmalloc_32);
 
@@ -3129,8 +3122,7 @@ void *vmalloc_32_user(unsigned long size)
 {
 	return __vmalloc_node_range(size, SHMLBA,  VMALLOC_START, VMALLOC_END,
 				    GFP_VMALLOC32 | __GFP_ZERO, PAGE_KERNEL,
-				    VM_USERMAP, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+				    VM_USERMAP, NUMA_NO_NODE, _RET_IP_);
 }
 EXPORT_SYMBOL(vmalloc_32_user);
 
@@ -3712,7 +3704,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		insert_vmap_area(vas[area], &vmap_area_root, &vmap_area_list);
 
 		setup_vmalloc_vm_locked(vms[area], vas[area], VM_ALLOC,
-				 pcpu_get_vm_areas);
+				 _THIS_IP_);
 	}
 	spin_unlock(&vmap_area_lock);
 
@@ -3820,7 +3812,7 @@ bool vmalloc_dump_obj(void *object)
 	if (!vm)
 		return false;
 	pr_cont(" %u-page vmalloc region starting at %#lx allocated at %pS\n",
-		vm->nr_pages, (unsigned long)vm->addr, vm->caller);
+		vm->nr_pages, (unsigned long)vm->addr, (void *)vm->caller);
 	return true;
 }
 #endif
@@ -3911,7 +3903,7 @@ static int s_show(struct seq_file *m, void *p)
 		v->addr, v->addr + v->size, v->size);
 
 	if (v->caller)
-		seq_printf(m, " %pS", v->caller);
+		seq_printf(m, " %pS", (void *)v->caller);
 
 	if (v->nr_pages)
 		seq_printf(m, " pages=%d", v->nr_pages);
-- 
2.30.2

