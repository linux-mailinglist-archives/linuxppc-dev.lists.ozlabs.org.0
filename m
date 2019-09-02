Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5584A54C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:25:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MSRb0nvqzDqHq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:24:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="GtG/Nis3"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MSMp1fdwzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:21:42 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id 4so3795523pgm.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35kLk8FWSFCHJ2vyUXox/79mDbZ7yOtITd2Pmd0FvCc=;
 b=GtG/Nis3bbQsM0GWcJn23gYLozNlwiEHnEWPtcIBpcgHR6465HySs5hineOARCv016
 dybbg/kII7ByvxYt78Ic1yGzr7xpm2gx7aP31ySAXFJO6Bofpz+BG/wtEIuyrIY9ubW5
 UgNwiJmLJywMk3kD0KfH839lfpMBTzyyaQlLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35kLk8FWSFCHJ2vyUXox/79mDbZ7yOtITd2Pmd0FvCc=;
 b=RMcIfIJX27onPZkvCQxNfK3tclVWIpKY9HAaDuhzzKMDkZFoPFryfwvq1PNJlQ9l0m
 5FnWynJxrK7J13UJOWCw/XnQtc1hls3JeaoZVx3IFdAanWvOnx5T0WTsvwwNq8D087nR
 7p9ihMnUiFh+aPmuS4hcuNFcYKsU5oAfC0lu6U9nzpJ1Z0QFYSVWmgSvt7ZoKN11K5px
 /bk3/wJXWFnWyb+uTB1Sh2ETa+Y+LCik8eH8RNxNF8dy92Mn/NMsX0vXaQCKJXXb+jLb
 uVLQNN3iUfFxBTV/VgC8g8olEgKw3FeSXUHgXkUNoMzPPD7t6V28KzTu/eudkeIQld6X
 vtBA==
X-Gm-Message-State: APjAAAXsNI5YNDeNVHgXx91bMRrJu+yq7V4N71DG6z+Kj+MhlNePzjf7
 FMQD2CVQqodBO882l505aTl4hg==
X-Google-Smtp-Source: APXvYqx7iZ9fAIfid8QKwriP+0ee2AO+hbTpvghXGf0XMY7cc3JXvHaiZXjbAk3ICSVKo3ivhnbstw==
X-Received: by 2002:a63:4b02:: with SMTP id y2mr24205868pga.135.1567423299416; 
 Mon, 02 Sep 2019 04:21:39 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id q33sm22778857pja.29.2019.09.02.04.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:21:38 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v6 1/5] kasan: support backing vmalloc space with real shadow
 memory
Date: Mon,  2 Sep 2019 21:20:24 +1000
Message-Id: <20190902112028.23773-2-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902112028.23773-1-dja@axtens.net>
References: <20190902112028.23773-1-dja@axtens.net>
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
Signed-off-by: Daniel Axtens <dja@axtens.net>
[Mark: rework shadow allocation]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>

--

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
---
 Documentation/dev-tools/kasan.rst |  63 ++++++++++++++
 include/linux/kasan.h             |  31 +++++++
 include/linux/moduleloader.h      |   2 +-
 include/linux/vmalloc.h           |  12 +++
 lib/Kconfig.kasan                 |  16 ++++
 mm/kasan/common.c                 | 139 ++++++++++++++++++++++++++++++
 mm/kasan/generic_report.c         |   3 +
 mm/kasan/kasan.h                  |   1 +
 mm/vmalloc.c                      |  45 +++++++++-
 9 files changed, 310 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index b72d07d70239..bdb92c3de7a5 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -215,3 +215,66 @@ brk handler is used to print bug reports.
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
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index cc8a03cc9674..4f404c565db1 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
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
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 5229c18025e9..ca92aea8a6bd 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -91,7 +91,7 @@ void module_arch_cleanup(struct module *mod);
 /* Any cleanup before freeing mod->module_init */
 void module_arch_freeing_init(struct module *mod);
 
-#ifdef CONFIG_KASAN
+#if defined(CONFIG_KASAN) && !defined(CONFIG_KASAN_VMALLOC)
 #include <linux/kasan.h>
 #define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
 #else
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index a1334bd18ef1..01bd08f0f52f 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -21,6 +21,18 @@ struct notifier_block;		/* in notifier.h */
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
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index 6c9682ce0254..81f5464ea9e1 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
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
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 6814d6d6a023..0b5141108cdc 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -590,6 +590,7 @@ void kasan_kfree_large(void *ptr, unsigned long ip)
 	/* The object will be poisoned by page_alloc. */
 }
 
+#ifndef CONFIG_KASAN_VMALLOC
 int kasan_module_alloc(void *addr, size_t size)
 {
 	void *ret;
@@ -625,6 +626,7 @@ void kasan_free_shadow(const struct vm_struct *vm)
 	if (vm->flags & VM_KASAN)
 		vfree(kasan_mem_to_shadow(vm->addr));
 }
+#endif
 
 extern void __kasan_report(unsigned long addr, size_t size, bool is_write, unsigned long ip);
 
@@ -744,3 +746,140 @@ static int __init kasan_memhotplug_init(void)
 
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
+	 * Ensure poisoning is visible before the shadow is made visible
+	 * to other CPUs.
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
+ */
+void kasan_release_vmalloc(unsigned long start, unsigned long end,
+			   unsigned long free_region_start,
+			   unsigned long free_region_end)
+{
+	void *shadow_start, *shadow_end;
+	unsigned long region_start, region_end;
+
+	/* we start with shadow entirely covered by this region */
+	region_start = ALIGN(start, PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
+	region_end = ALIGN_DOWN(end, PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
+
+	/*
+	 * We don't want to extend the region we release to the entire free
+	 * region, as the free region might cover huge chunks of vmalloc space
+	 * where we never allocated anything. We just want to see if we can
+	 * extend the [start, end) range: if start or end fall part way through
+	 * a shadow page, we want to check if we can free that entire page.
+	 */
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
+	if (shadow_end > shadow_start)
+		apply_to_page_range(&init_mm, (unsigned long)shadow_start,
+				    (unsigned long)(shadow_end - shadow_start),
+				    kasan_depopulate_vmalloc_pte, NULL);
+}
+#endif
diff --git a/mm/kasan/generic_report.c b/mm/kasan/generic_report.c
index 36c645939bc9..2d97efd4954f 100644
--- a/mm/kasan/generic_report.c
+++ b/mm/kasan/generic_report.c
@@ -86,6 +86,9 @@ static const char *get_shadow_bug_type(struct kasan_access_info *info)
 	case KASAN_ALLOCA_RIGHT:
 		bug_type = "alloca-out-of-bounds";
 		break;
+	case KASAN_VMALLOC_INVALID:
+		bug_type = "vmalloc-out-of-bounds";
+		break;
 	}
 
 	return bug_type;
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 35cff6bbb716..3a083274628e 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -25,6 +25,7 @@
 #endif
 
 #define KASAN_GLOBAL_REDZONE    0xFA  /* redzone for global variable */
+#define KASAN_VMALLOC_INVALID   0xF9  /* unallocated space in vmapped page */
 
 /*
  * Stack redzone shadow values
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index b8101030f79e..bf806566cad0 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -690,8 +690,19 @@ merge_or_add_vmap_area(struct vmap_area *va,
 	struct list_head *next;
 	struct rb_node **link;
 	struct rb_node *parent;
+	unsigned long orig_start, orig_end;
 	bool merged = false;
 
+	/*
+	 * To manage KASAN vmalloc memory usage, we use this opportunity to
+	 * clean up the shadow memory allocated to back this allocation.
+	 * Because a vmalloc shadow page covers several pages, the start or end
+	 * of an allocation might not align with a shadow page. Use the merging
+	 * opportunities to try to extend the region we can release.
+	 */
+	orig_start = va->va_start;
+	orig_end = va->va_end;
+
 	/*
 	 * Find a place in the tree where VA potentially will be
 	 * inserted, unless it is merged with its sibling/siblings.
@@ -741,6 +752,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
 		if (sibling->va_end == va->va_start) {
 			sibling->va_end = va->va_end;
 
+			kasan_release_vmalloc(orig_start, orig_end,
+					      sibling->va_start,
+					      sibling->va_end);
+
 			/* Check and update the tree if needed. */
 			augment_tree_propagate_from(sibling);
 
@@ -754,6 +769,8 @@ merge_or_add_vmap_area(struct vmap_area *va,
 	}
 
 insert:
+	kasan_release_vmalloc(orig_start, orig_end, va->va_start, va->va_end);
+
 	if (!merged) {
 		link_va(va, root, parent, link, head);
 		augment_tree_propagate_from(va);
@@ -2068,6 +2085,22 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
 
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
 
@@ -2245,6 +2278,9 @@ static void __vunmap(const void *addr, int deallocate_pages)
 	debug_check_no_locks_freed(area->addr, get_vm_area_size(area));
 	debug_check_no_obj_freed(area->addr, get_vm_area_size(area));
 
+	if (area->flags & VM_KASAN)
+		kasan_poison_vmalloc(area->addr, area->size);
+
 	vm_remove_mappings(area, deallocate_pages);
 
 	if (deallocate_pages) {
@@ -2495,6 +2531,9 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	if (!addr)
 		return NULL;
 
+	if (kasan_populate_vmalloc(real_size, area))
+		return NULL;
+
 	/*
 	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
 	 * flag. It means that vm_struct is not fully initialized.
@@ -3349,10 +3388,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
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

