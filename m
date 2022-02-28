Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 744EB4C693C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 11:59:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6cpf4w0Tz3gRC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 21:59:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K6cfD0pgQz3bpj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 21:52:35 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43542106F;
 Mon, 28 Feb 2022 02:52:35 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28EEB3F73D;
 Mon, 28 Feb 2022 02:52:26 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V3 27/30] nds32/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 28 Feb 2022 16:17:50 +0530
Message-Id: <1646045273-9343-28-git-send-email-anshuman.khandual@arm.com>
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
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This defines and exports a platform specific custom vm_get_page_prot() via
subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
macros can be dropped which are no longer needed.

Cc: Nick Hu <nickhu@andestech.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/nds32/Kconfig               |  1 +
 arch/nds32/include/asm/pgtable.h | 17 ---------------
 arch/nds32/mm/mmap.c             | 37 ++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index 4d1421b18734..576e05479925 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -10,6 +10,7 @@ config NDS32
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_WANT_FRAME_POINTERS if FTRACE
 	select CLKSRC_MMIO
 	select CLONE_BACKWARDS
diff --git a/arch/nds32/include/asm/pgtable.h b/arch/nds32/include/asm/pgtable.h
index 419f984eef70..79f64ed734cb 100644
--- a/arch/nds32/include/asm/pgtable.h
+++ b/arch/nds32/include/asm/pgtable.h
@@ -152,23 +152,6 @@ extern void __pgd_error(const char *file, int line, unsigned long val);
 #endif /* __ASSEMBLY__ */
 
 /*         xwr */
-#define __P000  (PAGE_NONE | _PAGE_CACHE_SHRD)
-#define __P001  (PAGE_READ | _PAGE_CACHE_SHRD)
-#define __P010  (PAGE_COPY | _PAGE_CACHE_SHRD)
-#define __P011  (PAGE_COPY | _PAGE_CACHE_SHRD)
-#define __P100  (PAGE_EXEC | _PAGE_CACHE_SHRD)
-#define __P101  (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __P110  (PAGE_COPY | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __P111  (PAGE_COPY | _PAGE_E | _PAGE_CACHE_SHRD)
-
-#define __S000  (PAGE_NONE | _PAGE_CACHE_SHRD)
-#define __S001  (PAGE_READ | _PAGE_CACHE_SHRD)
-#define __S010  (PAGE_RDWR | _PAGE_CACHE_SHRD)
-#define __S011  (PAGE_RDWR | _PAGE_CACHE_SHRD)
-#define __S100  (PAGE_EXEC | _PAGE_CACHE_SHRD)
-#define __S101  (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __S110  (PAGE_RDWR | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __S111  (PAGE_RDWR | _PAGE_E | _PAGE_CACHE_SHRD)
 
 #ifndef __ASSEMBLY__
 /*
diff --git a/arch/nds32/mm/mmap.c b/arch/nds32/mm/mmap.c
index 1bdf5e7d1b43..0399b928948d 100644
--- a/arch/nds32/mm/mmap.c
+++ b/arch/nds32/mm/mmap.c
@@ -71,3 +71,40 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return (PAGE_NONE | _PAGE_CACHE_SHRD);
+	case VM_READ:
+		return (PAGE_READ | _PAGE_CACHE_SHRD);
+	case VM_WRITE:
+	case VM_WRITE | VM_READ:
+		return (PAGE_COPY | _PAGE_CACHE_SHRD);
+	case VM_EXEC:
+		return (PAGE_EXEC | _PAGE_CACHE_SHRD);
+	case VM_EXEC | VM_READ:
+		return (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD);
+	case VM_EXEC | VM_WRITE:
+	case VM_EXEC | VM_WRITE | VM_READ:
+		return (PAGE_COPY | _PAGE_E | _PAGE_CACHE_SHRD);
+	case VM_SHARED:
+		return (PAGE_NONE | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_READ:
+		return (PAGE_READ | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_WRITE:
+	case VM_SHARED | VM_WRITE | VM_READ:
+		return (PAGE_RDWR | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_EXEC:
+		return (PAGE_EXEC | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
+		return (PAGE_RDWR | _PAGE_E | _PAGE_CACHE_SHRD);
+	default:
+		BUILD_BUG();
+	}
+}
+EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1

