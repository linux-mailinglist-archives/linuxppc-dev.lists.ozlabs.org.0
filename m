Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B815825C448
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 17:08:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj41d4WTszDqtK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 01:08:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+0324f78733eae8ed4bec+6220+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=ano1KxC9; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj31g2h5qzDr3h
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 00:23:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=B6771Z78+EjFEl66FRYSdFSUZAia5cb3z6J6dPED0dc=; b=ano1KxC9m3ViDX/61fzt8/FHMf
 RYHXWlYGDttZ0+lgsMWL4w8BpYaRnZtOMa9rrOQLMX33RlH5va3GXXHqre/VPKXxVaQjLpLs9+JLS
 pNYAQk67L8tsuNGSuVJn4Zfkc6wZ1Rz8Un47lKNDI2PPFupe6j4PP8Ajy2diXmkk1/786NG4JqG1s
 HpADYcsco56ugQCOTW4Vik4gMhVdYF6aiqtpfbHrCuaICF4S3OglJLXESWBI/ffhk7zEpieJ++kMW
 bo5eC+DQfcCyEPZrKwWurPrb4oLT3TgydSQ96TbdxijgdvIaJ3aoI9bHG61jifWO6nKrLXYgRZvB8
 dFeOgvBA==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDq8e-0004bg-GP; Thu, 03 Sep 2020 14:22:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 10/14] x86: move PAGE_OFFSET, TASK_SIZE & friends to page_{32,
 64}_types.h
Date: Thu,  3 Sep 2020 16:22:38 +0200
Message-Id: <20200903142242.925828-11-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903142242.925828-1-hch@lst.de>
References: <20200903142242.925828-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At least for 64-bit this moves them closer to some of the defines
they are based on, and it prepares for using the TASK_SIZE_MAX
definition from assembly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/include/asm/page_32_types.h | 11 +++++++
 arch/x86/include/asm/page_64_types.h | 38 +++++++++++++++++++++
 arch/x86/include/asm/processor.h     | 49 ----------------------------
 3 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/arch/x86/include/asm/page_32_types.h b/arch/x86/include/asm/page_32_types.h
index 565ad755c785e2..26236925fb2c36 100644
--- a/arch/x86/include/asm/page_32_types.h
+++ b/arch/x86/include/asm/page_32_types.h
@@ -41,6 +41,17 @@
 #define __VIRTUAL_MASK_SHIFT	32
 #endif	/* CONFIG_X86_PAE */
 
+/*
+ * User space process size: 3GB (default).
+ */
+#define IA32_PAGE_OFFSET	PAGE_OFFSET
+#define TASK_SIZE		PAGE_OFFSET
+#define TASK_SIZE_LOW		TASK_SIZE
+#define TASK_SIZE_MAX		TASK_SIZE
+#define DEFAULT_MAP_WINDOW	TASK_SIZE
+#define STACK_TOP		TASK_SIZE
+#define STACK_TOP_MAX		STACK_TOP
+
 /*
  * Kernel image size is limited to 512 MB (see in arch/x86/kernel/head_32.S)
  */
diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index 288b065955b729..996595c9897e0a 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -58,6 +58,44 @@
 #define __VIRTUAL_MASK_SHIFT	47
 #endif
 
+/*
+ * User space process size.  This is the first address outside the user range.
+ * There are a few constraints that determine this:
+ *
+ * On Intel CPUs, if a SYSCALL instruction is at the highest canonical
+ * address, then that syscall will enter the kernel with a
+ * non-canonical return address, and SYSRET will explode dangerously.
+ * We avoid this particular problem by preventing anything executable
+ * from being mapped at the maximum canonical address.
+ *
+ * On AMD CPUs in the Ryzen family, there's a nasty bug in which the
+ * CPUs malfunction if they execute code from the highest canonical page.
+ * They'll speculate right off the end of the canonical space, and
+ * bad things happen.  This is worked around in the same way as the
+ * Intel problem.
+ *
+ * With page table isolation enabled, we map the LDT in ... [stay tuned]
+ */
+#define TASK_SIZE_MAX	((1UL << __VIRTUAL_MASK_SHIFT) - PAGE_SIZE)
+
+#define DEFAULT_MAP_WINDOW	((1UL << 47) - PAGE_SIZE)
+
+/* This decides where the kernel will search for a free chunk of vm
+ * space during mmap's.
+ */
+#define IA32_PAGE_OFFSET	((current->personality & ADDR_LIMIT_3GB) ? \
+					0xc0000000 : 0xFFFFe000)
+
+#define TASK_SIZE_LOW		(test_thread_flag(TIF_ADDR32) ? \
+					IA32_PAGE_OFFSET : DEFAULT_MAP_WINDOW)
+#define TASK_SIZE		(test_thread_flag(TIF_ADDR32) ? \
+					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
+#define TASK_SIZE_OF(child)	((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
+					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
+
+#define STACK_TOP		TASK_SIZE_LOW
+#define STACK_TOP_MAX		TASK_SIZE_MAX
+
 /*
  * Maximum kernel image size is limited to 1 GiB, due to the fixmap living
  * in the next 1 GiB (see level2_kernel_pgt in arch/x86/kernel/head_64.S).
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 97143d87994c24..1618eeb08361a9 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -782,17 +782,6 @@ static inline void spin_lock_prefetch(const void *x)
 })
 
 #ifdef CONFIG_X86_32
-/*
- * User space process size: 3GB (default).
- */
-#define IA32_PAGE_OFFSET	PAGE_OFFSET
-#define TASK_SIZE		PAGE_OFFSET
-#define TASK_SIZE_LOW		TASK_SIZE
-#define TASK_SIZE_MAX		TASK_SIZE
-#define DEFAULT_MAP_WINDOW	TASK_SIZE
-#define STACK_TOP		TASK_SIZE
-#define STACK_TOP_MAX		STACK_TOP
-
 #define INIT_THREAD  {							  \
 	.sp0			= TOP_OF_INIT_STACK,			  \
 	.sysenter_cs		= __KERNEL_CS,				  \
@@ -802,44 +791,6 @@ static inline void spin_lock_prefetch(const void *x)
 #define KSTK_ESP(task)		(task_pt_regs(task)->sp)
 
 #else
-/*
- * User space process size.  This is the first address outside the user range.
- * There are a few constraints that determine this:
- *
- * On Intel CPUs, if a SYSCALL instruction is at the highest canonical
- * address, then that syscall will enter the kernel with a
- * non-canonical return address, and SYSRET will explode dangerously.
- * We avoid this particular problem by preventing anything executable
- * from being mapped at the maximum canonical address.
- *
- * On AMD CPUs in the Ryzen family, there's a nasty bug in which the
- * CPUs malfunction if they execute code from the highest canonical page.
- * They'll speculate right off the end of the canonical space, and
- * bad things happen.  This is worked around in the same way as the
- * Intel problem.
- *
- * With page table isolation enabled, we map the LDT in ... [stay tuned]
- */
-#define TASK_SIZE_MAX	((1UL << __VIRTUAL_MASK_SHIFT) - PAGE_SIZE)
-
-#define DEFAULT_MAP_WINDOW	((1UL << 47) - PAGE_SIZE)
-
-/* This decides where the kernel will search for a free chunk of vm
- * space during mmap's.
- */
-#define IA32_PAGE_OFFSET	((current->personality & ADDR_LIMIT_3GB) ? \
-					0xc0000000 : 0xFFFFe000)
-
-#define TASK_SIZE_LOW		(test_thread_flag(TIF_ADDR32) ? \
-					IA32_PAGE_OFFSET : DEFAULT_MAP_WINDOW)
-#define TASK_SIZE		(test_thread_flag(TIF_ADDR32) ? \
-					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
-#define TASK_SIZE_OF(child)	((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
-					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
-
-#define STACK_TOP		TASK_SIZE_LOW
-#define STACK_TOP_MAX		TASK_SIZE_MAX
-
 #define INIT_THREAD  {						\
 	.addr_limit		= KERNEL_DS,			\
 }
-- 
2.28.0

