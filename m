Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638255B6B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWbCs0X8cz3f9T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:01:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWbBM6FDhz3drj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 14:59:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08AC213D5;
	Sun, 26 Jun 2022 21:59:24 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.42.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69D083F5A1;
	Sun, 26 Jun 2022 21:59:16 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V5 04/26] sparc/mm: Move protection_map[] inside the platform
Date: Mon, 27 Jun 2022 10:28:11 +0530
Message-Id: <20220627045833.1590055-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627045833.1590055-1-anshuman.khandual@arm.com>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, hch@infradead.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves protection_map[] inside the platform and while here, also enable
ARCH_HAS_VM_GET_PAGE_PROT on 32 bit platforms via DECLARE_VM_GET_PAGE_PROT.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/sparc/Kconfig                  |  2 +-
 arch/sparc/include/asm/pgtable_32.h | 19 -------------------
 arch/sparc/include/asm/pgtable_64.h | 19 -------------------
 arch/sparc/mm/init_32.c             | 20 ++++++++++++++++++++
 arch/sparc/mm/init_64.c             |  3 +++
 5 files changed, 24 insertions(+), 39 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index ba449c47effd..09f868613a4d 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -13,6 +13,7 @@ config 64BIT
 config SPARC
 	bool
 	default y
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select DMA_OPS
@@ -84,7 +85,6 @@ config SPARC64
 	select PERF_USE_VMALLOC
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select HAVE_C_RECORDMCOUNT
-	select ARCH_HAS_VM_GET_PAGE_PROT
 	select HAVE_ARCH_AUDITSYSCALL
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 4866625da314..8ff549004fac 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -64,25 +64,6 @@ void paging_init(void);
 
 extern unsigned long ptr_in_current_pgd;
 
-/*         xwr */
-#define __P000  PAGE_NONE
-#define __P001  PAGE_READONLY
-#define __P010  PAGE_COPY
-#define __P011  PAGE_COPY
-#define __P100  PAGE_READONLY
-#define __P101  PAGE_READONLY
-#define __P110  PAGE_COPY
-#define __P111  PAGE_COPY
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READONLY
-#define __S010	PAGE_SHARED
-#define __S011	PAGE_SHARED
-#define __S100	PAGE_READONLY
-#define __S101	PAGE_READONLY
-#define __S110	PAGE_SHARED
-#define __S111	PAGE_SHARED
-
 /* First physical page can be anywhere, the following is needed so that
  * va-->pa and vice versa conversions work properly without performance
  * hit for all __pa()/__va() operations.
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 4679e45c8348..a779418ceba9 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -187,25 +187,6 @@ bool kern_addr_valid(unsigned long addr);
 #define _PAGE_SZHUGE_4U	_PAGE_SZ4MB_4U
 #define _PAGE_SZHUGE_4V	_PAGE_SZ4MB_4V
 
-/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
-#define __P000	__pgprot(0)
-#define __P001	__pgprot(0)
-#define __P010	__pgprot(0)
-#define __P011	__pgprot(0)
-#define __P100	__pgprot(0)
-#define __P101	__pgprot(0)
-#define __P110	__pgprot(0)
-#define __P111	__pgprot(0)
-
-#define __S000	__pgprot(0)
-#define __S001	__pgprot(0)
-#define __S010	__pgprot(0)
-#define __S011	__pgprot(0)
-#define __S100	__pgprot(0)
-#define __S101	__pgprot(0)
-#define __S110	__pgprot(0)
-#define __S111	__pgprot(0)
-
 #ifndef __ASSEMBLY__
 
 pte_t mk_pte_io(unsigned long, pgprot_t, int, unsigned long);
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index 1e9f577f084d..8693e4e28b86 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -302,3 +302,23 @@ void sparc_flush_page_to_ram(struct page *page)
 		__flush_page_to_ram(vaddr);
 }
 EXPORT_SYMBOL(sparc_flush_page_to_ram);
+
+static pgprot_t protection_map[16] __ro_after_init = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY,
+	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE | VM_READ]				= PAGE_COPY,
+	[VM_EXEC]					= PAGE_READONLY,
+	[VM_EXEC | VM_READ]				= PAGE_READONLY,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= PAGE_READONLY,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED
+};
+DECLARE_VM_GET_PAGE_PROT
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index f6174df2d5af..d6faee23c77d 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2634,6 +2634,9 @@ void vmemmap_free(unsigned long start, unsigned long end,
 }
 #endif /* CONFIG_SPARSEMEM_VMEMMAP */
 
+/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
+static pgprot_t protection_map[16] __ro_after_init;
+
 static void prot_init_common(unsigned long page_none,
 			     unsigned long page_shared,
 			     unsigned long page_copy,
-- 
2.25.1

