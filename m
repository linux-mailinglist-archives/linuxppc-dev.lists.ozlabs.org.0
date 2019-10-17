Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D8DA326
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 03:29:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ts5z0rGNzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 12:29:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Row3BVm4"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ts0z1ZyfzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 12:25:23 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id r1so282301pgj.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlOCKK/87ao2YHg1b+fMfj/LaWGJtfOKqzSoMaiSqF4=;
 b=Row3BVm4DVbKWhjvDdMAPMmLP3ujE2nJY4Ak3MwfE6jcWDfqcMGQxmq3fpfyYjWMpb
 YHPy/nOM1ZurMLnbdC6yd2y7hEzCSosQLnAl32IOZIXfxXztLY2p9HvsoaX6A0zA+Hfy
 Zhrgg+tfSOObtS0XZoZ5ug69fGmNnOQbTALAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlOCKK/87ao2YHg1b+fMfj/LaWGJtfOKqzSoMaiSqF4=;
 b=Nfv+8M4BkHAkIb/u3iC4zyWqD0vkku73B37XtlyqiQPS9ROmYvg8wbxRBLchVvceSx
 MvpqN69EHhm6BcLTfiuRx/QFP7ozhkxd/fRod+G00d2flRfK5n5DXhg5kdGJr1NQ5Ajm
 8mGwexmeoyBcmOt+qhw9gxo1yaB2F8mgy4/bRgQjkq+QiWZsB1QVM+S8ixSw3rvn8SZA
 queQ2UIFMOpVS+sg63pC4L/kXfPPlfbrMNKen9DtAZdVUPWjAbLtOGneK0a0BlPK4+aJ
 JwksdSoGYK7NQyyjL6hU9kaSzTXVY2uzKNVGEYpmOC0tOgIUSkI8E9qHagLAqBPR9KF3
 5vxw==
X-Gm-Message-State: APjAAAV9Y8uEK/YDEpKnD+3/OPpt2hTlMN34zOyDMptPAaEV670DTNrd
 EM207qgBLfGfj6OjN7soc9Khwg==
X-Google-Smtp-Source: APXvYqwFfIEp4zaxhZk5gkvUN/m2xdHyRnlS5AhgxThgNkcmDlHdgbyzn8CoJecqqXNw2hIQUbb/nQ==
X-Received: by 2002:a63:ff08:: with SMTP id k8mr1228826pgi.8.1571275518486;
 Wed, 16 Oct 2019 18:25:18 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id d2sm282660pgq.74.2019.10.16.18.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 18:25:17 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v9 1/5] kasan: support backing vmalloc space with real shadow
 memory
Date: Thu, 17 Oct 2019 12:25:02 +1100
Message-Id: <20191017012506.28503-2-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017012506.28503-1-dja@axtens.net>
References: <20191017012506.28503-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hook into vmalloc and vmap, and dynamically allocate real shadow
memory to back the mappings.

Most mappings in vmalloc space are small, requiring less than a full
page of shadow space. Allocating a full shadow page per mapping would
therefore be wasteful. Furthermore, to ensure that different mappings
use different shadow pages, mappings would have to be aligned to
KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE.

Instead, share backing space across multiple mappings. Allocate a
backing page when a mapping in vmalloc space uses a particular page of
the shadow region. This page can be shared by other vmalloc mappings
later on.

We hook in to the vmap infrastructure to lazily clean up unused shadow
memory.

To avoid the difficulties around swapping mappings around, this code
expects that the part of the shadow region that covers the vmalloc
space will not be covered by the early shadow page, but will be left
unmapped. This will require changes in arch-specific code.

This allows KASAN with VMAP_STACK, and may be helpful for architectures
that do not have a separate module space (e.g. powerpc64, which I am
currently working on). It also allows relaxing the module alignment
back to PAGE_SIZE.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=202009
Acked-by: Vasily Gorbik <gor@linux.ibm.com>
Co-developed-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com> [shadow rework]
Signed-off-by: Daniel Axtens <dja@axtens.net>

--

[I haven't tried to resolve the question of spurious faults. My
understanding is that in order to see the issue, you'd need to:

  a) on CPU 0, allocate shadow memory for memory in the vmalloc or
     module region, where the allocation is located at a fixed
     address, and
  
  b) on CPU 1, access that shadow memory via the fixed address (to
     avoid the dependency that would otherwise require the correct
     ordering)

If this is an issue on x86, we can fix it in the x86 enablement
patch. Hopefully someone from x86land can let us know.]

v2: let kasan_unpoison_shadow deal with ranges that do not use a
    full shadow byte.

v3: relax module alignment
    rename to kasan_populate_vmalloc which is a much better name
    deal with concurrency correctly

v4: Mark's rework
    Poision pages on vfree
    Handle allocation failures

v5: Per Christophe Leroy, split out test and dynamically free pages.

v6: Guard freeing page properly. Drop WARN_ON_ONCE(pte_none(*ptep)),
     on reflection it's unnecessary debugging cruft with too high a
     false positive rate.

v7: tlb flush, thanks Mark.
    explain more clearly how freeing works and is concurrency-safe.

v9:  - Pull in Uladzislau Rezki's changes to better line up with the
       design of the new vmalloc implementation. Thanks Vlad.
     - clarify comment explaining smp_wmb() per Mark and Andrey's discussion
     - tighten up the allocation of backing memory so that it only
       happens for vmalloc or module  space allocations. Thanks Andrey
       Ryabinin.
     - A TLB flush in the freeing path, thanks Mark Rutland.
---
 Documentation/dev-tools/kasan.rst |  63 +++++++++
 include/linux/kasan.h             |  31 +++++
 include/linux/moduleloader.h      |   2 +-
 include/linux/vmalloc.h           |  12 ++
 lib/Kconfig.kasan                 |  16 +++
 mm/kasan/common.c                 | 211 ++++++++++++++++++++++++++++++
 mm/kasan/generic_report.c         |   3 +
 mm/kasan/kasan.h                  |   1 +
 mm/vmalloc.c                      |  48 ++++++-
 9 files changed, 381 insertions(+), 6 deletions(-)

diff --git Documentation/dev-tools/kasan.rst Documentation/dev-tools/kasan.rst
index 525296121d89..e4d66e7c50de 100644
--- Documentation/dev-tools/kasan.rst
+++ Documentation/dev-tools/kasan.rst
@@ -218,3 +218,66 @@ brk handler is used to print bug reports.
 A potential expansion of this mode is a hardware tag-based mode, which would
 use hardware memory tagging support instead of compiler instrumentation and
 manual shadow memory manipulation.
+
+What memory accesses are sanitised by KASAN?
+--------------------------------------------
+
+The kernel maps memory in a number of different parts of the address
+space. This poses something of a problem for KASAN, which requires
+that all addresses accessed by instrumented code have a valid shadow
+region.
+
+The range of kernel virtual addresses is large: there is not enough
+real memory to support a real shadow region for every address that
+could be accessed by the kernel.
+
+By default
+~~~~~~~~~~
+
+By default, architectures only map real memory over the shadow region
+for the linear mapping (and potentially other small areas). For all
+other areas - such as vmalloc and vmemmap space - a single read-only
+page is mapped over the shadow area. This read-only shadow page
+declares all memory accesses as permitted.
+
+This presents a problem for modules: they do not live in the linear
+mapping, but in a dedicated module space. By hooking in to the module
+allocator, KASAN can temporarily map real shadow memory to cover
+them. This allows detection of invalid accesses to module globals, for
+example.
+
+This also creates an incompatibility with ``VMAP_STACK``: if the stack
+lives in vmalloc space, it will be shadowed by the read-only page, and
+the kernel will fault when trying to set up the shadow data for stack
+variables.
+
+CONFIG_KASAN_VMALLOC
+~~~~~~~~~~~~~~~~~~~~
+
+With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
+cost of greater memory usage. Currently this is only supported on x86.
+
+This works by hooking into vmalloc and vmap, and dynamically
+allocating real shadow memory to back the mappings.
+
+Most mappings in vmalloc space are small, requiring less than a full
+page of shadow space. Allocating a full shadow page per mapping would
+therefore be wasteful. Furthermore, to ensure that different mappings
+use different shadow pages, mappings would have to be aligned to
+``KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE``.
+
+Instead, we share backing space across multiple mappings. We allocate
+a backing page when a mapping in vmalloc space uses a particular page
+of the shadow region. This page can be shared by other vmalloc
+mappings later on.
+
+We hook in to the vmap infrastructure to lazily clean up unused shadow
+memory.
+
+To avoid the difficulties around swapping mappings around, we expect
+that the part of the shadow region that covers the vmalloc space will
+not be covered by the early shadow page, but will be left
+unmapped. This will require changes in arch-specific code.
+
+This allows ``VMAP_STACK`` support on x86, and can simplify support of
+architectures that do not have a fixed module region.
diff --git include/linux/kasan.h include/linux/kasan.h
index cc8a03cc9674..4f404c565db1 100644
--- include/linux/kasan.h
+++ include/linux/kasan.h
@@ -70,8 +70,18 @@ struct kasan_cache {
 	int free_meta_offset;
 };
 
+/*
+ * These functions provide a special case to support backing module
+ * allocations with real shadow memory. With KASAN vmalloc, the special
+ * case is unnecessary, as the work is handled in the generic case.
+ */
+#ifndef CONFIG_KASAN_VMALLOC
 int kasan_module_alloc(void *addr, size_t size);
 void kasan_free_shadow(const struct vm_struct *vm);
+#else
+static inline int kasan_module_alloc(void *addr, size_t size) { return 0; }
+static inline void kasan_free_shadow(const struct vm_struct *vm) {}
+#endif
 
 int kasan_add_zero_shadow(void *start, unsigned long size);
 void kasan_remove_zero_shadow(void *start, unsigned long size);
@@ -194,4 +204,25 @@ static inline void *kasan_reset_tag(const void *addr)
 
 #endif /* CONFIG_KASAN_SW_TAGS */
 
+#ifdef CONFIG_KASAN_VMALLOC
+int kasan_populate_vmalloc(unsigned long requested_size,
+			   struct vm_struct *area);
+void kasan_poison_vmalloc(void *start, unsigned long size);
+void kasan_release_vmalloc(unsigned long start, unsigned long end,
+			   unsigned long free_region_start,
+			   unsigned long free_region_end);
+#else
+static inline int kasan_populate_vmalloc(unsigned long requested_size,
+					 struct vm_struct *area)
+{
+	return 0;
+}
+
+static inline void kasan_poison_vmalloc(void *start, unsigned long size) {}
+static inline void kasan_release_vmalloc(unsigned long start,
+					 unsigned long end,
+					 unsigned long free_region_start,
+					 unsigned long free_region_end) {}
+#endif
+
 #endif /* LINUX_KASAN_H */
diff --git include/linux/moduleloader.h include/linux/moduleloader.h
index 5229c18025e9..ca92aea8a6bd 100644
--- include/linux/moduleloader.h
+++ include/linux/moduleloader.h
@@ -91,7 +91,7 @@ void module_arch_cleanup(struct module *mod);
 /* Any cleanup before freeing mod->module_init */
 void module_arch_freeing_init(struct module *mod);
 
-#ifdef CONFIG_KASAN
+#if defined(CONFIG_KASAN) && !defined(CONFIG_KASAN_VMALLOC)
 #include <linux/kasan.h>
 #define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
 #else
diff --git include/linux/vmalloc.h include/linux/vmalloc.h
index 4e7809408073..61c43d1a29ca 100644
--- include/linux/vmalloc.h
+++ include/linux/vmalloc.h
@@ -22,6 +22,18 @@ struct notifier_block;		/* in notifier.h */
 #define VM_UNINITIALIZED	0x00000020	/* vm_struct is not fully initialized */
 #define VM_NO_GUARD		0x00000040      /* don't add guard page */
 #define VM_KASAN		0x00000080      /* has allocated kasan shadow memory */
+
+/*
+ * VM_KASAN is used slighly differently depending on CONFIG_KASAN_VMALLOC.
+ *
+ * If IS_ENABLED(CONFIG_KASAN_VMALLOC), VM_KASAN is set on a vm_struct after
+ * shadow memory has been mapped. It's used to handle allocation errors so that
+ * we don't try to poision shadow on free if it was never allocated.
+ *
+ * Otherwise, VM_KASAN is set for kasan_module_alloc() allocations and used to
+ * determine which allocations need the module shadow freed.
+ */
+
 /*
  * Memory with VM_FLUSH_RESET_PERMS cannot be freed in an interrupt or with
  * vfree_atomic().
diff --git lib/Kconfig.kasan lib/Kconfig.kasan
index 6c9682ce0254..81f5464ea9e1 100644
--- lib/Kconfig.kasan
+++ lib/Kconfig.kasan
@@ -6,6 +6,9 @@ config HAVE_ARCH_KASAN
 config HAVE_ARCH_KASAN_SW_TAGS
 	bool
 
+config	HAVE_ARCH_KASAN_VMALLOC
+	bool
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
@@ -142,6 +145,19 @@ config KASAN_SW_TAGS_IDENTIFY
 	  (use-after-free or out-of-bounds) at the cost of increased
 	  memory consumption.
 
+config KASAN_VMALLOC
+	bool "Back mappings in vmalloc space with real shadow memory"
+	depends on KASAN && HAVE_ARCH_KASAN_VMALLOC
+	help
+	  By default, the shadow region for vmalloc space is the read-only
+	  zero page. This means that KASAN cannot detect errors involving
+	  vmalloc space.
+
+	  Enabling this option will hook in to vmap/vmalloc and back those
+	  mappings with real shadow memory allocated on demand. This allows
+	  for KASAN to detect more sorts of errors (and to support vmapped
+	  stacks), but at the cost of higher memory usage.
+
 config TEST_KASAN
 	tristate "Module for testing KASAN for bug detection"
 	depends on m && KASAN
diff --git mm/kasan/common.c mm/kasan/common.c
index 6814d6d6a023..81521d180bec 100644
--- mm/kasan/common.c
+++ mm/kasan/common.c
@@ -36,6 +36,8 @@
 #include <linux/bug.h>
 #include <linux/uaccess.h>
 
+#include <asm/tlbflush.h>
+
 #include "kasan.h"
 #include "../slab.h"
 
@@ -590,6 +592,7 @@ void kasan_kfree_large(void *ptr, unsigned long ip)
 	/* The object will be poisoned by page_alloc. */
 }
 
+#ifndef CONFIG_KASAN_VMALLOC
 int kasan_module_alloc(void *addr, size_t size)
 {
 	void *ret;
@@ -625,6 +628,7 @@ void kasan_free_shadow(const struct vm_struct *vm)
 	if (vm->flags & VM_KASAN)
 		vfree(kasan_mem_to_shadow(vm->addr));
 }
+#endif
 
 extern void __kasan_report(unsigned long addr, size_t size, bool is_write, unsigned long ip);
 
@@ -744,3 +748,210 @@ static int __init kasan_memhotplug_init(void)
 
 core_initcall(kasan_memhotplug_init);
 #endif
+
+#ifdef CONFIG_KASAN_VMALLOC
+static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
+				      void *unused)
+{
+	unsigned long page;
+	pte_t pte;
+
+	if (likely(!pte_none(*ptep)))
+		return 0;
+
+	page = __get_free_page(GFP_KERNEL);
+	if (!page)
+		return -ENOMEM;
+
+	memset((void *)page, KASAN_VMALLOC_INVALID, PAGE_SIZE);
+	pte = pfn_pte(PFN_DOWN(__pa(page)), PAGE_KERNEL);
+
+	/*
+	 * This barrier is to ensure that the poisoning is fully written out
+	 * and visible to other CPUs before setting the PTE.
+	 *
+	 * We're relying on the absence of a TLB entry preventing another CPU
+	 * from loading the corresponding shadow shadow memory until its PTE
+	 * has been populated (after the poisioning is visible). Consequently
+	 * there is no barrier on the other side, and just a control-dependency
+	 * (which would be insufficient on its own).
+	 */
+	smp_wmb();
+
+	spin_lock(&init_mm.page_table_lock);
+	if (likely(pte_none(*ptep))) {
+		set_pte_at(&init_mm, addr, ptep, pte);
+		page = 0;
+	}
+	spin_unlock(&init_mm.page_table_lock);
+	if (page)
+		free_page(page);
+	return 0;
+}
+
+int kasan_populate_vmalloc(unsigned long requested_size, struct vm_struct *area)
+{
+	unsigned long shadow_start, shadow_end;
+	int ret;
+
+	shadow_start = (unsigned long)kasan_mem_to_shadow(area->addr);
+	shadow_start = ALIGN_DOWN(shadow_start, PAGE_SIZE);
+	shadow_end = (unsigned long)kasan_mem_to_shadow(area->addr +
+							area->size);
+	shadow_end = ALIGN(shadow_end, PAGE_SIZE);
+
+	ret = apply_to_page_range(&init_mm, shadow_start,
+				  shadow_end - shadow_start,
+				  kasan_populate_vmalloc_pte, NULL);
+	if (ret)
+		return ret;
+
+	kasan_unpoison_shadow(area->addr, requested_size);
+
+	area->flags |= VM_KASAN;
+
+	return 0;
+}
+
+/*
+ * Poison the shadow for a vmalloc region. Called as part of the
+ * freeing process at the time the region is freed.
+ */
+void kasan_poison_vmalloc(void *start, unsigned long size)
+{
+	size = round_up(size, KASAN_SHADOW_SCALE_SIZE);
+	kasan_poison_shadow(start, size, KASAN_VMALLOC_INVALID);
+}
+
+static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
+					void *unused)
+{
+	unsigned long page;
+
+	page = (unsigned long)__va(pte_pfn(*ptep) << PAGE_SHIFT);
+
+	spin_lock(&init_mm.page_table_lock);
+
+	if (likely(!pte_none(*ptep))) {
+		pte_clear(&init_mm, addr, ptep);
+		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+		free_page(page);
+	}
+	spin_unlock(&init_mm.page_table_lock);
+
+	return 0;
+}
+
+/*
+ * Release the backing for the vmalloc region [start, end), which
+ * lies within the free region [free_region_start, free_region_end).
+ *
+ * This can be run lazily, long after the region was freed. It runs
+ * under vmap_area_lock, so it's not safe to interact with the vmalloc/vmap
+ * infrastructure.
+ *
+ * How does this work?
+ * -------------------
+ *
+ * We have a region that is page aligned, labelled as A.
+ * That might not map onto the shadow in a way that is page-aligned:
+ *
+ *                    start                     end
+ *                    v                         v
+ * |????????|????????|AAAAAAAA|AA....AA|AAAAAAAA|????????| < vmalloc
+ *  -------- -------- --------          -------- --------
+ *      |        |       |                 |        |
+ *      |        |       |         /-------/        |
+ *      \-------\|/------/         |/---------------/
+ *              |||                ||
+ *             |??AAAAAA|AAAAAAAA|AA??????|                < shadow
+ *                 (1)      (2)      (3)
+ *
+ * First we align the start upwards and the end downwards, so that the
+ * shadow of the region aligns with shadow page boundaries. In the
+ * example, this gives us the shadow page (2). This is the shadow entirely
+ * covered by this allocation.
+ *
+ * Then we have the tricky bits. We want to know if we can free the
+ * partially covered shadow pages - (1) and (3) in the example. For this,
+ * we are given the start and end of the free region that contains this
+ * allocation. Extending our previous example, we could have:
+ *
+ *  free_region_start                                    free_region_end
+ *  |                 start                     end      |
+ *  v                 v                         v        v
+ * |FFFFFFFF|FFFFFFFF|AAAAAAAA|AA....AA|AAAAAAAA|FFFFFFFF| < vmalloc
+ *  -------- -------- --------          -------- --------
+ *      |        |       |                 |        |
+ *      |        |       |         /-------/        |
+ *      \-------\|/------/         |/---------------/
+ *              |||                ||
+ *             |FFAAAAAA|AAAAAAAA|AAF?????|                < shadow
+ *                 (1)      (2)      (3) 
+ *
+ * Once again, we align the start of the free region up, and the end of
+ * the free region down so that the shadow is page aligned. So we can free
+ * page (1) - we know no allocation currently uses anything in that page,
+ * because all of it is in the vmalloc free region. But we cannot free
+ * page (3), because we can't be sure that the rest of it is unused.
+ *
+ * We only consider pages that contain part of the original region for
+ * freeing: we don't try to free other pages from the free region or we'd
+ * end up trying to free huge chunks of virtual address space.
+ *
+ * Concurrency
+ * -----------
+ *
+ * How do we know that we're not freeing a page that is simultaneously
+ * being used for a fresh allocation in kasan_populate_vmalloc(_pte)?
+ *
+ * We _can_ have kasan_release_vmalloc and kasan_populate_vmalloc running
+ * at the same time. While we run under vmap_area_lock, the population
+ * code does not: alloc_vmap_area and the per-cpu allocator both take the
+ * lock before calling __alloc_vmap_area to identify and reserve a region,
+ * and both release the lock before we call kasan_populate_vmalloc.
+ *
+ * vmap_area_lock instead operates to ensure that the larger range
+ * [free_region_start, free_region_end) is safe: because __alloc_vmap_area
+ * is excluded, no space identified as free will become non-free while we
+ * are running. This means that so long as we are careful with alignment
+ * and only free shadow pages entirely covered by the free region, we will
+ * not run in to trouble - any simultaneous allocations will be for
+ * disjoint regions.
+ */
+void kasan_release_vmalloc(unsigned long start, unsigned long end,
+			   unsigned long free_region_start,
+			   unsigned long free_region_end)
+{
+	void *shadow_start, *shadow_end;
+	unsigned long region_start, region_end;
+
+	region_start = ALIGN(start, PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
+	region_end = ALIGN_DOWN(end, PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
+
+	free_region_start = ALIGN(free_region_start,
+				  PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
+
+	if (start != region_start &&
+	    free_region_start < region_start)
+		region_start -= PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE;
+
+	free_region_end = ALIGN_DOWN(free_region_end,
+				     PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
+
+	if (end != region_end &&
+	    free_region_end > region_end)
+		region_end += PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE;
+
+	shadow_start = kasan_mem_to_shadow((void *)region_start);
+	shadow_end = kasan_mem_to_shadow((void *)region_end);
+
+	if (shadow_end > shadow_start) {
+		apply_to_page_range(&init_mm, (unsigned long)shadow_start,
+				    (unsigned long)(shadow_end - shadow_start),
+				    kasan_depopulate_vmalloc_pte, NULL);
+		flush_tlb_kernel_range((unsigned long)shadow_start,
+				       (unsigned long)shadow_end);
+	}
+}
+#endif
diff --git mm/kasan/generic_report.c mm/kasan/generic_report.c
index 36c645939bc9..2d97efd4954f 100644
--- mm/kasan/generic_report.c
+++ mm/kasan/generic_report.c
@@ -86,6 +86,9 @@ static const char *get_shadow_bug_type(struct kasan_access_info *info)
 	case KASAN_ALLOCA_RIGHT:
 		bug_type = "alloca-out-of-bounds";
 		break;
+	case KASAN_VMALLOC_INVALID:
+		bug_type = "vmalloc-out-of-bounds";
+		break;
 	}
 
 	return bug_type;
diff --git mm/kasan/kasan.h mm/kasan/kasan.h
index 35cff6bbb716..3a083274628e 100644
--- mm/kasan/kasan.h
+++ mm/kasan/kasan.h
@@ -25,6 +25,7 @@
 #endif
 
 #define KASAN_GLOBAL_REDZONE    0xFA  /* redzone for global variable */
+#define KASAN_VMALLOC_INVALID   0xF9  /* unallocated space in vmapped page */
 
 /*
  * Stack redzone shadow values
diff --git mm/vmalloc.c mm/vmalloc.c
index 96903a6a763b..93e73644bdc9 100644
--- mm/vmalloc.c
+++ mm/vmalloc.c
@@ -682,7 +682,7 @@ insert_vmap_area_augment(struct vmap_area *va,
  * free area is inserted. If VA has been merged, it is
  * freed.
  */
-static __always_inline void
+static __always_inline struct vmap_area *
 merge_or_add_vmap_area(struct vmap_area *va,
 	struct rb_root *root, struct list_head *head)
 {
@@ -749,7 +749,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
 
 			/* Free vmap_area object. */
 			kmem_cache_free(vmap_area_cachep, va);
-			return;
+
+			/* Point to the new merged area. */
+			va = sibling;
+			merged = true;
 		}
 	}
 
@@ -758,6 +761,8 @@ merge_or_add_vmap_area(struct vmap_area *va,
 		link_va(va, root, parent, link, head);
 		augment_tree_propagate_from(va);
 	}
+
+	return va;
 }
 
 static __always_inline bool
@@ -1171,7 +1176,7 @@ static void __free_vmap_area(struct vmap_area *va)
 	/*
 	 * Merge VA with its neighbors, otherwise just add it.
 	 */
-	merge_or_add_vmap_area(va,
+	(void) merge_or_add_vmap_area(va,
 		&free_vmap_area_root, &free_vmap_area_list);
 }
 
@@ -1278,15 +1283,20 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end)
 	spin_lock(&vmap_area_lock);
 	llist_for_each_entry_safe(va, n_va, valist, purge_list) {
 		unsigned long nr = (va->va_end - va->va_start) >> PAGE_SHIFT;
+		unsigned long orig_start = va->va_start;
+		unsigned long orig_end = va->va_end;
 
 		/*
 		 * Finally insert or merge lazily-freed area. It is
 		 * detached and there is no need to "unlink" it from
 		 * anything.
 		 */
-		merge_or_add_vmap_area(va,
+		va = merge_or_add_vmap_area(va,
 			&free_vmap_area_root, &free_vmap_area_list);
 
+		kasan_release_vmalloc(orig_start,
+			orig_end, va->va_start, va->va_end);
+
 		atomic_long_sub(nr, &vmap_lazy_nr);
 
 		if (atomic_long_read(&vmap_lazy_nr) < resched_threshold)
@@ -2068,6 +2078,22 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
 
 	setup_vmalloc_vm(area, va, flags, caller);
 
+	/*
+	 * For KASAN, if we are in vmalloc space, we need to cover the shadow
+	 * area with real memory. If we come here through VM_ALLOC, this is
+	 * done by a higher level function that has access to the true size,
+	 * which might not be a full page.
+	 *
+	 * We assume module space comes via VM_ALLOC path.
+	 */
+	if (is_vmalloc_addr(area->addr) && !(area->flags & VM_ALLOC)) {
+		if (kasan_populate_vmalloc(area->size, area)) {
+			unmap_vmap_area(va);
+			kfree(area);
+			return NULL;
+		}
+	}
+
 	return area;
 }
 
@@ -2245,6 +2271,9 @@ static void __vunmap(const void *addr, int deallocate_pages)
 	debug_check_no_locks_freed(area->addr, get_vm_area_size(area));
 	debug_check_no_obj_freed(area->addr, get_vm_area_size(area));
 
+	if (area->flags & VM_KASAN)
+		kasan_poison_vmalloc(area->addr, area->size);
+
 	vm_remove_mappings(area, deallocate_pages);
 
 	if (deallocate_pages) {
@@ -2497,6 +2526,11 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	if (!addr)
 		return NULL;
 
+	if (is_vmalloc_or_module_addr(area->addr)) {
+		if (kasan_populate_vmalloc(real_size, area))
+			return NULL;
+	}
+
 	/*
 	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
 	 * flag. It means that vm_struct is not fully initialized.
@@ -3351,10 +3385,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	spin_unlock(&vmap_area_lock);
 
 	/* insert all vm's */
-	for (area = 0; area < nr_vms; area++)
+	for (area = 0; area < nr_vms; area++) {
 		setup_vmalloc_vm(vms[area], vas[area], VM_ALLOC,
 				 pcpu_get_vm_areas);
 
+		/* assume success here */
+		kasan_populate_vmalloc(sizes[area], vms[area]);
+	}
+
 	kfree(vas);
 	return vms;
 
-- 
2.20.1

