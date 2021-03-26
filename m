Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E734A558
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 11:12:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6HpM2fs7z3c1j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 21:12:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kObWXJ3X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kObWXJ3X; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Hnx179fz2yxh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 21:12:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F6Hnw1Z1lz9sWP; Fri, 26 Mar 2021 21:12:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616753524;
 bh=GUlHzL5n9whpu6Hf7LxDdPjQ1vuGmBimzHPNq4r/5Cc=;
 h=From:To:Subject:Date:From;
 b=kObWXJ3Xbv8h7C97A5v8jTHaQvvasw0gQjwu2UoJpG/MgATMpVvwoo2bMFTRQmW5X
 Gv0UmSXqrGQbBRC+4PH3jAwPrBzTTQFp0ILDgB4MxaCGwDrkcOt0/HX5bvq0xLjNWy
 kc+ichLHA6EAiU3nDAR3q9nRniK9YPd/WWwZT1uOWub9o9HqOR4sje83dblqAK//0T
 Slj06EDw80pkVcufDDvSWSvqryqlGwDC2gTssqlq1VVxbSD7iTIXYMlwfYKmW8Hzl+
 F0TGiwBpDkgv2V3YOhPHd8aebBzammdTUB3VG/zeucuDnQokRSMG9pwyY8KTw6M29l
 1XCXgX3nRDrhg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Move security code into security.c
Date: Fri, 26 Mar 2021 21:12:01 +1100
Message-Id: <20210326101201.1973552-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the original spectre/meltdown mitigations were merged we put them
in setup_64.c for lack of a better place.

Since then we created security.c for some of the other mitigation
related code. But it should all be in there.

This sort of code movement can cause trouble for backports, but
hopefully this code is relatively stable these days (famous last words).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/security.c | 261 ++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/setup_64.c | 264 ---------------------------------
 2 files changed, 261 insertions(+), 264 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index e4e1a94ccf6a..287286ddf7dc 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -7,6 +7,7 @@
 #include <linux/cpu.h>
 #include <linux/kernel.h>
 #include <linux/device.h>
+#include <linux/memblock.h>
 #include <linux/nospec.h>
 #include <linux/prctl.h>
 #include <linux/seq_buf.h>
@@ -18,6 +19,7 @@
 #include <asm/setup.h>
 #include <asm/inst.h>
 
+#include "setup.h"
 
 u64 powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
 
@@ -541,6 +543,178 @@ void setup_count_cache_flush(void)
 	toggle_branch_cache_flush(enable);
 }
 
+static enum l1d_flush_type enabled_flush_types;
+static void *l1d_flush_fallback_area;
+static bool no_rfi_flush;
+static bool no_entry_flush;
+static bool no_uaccess_flush;
+bool rfi_flush;
+static bool entry_flush;
+static bool uaccess_flush;
+DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
+EXPORT_SYMBOL(uaccess_flush_key);
+
+static int __init handle_no_rfi_flush(char *p)
+{
+	pr_info("rfi-flush: disabled on command line.");
+	no_rfi_flush = true;
+	return 0;
+}
+early_param("no_rfi_flush", handle_no_rfi_flush);
+
+static int __init handle_no_entry_flush(char *p)
+{
+	pr_info("entry-flush: disabled on command line.");
+	no_entry_flush = true;
+	return 0;
+}
+early_param("no_entry_flush", handle_no_entry_flush);
+
+static int __init handle_no_uaccess_flush(char *p)
+{
+	pr_info("uaccess-flush: disabled on command line.");
+	no_uaccess_flush = true;
+	return 0;
+}
+early_param("no_uaccess_flush", handle_no_uaccess_flush);
+
+/*
+ * The RFI flush is not KPTI, but because users will see doco that says to use
+ * nopti we hijack that option here to also disable the RFI flush.
+ */
+static int __init handle_no_pti(char *p)
+{
+	pr_info("rfi-flush: disabling due to 'nopti' on command line.\n");
+	handle_no_rfi_flush(NULL);
+	return 0;
+}
+early_param("nopti", handle_no_pti);
+
+static void do_nothing(void *unused)
+{
+	/*
+	 * We don't need to do the flush explicitly, just enter+exit kernel is
+	 * sufficient, the RFI exit handlers will do the right thing.
+	 */
+}
+
+void rfi_flush_enable(bool enable)
+{
+	if (enable) {
+		do_rfi_flush_fixups(enabled_flush_types);
+		on_each_cpu(do_nothing, NULL, 1);
+	} else
+		do_rfi_flush_fixups(L1D_FLUSH_NONE);
+
+	rfi_flush = enable;
+}
+
+static void entry_flush_enable(bool enable)
+{
+	if (enable) {
+		do_entry_flush_fixups(enabled_flush_types);
+		on_each_cpu(do_nothing, NULL, 1);
+	} else {
+		do_entry_flush_fixups(L1D_FLUSH_NONE);
+	}
+
+	entry_flush = enable;
+}
+
+static void uaccess_flush_enable(bool enable)
+{
+	if (enable) {
+		do_uaccess_flush_fixups(enabled_flush_types);
+		static_branch_enable(&uaccess_flush_key);
+		on_each_cpu(do_nothing, NULL, 1);
+	} else {
+		static_branch_disable(&uaccess_flush_key);
+		do_uaccess_flush_fixups(L1D_FLUSH_NONE);
+	}
+
+	uaccess_flush = enable;
+}
+
+static void __ref init_fallback_flush(void)
+{
+	u64 l1d_size, limit;
+	int cpu;
+
+	/* Only allocate the fallback flush area once (at boot time). */
+	if (l1d_flush_fallback_area)
+		return;
+
+	l1d_size = ppc64_caches.l1d.size;
+
+	/*
+	 * If there is no d-cache-size property in the device tree, l1d_size
+	 * could be zero. That leads to the loop in the asm wrapping around to
+	 * 2^64-1, and then walking off the end of the fallback area and
+	 * eventually causing a page fault which is fatal. Just default to
+	 * something vaguely sane.
+	 */
+	if (!l1d_size)
+		l1d_size = (64 * 1024);
+
+	limit = min(ppc64_bolted_size(), ppc64_rma_size);
+
+	/*
+	 * Align to L1d size, and size it at 2x L1d size, to catch possible
+	 * hardware prefetch runoff. We don't have a recipe for load patterns to
+	 * reliably avoid the prefetcher.
+	 */
+	l1d_flush_fallback_area = memblock_alloc_try_nid(l1d_size * 2,
+						l1d_size, MEMBLOCK_LOW_LIMIT,
+						limit, NUMA_NO_NODE);
+	if (!l1d_flush_fallback_area)
+		panic("%s: Failed to allocate %llu bytes align=0x%llx max_addr=%pa\n",
+		      __func__, l1d_size * 2, l1d_size, &limit);
+
+
+	for_each_possible_cpu(cpu) {
+		struct paca_struct *paca = paca_ptrs[cpu];
+		paca->rfi_flush_fallback_area = l1d_flush_fallback_area;
+		paca->l1d_flush_size = l1d_size;
+	}
+}
+
+void setup_rfi_flush(enum l1d_flush_type types, bool enable)
+{
+	if (types & L1D_FLUSH_FALLBACK) {
+		pr_info("rfi-flush: fallback displacement flush available\n");
+		init_fallback_flush();
+	}
+
+	if (types & L1D_FLUSH_ORI)
+		pr_info("rfi-flush: ori type flush available\n");
+
+	if (types & L1D_FLUSH_MTTRIG)
+		pr_info("rfi-flush: mttrig type flush available\n");
+
+	enabled_flush_types = types;
+
+	if (!cpu_mitigations_off() && !no_rfi_flush)
+		rfi_flush_enable(enable);
+}
+
+void setup_entry_flush(bool enable)
+{
+	if (cpu_mitigations_off())
+		return;
+
+	if (!no_entry_flush)
+		entry_flush_enable(enable);
+}
+
+void setup_uaccess_flush(bool enable)
+{
+	if (cpu_mitigations_off())
+		return;
+
+	if (!no_uaccess_flush)
+		uaccess_flush_enable(enable);
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int count_cache_flush_set(void *data, u64 val)
 {
@@ -579,5 +753,92 @@ static __init int count_cache_flush_debugfs_init(void)
 	return 0;
 }
 device_initcall(count_cache_flush_debugfs_init);
+
+static int rfi_flush_set(void *data, u64 val)
+{
+	bool enable;
+
+	if (val == 1)
+		enable = true;
+	else if (val == 0)
+		enable = false;
+	else
+		return -EINVAL;
+
+	/* Only do anything if we're changing state */
+	if (enable != rfi_flush)
+		rfi_flush_enable(enable);
+
+	return 0;
+}
+
+static int rfi_flush_get(void *data, u64 *val)
+{
+	*val = rfi_flush ? 1 : 0;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
+
+static int entry_flush_set(void *data, u64 val)
+{
+	bool enable;
+
+	if (val == 1)
+		enable = true;
+	else if (val == 0)
+		enable = false;
+	else
+		return -EINVAL;
+
+	/* Only do anything if we're changing state */
+	if (enable != entry_flush)
+		entry_flush_enable(enable);
+
+	return 0;
+}
+
+static int entry_flush_get(void *data, u64 *val)
+{
+	*val = entry_flush ? 1 : 0;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
+
+static int uaccess_flush_set(void *data, u64 val)
+{
+	bool enable;
+
+	if (val == 1)
+		enable = true;
+	else if (val == 0)
+		enable = false;
+	else
+		return -EINVAL;
+
+	/* Only do anything if we're changing state */
+	if (enable != uaccess_flush)
+		uaccess_flush_enable(enable);
+
+	return 0;
+}
+
+static int uaccess_flush_get(void *data, u64 *val)
+{
+	*val = uaccess_flush ? 1 : 0;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
+
+static __init int rfi_flush_debugfs_init(void)
+{
+	debugfs_create_file("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
+	debugfs_create_file("entry_flush", 0600, powerpc_debugfs_root, NULL, &fops_entry_flush);
+	debugfs_create_file("uaccess_flush", 0600, powerpc_debugfs_root, NULL, &fops_uaccess_flush);
+	return 0;
+}
+device_initcall(rfi_flush_debugfs_init);
 #endif /* CONFIG_DEBUG_FS */
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 04a31586f760..ccbfcc88758c 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -50,7 +50,6 @@
 #include <asm/setup.h>
 #include <asm/rtas.h>
 #include <asm/iommu.h>
-#include <asm/security_features.h>
 #include <asm/serial.h>
 #include <asm/cache.h>
 #include <asm/page.h>
@@ -942,266 +941,3 @@ static int __init disable_hardlockup_detector(void)
 	return 0;
 }
 early_initcall(disable_hardlockup_detector);
-
-#ifdef CONFIG_PPC_BOOK3S_64
-static enum l1d_flush_type enabled_flush_types;
-static void *l1d_flush_fallback_area;
-static bool no_rfi_flush;
-static bool no_entry_flush;
-static bool no_uaccess_flush;
-bool rfi_flush;
-static bool entry_flush;
-static bool uaccess_flush;
-DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
-EXPORT_SYMBOL(uaccess_flush_key);
-
-static int __init handle_no_rfi_flush(char *p)
-{
-	pr_info("rfi-flush: disabled on command line.");
-	no_rfi_flush = true;
-	return 0;
-}
-early_param("no_rfi_flush", handle_no_rfi_flush);
-
-static int __init handle_no_entry_flush(char *p)
-{
-	pr_info("entry-flush: disabled on command line.");
-	no_entry_flush = true;
-	return 0;
-}
-early_param("no_entry_flush", handle_no_entry_flush);
-
-static int __init handle_no_uaccess_flush(char *p)
-{
-	pr_info("uaccess-flush: disabled on command line.");
-	no_uaccess_flush = true;
-	return 0;
-}
-early_param("no_uaccess_flush", handle_no_uaccess_flush);
-
-/*
- * The RFI flush is not KPTI, but because users will see doco that says to use
- * nopti we hijack that option here to also disable the RFI flush.
- */
-static int __init handle_no_pti(char *p)
-{
-	pr_info("rfi-flush: disabling due to 'nopti' on command line.\n");
-	handle_no_rfi_flush(NULL);
-	return 0;
-}
-early_param("nopti", handle_no_pti);
-
-static void do_nothing(void *unused)
-{
-	/*
-	 * We don't need to do the flush explicitly, just enter+exit kernel is
-	 * sufficient, the RFI exit handlers will do the right thing.
-	 */
-}
-
-void rfi_flush_enable(bool enable)
-{
-	if (enable) {
-		do_rfi_flush_fixups(enabled_flush_types);
-		on_each_cpu(do_nothing, NULL, 1);
-	} else
-		do_rfi_flush_fixups(L1D_FLUSH_NONE);
-
-	rfi_flush = enable;
-}
-
-static void entry_flush_enable(bool enable)
-{
-	if (enable) {
-		do_entry_flush_fixups(enabled_flush_types);
-		on_each_cpu(do_nothing, NULL, 1);
-	} else {
-		do_entry_flush_fixups(L1D_FLUSH_NONE);
-	}
-
-	entry_flush = enable;
-}
-
-static void uaccess_flush_enable(bool enable)
-{
-	if (enable) {
-		do_uaccess_flush_fixups(enabled_flush_types);
-		static_branch_enable(&uaccess_flush_key);
-		on_each_cpu(do_nothing, NULL, 1);
-	} else {
-		static_branch_disable(&uaccess_flush_key);
-		do_uaccess_flush_fixups(L1D_FLUSH_NONE);
-	}
-
-	uaccess_flush = enable;
-}
-
-static void __ref init_fallback_flush(void)
-{
-	u64 l1d_size, limit;
-	int cpu;
-
-	/* Only allocate the fallback flush area once (at boot time). */
-	if (l1d_flush_fallback_area)
-		return;
-
-	l1d_size = ppc64_caches.l1d.size;
-
-	/*
-	 * If there is no d-cache-size property in the device tree, l1d_size
-	 * could be zero. That leads to the loop in the asm wrapping around to
-	 * 2^64-1, and then walking off the end of the fallback area and
-	 * eventually causing a page fault which is fatal. Just default to
-	 * something vaguely sane.
-	 */
-	if (!l1d_size)
-		l1d_size = (64 * 1024);
-
-	limit = min(ppc64_bolted_size(), ppc64_rma_size);
-
-	/*
-	 * Align to L1d size, and size it at 2x L1d size, to catch possible
-	 * hardware prefetch runoff. We don't have a recipe for load patterns to
-	 * reliably avoid the prefetcher.
-	 */
-	l1d_flush_fallback_area = memblock_alloc_try_nid(l1d_size * 2,
-						l1d_size, MEMBLOCK_LOW_LIMIT,
-						limit, NUMA_NO_NODE);
-	if (!l1d_flush_fallback_area)
-		panic("%s: Failed to allocate %llu bytes align=0x%llx max_addr=%pa\n",
-		      __func__, l1d_size * 2, l1d_size, &limit);
-
-
-	for_each_possible_cpu(cpu) {
-		struct paca_struct *paca = paca_ptrs[cpu];
-		paca->rfi_flush_fallback_area = l1d_flush_fallback_area;
-		paca->l1d_flush_size = l1d_size;
-	}
-}
-
-void setup_rfi_flush(enum l1d_flush_type types, bool enable)
-{
-	if (types & L1D_FLUSH_FALLBACK) {
-		pr_info("rfi-flush: fallback displacement flush available\n");
-		init_fallback_flush();
-	}
-
-	if (types & L1D_FLUSH_ORI)
-		pr_info("rfi-flush: ori type flush available\n");
-
-	if (types & L1D_FLUSH_MTTRIG)
-		pr_info("rfi-flush: mttrig type flush available\n");
-
-	enabled_flush_types = types;
-
-	if (!cpu_mitigations_off() && !no_rfi_flush)
-		rfi_flush_enable(enable);
-}
-
-void setup_entry_flush(bool enable)
-{
-	if (cpu_mitigations_off())
-		return;
-
-	if (!no_entry_flush)
-		entry_flush_enable(enable);
-}
-
-void setup_uaccess_flush(bool enable)
-{
-	if (cpu_mitigations_off())
-		return;
-
-	if (!no_uaccess_flush)
-		uaccess_flush_enable(enable);
-}
-
-#ifdef CONFIG_DEBUG_FS
-static int rfi_flush_set(void *data, u64 val)
-{
-	bool enable;
-
-	if (val == 1)
-		enable = true;
-	else if (val == 0)
-		enable = false;
-	else
-		return -EINVAL;
-
-	/* Only do anything if we're changing state */
-	if (enable != rfi_flush)
-		rfi_flush_enable(enable);
-
-	return 0;
-}
-
-static int rfi_flush_get(void *data, u64 *val)
-{
-	*val = rfi_flush ? 1 : 0;
-	return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
-
-static int entry_flush_set(void *data, u64 val)
-{
-	bool enable;
-
-	if (val == 1)
-		enable = true;
-	else if (val == 0)
-		enable = false;
-	else
-		return -EINVAL;
-
-	/* Only do anything if we're changing state */
-	if (enable != entry_flush)
-		entry_flush_enable(enable);
-
-	return 0;
-}
-
-static int entry_flush_get(void *data, u64 *val)
-{
-	*val = entry_flush ? 1 : 0;
-	return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
-
-static int uaccess_flush_set(void *data, u64 val)
-{
-	bool enable;
-
-	if (val == 1)
-		enable = true;
-	else if (val == 0)
-		enable = false;
-	else
-		return -EINVAL;
-
-	/* Only do anything if we're changing state */
-	if (enable != uaccess_flush)
-		uaccess_flush_enable(enable);
-
-	return 0;
-}
-
-static int uaccess_flush_get(void *data, u64 *val)
-{
-	*val = uaccess_flush ? 1 : 0;
-	return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
-
-static __init int rfi_flush_debugfs_init(void)
-{
-	debugfs_create_file("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
-	debugfs_create_file("entry_flush", 0600, powerpc_debugfs_root, NULL, &fops_entry_flush);
-	debugfs_create_file("uaccess_flush", 0600, powerpc_debugfs_root, NULL, &fops_uaccess_flush);
-	return 0;
-}
-device_initcall(rfi_flush_debugfs_init);
-#endif
-#endif /* CONFIG_PPC_BOOK3S_64 */
-- 
2.25.1

