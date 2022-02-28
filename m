Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0295A4C6933
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 11:59:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6cnn0zs5z3gHC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 21:59:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K6cdt50qLz3f57
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 21:52:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10EEE11FB;
 Mon, 28 Feb 2022 02:52:18 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 863F03F73D;
 Mon, 28 Feb 2022 02:52:10 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V3 25/30] nios2/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 28 Feb 2022 16:17:48 +0530
Message-Id: <1646045273-9343-26-git-send-email-anshuman.khandual@arm.com>
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
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This defines and exports a platform specific custom vm_get_page_prot() via
subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
macros can be dropped which are no longer needed.

Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/nios2/Kconfig               |  1 +
 arch/nios2/include/asm/pgtable.h | 24 ----------------
 arch/nios2/mm/init.c             | 47 ++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index 33fd06f5fa41..85a58a357a3b 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -6,6 +6,7 @@ config NIOS2
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_DMA_SET_UNCACHED
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_NO_SWAP
 	select COMMON_CLK
 	select TIMER_OF
diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index 4a995fa628ee..ba3f9822c0b3 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -34,30 +34,6 @@ struct mm_struct;
 				((x) ? _PAGE_EXEC : 0) |		\
 				((r) ? _PAGE_READ : 0) |		\
 				((w) ? _PAGE_WRITE : 0))
-/*
- * These are the macros that generic kernel code needs
- * (to populate protection_map[])
- */
-
-/* Remove W bit on private pages for COW support */
-#define __P000	MKP(0, 0, 0)
-#define __P001	MKP(0, 0, 1)
-#define __P010	MKP(0, 0, 0)	/* COW */
-#define __P011	MKP(0, 0, 1)	/* COW */
-#define __P100	MKP(1, 0, 0)
-#define __P101	MKP(1, 0, 1)
-#define __P110	MKP(1, 0, 0)	/* COW */
-#define __P111	MKP(1, 0, 1)	/* COW */
-
-/* Shared pages can have exact HW mapping */
-#define __S000	MKP(0, 0, 0)
-#define __S001	MKP(0, 0, 1)
-#define __S010	MKP(0, 1, 0)
-#define __S011	MKP(0, 1, 1)
-#define __S100	MKP(1, 0, 0)
-#define __S101	MKP(1, 0, 1)
-#define __S110	MKP(1, 1, 0)
-#define __S111	MKP(1, 1, 1)
 
 /* Used all over the kernel */
 #define PAGE_KERNEL __pgprot(_PAGE_PRESENT | _PAGE_CACHED | _PAGE_READ | \
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index 613fcaa5988a..e867f5d85580 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -124,3 +124,50 @@ const char *arch_vma_name(struct vm_area_struct *vma)
 {
 	return (vma->vm_start == KUSER_BASE) ? "[kuser]" : NULL;
 }
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	/* Remove W bit on private pages for COW support */
+	case VM_NONE:
+		return MKP(0, 0, 0);
+	case VM_READ:
+		return MKP(0, 0, 1);
+	/* COW */
+	case VM_WRITE:
+		return MKP(0, 0, 0);
+	/* COW */
+	case VM_WRITE | VM_READ:
+		return MKP(0, 0, 1);
+	case VM_EXEC:
+		return MKP(1, 0, 0);
+	case VM_EXEC | VM_READ:
+		return MKP(1, 0, 1);
+	/* COW */
+	case VM_EXEC | VM_WRITE:
+		return MKP(1, 0, 0);
+	/* COW */
+	case VM_EXEC | VM_WRITE | VM_READ:
+		return MKP(1, 0, 1);
+	/* Shared pages can have exact HW mapping */
+	case VM_SHARED:
+		return MKP(0, 0, 0);
+	case VM_SHARED | VM_READ:
+		return MKP(0, 0, 1);
+	case VM_SHARED | VM_WRITE:
+		return MKP(0, 1, 0);
+	case VM_SHARED | VM_WRITE | VM_READ:
+		return MKP(0, 1, 1);
+	case VM_SHARED | VM_EXEC:
+		return MKP(1, 0, 0);
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return MKP(1, 0, 1);
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+		return MKP(1, 1, 0);
+	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
+		return MKP(1, 1, 1);
+	default:
+		BUILD_BUG();
+	}
+}
+EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1

