Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F719FFDF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:03:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x30W3xRSzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:03:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x2xj0T7mzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 07:00:40 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 08B77AA55;
 Mon,  6 Apr 2020 21:00:37 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpcs: perf: consolidate perf_callchain_user_64 and
 perf_callchain_user_32
Date: Mon,  6 Apr 2020 23:00:22 +0200
Message-Id: <20200406210022.32265-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <1585896170.ohti800w9v.astroid@bobo.none>
References: <1585896170.ohti800w9v.astroid@bobo.none>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Namhyung Kim <namhyung@kernel.org>, Michal Suchanek <msuchanek@suse.de>,
 Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

perf_callchain_user_64 and perf_callchain_user_32 are nearly identical.
Consolidate into one function with thin wrappers.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/perf/callchain.h    | 24 +++++++++++++++++++++++-
 arch/powerpc/perf/callchain_32.c | 21 ++-------------------
 arch/powerpc/perf/callchain_64.c | 14 ++++----------
 3 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
index 7a2cb9e1181a..7540bb71cb60 100644
--- a/arch/powerpc/perf/callchain.h
+++ b/arch/powerpc/perf/callchain.h
@@ -2,7 +2,7 @@
 #ifndef _POWERPC_PERF_CALLCHAIN_H
 #define _POWERPC_PERF_CALLCHAIN_H
 
-int read_user_stack_slow(void __user *ptr, void *buf, int nb);
+int read_user_stack_slow(const void __user *ptr, void *buf, int nb);
 void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
 			    struct pt_regs *regs);
 void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
@@ -16,4 +16,26 @@ static inline bool invalid_user_sp(unsigned long sp)
 	return (!sp || (sp & mask) || (sp > top));
 }
 
+/*
+ * On 32-bit we just access the address and let hash_page create a
+ * HPTE if necessary, so there is no need to fall back to reading
+ * the page tables.  Since this is called at interrupt level,
+ * do_page_fault() won't treat a DSI as a page fault.
+ */
+static inline int __read_user_stack(const void __user *ptr, void *ret,
+				    size_t size)
+{
+	int rc;
+
+	if ((unsigned long)ptr > TASK_SIZE - size ||
+			((unsigned long)ptr & (size - 1)))
+		return -EFAULT;
+	rc = probe_user_read(ret, ptr, size);
+
+	if (rc && IS_ENABLED(CONFIG_PPC64))
+		return read_user_stack_slow(ptr, ret, size);
+
+	return rc;
+}
+
 #endif /* _POWERPC_PERF_CALLCHAIN_H */
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index 8aa951003141..1b4621f177e8 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -31,26 +31,9 @@
 
 #endif /* CONFIG_PPC64 */
 
-/*
- * On 32-bit we just access the address and let hash_page create a
- * HPTE if necessary, so there is no need to fall back to reading
- * the page tables.  Since this is called at interrupt level,
- * do_page_fault() won't treat a DSI as a page fault.
- */
-static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
+static int read_user_stack_32(const unsigned int __user *ptr, unsigned int *ret)
 {
-	int rc;
-
-	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
-	    ((unsigned long)ptr & 3))
-		return -EFAULT;
-
-	rc = probe_user_read(ret, ptr, sizeof(*ret));
-
-	if (IS_ENABLED(CONFIG_PPC64) && rc)
-		return read_user_stack_slow(ptr, ret, 4);
-
-	return rc;
+	return __read_user_stack(ptr, ret, sizeof(*ret);
 }
 
 /*
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index df1ffd8b20f2..55bbc25a54ed 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -24,7 +24,7 @@
  * interrupt context, so if the access faults, we read the page tables
  * to find which page (if any) is mapped and access it directly.
  */
-int read_user_stack_slow(void __user *ptr, void *buf, int nb)
+int read_user_stack_slow(const void __user *ptr, void *buf, int nb)
 {
 	int ret = -EFAULT;
 	pgd_t *pgdir;
@@ -65,16 +65,10 @@ int read_user_stack_slow(void __user *ptr, void *buf, int nb)
 	return ret;
 }
 
-static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
+static int read_user_stack_64(const unsigned long __user *ptr,
+			      unsigned long *ret)
 {
-	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned long) ||
-	    ((unsigned long)ptr & 7))
-		return -EFAULT;
-
-	if (!probe_user_read(ret, ptr, sizeof(*ret)))
-		return 0;
-
-	return read_user_stack_slow(ptr, ret, 8);
+	return __read_user_stack(ptr, ret, sizeof(*ret));
 }
 
 /*
-- 
2.23.0

