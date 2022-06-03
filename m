Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFE53C87A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 12:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDzMk5XW2z3f3M
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 20:17:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDzKr48ZYz3cgB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 20:15:44 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62BF315DB;
	Fri,  3 Jun 2022 03:15:13 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.42.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A26C03F766;
	Fri,  3 Jun 2022 03:15:04 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH 5/6] nios2/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Fri,  3 Jun 2022 15:44:10 +0530
Message-Id: <20220603101411.488970-6-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603101411.488970-1-anshuman.khandual@arm.com>
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, openrisc@lists.librecores.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
index 4167f1eb4cd8..e0459dffd218 100644
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
index 262d0609268c..3c9f83c22733 100644
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

