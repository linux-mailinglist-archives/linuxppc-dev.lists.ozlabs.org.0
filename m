Return-Path: <linuxppc-dev+bounces-15069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E838CCE4D56
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 13:47:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfJyX56y6z2yFc;
	Sun, 28 Dec 2025 23:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766926020;
	cv=none; b=SGnILBbtp2IptpBNqRvehvwAYoRbBH59KN/kTG+lISySEh/OyOj8fvF6PoHVmtH8k/AnxlR9kZoJpRud+YL8Bk7LIFD8qQLsMwsbj8TniYDeRCN8P7p4b5TSwa6OZvk5mwk87xCcrgaAV4Fo8Y+PzFg+QMP/dafdLO0e/N6W4NzM+W5P3G1RkSE4fBxNUjDumP9ZgcNlVQ/4nFplISpPOvBhudcENIxCPB3SM32Hy+oyIRwbTE8JQ7wydVgZ1PvPBkGoQLOzXKuCNlC0S1K9yl5OsF548vEebsUKTAPJ8PSQWAiQR60R9ENeME2ie8OI0NyKdJtxiUumTO5cmVPijA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766926020; c=relaxed/relaxed;
	bh=8iKttVh1bMySv1OkpwQHhe3T2y4VyvzqMWnhRrdNZDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJGiwfeIcKynihZnxsZbX86dedIl6fVHeYsQA0d6uhhWRIS+QJ4YmbBOIpDDpAfZgJnnFuL6DLSGLsWVQpQ7N9wb5qbOoQhRdgA30Z/comyYaECZYtVQQia9CC7YWdkr3OmSidD14ZIMfT4XFnMksahfSZMbnsvLcnRjkp3BTU2uIW3FSsq4YsH3tgT+4XfxPnffqq8mZ8GN3d2+zM3PVfnsrIMotnlo4vszejfSk7x5/rexgIS+2obKBvwgoziRkEzkFKOmjr1hOjV6cyFDJZFd1hnJdOgB66gmcFmuoL0pGuOKrjYjxf3khI4/rXWLx+Ai2SZhNF5G/ZWzxhvtXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwEIoXJd; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwEIoXJd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfJyW6gtmz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 23:46:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51C52436EB;
	Sun, 28 Dec 2025 12:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4D2C16AAE;
	Sun, 28 Dec 2025 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925988;
	bh=7E0qVjEGwP0IKHJeUAaXMmWVvlYzyxOQxwuX/DFLLew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OwEIoXJdG98YiePXRGSvSaM/guhCtt9DqYoehJs1kmgrNdayLYZb98bmE2YCUEnZo
	 Qmwm9yA77o0Hd59obimn44eoWTie7X51oQoLGl9XRfkPcj8PWgUK6EZkY1JRvNoyfI
	 +qP6lNoHzCEIxlRl0twSJ8HMk3S0SF2AkD+uls/HtvaTB/qHSSGlgUNLlpAyVfPx5D
	 TBncDmleiJGcsoaqlhl73ePx82LMo88bZBVoG0HHFv4tFzDX/pLwXsxnMSA+bo4Y4r
	 P+xDdd53+vztiArILfckiQ6J9lZqmoFoTR9u4HTUeE5UzCrkjOzbejvgGi/1OTwmTA
	 elVGJMvE42DMg==
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
Subject: [PATCH 26/28] mm, arch: consolidate hugetlb CMA reservation
Date: Sun, 28 Dec 2025 14:39:56 +0200
Message-ID: <20251228124001.3624742-27-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251228124001.3624742-1-rppt@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Every architecture that supports hugetlb_cma command line parameter
reserves CMA areas for hugetlb during setup_arch().

This obfuscates the ordering of hugetlb CMA initialization with resepect to
the rest initalization of the core MM.

Introduce arch_hugetlb_cma_order() callback to allow arhictectures report
the desired order-per-bit of CMA areas and provive a week implementation of
arch_hugetlb_cma_order() for architectures that don't support hugetlb with
CMA.

Use this callback in hugetlb_cma_reserve() instead if passing the order as
parameter and call hugetlb_cma_reserve() from mm_core_init rather than have
it spead over arcihtecture specific code.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../driver-api/cxl/linux/early-boot.rst       |  2 +-
 arch/arm64/include/asm/hugetlb.h              |  2 --
 arch/arm64/mm/hugetlbpage.c                   | 10 +++-------
 arch/arm64/mm/init.c                          |  9 ---------
 arch/powerpc/include/asm/hugetlb.h            |  5 -----
 arch/powerpc/kernel/setup-common.c            |  1 -
 arch/powerpc/mm/hugetlbpage.c                 | 11 ++++-------
 arch/riscv/mm/hugetlbpage.c                   |  8 ++++++++
 arch/riscv/mm/init.c                          |  2 --
 arch/s390/kernel/setup.c                      |  2 --
 arch/s390/mm/hugetlbpage.c                    |  8 ++++++++
 arch/x86/kernel/setup.c                       |  4 ----
 arch/x86/mm/hugetlbpage.c                     |  8 ++++++++
 include/linux/hugetlb.h                       |  6 ++++--
 mm/hugetlb_cma.c                              | 19 ++++++++++++++-----
 mm/mm_init.c                                  |  2 ++
 16 files changed, 52 insertions(+), 47 deletions(-)

diff --git a/Documentation/driver-api/cxl/linux/early-boot.rst b/Documentation/driver-api/cxl/linux/early-boot.rst
index a7fc6fc85fbe..414481f33819 100644
--- a/Documentation/driver-api/cxl/linux/early-boot.rst
+++ b/Documentation/driver-api/cxl/linux/early-boot.rst
@@ -125,7 +125,7 @@ The contiguous memory allocator (CMA) enables reservation of contiguous memory
 regions on NUMA nodes during early boot.  However, CMA cannot reserve memory
 on NUMA nodes that are not online during early boot. ::
 
-  void __init hugetlb_cma_reserve(int order) {
+  void __init hugetlb_cma_reserve(void) {
     if (!node_online(nid))
       /* do not allow reservations */
   }
diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 44c1f757bfcf..e6f8ff3cc630 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -56,8 +56,6 @@ extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 #define __HAVE_ARCH_HUGE_PTEP_GET
 extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 
-void __init arm64_hugetlb_cma_reserve(void);
-
 #define huge_ptep_modify_prot_start huge_ptep_modify_prot_start
 extern pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 1d90a7e75333..f8dd58ab67a8 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -36,16 +36,12 @@
  * huge pages could still be served from those areas.
  */
 #ifdef CONFIG_CMA
-void __init arm64_hugetlb_cma_reserve(void)
+unsigned int arch_hugetlb_cma_order(void)
 {
-	int order;
-
 	if (pud_sect_supported())
-		order = PUD_SHIFT - PAGE_SHIFT;
-	else
-		order = CONT_PMD_SHIFT - PAGE_SHIFT;
+		return PUD_SHIFT - PAGE_SHIFT;
 
-	hugetlb_cma_reserve(order);
+	return CONT_PMD_SHIFT - PAGE_SHIFT;
 }
 #endif /* CONFIG_CMA */
 
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9d271aff7652..96711b8578fd 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -311,15 +311,6 @@ void __init bootmem_init(void)
 
 	arch_numa_init();
 
-	/*
-	 * must be done after arch_numa_init() which calls numa_init() to
-	 * initialize node_online_map that gets used in hugetlb_cma_reserve()
-	 * while allocating required CMA size across online nodes.
-	 */
-#if defined(CONFIG_HUGETLB_PAGE) && defined(CONFIG_CMA)
-	arm64_hugetlb_cma_reserve();
-#endif
-
 	kvm_hyp_reserve();
 	dma_limits_init();
 
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 86326587e58d..6d32a4299445 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -68,7 +68,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty);
 
-void gigantic_hugetlb_cma_reserve(void) __init;
 #include <asm-generic/hugetlb.h>
 
 #else /* ! CONFIG_HUGETLB_PAGE */
@@ -77,10 +76,6 @@ static inline void flush_hugetlb_page(struct vm_area_struct *vma,
 {
 }
 
-static inline void __init gigantic_hugetlb_cma_reserve(void)
-{
-}
-
 static inline void __init hugetlbpage_init_defaultsize(void)
 {
 }
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index c8c42b419742..cb5b73adc250 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -1003,7 +1003,6 @@ void __init setup_arch(char **cmdline_p)
 	fadump_cma_init();
 	kdump_cma_reserve();
 	kvm_cma_reserve();
-	gigantic_hugetlb_cma_reserve();
 
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index d3c1b749dcfc..558fafb82b8a 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -200,18 +200,15 @@ static int __init hugetlbpage_init(void)
 
 arch_initcall(hugetlbpage_init);
 
-void __init gigantic_hugetlb_cma_reserve(void)
+unsigned int __init arch_hugetlb_cma_order(void)
 {
-	unsigned long order = 0;
-
 	if (radix_enabled())
-		order = PUD_SHIFT - PAGE_SHIFT;
+		return PUD_SHIFT - PAGE_SHIFT;
 	else if (!firmware_has_feature(FW_FEATURE_LPAR) && mmu_psize_defs[MMU_PAGE_16G].shift)
 		/*
 		 * For pseries we do use ibm,expected#pages for reserving 16G pages.
 		 */
-		order = mmu_psize_to_shift(MMU_PAGE_16G) - PAGE_SHIFT;
+		return mmu_psize_to_shift(MMU_PAGE_16G) - PAGE_SHIFT;
 
-	if (order)
-		hugetlb_cma_reserve(order);
+	return 0;
 }
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 375dd96bb4a0..a6d217112cf4 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -447,3 +447,11 @@ static __init int gigantic_pages_init(void)
 }
 arch_initcall(gigantic_pages_init);
 #endif
+
+unsigned int __init arch_hugetlb_cma_order(void)
+{
+	if (IS_ENABLED(CONFIG_64BIT))
+		return PUD_SHIFT - PAGE_SHIFT;
+
+	return 0;
+}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 11ac4041afc0..848efeb9e163 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -311,8 +311,6 @@ static void __init setup_bootmem(void)
 		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 
 	dma_contiguous_reserve(dma32_phys_limit);
-	if (IS_ENABLED(CONFIG_64BIT))
-		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
 }
 
 #ifdef CONFIG_RELOCATABLE
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index c1fe0b53c5ac..b60284328fe3 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -963,8 +963,6 @@ void __init setup_arch(char **cmdline_p)
 	setup_uv();
 	dma_contiguous_reserve(ident_map_size);
 	vmcp_cma_reserve();
-	if (cpu_has_edat2())
-		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
 
 	reserve_crashkernel();
 #ifdef CONFIG_CRASH_DUMP
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index d42e61c7594e..d93417d1e53c 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -255,3 +255,11 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 	else
 		return false;
 }
+
+unsigned int __init arch_hugetlb_cma_order(void)
+{
+	if (cpu_has_edat2())
+		return PUD_SHIFT - PAGE_SHIFT;
+
+	return 0;
+}
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index e2318fa9b1bb..e1efe3975aa0 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1189,10 +1189,6 @@ void __init setup_arch(char **cmdline_p)
 	initmem_init();
 	dma_contiguous_reserve(max_pfn_mapped << PAGE_SHIFT);
 
-	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
-		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-	}
-
 	/*
 	 * Reserve memory for crash kernel after SRAT is parsed so that it
 	 * won't consume hotpluggable memory.
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 58f7f2bd535d..3b26621c9128 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -42,3 +42,11 @@ static __init int gigantic_pages_init(void)
 arch_initcall(gigantic_pages_init);
 #endif
 #endif
+
+unsigned int __init arch_hugetlb_cma_order(void)
+{
+	if (boot_cpu_has(X86_FEATURE_GBPAGES))
+		return PUD_SHIFT - PAGE_SHIFT;
+
+	return 0;
+}
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 019a1c5281e4..08fc332e88a7 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -279,6 +279,8 @@ void fixup_hugetlb_reservations(struct vm_area_struct *vma);
 void hugetlb_split(struct vm_area_struct *vma, unsigned long addr);
 int hugetlb_vma_lock_alloc(struct vm_area_struct *vma);
 
+unsigned int arch_hugetlb_cma_order(void);
+
 #else /* !CONFIG_HUGETLB_PAGE */
 
 static inline void hugetlb_dup_vma_private(struct vm_area_struct *vma)
@@ -1316,9 +1318,9 @@ static inline spinlock_t *huge_pte_lock(struct hstate *h,
 }
 
 #if defined(CONFIG_HUGETLB_PAGE) && defined(CONFIG_CMA)
-extern void __init hugetlb_cma_reserve(int order);
+extern void __init hugetlb_cma_reserve(void);
 #else
-static inline __init void hugetlb_cma_reserve(int order)
+static inline __init void hugetlb_cma_reserve(void)
 {
 }
 #endif
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index e8e4dc7182d5..b1eb5998282c 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -134,12 +134,24 @@ static int __init cmdline_parse_hugetlb_cma_only(char *p)
 
 early_param("hugetlb_cma_only", cmdline_parse_hugetlb_cma_only);
 
-void __init hugetlb_cma_reserve(int order)
+unsigned int __weak arch_hugetlb_cma_order(void)
 {
-	unsigned long size, reserved, per_node;
+	return 0;
+}
+
+void __init hugetlb_cma_reserve(void)
+{
+	unsigned long size, reserved, per_node, order;
 	bool node_specific_cma_alloc = false;
 	int nid;
 
+	if (!hugetlb_cma_size)
+		return;
+
+	order = arch_hugetlb_cma_order();
+	if (!order)
+		return;
+
 	/*
 	 * HugeTLB CMA reservation is required for gigantic
 	 * huge pages which could not be allocated via the
@@ -149,9 +161,6 @@ void __init hugetlb_cma_reserve(int order)
 	VM_WARN_ON(order <= MAX_PAGE_ORDER);
 	cma_reserve_called = true;
 
-	if (!hugetlb_cma_size)
-		return;
-
 	hugetlb_bootmem_set_nodes();
 
 	for (nid = 0; nid < MAX_NUMNODES; nid++) {
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 027d53073393..11491e455d17 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2701,6 +2701,8 @@ void __init mm_core_init_early(void)
 void __init mm_core_init(void)
 {
 	arch_mm_preinit();
+
+	hugetlb_cma_reserve();
 	hugetlb_bootmem_alloc();
 
 	free_area_init();
-- 
2.51.0


