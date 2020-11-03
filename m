Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5462A4B80
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 17:29:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQZxj2xLJzDqkc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 03:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=l2CbnDHD; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQZmV3SLrzDqjZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 03:21:46 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A573320674;
 Tue,  3 Nov 2020 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604420503;
 bh=QXOG96GUVeNJv53IljzHpitgPTZquMw49hB7itvNgSc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l2CbnDHD9Dqfg1iumjO8sJigvz4oAzlAZmPperbO0+Mj6IPzdFmq/pgDYT1z/IG9C
 al8wvT+e+Ofprm9rfdNJbEljyS2UWa2y+cudtsxkY90rSnVhaLwQ+SNxXHfpXx+e4E
 uU/tn95BvXRZiDEbmXiSf0AI8ayQmtN5bAjx809Y=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 3/4] arch,
 mm: restore dependency of __kernel_map_pages() of DEBUG_PAGEALLOC
Date: Tue,  3 Nov 2020 18:20:56 +0200
Message-Id: <20201103162057.22916-4-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103162057.22916-1-rppt@kernel.org>
References: <20201103162057.22916-1-rppt@kernel.org>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The design of DEBUG_PAGEALLOC presumes that __kernel_map_pages() must never
fail. With this assumption is wouldn't be safe to allow general usage of
this function.

Moreover, some architectures that implement __kernel_map_pages() have this
function guarded by #ifdef DEBUG_PAGEALLOC and some refuse to map/unmap
pages when page allocation debugging is disabled at runtime.

As all the users of __kernel_map_pages() were converted to use
debug_pagealloc_map_pages() it is safe to make it available only when
DEBUG_PAGEALLOC is set.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/Kconfig                     |  3 +++
 arch/arm64/Kconfig               |  4 +---
 arch/arm64/mm/pageattr.c         |  8 ++++++--
 arch/powerpc/Kconfig             |  5 +----
 arch/riscv/Kconfig               |  4 +---
 arch/riscv/include/asm/pgtable.h |  2 --
 arch/riscv/mm/pageattr.c         |  2 ++
 arch/s390/Kconfig                |  4 +---
 arch/sparc/Kconfig               |  4 +---
 arch/x86/Kconfig                 |  4 +---
 arch/x86/mm/pat/set_memory.c     |  2 ++
 include/linux/mm.h               | 10 +++++++---
 12 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..56d4752b6db6 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1028,6 +1028,9 @@ config HAVE_STATIC_CALL_INLINE
 	bool
 	depends on HAVE_STATIC_CALL
 
+config ARCH_SUPPORTS_DEBUG_PAGEALLOC
+	bool
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1d466addb078..a932810cfd90 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -71,6 +71,7 @@ config ARM64
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
+	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
 	select ARCH_SUPPORTS_ATOMIC_RMW
@@ -1025,9 +1026,6 @@ config HOLES_IN_ZONE
 
 source "kernel/Kconfig.hz"
 
-config ARCH_SUPPORTS_DEBUG_PAGEALLOC
-	def_bool y
-
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 1b94f5b82654..439325532be1 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -155,7 +155,7 @@ int set_direct_map_invalid_noflush(struct page *page)
 		.clear_mask = __pgprot(PTE_VALID),
 	};
 
-	if (!rodata_full)
+	if (!debug_pagealloc_enabled() && !rodata_full)
 		return 0;
 
 	return apply_to_page_range(&init_mm,
@@ -170,7 +170,7 @@ int set_direct_map_default_noflush(struct page *page)
 		.clear_mask = __pgprot(PTE_RDONLY),
 	};
 
-	if (!rodata_full)
+	if (!debug_pagealloc_enabled() && !rodata_full)
 		return 0;
 
 	return apply_to_page_range(&init_mm,
@@ -178,6 +178,7 @@ int set_direct_map_default_noflush(struct page *page)
 				   PAGE_SIZE, change_page_range, &data);
 }
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	if (!debug_pagealloc_enabled() && !rodata_full)
@@ -186,6 +187,7 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
 	set_memory_valid((unsigned long)page_address(page), numpages, enable);
 }
 
+#ifdef CONFIG_HIBERNATION
 /*
  * This function is used to determine if a linear map page has been marked as
  * not-valid. Walk the page table and check the PTE_VALID bit. This is based
@@ -232,3 +234,5 @@ bool kernel_page_present(struct page *page)
 	ptep = pte_offset_kernel(pmdp, addr);
 	return pte_valid(READ_ONCE(*ptep));
 }
+#endif /* CONFIG_HIBERNATION */
+#endif /* CONFIG_DEBUG_PAGEALLOC */
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..ad8a83f3ddca 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -146,6 +146,7 @@ config PPC
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC32 || PPC_BOOK3S_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
@@ -355,10 +356,6 @@ config PPC_OF_PLATFORM_PCI
 	depends on PCI
 	depends on PPC64 # not supported on 32 bits yet
 
-config ARCH_SUPPORTS_DEBUG_PAGEALLOC
-	depends on PPC32 || PPC_BOOK3S_64
-	def_bool y
-
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 44377fd7860e..9283c6f9ae2a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
@@ -153,9 +154,6 @@ config ARCH_SELECT_MEMORY_MODEL
 config ARCH_WANT_GENERAL_HUGETLB
 	def_bool y
 
-config ARCH_SUPPORTS_DEBUG_PAGEALLOC
-	def_bool y
-
 config SYS_SUPPORTS_HUGETLBFS
 	depends on MMU
 	def_bool y
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 183f1f4b2ae6..41a72861987c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -461,8 +461,6 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define VMALLOC_START		0
 #define VMALLOC_END		TASK_SIZE
 
-static inline void __kernel_map_pages(struct page *page, int numpages, int enable) {}
-
 #endif /* !CONFIG_MMU */
 
 #define kern_addr_valid(addr)   (1) /* FIXME */
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 19fecb362d81..321b09d2e2ea 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -184,6 +184,7 @@ int set_direct_map_default_noflush(struct page *page)
 	return ret;
 }
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	if (!debug_pagealloc_enabled())
@@ -196,3 +197,4 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
 		__set_memory((unsigned long)page_address(page), numpages,
 			     __pgprot(0), __pgprot(_PAGE_PRESENT));
 }
+#endif
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 4a2a12be04c9..991a850a6c0b 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -35,9 +35,6 @@ config GENERIC_LOCKBREAK
 config PGSTE
 	def_bool y if KVM
 
-config ARCH_SUPPORTS_DEBUG_PAGEALLOC
-	def_bool y
-
 config AUDIT_ARCH
 	def_bool y
 
@@ -106,6 +103,7 @@ config S390
 	select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index a6ca135442f9..2c729b8d097a 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -88,6 +88,7 @@ config SPARC64
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_ARCH_AUDITSYSCALL
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select HAVE_NMI
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select ARCH_USE_QUEUED_RWLOCKS
@@ -148,9 +149,6 @@ config GENERIC_ISA_DMA
 	bool
 	default y if SPARC32
 
-config ARCH_SUPPORTS_DEBUG_PAGEALLOC
-	def_bool y if SPARC64
-
 config PGTABLE_LEVELS
 	default 4 if 64BIT
 	default 3
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f6946b81f74a..0db3fb1da70c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -91,6 +91,7 @@ config X86
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ACPI
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
@@ -329,9 +330,6 @@ config ZONE_DMA32
 config AUDIT_ARCH
 	def_bool y if X86_64
 
-config ARCH_SUPPORTS_DEBUG_PAGEALLOC
-	def_bool y
-
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 40baa90e74f4..bc9be96b777f 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2194,6 +2194,7 @@ int set_direct_map_default_noflush(struct page *page)
 	return __set_pages_p(page, 1);
 }
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	if (PageHighMem(page))
@@ -2239,6 +2240,7 @@ bool kernel_page_present(struct page *page)
 	return (pte_val(*pte) & _PAGE_PRESENT);
 }
 #endif /* CONFIG_HIBERNATION */
+#endif /* CONFIG_DEBUG_PAGEALLOC */
 
 int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long address,
 				   unsigned numpages, unsigned long page_flags)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 14e397f3752c..ab0ef6bd351d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2924,7 +2924,11 @@ static inline bool debug_pagealloc_enabled_static(void)
 	return static_branch_unlikely(&_debug_pagealloc_enabled);
 }
 
-#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
+#ifdef CONFIG_DEBUG_PAGEALLOC
+/*
+ * To support DEBUG_PAGEALLOC architecture must ensure that
+ * __kernel_map_pages() never fails
+ */
 extern void __kernel_map_pages(struct page *page, int numpages, int enable);
 
 static inline void debug_pagealloc_map_pages(struct page *page,
@@ -2937,13 +2941,13 @@ static inline void debug_pagealloc_map_pages(struct page *page,
 #ifdef CONFIG_HIBERNATION
 extern bool kernel_page_present(struct page *page);
 #endif	/* CONFIG_HIBERNATION */
-#else	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
+#else	/* CONFIG_DEBUG_PAGEALLOC */
 static inline void debug_pagealloc_map_pages(struct page *page,
 					     int numpages, int enable) {}
 #ifdef CONFIG_HIBERNATION
 static inline bool kernel_page_present(struct page *page) { return true; }
 #endif	/* CONFIG_HIBERNATION */
-#endif	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
+#endif	/* CONFIG_DEBUG_PAGEALLOC */
 
 #ifdef __HAVE_ARCH_GATE_AREA
 extern struct vm_area_struct *get_gate_vma(struct mm_struct *mm);
-- 
2.28.0

