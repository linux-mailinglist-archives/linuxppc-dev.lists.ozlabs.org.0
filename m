Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CC24C6937
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 11:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6cpC6rdjz3c4k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 21:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K6cf31nZfz3f6b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 21:52:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD69106F;
 Mon, 28 Feb 2022 02:52:26 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4B533F73D;
 Mon, 28 Feb 2022 02:52:18 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V3 26/30] hexagon/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 28 Feb 2022 16:17:49 +0530
Message-Id: <1646045273-9343-27-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This defines and exports a platform specific custom vm_get_page_prot() via
subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
macros can be dropped which are no longer needed.

Cc: Brian Cain <bcain@codeaurora.org>
Cc: linux-hexagon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/hexagon/Kconfig               |  1 +
 arch/hexagon/include/asm/pgtable.h | 24 -----------
 arch/hexagon/mm/init.c             | 67 ++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 24 deletions(-)

diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index 15dd8f38b698..cdc5df32a1e3 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -6,6 +6,7 @@ config HEXAGON
 	def_bool y
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_NO_PREEMPT
 	select DMA_GLOBAL_POOL
 	# Other pending projects/to-do items.
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index 18cd6ea9ab23..5eceddfe013d 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -127,31 +127,7 @@ extern unsigned long _dflt_cache_att;
 #define CACHEDEF	(CACHE_DEFAULT << 6)
 
 /* Private (copy-on-write) page protections. */
-#define __P000 __pgprot(_PAGE_PRESENT | _PAGE_USER | CACHEDEF)
-#define __P001 __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_READ | CACHEDEF)
-#define __P010 __P000	/* Write-only copy-on-write */
-#define __P011 __P001	/* Read/Write copy-on-write */
-#define __P100 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
-			_PAGE_EXECUTE | CACHEDEF)
-#define __P101 __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_EXECUTE | \
-			_PAGE_READ | CACHEDEF)
-#define __P110 __P100	/* Write/execute copy-on-write */
-#define __P111 __P101	/* Read/Write/Execute, copy-on-write */
-
 /* Shared page protections. */
-#define __S000 __P000
-#define __S001 __P001
-#define __S010 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
-			_PAGE_WRITE | CACHEDEF)
-#define __S011 __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_READ | \
-			_PAGE_WRITE | CACHEDEF)
-#define __S100 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
-			_PAGE_EXECUTE | CACHEDEF)
-#define __S101 __P101
-#define __S110 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
-			_PAGE_EXECUTE | _PAGE_WRITE | CACHEDEF)
-#define __S111 __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_READ | \
-			_PAGE_EXECUTE | _PAGE_WRITE | CACHEDEF)
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];  /* located in head.S */
 
diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
index f01e91e10d95..b53595fc4103 100644
--- a/arch/hexagon/mm/init.c
+++ b/arch/hexagon/mm/init.c
@@ -236,3 +236,70 @@ void __init setup_arch_memory(void)
 	 *  which is called by start_kernel() later on in the process
 	 */
 }
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				CACHEDEF);
+	case VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_READ | CACHEDEF);
+	/* Write-only copy-on-write */
+	case VM_WRITE:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				CACHEDEF);
+	/* Read/Write copy-on-write */
+	case VM_WRITE | VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_READ | CACHEDEF);
+	case VM_EXEC:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_EXECUTE | CACHEDEF);
+	case VM_EXEC | VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_EXECUTE | _PAGE_READ |
+				CACHEDEF);
+	/* Write/execute copy-on-write */
+	case VM_EXEC | VM_WRITE:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_EXECUTE | CACHEDEF);
+	/* Read/Write/Execute, copy-on-write */
+	case VM_EXEC | VM_WRITE | VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_EXECUTE | _PAGE_READ |
+				CACHEDEF);
+	case VM_SHARED:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				CACHEDEF);
+	case VM_SHARED | VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_READ | CACHEDEF);
+	case VM_SHARED | VM_WRITE:
+		return  __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_WRITE | CACHEDEF);
+	case VM_SHARED | VM_WRITE | VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_READ | _PAGE_WRITE |
+				CACHEDEF);
+	case VM_SHARED | VM_EXEC:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_EXECUTE | CACHEDEF);
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_EXECUTE | _PAGE_READ |
+				CACHEDEF);
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_EXECUTE | _PAGE_WRITE |
+				CACHEDEF);
+	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
+		return __pgprot(_PAGE_PRESENT | _PAGE_USER |
+				_PAGE_READ | _PAGE_EXECUTE |
+				_PAGE_WRITE | CACHEDEF);
+	default:
+		BUILD_BUG();
+	}
+}
+EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1

