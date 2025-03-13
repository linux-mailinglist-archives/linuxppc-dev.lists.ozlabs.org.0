Return-Path: <linuxppc-dev+bounces-6973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C519CA5F6C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:53:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD88w3hs1z3cVD;
	Fri, 14 Mar 2025 00:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741874000;
	cv=none; b=F7njoYQGQAWukTZr7ZdFolMJEEuLddUy0lRqLqpL10d75D9tLmwM4Wnuvvixf0ifUV7pMgWPhDyKC1kQ9d6oeGrDjHTi5jWTps8ldWrQrmUWmE0Za9r2IJ26w+nIZg7uM9BCGrwU3gMlTXMzA2WGuF5yXZOoMbfjZ6wTMcSvoeF7Tg+ZqB2L22A/JRC98Ccao7zB/5b4ftjWxS5RfFiwXd6ykzPoO9zpY1/0eyj2DoUYcgRDZFPOfb16d4Q/HKGmEI77Y9ceeLjPjTe0YCB/CiCo1QWoPl4DGibItmy7C9ccmaY1xFWcAHPU/fxNyxnAtP/f9YsPluyM6w31eFaWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741874000; c=relaxed/relaxed;
	bh=qbH/aIGqjuWpzYMXdeQ9yt+sXZufTjb/7sAQETXJZIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBwJzIO9DDUZccwKeTpzFOEQYw9dXOUFcXDp5boT/6TJfE4EhBKZHVTpKCRC5J7/s8okhJPssLFixlm1TLqv34gtSAg3qMAh0/qxih7OzqjF4+LV41D+hHkDHoUANWgZhwX83TBE02vD/Hy0jra+U/AvaLaIWBWZepoAY+GIw96SgtR+jp3OTc1+S8KBU00ZUlq0p27+WPNr6uHBvEswhcIYSuLVhyxwv/AtoKtQ5CFq6anuQt9r7RgMke83vV6pkf8bQ/COKsakwQY6GbAHnr6o+lzj3j0Vei1B5Zxn3PnK44Sr+dhFJ5J0o0GZRSR2YW9uPcYkOVRJahesY5R9dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Frzx88Jm; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Frzx88Jm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD88v52ctz3cV6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:53:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E04B25C5BBB;
	Thu, 13 Mar 2025 13:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFCCC4CEEB;
	Thu, 13 Mar 2025 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873997;
	bh=d5ex9i1SwD2XSIqwBrgYv8BKsdE8PhWueLnISDsQsvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Frzx88JmOjxClo+mmzCvR3AJRrRt2qR4ASejpye4lKQy44Scw7bpC69M46s4hmypp
	 h9b2w/8ceoKmAZX7bViDVxYW3uS3+D2o6iUQBbDjYXm62eGwQ5y/jaMZundqe1FYQr
	 7HwNqdwE8CGLUm4fVdTD0o8JkloTlvVTswzexakimV/qoncGJKzK/thzs/noiQ09pi
	 bDpfuODaKcYRLr1Xz4dkGIhwk1NbY42yMl1hbjzre2znvhOdIqODtYtGfyw9hLYIO/
	 jkwrzXpbLcSomidbqUmTPa+2Madj+OqwozjVRHewGSqbDKbDbcxf+4P3qneK1m3aBG
	 2lCELVN8c3h3g==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 13/13] arch, mm: make releasing of memory to page allocator more explicit
Date: Thu, 13 Mar 2025 15:50:03 +0200
Message-ID: <20250313135003.836600-14-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

The point where the memory is released from memblock to the buddy allocator
is hidden inside arch-specific mem_init()s and the call to
memblock_free_all() is needlessly duplicated in every artiste cure and
after introduction of arch_mm_preinit() hook, mem_init() implementation on
many architecture only contains the call to memblock_free_all().

Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
relevant architectures to make it more explicit where the free memory is
released from memblock to the buddy allocator and to reduce code
duplication in architecture specific code.

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>	# x86
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/alpha/mm/init.c         |  6 ------
 arch/arc/mm/init.c           | 11 -----------
 arch/arm/mm/init.c           | 11 -----------
 arch/arm64/mm/init.c         | 11 -----------
 arch/csky/mm/init.c          |  5 -----
 arch/hexagon/mm/init.c       | 18 ------------------
 arch/loongarch/kernel/numa.c |  5 -----
 arch/loongarch/mm/init.c     |  5 -----
 arch/m68k/mm/init.c          |  2 --
 arch/microblaze/mm/init.c    |  3 ---
 arch/mips/mm/init.c          |  5 -----
 arch/nios2/mm/init.c         |  6 ------
 arch/openrisc/mm/init.c      |  3 ---
 arch/parisc/mm/init.c        |  2 --
 arch/powerpc/mm/mem.c        |  5 -----
 arch/riscv/mm/init.c         |  5 -----
 arch/s390/mm/init.c          |  6 ------
 arch/sh/mm/init.c            |  2 --
 arch/sparc/mm/init_32.c      |  5 -----
 arch/sparc/mm/init_64.c      |  2 --
 arch/um/kernel/mem.c         |  2 --
 arch/x86/mm/init_32.c        |  3 ---
 arch/x86/mm/init_64.c        |  2 --
 arch/xtensa/mm/init.c        |  9 ---------
 include/linux/memblock.h     |  1 -
 mm/internal.h                |  3 ++-
 mm/mm_init.c                 |  5 +++++
 27 files changed, 7 insertions(+), 136 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 3ab2d2f3c917..2d491b8cdab9 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -273,12 +273,6 @@ srm_paging_stop (void)
 }
 #endif
 
-void __init
-mem_init(void)
-{
-	memblock_free_all();
-}
-
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= _PAGE_P(_PAGE_FOE | _PAGE_FOW |
 								  _PAGE_FOR),
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 90715b4a0bfa..a73cc94f806e 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -169,17 +169,6 @@ void __init arch_mm_preinit(void)
 	BUILD_BUG_ON((PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE);
 }
 
-/*
- * mem_init - initializes memory
- *
- * Frees up bootmem
- * Calculates and displays memory available/used
- */
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 #ifdef CONFIG_HIGHMEM
 int pfn_valid(unsigned long pfn)
 {
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 7222100b0631..54bdca025c9f 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -263,17 +263,6 @@ void __init arch_mm_preinit(void)
 #endif
 }
 
-/*
- * mem_init() marks the free areas in the mem_map and tells us how much
- * memory is free.  This is done after various parts of the system have
- * claimed their memory after the kernel image.
- */
-void __init mem_init(void)
-{
-	/* this will put all unused low memory onto the freelists */
-	memblock_free_all();
-}
-
 #ifdef CONFIG_STRICT_KERNEL_RWX
 struct section_perm {
 	const char *name;
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 8eff6a6eb11e..510695107233 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -411,17 +411,6 @@ void __init arch_mm_preinit(void)
 	}
 }
 
-/*
- * mem_init() marks the free areas in the mem_map and tells us how much memory
- * is free.  This is done after various parts of the system have claimed their
- * memory after the kernel image.
- */
-void __init mem_init(void)
-{
-	/* this will put all unused low memory onto the freelists */
-	memblock_free_all();
-}
-
 void free_initmem(void)
 {
 	void *lm_init_begin = lm_alias(__init_begin);
diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index 3914c2b873da..573da66b2543 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -42,11 +42,6 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 						__page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 void free_initmem(void)
 {
 	free_initmem_default(-1);
diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
index d412c2314509..34eb9d424b96 100644
--- a/arch/hexagon/mm/init.c
+++ b/arch/hexagon/mm/init.c
@@ -43,24 +43,6 @@ DEFINE_SPINLOCK(kmap_gen_lock);
 /*  checkpatch says don't init this to 0.  */
 unsigned long long kmap_generation;
 
-/*
- * mem_init - initializes memory
- *
- * Frees up bootmem
- * Fixes up more stuff for HIGHMEM
- * Calculates and displays memory available/used
- */
-void __init mem_init(void)
-{
-	/*  No idea where this is actually declared.  Seems to evade LXR.  */
-	memblock_free_all();
-
-	/*
-	 *  To-Do:  someone somewhere should wipe out the bootmem map
-	 *  after we're done?
-	 */
-}
-
 void sync_icache_dcache(pte_t pte)
 {
 	unsigned long addr;
diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 8eb489725b1a..30a72fd528c0 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -387,11 +387,6 @@ void __init paging_init(void)
 	free_area_init(zones_size);
 }
 
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 int pcibus_to_node(struct pci_bus *bus)
 {
 	return dev_to_node(&bus->dev);
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 6affa3609188..fdb7f73ad160 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -75,11 +75,6 @@ void __init paging_init(void)
 
 	free_area_init(max_zone_pfns);
 }
-
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
 #endif /* !CONFIG_NUMA */
 
 void __ref free_initmem(void)
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 8b11d0d545aa..488411af1b3f 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -121,7 +121,5 @@ static inline void init_pointer_tables(void)
 
 void __init mem_init(void)
 {
-	/* this will put all memory onto the freelists */
-	memblock_free_all();
 	init_pointer_tables();
 }
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 3e664e0efc33..65f0d1fb8a2a 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -107,9 +107,6 @@ void __init setup_memory(void)
 
 void __init mem_init(void)
 {
-	/* this will put all memory onto the freelists */
-	memblock_free_all();
-
 	mem_init_done = 1;
 }
 
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index eec38e7735dd..a673d3d68254 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -451,11 +451,6 @@ void __init arch_mm_preinit(void)
 }
 #endif /* !CONFIG_NUMA */
 
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 void free_init_pages(const char *what, unsigned long begin, unsigned long end)
 {
 	unsigned long pfn;
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index 4ba8dfa0d238..94efa3de3933 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -60,12 +60,6 @@ void __init paging_init(void)
 			(unsigned long)empty_zero_page + PAGE_SIZE);
 }
 
-void __init mem_init(void)
-{
-	/* this will put all memory onto the freelists */
-	memblock_free_all();
-}
-
 void __init mmu_init(void)
 {
 	flush_tlb_all();
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index 72c5952607ac..be1c2eb8bb94 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -196,9 +196,6 @@ void __init mem_init(void)
 	/* clear the zero-page */
 	memset((void *)empty_zero_page, 0, PAGE_SIZE);
 
-	/* this will put all low memory onto the freelists */
-	memblock_free_all();
-
 	printk("mem_init_done ...........................................\n");
 	mem_init_done = 1;
 	return;
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 4fbe354dc9b4..14270715d754 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -562,8 +562,6 @@ void __init mem_init(void)
 	BUILD_BUG_ON(TMPALIAS_MAP_START >= 0x80000000);
 #endif
 
-	memblock_free_all();
-
 #ifdef CONFIG_PA11
 	if (boot_cpu_data.cpu_type == pcxl2 || boot_cpu_data.cpu_type == pcxl) {
 		pcxl_dma_start = (unsigned long)SET_MAP_OFFSET(MAP_START);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 68efdaf14e58..d8fe11b64259 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -327,11 +327,6 @@ void __init arch_mm_preinit(void)
 #endif /* CONFIG_PPC32 */
 }
 
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 void free_initmem(void)
 {
 	ppc_md.progress = ppc_printk_progress;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9efadabf6be1..79b649f6de72 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -196,11 +196,6 @@ void __init arch_mm_preinit(void)
 	print_vm_layout();
 }
 
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 /* Limit the memory size via mem. */
 static phys_addr_t memory_limit;
 #ifdef CONFIG_XIP_KERNEL
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index c496dfa48bdc..1999b5a94170 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -165,12 +165,6 @@ void __init arch_mm_preinit(void)
 	setup_zero_pages();	/* Setup zeroed pages. */
 }
 
-void __init mem_init(void)
-{
-	/* this will put all low memory onto the freelists */
-	memblock_free_all();
-}
-
 unsigned long memory_block_size_bytes(void)
 {
 	/*
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 6d459ffba4bc..99e302eeeec1 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -330,8 +330,6 @@ unsigned int mem_init_done = 0;
 
 void __init mem_init(void)
 {
-	memblock_free_all();
-
 	/* Set this up early, so we can take care of the zero page */
 	cpu_cache_init();
 
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index e16c32c5728f..fdc93dd12c3e 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -264,11 +264,6 @@ void __init arch_mm_preinit(void)
 	taint_real_pages();
 }
 
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 void sparc_flush_page_to_ram(struct page *page)
 {
 	unsigned long vaddr = (unsigned long)page_address(page);
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 34d46adb9571..760818950464 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2505,8 +2505,6 @@ static void __init register_page_bootmem_info(void)
 }
 void __init mem_init(void)
 {
-	memblock_free_all();
-
 	/*
 	 * Must be done after boot memory is put on freelist, because here we
 	 * might set fields in deferred struct pages that have not yet been
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index cce387438e60..379f33a1babf 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -71,8 +71,6 @@ void __init arch_mm_preinit(void)
 
 void __init mem_init(void)
 {
-	/* this will put all low memory onto the freelists */
-	memblock_free_all();
 	kmalloc_ok = 1;
 }
 
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 16664c5464b5..95b2758b4e4d 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -702,9 +702,6 @@ void __init arch_mm_preinit(void)
 
 void __init mem_init(void)
 {
-	/* this will put all low memory onto the freelists */
-	memblock_free_all();
-
 	after_bootmem = 1;
 	x86_init.hyper.init_after_bootmem();
 
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index f8981e29633c..451e796427d3 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1357,8 +1357,6 @@ void __init mem_init(void)
 {
 	/* clear_bss() already clear the empty_zero_page */
 
-	/* this will put all memory onto the freelists */
-	memblock_free_all();
 	after_bootmem = 1;
 	x86_init.hyper.init_after_bootmem();
 
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index 47ecbe28263e..cc52733a0649 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -129,15 +129,6 @@ void __init zones_init(void)
 	print_vm_layout();
 }
 
-/*
- * Initialize memory pages.
- */
-
-void __init mem_init(void)
-{
-	memblock_free_all();
-}
-
 static void __init parse_memmap_one(char *p)
 {
 	char *oldp;
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index e79eb6ac516f..ef5a1ecc6e59 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -133,7 +133,6 @@ int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
 int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 
-void memblock_free_all(void);
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
 
diff --git a/mm/internal.h b/mm/internal.h
index 109ef30fee11..26e2e8cea495 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1407,7 +1407,8 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
 }
 
 extern bool mirrored_kernelcore;
-extern bool memblock_has_mirror(void);
+bool memblock_has_mirror(void);
+void memblock_free_all(void);
 
 static __always_inline void vma_set_range(struct vm_area_struct *vma,
 					  unsigned long start, unsigned long end,
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 57f762c16c02..c529a07fd055 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2679,6 +2679,10 @@ void __init __weak arch_mm_preinit(void)
 {
 }
 
+void __init __weak mem_init(void)
+{
+}
+
 /*
  * Set up kernel memory allocators
  */
@@ -2700,6 +2704,7 @@ void __init mm_core_init(void)
 	report_meminit();
 	kmsan_init_shadow();
 	stack_depot_early_init();
+	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
 	/*
-- 
2.47.2


