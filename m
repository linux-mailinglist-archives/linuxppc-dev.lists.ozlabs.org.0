Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394D15611C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 07:26:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYRdf5jH1z3gVv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:26:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYRVr6NhRz3fT6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 15:20:36 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E25381BA8;
	Wed, 29 Jun 2022 22:20:05 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEAF93F66F;
	Wed, 29 Jun 2022 22:19:57 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V6 23/26] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Thu, 30 Jun 2022 10:46:27 +0530
Message-Id: <20220630051630.1718927-24-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, hch@infradead.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
up a private and static protection_map[] array. Subsequently all __SXXX and
__PXXX macros can be dropped which are no longer needed.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm/Kconfig                   |  1 +
 arch/arm/include/asm/pgtable.h     | 17 -----------------
 arch/arm/lib/uaccess_with_memcpy.c |  2 +-
 arch/arm/mm/mmu.c                  | 20 ++++++++++++++++++++
 4 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7630ba9cb6cc..e153b6d4fc5b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -24,6 +24,7 @@ config ARM
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if SWIOTLB || !MMU
 	select ARCH_HAS_TEARDOWN_DMA_OPS if MMU
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if CPU_V7 || CPU_V7M || CPU_V6K
 	select ARCH_HAS_GCOV_PROFILE_ALL
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index cd1f84bb40ae..78a532068fec 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -137,23 +137,6 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
  *  2) If we could do execute protection, then read is implied
  *  3) write implies read permissions
  */
-#define __P000  __PAGE_NONE
-#define __P001  __PAGE_READONLY
-#define __P010  __PAGE_COPY
-#define __P011  __PAGE_COPY
-#define __P100  __PAGE_READONLY_EXEC
-#define __P101  __PAGE_READONLY_EXEC
-#define __P110  __PAGE_COPY_EXEC
-#define __P111  __PAGE_COPY_EXEC
-
-#define __S000  __PAGE_NONE
-#define __S001  __PAGE_READONLY
-#define __S010  __PAGE_SHARED
-#define __S011  __PAGE_SHARED
-#define __S100  __PAGE_READONLY_EXEC
-#define __S101  __PAGE_READONLY_EXEC
-#define __S110  __PAGE_SHARED_EXEC
-#define __S111  __PAGE_SHARED_EXEC
 
 #ifndef __ASSEMBLY__
 /*
diff --git a/arch/arm/lib/uaccess_with_memcpy.c b/arch/arm/lib/uaccess_with_memcpy.c
index c30b689bec2e..14eecaaf295f 100644
--- a/arch/arm/lib/uaccess_with_memcpy.c
+++ b/arch/arm/lib/uaccess_with_memcpy.c
@@ -237,7 +237,7 @@ static int __init test_size_treshold(void)
 	if (!dst_page)
 		goto no_dst;
 	kernel_ptr = page_address(src_page);
-	user_ptr = vmap(&dst_page, 1, VM_IOREMAP, __pgprot(__P010));
+	user_ptr = vmap(&dst_page, 1, VM_IOREMAP, __pgprot(__PAGE_COPY));
 	if (!user_ptr)
 		goto no_vmap;
 
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 5e2be37a198e..2722abddd725 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -405,6 +405,26 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	local_flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
 }
 
+static pgprot_t protection_map[16] __ro_after_init = {
+	[VM_NONE]					= __PAGE_NONE,
+	[VM_READ]					= __PAGE_READONLY,
+	[VM_WRITE]					= __PAGE_COPY,
+	[VM_WRITE | VM_READ]				= __PAGE_COPY,
+	[VM_EXEC]					= __PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_READ]				= __PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_WRITE]				= __PAGE_COPY_EXEC,
+	[VM_EXEC | VM_WRITE | VM_READ]			= __PAGE_COPY_EXEC,
+	[VM_SHARED]					= __PAGE_NONE,
+	[VM_SHARED | VM_READ]				= __PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= __PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= __PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= __PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_READ]			= __PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= __PAGE_SHARED_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __PAGE_SHARED_EXEC
+};
+DECLARE_VM_GET_PAGE_PROT
+
 /*
  * Adjust the PMD section entries according to the CPU in use.
  */
-- 
2.25.1

