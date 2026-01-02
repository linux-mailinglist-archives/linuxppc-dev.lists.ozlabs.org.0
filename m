Return-Path: <linuxppc-dev+bounces-15148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27608CEDCF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:06:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF9K0Gbvz30HQ;
	Fri, 02 Jan 2026 18:06:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337588;
	cv=none; b=l+cqJBIdLg9eKiTwsi1K9gDpoXg+pq8nV3TKw+0xwC/DJmz0zOdaq6XU8XIWV6padVH+UsRdHOuE+ehCqq4GqukDm3eP89uywvKUlREGhBrqh9KNhyn/zz0plU3BH3CeKMal2sKZOdx3ZX7OibeGCX+A6mdc5SIneUHiqqg9pKXnrlQHC3Fs0dXRpJ11q+RRo1NTYb9tXEPLr5SB61fWBqbsIiNlQB2fWYDUWZ1FRRII53zHP37RUqVP/v9JESckK212TXbtsmF3yvjuIhHZ0keggxJ8bfr1ALzQJ0CTXPhxYDWbBQEMoOgrvWFThJ7RnVNTwAu+tY6U1uzHiCfifw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337588; c=relaxed/relaxed;
	bh=deOMpuGYGlz90LEQ2vf7mheiMo+4nubl/NdZiJQKJW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGSsWIefrWsRBDVgZXhDcrBT4QYhowcnzHkKIWKQGABMwRKTKrEkYPtZyDtWl6QaUV4pTKeJAIxvXr4wKJLepZLSQC/XUaxi6nlDENXsHiF14Pm0jYLKz0nzVGt4uRGu6u4bLd2QGZbipQPladLQYpMOjYMT1P+0yZw70v5siMh2q0BLIey1C+hidYkNLh41SWCbO40FIuNpPHslqvOdUZqz+dq2Rt4LfA3YsyTuDUAYo6R0KhrEOc4bio0n6dG7a8BNES2uG5tenLyVg5vgXCfQQTI/erXEObSn5K8XsmY8GXpJYp95M9N+uAJICGbzg9xDXyttlxCdkT3CCW9vhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BRazAYvp; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BRazAYvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF9J0jmFz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:06:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D444860017;
	Fri,  2 Jan 2026 07:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58FDC19422;
	Fri,  2 Jan 2026 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337555;
	bh=PCpWC6AbTzuppWM+VmkMKjEgcPECM1FjjXTtxFhKA/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRazAYvpE65O4ga8K2yr6JMC0JTgjxdrfQPg7QECGdx57udLajfCNmxiYN1rL21hc
	 a2Ax5uezK3vyFKPJ2EarK8rSiCmvDAKovnnk2jzw77WcdEpAypTdd10J/L4NFYuHw1
	 DXvoNmbVoqO1e+RG6RPNorO8yJhKCN+QxPR9+p7pA90YcAGCfjmrO6Wox8DChjIccy
	 epXYiWwQskLpByFfzzD++t5S/BwbIZSbEucQ9MhEgPplxwQQQVGKYI5tHo75ATiOwY
	 kD+dIcP59kSET90TOz/PrEVZt3AswtUls/gR3l14jboA9EJKRGk2bdw9hDr4Oa7ryb
	 nfI4Mx3TtU/Pg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 23/28] arch, mm: consolidate initialization of SPARSE memory model
Date: Fri,  2 Jan 2026 08:59:59 +0200
Message-ID: <20260102070005.65328-24-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Every architecture calls sparse_init() during setup_arch() although the
data structures created by sparse_init() are not used until the
initialization of the core MM.

Beside the code duplication, calling sparse_init() from architecture
specific code causes ordering differences of vmemmap and HVO initialization
on different architectures.

Move the call to sparse_init() from architecture specific code to
free_area_init() to ensure that vmemmap and HVO initialization order is
always the same.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/mm/memory-model.rst                    |  3 ---
 Documentation/translations/zh_CN/mm/memory-model.rst |  2 --
 arch/alpha/kernel/setup.c                            |  1 -
 arch/arm/mm/init.c                                   |  6 ------
 arch/arm64/mm/init.c                                 |  6 ------
 arch/csky/kernel/setup.c                             |  2 --
 arch/loongarch/kernel/setup.c                        |  8 --------
 arch/mips/kernel/setup.c                             | 11 -----------
 arch/parisc/mm/init.c                                |  2 --
 arch/powerpc/include/asm/setup.h                     |  4 ++++
 arch/powerpc/mm/mem.c                                |  5 -----
 arch/powerpc/mm/numa.c                               |  2 --
 arch/riscv/mm/init.c                                 |  1 -
 arch/s390/mm/init.c                                  |  1 -
 arch/sh/mm/init.c                                    |  2 --
 arch/sparc/mm/init_64.c                              |  2 --
 arch/x86/mm/init_32.c                                |  1 -
 arch/x86/mm/init_64.c                                |  2 --
 include/linux/mmzone.h                               |  2 --
 mm/internal.h                                        |  6 ++++++
 mm/mm_init.c                                         |  1 +
 21 files changed, 11 insertions(+), 59 deletions(-)

diff --git a/Documentation/mm/memory-model.rst b/Documentation/mm/memory-model.rst
index 7957122039e8..199b11328f4f 100644
--- a/Documentation/mm/memory-model.rst
+++ b/Documentation/mm/memory-model.rst
@@ -97,9 +97,6 @@ sections:
   `mem_section` objects and the number of rows is calculated to fit
   all the memory sections.
 
-The architecture setup code should call sparse_init() to
-initialize the memory sections and the memory maps.
-
 With SPARSEMEM there are two possible ways to convert a PFN to the
 corresponding `struct page` - a "classic sparse" and "sparse
 vmemmap". The selection is made at build time and it is determined by
diff --git a/Documentation/translations/zh_CN/mm/memory-model.rst b/Documentation/translations/zh_CN/mm/memory-model.rst
index 77ec149a970c..c0c5d8ecd880 100644
--- a/Documentation/translations/zh_CN/mm/memory-model.rst
+++ b/Documentation/translations/zh_CN/mm/memory-model.rst
@@ -83,8 +83,6 @@ SPARSEMEM模型将物理内存显示为一个部分的集合。一个区段用me
   每一行包含价值 `PAGE_SIZE` 的 `mem_section` 对象，行数的计算是为了适应所有的
   内存区。
 
-架构设置代码应该调用sparse_init()来初始化内存区和内存映射。
-
 通过SPARSEMEM，有两种可能的方式将PFN转换为相应的 `struct page` --"classic sparse"和
  "sparse vmemmap"。选择是在构建时进行的，它由 `CONFIG_SPARSEMEM_VMEMMAP` 的
  值决定。
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index bebdffafaee8..f0af444a69a4 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -607,7 +607,6 @@ setup_arch(char **cmdline_p)
 	/* Find our memory.  */
 	setup_memory(kernel_end);
 	memblock_set_bottom_up(true);
-	sparse_init();
 
 	/* First guess at cpu cache sizes.  Do this before init_arch.  */
 	determine_cpu_caches(cpu->type);
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index a8f7b4084715..0cc1bf04686d 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -207,12 +207,6 @@ void __init bootmem_init(void)
 
 	early_memtest((phys_addr_t)min_low_pfn << PAGE_SHIFT,
 		      (phys_addr_t)max_low_pfn << PAGE_SHIFT);
-
-	/*
-	 * sparse_init() tries to allocate memory from memblock, so must be
-	 * done after the fixed reservations
-	 */
-	sparse_init();
 }
 
 /*
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 3641e88ea871..9d271aff7652 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -321,12 +321,6 @@ void __init bootmem_init(void)
 #endif
 
 	kvm_hyp_reserve();
-
-	/*
-	 * sparse_init() tries to allocate memory from memblock, so must be
-	 * done after the fixed reservations
-	 */
-	sparse_init();
 	dma_limits_init();
 
 	/*
diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index 4bf3c01ead3a..45c98dcf7f50 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -123,8 +123,6 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
-	sparse_init();
-
 	fixaddr_init();
 
 #ifdef CONFIG_HIGHMEM
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 708ac025db71..d6a1ff0e16f1 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -402,14 +402,6 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	check_kernel_sections_mem();
 
-	/*
-	 * In order to reduce the possibility of kernel panic when failed to
-	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
-	 * low memory as small as possible before swiotlb_init(), so make
-	 * sparse_init() using top-down allocation.
-	 */
-	memblock_set_bottom_up(false);
-	sparse_init();
 	memblock_set_bottom_up(true);
 
 	swiotlb_init(true, SWIOTLB_VERBOSE);
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 11b9b6b63e19..d36d89d01fa4 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -614,7 +614,6 @@ static void __init bootcmdline_init(void)
  * kernel but generic memory management system is still entirely uninitialized.
  *
  *  o bootmem_init()
- *  o sparse_init()
  *  o paging_init()
  *  o dma_contiguous_reserve()
  *
@@ -665,16 +664,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	mips_parse_crashkernel();
 	device_tree_init();
 
-	/*
-	 * In order to reduce the possibility of kernel panic when failed to
-	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
-	 * low memory as small as possible before plat_swiotlb_setup(), so
-	 * make sparse_init() using top-down allocation.
-	 */
-	memblock_set_bottom_up(false);
-	sparse_init();
-	memblock_set_bottom_up(true);
-
 	plat_swiotlb_setup();
 
 	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index ce6f09ab7a90..6a39e031e5ff 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -706,8 +706,6 @@ void __init paging_init(void)
 	fixmap_init();
 	flush_cache_all_local(); /* start with known state */
 	flush_tlb_all_local(NULL);
-
-	sparse_init();
 }
 
 static void alloc_btlb(unsigned long start, unsigned long end, int *slot,
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 50a92b24628d..6d60ea4868ab 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -20,7 +20,11 @@ extern void reloc_got2(unsigned long);
 
 void check_for_initrd(void);
 void mem_topology_setup(void);
+#ifdef CONFIG_NUMA
 void initmem_init(void);
+#else
+static inline void initmem_init(void) {}
+#endif
 void setup_panic(void);
 #define ARCH_PANIC_TIMEOUT 180
 
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 72d4993192a6..30f56d601e56 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -182,11 +182,6 @@ void __init mem_topology_setup(void)
 	memblock_set_node(0, PHYS_ADDR_MAX, &memblock.memory, 0);
 }
 
-void __init initmem_init(void)
-{
-	sparse_init();
-}
-
 /* mark pages that don't exist as nosave */
 static int __init mark_nonram_nosave(void)
 {
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 603a0f652ba6..f4cf3ae036de 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1213,8 +1213,6 @@ void __init initmem_init(void)
 		setup_node_data(nid, start_pfn, end_pfn);
 	}
 
-	sparse_init();
-
 	/*
 	 * We need the numa_cpu_lookup_table to be accurate for all CPUs,
 	 * even before we online them, so that we can use cpu_to_{node,mem}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 79b4792578c4..11ac4041afc0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1430,7 +1430,6 @@ void __init misc_mem_init(void)
 {
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 	arch_numa_init();
-	sparse_init();
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
 	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 9ec608b5cbb1..3c20475cbee2 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -98,7 +98,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 void __init paging_init(void)
 {
 	vmem_map_init();
-	sparse_init();
 	zone_dma_limit = DMA_BIT_MASK(31);
 }
 
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 3edee854b755..464a3a63e2fa 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -227,8 +227,6 @@ static void __init do_init_bootmem(void)
 	node_set_online(0);
 
 	plat_mem_setup();
-
-	sparse_init();
 }
 
 static void __init early_reserve_mem(void)
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 931f872ce84a..4f7bdb18774b 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1615,8 +1615,6 @@ static unsigned long __init bootmem_init(unsigned long phys_base)
 
 	/* XXX cpu notifier XXX */
 
-	sparse_init();
-
 	return end_pfn;
 }
 
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index b55172118c91..0908c44d51e6 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -654,7 +654,6 @@ void __init paging_init(void)
 	 * NOTE: at this point the bootmem allocator is fully available.
 	 */
 	olpc_dt_build_devicetree();
-	sparse_init();
 }
 
 /*
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 4daa40071c9f..df2261fa4f98 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -833,8 +833,6 @@ void __init initmem_init(void)
 
 void __init paging_init(void)
 {
-	sparse_init();
-
 	/*
 	 * clear the default setting with node 0
 	 * note: don't use nodes_clear here, that is really clearing when
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 75ef7c9f9307..6a7db0fee54a 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2285,9 +2285,7 @@ static inline unsigned long next_present_section_nr(unsigned long section_nr)
 #define pfn_to_nid(pfn)		(0)
 #endif
 
-void sparse_init(void);
 #else
-#define sparse_init()	do {} while (0)
 #define sparse_index_init(_sec, _nid)  do {} while (0)
 #define sparse_vmemmap_init_nid_early(_nid) do {} while (0)
 #define sparse_vmemmap_init_nid_late(_nid) do {} while (0)
diff --git a/mm/internal.h b/mm/internal.h
index e430da900430..dc5316c68664 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -860,6 +860,12 @@ void memmap_init_range(unsigned long, int, unsigned long, unsigned long,
 		unsigned long, enum meminit_context, struct vmem_altmap *, int,
 		bool);
 
+#ifdef CONFIG_SPARSEMEM
+void sparse_init(void);
+#else
+static inline void sparse_init(void) {}
+#endif /* CONFIG_SPARSEMEM */
+
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
 /*
diff --git a/mm/mm_init.c b/mm/mm_init.c
index ffc4a0f1fee9..4cfe722da062 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1828,6 +1828,7 @@ static void __init free_area_init(void)
 	bool descending;
 
 	arch_zone_limits_init(max_zone_pfn);
+	sparse_init();
 
 	start_pfn = PHYS_PFN(memblock_start_of_DRAM());
 	descending = arch_has_descending_max_zone_pfns();
-- 
2.51.0


