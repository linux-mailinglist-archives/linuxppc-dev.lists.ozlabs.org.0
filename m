Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61D552C14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 09:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRyqq6vnsz3dsj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 17:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRymp1JZ3z3f1g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 17:28:42 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LRykp3L90zkWPt;
	Tue, 21 Jun 2022 15:26:58 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 21 Jun 2022 15:27:04 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 21 Jun 2022 15:27:03 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -next v6 10/10] arm64: add cow to machine check safe
Date: Tue, 21 Jun 2022 07:26:38 +0000
Message-ID: <20220621072638.1273594-11-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621072638.1273594-1-tongtiangen@huawei.com>
References: <20220621072638.1273594-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the cow(copy on write) processing, the data of the user process is
copied, when hardware memory error is encountered during copy, only the
relevant processes are affected, so killing the user process and isolate
the user page with hardware memory errors is a more reasonable choice than
kernel panic.

Add new helper copy_page_mc() which provide a page copy implementation with
machine check safe. At present, only used in cow. In future, we can expand
more scenes. As long as the consequences of page copy failure are not
fatal(eg: only affect user process), we can use this helper.

The copy_page_mc() in copy_page_mc.S is largely borrows from copy_page()
in copy_page.S and the main difference is copy_page_mc() add extable entry
to every load/store insn to support machine check safe. largely to keep the
patch simple. If needed those optimizations can be folded in.

Add new extable type EX_TYPE_COPY_PAGE_MC which used in copy_page_mc().

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/asm-extable.h |  5 ++
 arch/arm64/include/asm/assembler.h   |  4 ++
 arch/arm64/include/asm/mte.h         |  4 ++
 arch/arm64/include/asm/page.h        | 10 ++++
 arch/arm64/lib/Makefile              |  2 +
 arch/arm64/lib/copy_page_mc.S        | 82 ++++++++++++++++++++++++++++
 arch/arm64/lib/mte.S                 | 19 +++++++
 arch/arm64/mm/copypage.c             | 41 +++++++++++---
 arch/arm64/mm/extable.c              |  9 +++
 include/linux/highmem.h              |  8 +++
 mm/memory.c                          |  2 +-
 11 files changed, 178 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/lib/copy_page_mc.S

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index 980d1dd8e1a3..969e2848ca13 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -10,6 +10,7 @@
 #define EX_TYPE_UACCESS_ERR_ZERO	2
 #define EX_TYPE_KACCESS_ERR_ZERO	3
 #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
+#define EX_TYPE_COPY_PAGE_MC		5
 
 /* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
 #define EX_DATA_REG_ERR_SHIFT	0
@@ -59,6 +60,10 @@
 	_ASM_EXTABLE_UACCESS(\insn, \fixup)
 	.endm
 
+	.macro          _asm_extable_copy_page_mc, insn, fixup
+	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_COPY_PAGE_MC, 0)
+	.endm
+
 /*
  * Create an exception table entry for `insn` if `fixup` is provided. Otherwise
  * do nothing.
diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index dc422fa437c2..44927fa3a844 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -168,6 +168,10 @@ lr	.req	x30		// link register
 #define CPU_LE(code...) code
 #endif
 
+#define CPY_MC(l, x...)		\
+9999:   x;			\
+	_asm_extable_copy_page_mc    9999b, l
+
 /*
  * Define a macro that constructs a 64-bit value by concatenating two
  * 32-bit registers. Note that on big endian systems the order of the
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index aa523591a44e..b8129f64cfea 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -40,6 +40,7 @@ void mte_free_tag_storage(char *storage);
 void mte_zero_clear_page_tags(void *addr);
 void mte_sync_tags(pte_t old_pte, pte_t pte);
 void mte_copy_page_tags(void *kto, const void *kfrom);
+void mte_copy_page_tags_mc(void *kto, const void *kfrom);
 void mte_thread_init_user(void);
 void mte_thread_switch(struct task_struct *next);
 void mte_suspend_enter(void);
@@ -63,6 +64,9 @@ static inline void mte_sync_tags(pte_t old_pte, pte_t pte)
 static inline void mte_copy_page_tags(void *kto, const void *kfrom)
 {
 }
+static inline void mte_copy_page_tags_mc(void *kto, const void *kfrom)
+{
+}
 static inline void mte_thread_init_user(void)
 {
 }
diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index 993a27ea6f54..832571a7dddb 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -29,6 +29,16 @@ void copy_user_highpage(struct page *to, struct page *from,
 void copy_highpage(struct page *to, struct page *from);
 #define __HAVE_ARCH_COPY_HIGHPAGE
 
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+extern void copy_page_mc(void *to, const void *from);
+void copy_highpage_mc(struct page *to, struct page *from);
+#define __HAVE_ARCH_COPY_HIGHPAGE_MC
+
+void copy_user_highpage_mc(struct page *to, struct page *from,
+		unsigned long vaddr, struct vm_area_struct *vma);
+#define __HAVE_ARCH_COPY_USER_HIGHPAGE_MC
+#endif
+
 struct page *alloc_zeroed_user_highpage_movable(struct vm_area_struct *vma,
 						unsigned long vaddr);
 #define __HAVE_ARCH_ALLOC_ZEROED_USER_HIGHPAGE_MOVABLE
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 29490be2546b..0d9f292ef68a 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -15,6 +15,8 @@ endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
+lib-$(CONFIG_ARCH_HAS_COPY_MC) += copy_page_mc.o
+
 obj-$(CONFIG_CRC32) += crc32.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/arm64/lib/copy_page_mc.S b/arch/arm64/lib/copy_page_mc.S
new file mode 100644
index 000000000000..65fcad1dd7c8
--- /dev/null
+++ b/arch/arm64/lib/copy_page_mc.S
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ */
+
+#include <linux/linkage.h>
+#include <linux/const.h>
+#include <asm/assembler.h>
+#include <asm/page.h>
+#include <asm/cpufeature.h>
+#include <asm/alternative.h>
+#include <asm/asm-extable.h>
+
+/*
+ * Copy a page from src to dest (both are page aligned) with machine check
+ *
+ * Parameters:
+ *	x0 - dest
+ *	x1 - src
+ */
+SYM_FUNC_START(__pi_copy_page_mc)
+alternative_if ARM64_HAS_NO_HW_PREFETCH
+	// Prefetch three cache lines ahead.
+	prfm	pldl1strm, [x1, #128]
+	prfm	pldl1strm, [x1, #256]
+	prfm	pldl1strm, [x1, #384]
+alternative_else_nop_endif
+
+CPY_MC(9998f, ldp	x2, x3, [x1])
+CPY_MC(9998f, ldp	x4, x5, [x1, #16])
+CPY_MC(9998f, ldp	x6, x7, [x1, #32])
+CPY_MC(9998f, ldp	x8, x9, [x1, #48])
+CPY_MC(9998f, ldp	x10, x11, [x1, #64])
+CPY_MC(9998f, ldp	x12, x13, [x1, #80])
+CPY_MC(9998f, ldp	x14, x15, [x1, #96])
+CPY_MC(9998f, ldp	x16, x17, [x1, #112])
+
+	add	x0, x0, #256
+	add	x1, x1, #128
+1:
+	tst	x0, #(PAGE_SIZE - 1)
+
+alternative_if ARM64_HAS_NO_HW_PREFETCH
+	prfm	pldl1strm, [x1, #384]
+alternative_else_nop_endif
+
+CPY_MC(9998f, stnp	x2, x3, [x0, #-256])
+CPY_MC(9998f, ldp	x2, x3, [x1])
+CPY_MC(9998f, stnp	x4, x5, [x0, #16 - 256])
+CPY_MC(9998f, ldp	x4, x5, [x1, #16])
+CPY_MC(9998f, stnp	x6, x7, [x0, #32 - 256])
+CPY_MC(9998f, ldp	x6, x7, [x1, #32])
+CPY_MC(9998f, stnp	x8, x9, [x0, #48 - 256])
+CPY_MC(9998f, ldp	x8, x9, [x1, #48])
+CPY_MC(9998f, stnp	x10, x11, [x0, #64 - 256])
+CPY_MC(9998f, ldp	x10, x11, [x1, #64])
+CPY_MC(9998f, stnp	x12, x13, [x0, #80 - 256])
+CPY_MC(9998f, ldp	x12, x13, [x1, #80])
+CPY_MC(9998f, stnp	x14, x15, [x0, #96 - 256])
+CPY_MC(9998f, ldp	x14, x15, [x1, #96])
+CPY_MC(9998f, stnp	x16, x17, [x0, #112 - 256])
+CPY_MC(9998f, ldp	x16, x17, [x1, #112])
+
+	add	x0, x0, #128
+	add	x1, x1, #128
+
+	b.ne	1b
+
+CPY_MC(9998f, stnp	x2, x3, [x0, #-256])
+CPY_MC(9998f, stnp	x4, x5, [x0, #16 - 256])
+CPY_MC(9998f, stnp	x6, x7, [x0, #32 - 256])
+CPY_MC(9998f, stnp	x8, x9, [x0, #48 - 256])
+CPY_MC(9998f, stnp	x10, x11, [x0, #64 - 256])
+CPY_MC(9998f, stnp	x12, x13, [x0, #80 - 256])
+CPY_MC(9998f, stnp	x14, x15, [x0, #96 - 256])
+CPY_MC(9998f, stnp	x16, x17, [x0, #112 - 256])
+
+9998:	ret
+
+SYM_FUNC_END(__pi_copy_page_mc)
+SYM_FUNC_ALIAS(copy_page_mc, __pi_copy_page_mc)
+EXPORT_SYMBOL(copy_page_mc)
diff --git a/arch/arm64/lib/mte.S b/arch/arm64/lib/mte.S
index eeb9e45bcce8..cf728a9f39b5 100644
--- a/arch/arm64/lib/mte.S
+++ b/arch/arm64/lib/mte.S
@@ -80,6 +80,25 @@ SYM_FUNC_START(mte_copy_page_tags)
 	ret
 SYM_FUNC_END(mte_copy_page_tags)
 
+/*
+ * Copy the tags from the source page to the destination one wiht machine check safe
+ *   x0 - address of the destination page
+ *   x1 - address of the source page
+ */
+SYM_FUNC_START(mte_copy_page_tags_mc)
+	mov	x2, x0
+	mov	x3, x1
+	multitag_transfer_size x5, x6
+1:
+CPY_MC(2f, ldgm	x4, [x3])
+	stgm	x4, [x2]
+	add	x2, x2, x5
+	add	x3, x3, x5
+	tst	x2, #(PAGE_SIZE - 1)
+	b.ne	1b
+2:	ret
+SYM_FUNC_END(mte_copy_page_tags_mc)
+
 /*
  * Read tags from a user buffer (one tag per byte) and set the corresponding
  * tags at the given kernel address. Used by PTRACE_POKEMTETAGS.
diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index 0dea80bf6de4..d68c5fc753a2 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -14,13 +14,8 @@
 #include <asm/cpufeature.h>
 #include <asm/mte.h>
 
-void copy_highpage(struct page *to, struct page *from)
+static void do_mte(struct page *to, struct page *from, void *kto, void *kfrom, bool mc)
 {
-	void *kto = page_address(to);
-	void *kfrom = page_address(from);
-
-	copy_page(kto, kfrom);
-
 	if (system_supports_mte() && test_bit(PG_mte_tagged, &from->flags)) {
 		set_bit(PG_mte_tagged, &to->flags);
 		page_kasan_tag_reset(to);
@@ -32,9 +27,21 @@ void copy_highpage(struct page *to, struct page *from)
 		 * the new page->flags are visible before the tags were updated.
 		 */
 		smp_wmb();
-		mte_copy_page_tags(kto, kfrom);
+		if (mc)
+			mte_copy_page_tags_mc(kto, kfrom);
+		else
+			mte_copy_page_tags(kto, kfrom);
 	}
 }
+
+void copy_highpage(struct page *to, struct page *from)
+{
+	void *kto = page_address(to);
+	void *kfrom = page_address(from);
+
+	copy_page(kto, kfrom);
+	do_mte(to, from, kto, kfrom, false);
+}
 EXPORT_SYMBOL(copy_highpage);
 
 void copy_user_highpage(struct page *to, struct page *from,
@@ -44,3 +51,23 @@ void copy_user_highpage(struct page *to, struct page *from,
 	flush_dcache_page(to);
 }
 EXPORT_SYMBOL_GPL(copy_user_highpage);
+
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+void copy_highpage_mc(struct page *to, struct page *from)
+{
+	void *kto = page_address(to);
+	void *kfrom = page_address(from);
+
+	copy_page_mc(kto, kfrom);
+	do_mte(to, from, kto, kfrom, true);
+}
+EXPORT_SYMBOL(copy_highpage_mc);
+
+void copy_user_highpage_mc(struct page *to, struct page *from,
+			unsigned long vaddr, struct vm_area_struct *vma)
+{
+	copy_highpage_mc(to, from);
+	flush_dcache_page(to);
+}
+EXPORT_SYMBOL_GPL(copy_user_highpage_mc);
+#endif
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 28ec35e3d210..b986333a3100 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -16,6 +16,13 @@ get_ex_fixup(const struct exception_table_entry *ex)
 	return ((unsigned long)&ex->fixup + ex->fixup);
 }
 
+static bool ex_handler_fixup(const struct exception_table_entry *ex,
+			     struct pt_regs *regs)
+{
+	regs->pc = get_ex_fixup(ex);
+	return true;
+}
+
 static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
 					struct pt_regs *regs)
 {
@@ -88,6 +95,8 @@ bool fixup_exception_mc(struct pt_regs *regs)
 	switch (ex->type) {
 	case EX_TYPE_UACCESS_ERR_ZERO:
 		return ex_handler_uaccess_err_zero(ex, regs);
+	case EX_TYPE_COPY_PAGE_MC:
+		return ex_handler_fixup(ex, regs);
 	}
 
 	return false;
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 22379a63e293..5ba234b89be5 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -318,6 +318,10 @@ static inline void copy_user_highpage(struct page *to, struct page *from,
 
 #endif
 
+#ifndef __HAVE_ARCH_COPY_USER_HIGHPAGE_MC
+#define copy_user_highpage_mc copy_user_highpage
+#endif
+
 #ifndef __HAVE_ARCH_COPY_HIGHPAGE
 
 static inline void copy_highpage(struct page *to, struct page *from)
@@ -333,6 +337,10 @@ static inline void copy_highpage(struct page *to, struct page *from)
 
 #endif
 
+#ifndef __HAVE_ARCH_COPY_HIGHPAGE_MC
+#define copy_highpage_mc copy_highpage
+#endif
+
 static inline void memcpy_page(struct page *dst_page, size_t dst_off,
 			       struct page *src_page, size_t src_off,
 			       size_t len)
diff --git a/mm/memory.c b/mm/memory.c
index fee2884481f2..7decc792a02d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2868,7 +2868,7 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
 	unsigned long addr = vmf->address;
 
 	if (likely(src)) {
-		copy_user_highpage(dst, src, addr, vma);
+		copy_user_highpage_mc(dst, src, addr, vma);
 		return true;
 	}
 
-- 
2.25.1

