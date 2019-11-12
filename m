Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA8F87AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 06:04:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bwdp5w27zF3SR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 16:04:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47BwbN2xdyzF3BW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 16:02:23 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB79831B;
 Mon, 11 Nov 2019 21:02:20 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 067FC3F52E;
 Mon, 11 Nov 2019 21:01:58 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V9 RESEND] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 12 Nov 2019 10:32:33 +0530
Message-Id: <1573534953-1342-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds tests which will validate architecture page table helpers and
other accessors in their compliance with expected generic MM semantics.
This will help various architectures in validating changes to existing
page table helpers or addition of new ones.

This test covers basic page table entry transformations including but not
limited to old, young, dirty, clean, write, write protect etc at various
level along with populating intermediate entries with next page table page
and validating them.

Test page table pages are allocated from system memory with required size
and alignments. The mapped pfns at page table levels are derived from a
real pfn representing a valid kernel text symbol. This test gets called
right after page_alloc_init_late().

This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
arm64. Going forward, other architectures too can enable this after fixing
build or runtime problems (if any) with their page table helpers.

Folks interested in making sure that a given platform's page table helpers
conform to expected generic MM semantics should enable the above config
which will just trigger this test during boot. Any non conformity here will
be reported as an warning which would need to be fixed. This test will help
catch any changes to the agreed upon semantics expected from generic MM and
enable platforms to accommodate it thereafter.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Steven Price <Steven.Price@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Sri Krishna chowdary <schowdary@nvidia.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org

Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>		#PPC32
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This adds a test validation for architecture exported page table helpers.
Patch adds basic transformation tests at various levels of the page table.

This test was originally suggested by Catalin during arm64 THP migration
RFC discussion earlier. Going forward it can include more specific tests
with respect to various generic MM functions like THP, HugeTLB etc and
platform specific tests.

https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/

Needs to be applied on linux-next (next-20191108).

Changes in V9:

- Changed feature support enumeration for powerpc platforms per Christophe
- Changed config wrapper for basic_[pmd|pud]_tests() to enable ARC platform
- Enabled the test on ARC platform

Changes in V8: (https://patchwork.kernel.org/project/linux-mm/list/?series=194297)

- Enabled ARCH_HAS_DEBUG_VM_PGTABLE on PPC32 platform per Christophe
- Updated feature documentation as DEBUG_VM_PGTABLE is now enabled on PPC32 platform
- Moved ARCH_HAS_DEBUG_VM_PGTABLE earlier to indent it with DEBUG_VM per Christophe
- Added an information message in debug_vm_pgtable() per Christophe
- Dropped random_vaddr boundary condition checks per Christophe and Qian
- Replaced virt_addr_valid() check with pfn_valid() check in debug_vm_pgtable()
- Slightly changed pr_fmt(fmt) information

Changes in V7: (https://patchwork.kernel.org/project/linux-mm/list/?series=193051)

- Memory allocation and free routines for mapped pages have been droped
- Mapped pfns are derived from standard kernel text symbol per Matthew
- Moved debug_vm_pgtaable() after page_alloc_init_late() per Michal and Qian 
- Updated the commit message per Michal
- Updated W=1 GCC warning problem on x86 per Qian Cai
- Addition of new alloc_contig_pages() helper has been submitted separately

Changes in V6: (https://patchwork.kernel.org/project/linux-mm/list/?series=187589)

- Moved alloc_gigantic_page_order() into mm/page_alloc.c per Michal
- Moved alloc_gigantic_page_order() within CONFIG_CONTIG_ALLOC in the test
- Folded Andrew's include/asm-generic/pgtable.h fix into the test patch 2/2

Changes in V5: (https://patchwork.kernel.org/project/linux-mm/list/?series=185991)

- Redefined and moved X86 mm_p4d_folded() into a different header per Kirill/Ingo
- Updated the config option comment per Ingo and dropped 'kernel module' reference
- Updated the commit message and dropped 'kernel module' reference
- Changed DEBUG_ARCH_PGTABLE_TEST into DEBUG_VM_PGTABLE per Ingo
- Moved config option from mm/Kconfig.debug into lib/Kconfig.debug
- Renamed core test function arch_pgtable_tests() as debug_vm_pgtable()
- Renamed mm/arch_pgtable_test.c as mm/debug_vm_pgtable.c
- debug_vm_pgtable() gets called from kernel_init_freeable() after init_mm_internals()
- Added an entry in Documentation/features/debug/ per Ingo
- Enabled the test on arm64 and x86 platforms for now

Changes in V4: (https://patchwork.kernel.org/project/linux-mm/list/?series=183465)

- Disable DEBUG_ARCH_PGTABLE_TEST for ARM and IA64 platforms

Changes in V3: (https://lore.kernel.org/patchwork/project/lkml/list/?series=411216)

- Changed test trigger from module format into late_initcall()
- Marked all functions with __init to be freed after completion
- Changed all __PGTABLE_PXX_FOLDED checks as mm_pxx_folded()
- Folded in PPC32 fixes from Christophe

Changes in V2:

https://lore.kernel.org/linux-mm/1568268173-31302-1-git-send-email-anshuman.khandual@arm.com/T/#t

- Fixed small typo error in MODULE_DESCRIPTION()
- Fixed m64k build problems for lvalue concerns in pmd_xxx_tests()
- Fixed dynamic page table level folding problems on x86 as per Kirril
- Fixed second pointers during pxx_populate_tests() per Kirill and Gerald
- Allocate and free pte table with pte_alloc_one/pte_free per Kirill
- Modified pxx_clear_tests() to accommodate s390 lower 12 bits situation
- Changed RANDOM_NZVALUE value from 0xbe to 0xff
- Changed allocation, usage, free sequence for saved_ptep
- Renamed VMA_FLAGS as VMFLAGS
- Implemented a new method for random vaddr generation
- Implemented some other cleanups
- Dropped extern reference to mm_alloc()
- Created and exported new alloc_gigantic_page_order()
- Dropped the custom allocator and used new alloc_gigantic_page_order()

Changes in V1:

https://lore.kernel.org/linux-mm/1567497706-8649-1-git-send-email-anshuman.khandual@arm.com/

- Added fallback mechanism for PMD aligned memory allocation failure

Changes in RFC V2:

https://lore.kernel.org/linux-mm/1565335998-22553-1-git-send-email-anshuman.khandual@arm.com/T/#u

- Moved test module and it's config from lib/ to mm/
- Renamed config TEST_ARCH_PGTABLE as DEBUG_ARCH_PGTABLE_TEST
- Renamed file from test_arch_pgtable.c to arch_pgtable_test.c
- Added relevant MODULE_DESCRIPTION() and MODULE_AUTHOR() details
- Dropped loadable module config option
- Basic tests now use memory blocks with required size and alignment
- PUD aligned memory block gets allocated with alloc_contig_range()
- If PUD aligned memory could not be allocated it falls back on PMD aligned
  memory block from page allocator and pud_* tests are skipped
- Clear and populate tests now operate on real in memory page table entries
- Dummy mm_struct gets allocated with mm_alloc()
- Dummy page table entries get allocated with [pud|pmd|pte]_alloc_[map]()
- Simplified [p4d|pgd]_basic_tests(), now has random values in the entries

Original RFC V1:

https://lore.kernel.org/linux-mm/1564037723-26676-1-git-send-email-anshuman.khandual@arm.com/

 .../debug/debug-vm-pgtable/arch-support.txt        |  35 ++
 arch/arc/Kconfig                                   |   1 +
 arch/arm64/Kconfig                                 |   1 +
 arch/powerpc/Kconfig                               |   1 +
 arch/x86/Kconfig                                   |   1 +
 arch/x86/include/asm/pgtable_64.h                  |   6 +
 include/asm-generic/pgtable.h                      |   6 +
 init/main.c                                        |   1 +
 lib/Kconfig.debug                                  |  21 ++
 mm/Makefile                                        |   1 +
 mm/debug_vm_pgtable.c                              | 388 +++++++++++++++++++++
 11 files changed, 462 insertions(+)
 create mode 100644 Documentation/features/debug/debug-vm-pgtable/arch-support.txt
 create mode 100644 mm/debug_vm_pgtable.c

diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
new file mode 100644
index 0000000..f3f8111
--- /dev/null
+++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
@@ -0,0 +1,35 @@
+#
+# Feature name:          debug-vm-pgtable
+#         Kconfig:       ARCH_HAS_DEBUG_VM_PGTABLE
+#         description:   arch supports pgtable tests for semantics compliance
+#
+    -----------------------
+    |         arch |status|
+    -----------------------
+    |       alpha: | TODO |
+    |         arc: |  ok  |
+    |         arm: | TODO |
+    |       arm64: |  ok  |
+    |         c6x: | TODO |
+    |        csky: | TODO |
+    |       h8300: | TODO |
+    |     hexagon: | TODO |
+    |        ia64: | TODO |
+    |        m68k: | TODO |
+    |  microblaze: | TODO |
+    |        mips: | TODO |
+    |       nds32: | TODO |
+    |       nios2: | TODO |
+    |    openrisc: | TODO |
+    |      parisc: | TODO |
+    |  powerpc/32: |  ok  |
+    |  powerpc/64: | TODO |
+    |       riscv: | TODO |
+    |        s390: | TODO |
+    |          sh: | TODO |
+    |       sparc: | TODO |
+    |          um: | TODO |
+    |   unicore32: | TODO |
+    |         x86: |  ok  |
+    |      xtensa: | TODO |
+    -----------------------
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index d266ae6..911e325 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -6,6 +6,7 @@
 config ARC
 	def_bool y
 	select ARC_TIMERS
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SETUP_DMA_OPS
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 50df79d..ade454e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -11,6 +11,7 @@ config ARM64
 	select ACPI_PPTT if ACPI
 	select ARCH_CLOCKSOURCE_DATA
 	select ARCH_HAS_DEBUG_VIRTUAL
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c4a0fc..27c5aa4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -120,6 +120,7 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_HAS_DEBUG_VIRTUAL
+	select ARCH_HAS_DEBUG_VM_PGTABLE if PPC32
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2329f9e..2c8d1f9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -61,6 +61,7 @@ config X86
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_DEBUG_VIRTUAL
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FAST_MULTIPLIER
diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index 0b6c4042..fb0e76d 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -53,6 +53,12 @@ static inline void sync_initial_page_table(void) { }
 
 struct mm_struct;
 
+#define mm_p4d_folded mm_p4d_folded
+static inline bool mm_p4d_folded(struct mm_struct *mm)
+{
+	return !pgtable_l5_enabled();
+}
+
 void set_pte_vaddr_p4d(p4d_t *p4d_page, unsigned long vaddr, pte_t new_pte);
 void set_pte_vaddr_pud(pud_t *pud_page, unsigned long vaddr, pte_t new_pte);
 
diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index b5d20e0..70fa147 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -1168,6 +1168,12 @@ static inline bool arch_has_pfn_modify_check(void)
 # define PAGE_KERNEL_EXEC PAGE_KERNEL
 #endif
 
+#ifdef CONFIG_DEBUG_VM_PGTABLE
+extern void debug_vm_pgtable(void);
+#else
+static inline void debug_vm_pgtable(void) { }
+#endif
+
 #endif /* !__ASSEMBLY__ */
 
 #ifndef io_remap_pfn_range
diff --git a/init/main.c b/init/main.c
index 91f6ebb..af8379e 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1185,6 +1185,7 @@ static noinline void __init kernel_init_freeable(void)
 	sched_init_smp();
 
 	page_alloc_init_late();
+	debug_vm_pgtable();
 	/* Initialize page ext after all struct pages are initialized. */
 	page_ext_init();
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 63db31b..91f39d6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -664,6 +664,12 @@ config SCHED_STACK_END_CHECK
 	  data corruption or a sporadic crash at a later stage once the region
 	  is examined. The runtime overhead introduced is minimal.
 
+config ARCH_HAS_DEBUG_VM_PGTABLE
+	bool
+	help
+	  An architecture should select this when it can successfully
+	  build and run DEBUG_VM_PGTABLE.
+
 config DEBUG_VM
 	bool "Debug VM"
 	depends on DEBUG_KERNEL
@@ -699,6 +705,21 @@ config DEBUG_VM_PGFLAGS
 
 	  If unsure, say N.
 
+config DEBUG_VM_PGTABLE
+	bool "Debug arch page table for semantics compliance"
+	depends on MMU
+	depends on DEBUG_VM
+	depends on ARCH_HAS_DEBUG_VM_PGTABLE
+	help
+	  This option provides a debug method which can be used to test
+	  architecture page table helper functions on various platforms in
+	  verifying if they comply with expected generic MM semantics. This
+	  will help architecture code in making sure that any changes or
+	  new additions of these helpers still conform to expected
+	  semantics of the generic MM.
+
+	  If unsure, say N.
+
 config ARCH_HAS_DEBUG_VIRTUAL
 	bool
 
diff --git a/mm/Makefile b/mm/Makefile
index 41e6aa4..79a0c1f 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_HWPOISON_INJECT) += hwpoison-inject.o
 obj-$(CONFIG_DEBUG_KMEMLEAK) += kmemleak.o
 obj-$(CONFIG_DEBUG_KMEMLEAK_TEST) += kmemleak-test.o
 obj-$(CONFIG_DEBUG_RODATA_TEST) += rodata_test.o
+obj-$(CONFIG_DEBUG_VM_PGTABLE) += debug_vm_pgtable.o
 obj-$(CONFIG_PAGE_OWNER) += page_owner.o
 obj-$(CONFIG_CLEANCACHE) += cleancache.o
 obj-$(CONFIG_MEMORY_ISOLATION) += page_isolation.o
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
new file mode 100644
index 0000000..99ebc7c
--- /dev/null
+++ b/mm/debug_vm_pgtable.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This kernel test validates architecture page table helpers and
+ * accessors and helps in verifying their continued compliance with
+ * expected generic MM semantics.
+ *
+ * Copyright (C) 2019 ARM Ltd.
+ *
+ * Author: Anshuman Khandual <anshuman.khandual@arm.com>
+ */
+#define pr_fmt(fmt) "debug_vm_pgtable: %s: " fmt, __func__
+
+#include <linux/gfp.h>
+#include <linux/highmem.h>
+#include <linux/hugetlb.h>
+#include <linux/kernel.h>
+#include <linux/kconfig.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/mm_types.h>
+#include <linux/module.h>
+#include <linux/pfn_t.h>
+#include <linux/printk.h>
+#include <linux/random.h>
+#include <linux/spinlock.h>
+#include <linux/swap.h>
+#include <linux/swapops.h>
+#include <linux/start_kernel.h>
+#include <linux/sched/mm.h>
+#include <asm/pgalloc.h>
+#include <asm/pgtable.h>
+
+/*
+ * Basic operations
+ *
+ * mkold(entry)			= An old and not a young entry
+ * mkyoung(entry)		= A young and not an old entry
+ * mkdirty(entry)		= A dirty and not a clean entry
+ * mkclean(entry)		= A clean and not a dirty entry
+ * mkwrite(entry)		= A write and not a write protected entry
+ * wrprotect(entry)		= A write protected and not a write entry
+ * pxx_bad(entry)		= A mapped and non-table entry
+ * pxx_same(entry1, entry2)	= Both entries hold the exact same value
+ */
+#define VMFLAGS	(VM_READ|VM_WRITE|VM_EXEC)
+
+/*
+ * On s390 platform, the lower 12 bits are used to identify given page table
+ * entry type and for other arch specific requirements. But these bits might
+ * affect the ability to clear entries with pxx_clear(). So while loading up
+ * the entries skip all lower 12 bits in order to accommodate s390 platform.
+ * It does not have affect any other platform.
+ */
+#define RANDOM_ORVALUE	(0xfffffffffffff000UL)
+#define RANDOM_NZVALUE	(0xff)
+
+static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
+{
+	pte_t pte = pfn_pte(pfn, prot);
+
+	WARN_ON(!pte_same(pte, pte));
+	WARN_ON(!pte_young(pte_mkyoung(pte)));
+	WARN_ON(!pte_dirty(pte_mkdirty(pte)));
+	WARN_ON(!pte_write(pte_mkwrite(pte)));
+	WARN_ON(pte_young(pte_mkold(pte)));
+	WARN_ON(pte_dirty(pte_mkclean(pte)));
+	WARN_ON(pte_write(pte_wrprotect(pte)));
+}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
+{
+	pmd_t pmd = pfn_pmd(pfn, prot);
+
+	WARN_ON(!pmd_same(pmd, pmd));
+	WARN_ON(!pmd_young(pmd_mkyoung(pmd)));
+	WARN_ON(!pmd_dirty(pmd_mkdirty(pmd)));
+	WARN_ON(!pmd_write(pmd_mkwrite(pmd)));
+	WARN_ON(pmd_young(pmd_mkold(pmd)));
+	WARN_ON(pmd_dirty(pmd_mkclean(pmd)));
+	WARN_ON(pmd_write(pmd_wrprotect(pmd)));
+	/*
+	 * A huge page does not point to next level page table
+	 * entry. Hence this must qualify as pmd_bad().
+	 */
+	WARN_ON(!pmd_bad(pmd_mkhuge(pmd)));
+}
+
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
+{
+	pud_t pud = pfn_pud(pfn, prot);
+
+	WARN_ON(!pud_same(pud, pud));
+	WARN_ON(!pud_young(pud_mkyoung(pud)));
+	WARN_ON(!pud_write(pud_mkwrite(pud)));
+	WARN_ON(pud_write(pud_wrprotect(pud)));
+	WARN_ON(pud_young(pud_mkold(pud)));
+
+	if (mm_pmd_folded(mm) || __is_defined(ARCH_HAS_4LEVEL_HACK))
+		return;
+
+	/*
+	 * A huge page does not point to next level page table
+	 * entry. Hence this must qualify as pud_bad().
+	 */
+	WARN_ON(!pud_bad(pud_mkhuge(pud)));
+}
+#else
+static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
+#endif
+#else
+static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
+#endif
+
+static void __init p4d_basic_tests(unsigned long pfn, pgprot_t prot)
+{
+	p4d_t p4d;
+
+	memset(&p4d, RANDOM_NZVALUE, sizeof(p4d_t));
+	WARN_ON(!p4d_same(p4d, p4d));
+}
+
+static void __init pgd_basic_tests(unsigned long pfn, pgprot_t prot)
+{
+	pgd_t pgd;
+
+	memset(&pgd, RANDOM_NZVALUE, sizeof(pgd_t));
+	WARN_ON(!pgd_same(pgd, pgd));
+}
+
+#ifndef __ARCH_HAS_4LEVEL_HACK
+static void __init pud_clear_tests(struct mm_struct *mm, pud_t *pudp)
+{
+	pud_t pud = READ_ONCE(*pudp);
+
+	if (mm_pmd_folded(mm))
+		return;
+
+	pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
+	WRITE_ONCE(*pudp, pud);
+	pud_clear(pudp);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(!pud_none(pud));
+}
+
+static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
+				      pmd_t *pmdp)
+{
+	pud_t pud;
+
+	if (mm_pmd_folded(mm))
+		return;
+	/*
+	 * This entry points to next level page table page.
+	 * Hence this must not qualify as pud_bad().
+	 */
+	pmd_clear(pmdp);
+	pud_clear(pudp);
+	pud_populate(mm, pudp, pmdp);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(pud_bad(pud));
+}
+#else
+static void __init pud_clear_tests(struct mm_struct *mm, pud_t *pudp) { }
+static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
+				      pmd_t *pmdp)
+{
+}
+#endif
+
+#ifndef __ARCH_HAS_5LEVEL_HACK
+static void __init p4d_clear_tests(struct mm_struct *mm, p4d_t *p4dp)
+{
+	p4d_t p4d = READ_ONCE(*p4dp);
+
+	if (mm_pud_folded(mm))
+		return;
+
+	p4d = __p4d(p4d_val(p4d) | RANDOM_ORVALUE);
+	WRITE_ONCE(*p4dp, p4d);
+	p4d_clear(p4dp);
+	p4d = READ_ONCE(*p4dp);
+	WARN_ON(!p4d_none(p4d));
+}
+
+static void __init p4d_populate_tests(struct mm_struct *mm, p4d_t *p4dp,
+				      pud_t *pudp)
+{
+	p4d_t p4d;
+
+	if (mm_pud_folded(mm))
+		return;
+
+	/*
+	 * This entry points to next level page table page.
+	 * Hence this must not qualify as p4d_bad().
+	 */
+	pud_clear(pudp);
+	p4d_clear(p4dp);
+	p4d_populate(mm, p4dp, pudp);
+	p4d = READ_ONCE(*p4dp);
+	WARN_ON(p4d_bad(p4d));
+}
+
+static void __init pgd_clear_tests(struct mm_struct *mm, pgd_t *pgdp)
+{
+	pgd_t pgd = READ_ONCE(*pgdp);
+
+	if (mm_p4d_folded(mm))
+		return;
+
+	pgd = __pgd(pgd_val(pgd) | RANDOM_ORVALUE);
+	WRITE_ONCE(*pgdp, pgd);
+	pgd_clear(pgdp);
+	pgd = READ_ONCE(*pgdp);
+	WARN_ON(!pgd_none(pgd));
+}
+
+static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
+				      p4d_t *p4dp)
+{
+	pgd_t pgd;
+
+	if (mm_p4d_folded(mm))
+		return;
+
+	/*
+	 * This entry points to next level page table page.
+	 * Hence this must not qualify as pgd_bad().
+	 */
+	p4d_clear(p4dp);
+	pgd_clear(pgdp);
+	pgd_populate(mm, pgdp, p4dp);
+	pgd = READ_ONCE(*pgdp);
+	WARN_ON(pgd_bad(pgd));
+}
+#else
+static void __init p4d_clear_tests(struct mm_struct *mm, p4d_t *p4dp) { }
+static void __init pgd_clear_tests(struct mm_struct *mm, pgd_t *pgdp) { }
+static void __init p4d_populate_tests(struct mm_struct *mm, p4d_t *p4dp,
+				      pud_t *pudp)
+{
+}
+static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
+				      p4d_t *p4dp)
+{
+}
+#endif
+
+static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep)
+{
+	pte_t pte = READ_ONCE(*ptep);
+
+	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
+	WRITE_ONCE(*ptep, pte);
+	pte_clear(mm, 0, ptep);
+	pte = READ_ONCE(*ptep);
+	WARN_ON(!pte_none(pte));
+}
+
+static void __init pmd_clear_tests(struct mm_struct *mm, pmd_t *pmdp)
+{
+	pmd_t pmd = READ_ONCE(*pmdp);
+
+	pmd = __pmd(pmd_val(pmd) | RANDOM_ORVALUE);
+	WRITE_ONCE(*pmdp, pmd);
+	pmd_clear(pmdp);
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(!pmd_none(pmd));
+}
+
+static void __init pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
+				      pgtable_t pgtable)
+{
+	pmd_t pmd;
+
+	/*
+	 * This entry points to next level page table page.
+	 * Hence this must not qualify as pmd_bad().
+	 */
+	pmd_clear(pmdp);
+	pmd_populate(mm, pmdp, pgtable);
+	pmd = READ_ONCE(*pmdp);
+	WARN_ON(pmd_bad(pmd));
+}
+
+static unsigned long __init get_random_vaddr(void)
+{
+	unsigned long random_vaddr, random_pages, total_user_pages;
+
+	total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
+
+	random_pages = get_random_long() % total_user_pages;
+	random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
+
+	return random_vaddr;
+}
+
+void __init debug_vm_pgtable(void)
+{
+	struct mm_struct *mm;
+	pgd_t *pgdp;
+	p4d_t *p4dp, *saved_p4dp;
+	pud_t *pudp, *saved_pudp;
+	pmd_t *pmdp, *saved_pmdp, pmd;
+	pte_t *ptep;
+	pgtable_t saved_ptep;
+	pgprot_t prot;
+	phys_addr_t paddr;
+	unsigned long vaddr, pte_aligned, pmd_aligned;
+	unsigned long pud_aligned, p4d_aligned, pgd_aligned;
+
+	pr_info("Validating architecture page table helpers\n");
+	prot = vm_get_page_prot(VMFLAGS);
+	vaddr = get_random_vaddr();
+	mm = mm_alloc();
+	if (!mm) {
+		pr_err("mm_struct allocation failed\n");
+		return;
+	}
+
+	/*
+	 * PFN for mapping at PTE level is determined from a standard kernel
+	 * text symbol. But pfns for higher page table levels are derived by
+	 * masking lower bits of this real pfn. These derived pfns might not
+	 * exist on the platform but that does not really matter as pfn_pxx()
+	 * helpers will still create appropriate entries for the test. This
+	 * helps avoid large memory block allocations to be used for mapping
+	 * at higher page table levels.
+	 */
+	paddr = __pa(&start_kernel);
+
+	pte_aligned = (paddr & PAGE_MASK) >> PAGE_SHIFT;
+	pmd_aligned = (paddr & PMD_MASK) >> PAGE_SHIFT;
+	pud_aligned = (paddr & PUD_MASK) >> PAGE_SHIFT;
+	p4d_aligned = (paddr & P4D_MASK) >> PAGE_SHIFT;
+	pgd_aligned = (paddr & PGDIR_MASK) >> PAGE_SHIFT;
+	WARN_ON(!pfn_valid(pte_aligned));
+
+	pgdp = pgd_offset(mm, vaddr);
+	p4dp = p4d_alloc(mm, pgdp, vaddr);
+	pudp = pud_alloc(mm, p4dp, vaddr);
+	pmdp = pmd_alloc(mm, pudp, vaddr);
+	ptep = pte_alloc_map(mm, pmdp, vaddr);
+
+	/*
+	 * Save all the page table page addresses as the page table
+	 * entries will be used for testing with random or garbage
+	 * values. These saved addresses will be used for freeing
+	 * page table pages.
+	 */
+	pmd = READ_ONCE(*pmdp);
+	saved_p4dp = p4d_offset(pgdp, 0UL);
+	saved_pudp = pud_offset(p4dp, 0UL);
+	saved_pmdp = pmd_offset(pudp, 0UL);
+	saved_ptep = pmd_pgtable(pmd);
+
+	pte_basic_tests(pte_aligned, prot);
+	pmd_basic_tests(pmd_aligned, prot);
+	pud_basic_tests(pud_aligned, prot);
+	p4d_basic_tests(p4d_aligned, prot);
+	pgd_basic_tests(pgd_aligned, prot);
+
+	pte_clear_tests(mm, ptep);
+	pmd_clear_tests(mm, pmdp);
+	pud_clear_tests(mm, pudp);
+	p4d_clear_tests(mm, p4dp);
+	pgd_clear_tests(mm, pgdp);
+
+	pte_unmap(ptep);
+
+	pmd_populate_tests(mm, pmdp, saved_ptep);
+	pud_populate_tests(mm, pudp, saved_pmdp);
+	p4d_populate_tests(mm, p4dp, saved_pudp);
+	pgd_populate_tests(mm, pgdp, saved_p4dp);
+
+	p4d_free(mm, saved_p4dp);
+	pud_free(mm, saved_pudp);
+	pmd_free(mm, saved_pmdp);
+	pte_free(mm, saved_ptep);
+
+	mm_dec_nr_puds(mm);
+	mm_dec_nr_pmds(mm);
+	mm_dec_nr_ptes(mm);
+	__mmdrop(mm);
+}
-- 
2.7.4

