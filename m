Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3E56D5CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 09:09:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhFPR0p2Dz3fLQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 17:09:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhFMK56fvz3dpV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 17:07:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6EA1595;
	Mon, 11 Jul 2022 00:07:10 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.45.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 052F93F70D;
	Mon, 11 Jul 2022 00:07:01 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V7 06/26] x86/mm: Move protection_map[] inside the platform
Date: Mon, 11 Jul 2022 12:35:40 +0530
Message-Id: <20220711070600.2378316-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711070600.2378316-1-anshuman.khandual@arm.com>
References: <20220711070600.2378316-1-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, hch@infradead.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves protection_map[] inside the platform and makes it a static. This
also defines a helper function add_encrypt_protection_map() that can update
the protection_map[] array with pgprot_encrypted().

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/x86/include/asm/mem_encrypt.h   |  2 ++
 arch/x86/include/asm/pgtable_types.h | 19 -------------------
 arch/x86/mm/mem_encrypt_amd.c        |  6 ++----
 arch/x86/mm/pgprot.c                 | 28 ++++++++++++++++++++++++++++
 4 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index 88ceaf3648b3..72ca90552b6a 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -89,6 +89,8 @@ static inline void mem_encrypt_free_decrypted_mem(void) { }
 /* Architecture __weak replacement functions */
 void __init mem_encrypt_init(void);
 
+void add_encrypt_protection_map(void);
+
 /*
  * The __sme_pa() and __sme_pa_nodebug() macros are meant for use when
  * writing to or comparing values from the cr3 register.  Having the
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index bdaf8391e2e0..aa174fed3a71 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -230,25 +230,6 @@ enum page_cache_mode {
 
 #endif	/* __ASSEMBLY__ */
 
-/*         xwr */
-#define __P000	PAGE_NONE
-#define __P001	PAGE_READONLY
-#define __P010	PAGE_COPY
-#define __P011	PAGE_COPY
-#define __P100	PAGE_READONLY_EXEC
-#define __P101	PAGE_READONLY_EXEC
-#define __P110	PAGE_COPY_EXEC
-#define __P111	PAGE_COPY_EXEC
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READONLY
-#define __S010	PAGE_SHARED
-#define __S011	PAGE_SHARED
-#define __S100	PAGE_READONLY_EXEC
-#define __S101	PAGE_READONLY_EXEC
-#define __S110	PAGE_SHARED_EXEC
-#define __S111	PAGE_SHARED_EXEC
-
 /*
  * early identity mapping  pte attrib macros.
  */
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index f6d038e2cd8e..5c3c3ed46f5a 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -26,6 +26,7 @@
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
 #include <asm/setup.h>
+#include <asm/mem_encrypt.h>
 #include <asm/bootparam.h>
 #include <asm/set_memory.h>
 #include <asm/cacheflush.h>
@@ -486,8 +487,6 @@ void __init early_set_mem_enc_dec_hypercall(unsigned long vaddr, int npages, boo
 
 void __init sme_early_init(void)
 {
-	unsigned int i;
-
 	if (!sme_me_mask)
 		return;
 
@@ -496,8 +495,7 @@ void __init sme_early_init(void)
 	__supported_pte_mask = __sme_set(__supported_pte_mask);
 
 	/* Update the protection map with memory encryption mask */
-	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
-		protection_map[i] = pgprot_encrypted(protection_map[i]);
+	add_encrypt_protection_map();
 
 	x86_platform.guest.enc_status_change_prepare = amd_enc_status_change_prepare;
 	x86_platform.guest.enc_status_change_finish  = amd_enc_status_change_finish;
diff --git a/arch/x86/mm/pgprot.c b/arch/x86/mm/pgprot.c
index 763742782286..c84bd9540b16 100644
--- a/arch/x86/mm/pgprot.c
+++ b/arch/x86/mm/pgprot.c
@@ -3,6 +3,34 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <asm/pgtable.h>
+#include <asm/mem_encrypt.h>
+
+static pgprot_t protection_map[16] __ro_after_init = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY,
+	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE | VM_READ]				= PAGE_COPY,
+	[VM_EXEC]					= PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_READ]				= PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY_EXEC,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_EXEC,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_EXEC
+};
+
+void add_encrypt_protection_map(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
+		protection_map[i] = pgprot_encrypted(protection_map[i]);
+}
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-- 
2.25.1

