Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E74561195
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 07:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYRZ756GXz3g01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:23:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYRTW4br7z3dt0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 15:19:27 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7818019F0;
	Wed, 29 Jun 2022 22:18:56 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CFBB3F66F;
	Wed, 29 Jun 2022 22:18:47 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V6 15/26] nios2/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Thu, 30 Jun 2022 10:46:19 +0530
Message-Id: <20220630051630.1718927-16-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630051630.1718927-1-anshuman.khandual@arm.com>
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, hch@infradead.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
up a private and static protection_map[] array. Subsequently all __SXXX and
__PXXX macros can be dropped which are no longer needed.

Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/nios2/Kconfig               |  1 +
 arch/nios2/include/asm/pgtable.h | 16 ----------------
 arch/nios2/mm/init.c             | 20 ++++++++++++++++++++
 3 files changed, 21 insertions(+), 16 deletions(-)

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
index 262d0609268c..470516d4555e 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -40,24 +40,8 @@ struct mm_struct;
  */
 
 /* Remove W bit on private pages for COW support */
-#define __P000	MKP(0, 0, 0)
-#define __P001	MKP(0, 0, 1)
-#define __P010	MKP(0, 0, 0)	/* COW */
-#define __P011	MKP(0, 0, 1)	/* COW */
-#define __P100	MKP(1, 0, 0)
-#define __P101	MKP(1, 0, 1)
-#define __P110	MKP(1, 0, 0)	/* COW */
-#define __P111	MKP(1, 0, 1)	/* COW */
 
 /* Shared pages can have exact HW mapping */
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
index 613fcaa5988a..ae24687d12ad 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -124,3 +124,23 @@ const char *arch_vma_name(struct vm_area_struct *vma)
 {
 	return (vma->vm_start == KUSER_BASE) ? "[kuser]" : NULL;
 }
+
+static const pgprot_t protection_map[16] = {
+	[VM_NONE]					= MKP(0, 0, 0),
+	[VM_READ]					= MKP(0, 0, 1),
+	[VM_WRITE]					= MKP(0, 0, 0),
+	[VM_WRITE | VM_READ]				= MKP(0, 0, 1),
+	[VM_EXEC]					= MKP(1, 0, 0),
+	[VM_EXEC | VM_READ]				= MKP(1, 0, 1),
+	[VM_EXEC | VM_WRITE]				= MKP(1, 0, 0),
+	[VM_EXEC | VM_WRITE | VM_READ]			= MKP(1, 0, 1),
+	[VM_SHARED]					= MKP(0, 0, 0),
+	[VM_SHARED | VM_READ]				= MKP(0, 0, 1),
+	[VM_SHARED | VM_WRITE]				= MKP(0, 1, 0),
+	[VM_SHARED | VM_WRITE | VM_READ]		= MKP(0, 1, 1),
+	[VM_SHARED | VM_EXEC]				= MKP(1, 0, 0),
+	[VM_SHARED | VM_EXEC | VM_READ]			= MKP(1, 0, 1),
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= MKP(1, 1, 0),
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= MKP(1, 1, 1)
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1

