Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id B18218D173D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 11:26:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpRkd05bKz88D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 19:18:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpRkD45TWz880p
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 19:17:40 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VpRF371t1z1S5xH;
	Tue, 28 May 2024 16:55:51 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 83FFC1A016C;
	Tue, 28 May 2024 16:59:26 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 16:59:24 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: [PATCH v12 4/6] arm64: support copy_mc_[user]_highpage()
Date: Tue, 28 May 2024 16:59:13 +0800
Message-ID: <20240528085915.1955987-5-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240528085915.1955987-1-tongtiangen@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, many scenarios that can tolerate memory errors when copying page
have been supported in the kernel[1~5], all of which are implemented by
copy_mc_[user]_highpage(). arm64 should also support this mechanism.

Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
__HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.

Add new helper copy_mc_page() which provide a page copy implementation with
hardware memory error safe. The code logic of copy_mc_page() is the same as
copy_page(), the main difference is that the ldp insn of copy_mc_page()
contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE, therefore, the
main logic is extracted to copy_page_template.S.

[1] commit d302c2398ba2 ("mm, hwpoison: when copy-on-write hits poison, take page offline")
[2] commit 1cb9dc4b475c ("mm: hwpoison: support recovery from HugePage copy-on-write faults")
[3] commit 6b970599e807 ("mm: hwpoison: support recovery from ksm_might_need_to_copy()")
[4] commit 98c76c9f1ef7 ("mm/khugepaged: recover from poisoned anonymous memory")
[5] commit 12904d953364 ("mm/khugepaged: recover from poisoned file-backed memory")

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/mte.h        |  9 +++++
 arch/arm64/include/asm/page.h       | 10 ++++++
 arch/arm64/lib/Makefile             |  2 ++
 arch/arm64/lib/copy_mc_page.S       | 35 ++++++++++++++++++
 arch/arm64/lib/copy_page.S          | 50 +++-----------------------
 arch/arm64/lib/copy_page_template.S | 56 +++++++++++++++++++++++++++++
 arch/arm64/lib/mte.S                | 29 +++++++++++++++
 arch/arm64/mm/copypage.c            | 45 +++++++++++++++++++++++
 include/linux/highmem.h             |  8 +++++
 9 files changed, 199 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm64/lib/copy_mc_page.S
 create mode 100644 arch/arm64/lib/copy_page_template.S

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 91fbd5c8a391..dc68337c2623 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -92,6 +92,11 @@ static inline bool try_page_mte_tagging(struct page *page)
 void mte_zero_clear_page_tags(void *addr);
 void mte_sync_tags(pte_t pte, unsigned int nr_pages);
 void mte_copy_page_tags(void *kto, const void *kfrom);
+
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+int mte_copy_mc_page_tags(void *kto, const void *kfrom);
+#endif
+
 void mte_thread_init_user(void);
 void mte_thread_switch(struct task_struct *next);
 void mte_cpu_setup(void);
@@ -128,6 +133,10 @@ static inline void mte_sync_tags(pte_t pte, unsigned int nr_pages)
 static inline void mte_copy_page_tags(void *kto, const void *kfrom)
 {
 }
+static inline int mte_copy_mc_page_tags(void *kto, const void *kfrom)
+{
+	return 0;
+}
 static inline void mte_thread_init_user(void)
 {
 }
diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index 2312e6ee595f..304cc86b8a10 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -29,6 +29,16 @@ void copy_user_highpage(struct page *to, struct page *from,
 void copy_highpage(struct page *to, struct page *from);
 #define __HAVE_ARCH_COPY_HIGHPAGE
 
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+int copy_mc_page(void *to, const void *from);
+int copy_mc_highpage(struct page *to, struct page *from);
+#define __HAVE_ARCH_COPY_MC_HIGHPAGE
+
+int copy_mc_user_highpage(struct page *to, struct page *from,
+		unsigned long vaddr, struct vm_area_struct *vma);
+#define __HAVE_ARCH_COPY_MC_USER_HIGHPAGE
+#endif
+
 struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 						unsigned long vaddr);
 #define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 13e6a2829116..65ec3d24d32d 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -13,6 +13,8 @@ endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
+lib-$(CONFIG_ARCH_HAS_COPY_MC) += copy_mc_page.o
+
 obj-$(CONFIG_CRC32) += crc32.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/arm64/lib/copy_mc_page.S b/arch/arm64/lib/copy_mc_page.S
new file mode 100644
index 000000000000..7e633a6aa89f
--- /dev/null
+++ b/arch/arm64/lib/copy_mc_page.S
@@ -0,0 +1,35 @@
+#include <linux/linkage.h>
+#include <linux/const.h>
+#include <asm/assembler.h>
+#include <asm/page.h>
+#include <asm/cpufeature.h>
+#include <asm/alternative.h>
+#include <asm/asm-extable.h>
+#include <asm/asm-uaccess.h>
+
+/*
+ * Copy a page from src to dest (both are page aligned) with memory error safe
+ *
+ * Parameters:
+ *	x0 - dest
+ *	x1 - src
+ * Returns:
+ * 	x0 - Return 0 if copy success, or -EFAULT if anything goes wrong
+ *	     while copying.
+ */
+	.macro ldp1 reg1, reg2, ptr, val
+	KERNEL_ME_SAFE(9998f, ldp \reg1, \reg2, [\ptr, \val])
+	.endm
+
+SYM_FUNC_START(__pi_copy_mc_page)
+#include "copy_page_template.S"
+
+	mov x0, #0
+	ret
+
+9998:	mov x0, #-EFAULT
+	ret
+
+SYM_FUNC_END(__pi_copy_mc_page)
+SYM_FUNC_ALIAS(copy_mc_page, __pi_copy_mc_page)
+EXPORT_SYMBOL(copy_mc_page)
diff --git a/arch/arm64/lib/copy_page.S b/arch/arm64/lib/copy_page.S
index 6a56d7cf309d..5499f507bb75 100644
--- a/arch/arm64/lib/copy_page.S
+++ b/arch/arm64/lib/copy_page.S
@@ -17,52 +17,12 @@
  *	x0 - dest
  *	x1 - src
  */
-SYM_FUNC_START(__pi_copy_page)
-	ldp	x2, x3, [x1]
-	ldp	x4, x5, [x1, #16]
-	ldp	x6, x7, [x1, #32]
-	ldp	x8, x9, [x1, #48]
-	ldp	x10, x11, [x1, #64]
-	ldp	x12, x13, [x1, #80]
-	ldp	x14, x15, [x1, #96]
-	ldp	x16, x17, [x1, #112]
-
-	add	x0, x0, #256
-	add	x1, x1, #128
-1:
-	tst	x0, #(PAGE_SIZE - 1)
-
-	stnp	x2, x3, [x0, #-256]
-	ldp	x2, x3, [x1]
-	stnp	x4, x5, [x0, #16 - 256]
-	ldp	x4, x5, [x1, #16]
-	stnp	x6, x7, [x0, #32 - 256]
-	ldp	x6, x7, [x1, #32]
-	stnp	x8, x9, [x0, #48 - 256]
-	ldp	x8, x9, [x1, #48]
-	stnp	x10, x11, [x0, #64 - 256]
-	ldp	x10, x11, [x1, #64]
-	stnp	x12, x13, [x0, #80 - 256]
-	ldp	x12, x13, [x1, #80]
-	stnp	x14, x15, [x0, #96 - 256]
-	ldp	x14, x15, [x1, #96]
-	stnp	x16, x17, [x0, #112 - 256]
-	ldp	x16, x17, [x1, #112]
-
-	add	x0, x0, #128
-	add	x1, x1, #128
-
-	b.ne	1b
-
-	stnp	x2, x3, [x0, #-256]
-	stnp	x4, x5, [x0, #16 - 256]
-	stnp	x6, x7, [x0, #32 - 256]
-	stnp	x8, x9, [x0, #48 - 256]
-	stnp	x10, x11, [x0, #64 - 256]
-	stnp	x12, x13, [x0, #80 - 256]
-	stnp	x14, x15, [x0, #96 - 256]
-	stnp	x16, x17, [x0, #112 - 256]
+	.macro ldp1 reg1, reg2, ptr, val
+	ldp \reg1, \reg2, [\ptr, \val]
+	.endm
 
+SYM_FUNC_START(__pi_copy_page)
+#include "copy_page_template.S"
 	ret
 SYM_FUNC_END(__pi_copy_page)
 SYM_FUNC_ALIAS(copy_page, __pi_copy_page)
diff --git a/arch/arm64/lib/copy_page_template.S b/arch/arm64/lib/copy_page_template.S
new file mode 100644
index 000000000000..b3ddec2c7a27
--- /dev/null
+++ b/arch/arm64/lib/copy_page_template.S
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ */
+
+/*
+ * Copy a page from src to dest (both are page aligned)
+ *
+ * Parameters:
+ *	x0 - dest
+ *	x1 - src
+ */
+	ldp1	x2, x3, x1, #0
+	ldp1	x4, x5, x1, #16
+	ldp1	x6, x7, x1, #32
+	ldp1	x8, x9, x1, #48
+	ldp1	x10, x11, x1, #64
+	ldp1	x12, x13, x1, #80
+	ldp1	x14, x15, x1, #96
+	ldp1	x16, x17, x1, #112
+
+	add	x0, x0, #256
+	add	x1, x1, #128
+1:
+	tst	x0, #(PAGE_SIZE - 1)
+
+	stnp	x2, x3, [x0, #-256]
+	ldp1	x2, x3, x1, #0
+	stnp	x4, x5, [x0, #16 - 256]
+	ldp1	x4, x5, x1, #16
+	stnp	x6, x7, [x0, #32 - 256]
+	ldp1	x6, x7, x1, #32
+	stnp	x8, x9, [x0, #48 - 256]
+	ldp1	x8, x9, x1, #48
+	stnp	x10, x11, [x0, #64 - 256]
+	ldp1	x10, x11, x1, #64
+	stnp	x12, x13, [x0, #80 - 256]
+	ldp1	x12, x13, x1, #80
+	stnp	x14, x15, [x0, #96 - 256]
+	ldp1	x14, x15, x1, #96
+	stnp	x16, x17, [x0, #112 - 256]
+	ldp1	x16, x17, x1, #112
+
+	add	x0, x0, #128
+	add	x1, x1, #128
+
+	b.ne	1b
+
+	stnp	x2, x3, [x0, #-256]
+	stnp	x4, x5, [x0, #16 - 256]
+	stnp	x6, x7, [x0, #32 - 256]
+	stnp	x8, x9, [x0, #48 - 256]
+	stnp	x10, x11, [x0, #64 - 256]
+	stnp	x12, x13, [x0, #80 - 256]
+	stnp	x14, x15, [x0, #96 - 256]
+	stnp	x16, x17, [x0, #112 - 256]
diff --git a/arch/arm64/lib/mte.S b/arch/arm64/lib/mte.S
index 5018ac03b6bf..50ef24318281 100644
--- a/arch/arm64/lib/mte.S
+++ b/arch/arm64/lib/mte.S
@@ -80,6 +80,35 @@ SYM_FUNC_START(mte_copy_page_tags)
 	ret
 SYM_FUNC_END(mte_copy_page_tags)
 
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+/*
+ * Copy the tags from the source page to the destination one wiht machine check safe
+ *   x0 - address of the destination page
+ *   x1 - address of the source page
+ * Returns:
+ *   x0 - Return 0 if copy success, or
+ *        -EFAULT if anything goes wrong while copying.
+ */
+SYM_FUNC_START(mte_copy_mc_page_tags)
+	mov	x2, x0
+	mov	x3, x1
+	multitag_transfer_size x5, x6
+1:
+KERNEL_ME_SAFE(2f, ldgm	x4, [x3])
+	stgm	x4, [x2]
+	add	x2, x2, x5
+	add	x3, x3, x5
+	tst	x2, #(PAGE_SIZE - 1)
+	b.ne	1b
+
+	mov x0, #0
+	ret
+
+2:	mov x0, #-EFAULT
+	ret
+SYM_FUNC_END(mte_copy_mc_page_tags)
+#endif
+
 /*
  * Read tags from a user buffer (one tag per byte) and set the corresponding
  * tags at the given kernel address. Used by PTRACE_POKEMTETAGS.
diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index a7bb20055ce0..ff0d9ceea2a4 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -40,3 +40,48 @@ void copy_user_highpage(struct page *to, struct page *from,
 	flush_dcache_page(to);
 }
 EXPORT_SYMBOL_GPL(copy_user_highpage);
+
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+/*
+ * Return -EFAULT if anything goes wrong while copying page or mte.
+ */
+int copy_mc_highpage(struct page *to, struct page *from)
+{
+	void *kto = page_address(to);
+	void *kfrom = page_address(from);
+	int ret;
+
+	ret = copy_mc_page(kto, kfrom);
+	if (ret)
+		return -EFAULT;
+
+	if (kasan_hw_tags_enabled())
+		page_kasan_tag_reset(to);
+
+	if (system_supports_mte() && page_mte_tagged(from)) {
+		/* It's a new page, shouldn't have been tagged yet */
+		WARN_ON_ONCE(!try_page_mte_tagging(to));
+		ret = mte_copy_mc_page_tags(kto, kfrom);
+		if (ret)
+			return -EFAULT;
+
+		set_page_mte_tagged(to);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(copy_mc_highpage);
+
+int copy_mc_user_highpage(struct page *to, struct page *from,
+			unsigned long vaddr, struct vm_area_struct *vma)
+{
+	int ret;
+
+	ret = copy_mc_highpage(to, from);
+	if (!ret)
+		flush_dcache_page(to);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(copy_mc_user_highpage);
+#endif
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 64a567d5ad6f..7a8ddb2b67e6 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -332,6 +332,7 @@ static inline void copy_highpage(struct page *to, struct page *from)
 #endif
 
 #ifdef copy_mc_to_kernel
+#ifndef __HAVE_ARCH_COPY_MC_USER_HIGHPAGE
 /*
  * If architecture supports machine check exception handling, define the
  * #MC versions of copy_user_highpage and copy_highpage. They copy a memory
@@ -354,7 +355,9 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 
 	return ret ? -EFAULT : 0;
 }
+#endif
 
+#ifndef __HAVE_ARCH_COPY_MC_HIGHPAGE
 static inline int copy_mc_highpage(struct page *to, struct page *from)
 {
 	unsigned long ret;
@@ -370,20 +373,25 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
 
 	return ret ? -EFAULT : 0;
 }
+#endif
 #else
+#ifndef __HAVE_ARCH_COPY_MC_USER_HIGHPAGE
 static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 					unsigned long vaddr, struct vm_area_struct *vma)
 {
 	copy_user_highpage(to, from, vaddr, vma);
 	return 0;
 }
+#endif
 
+#ifndef __HAVE_ARCH_COPY_MC_HIGHPAGE
 static inline int copy_mc_highpage(struct page *to, struct page *from)
 {
 	copy_highpage(to, from);
 	return 0;
 }
 #endif
+#endif
 
 static inline void memcpy_page(struct page *dst_page, size_t dst_off,
 			       struct page *src_page, size_t src_off,
-- 
2.25.1

