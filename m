Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E635936E610
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6gc65dcz3cmT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:33:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:111;
 helo=mout-y-111.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org
 [IPv6:2001:67c:2050:1::465:111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6cg6b7yz2yxP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:15 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4FW6PV1TFHzQjp4;
 Thu, 29 Apr 2021 09:21:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id wUODJZPqggbl; Thu, 29 Apr 2021 09:21:31 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/11] powerpc/64s: Add ability to skip SLB preload
Date: Thu, 29 Apr 2021 02:20:51 -0500
Message-Id: <20210429072057.8870-6-cmr@bluescreens.de>
In-Reply-To: <20210429072057.8870-1-cmr@bluescreens.de>
References: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.57 / 15.00 / 15.00
X-Rspamd-Queue-Id: 418D917F6
X-Rspamd-UID: ea0d8a
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switching to a different mm with Hash translation causes SLB entries to
be preloaded from the current thread_info. This reduces SLB faults, for
example when threads share a common mm but operate on different address
ranges.

Preloading entries from the thread_info struct may not always be
appropriate - such as when switching to a temporary mm. Introduce a new
boolean in mm_context_t to skip the SLB preload entirely. Also move the
SLB preload code into a separate function since switch_slb() is already
quite long. The default behavior (preloading SLB entries from the
current thread_info struct) remains unchanged.

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v4:  * New to series.
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
 arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
 arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
 arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++----------
 4 files changed, 50 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index eace8c3f7b0a1..b23a9dcdee5af 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -130,6 +130,9 @@ typedef struct {
 	u32 pkey_allocation_map;
 	s16 execute_only_pkey; /* key holding execute-only protection */
 #endif
+
+	/* Do not preload SLB entries from thread_info during switch_slb() */
+	bool skip_slb_preload;
 } mm_context_t;
 
 static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 4bc45d3ed8b0e..264787e90b1a1 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
 	return 0;
 }
 
+#ifdef CONFIG_PPC_BOOK3S_64
+
+static inline void skip_slb_preload_mm(struct mm_struct *mm)
+{
+	mm->context.skip_slb_preload = true;
+}
+
+#else
+
+static inline void skip_slb_preload_mm(struct mm_struct *mm) {}
+
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 #include <asm-generic/mmu_context.h>
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index c10fc8a72fb37..3479910264c59 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -202,6 +202,8 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 	atomic_set(&mm->context.active_cpus, 0);
 	atomic_set(&mm->context.copros, 0);
 
+	mm->context.skip_slb_preload = false;
+
 	return 0;
 }
 
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c91bd85eb90e3..da0836cb855af 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned int index)
 	asm volatile("slbie %0" : : "r" (slbie_data));
 }
 
+static void preload_slb_entries(struct task_struct *tsk, struct mm_struct *mm)
+{
+	struct thread_info *ti = task_thread_info(tsk);
+	unsigned char i;
+
+	/*
+	 * We gradually age out SLBs after a number of context switches to
+	 * reduce reload overhead of unused entries (like we do with FP/VEC
+	 * reload). Each time we wrap 256 switches, take an entry out of the
+	 * SLB preload cache.
+	 */
+	tsk->thread.load_slb++;
+	if (!tsk->thread.load_slb) {
+		unsigned long pc = KSTK_EIP(tsk);
+
+		preload_age(ti);
+		preload_add(ti, pc);
+	}
+
+	for (i = 0; i < ti->slb_preload_nr; i++) {
+		unsigned char idx;
+		unsigned long ea;
+
+		idx = (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
+		ea = (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
+
+		slb_allocate_user(mm, ea);
+	}
+}
+
 /* Flush all user entries from the segment table of the current processor. */
 void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 {
-	struct thread_info *ti = task_thread_info(tsk);
 	unsigned char i;
 
 	/*
@@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 
 	copy_mm_to_paca(mm);
 
-	/*
-	 * We gradually age out SLBs after a number of context switches to
-	 * reduce reload overhead of unused entries (like we do with FP/VEC
-	 * reload). Each time we wrap 256 switches, take an entry out of the
-	 * SLB preload cache.
-	 */
-	tsk->thread.load_slb++;
-	if (!tsk->thread.load_slb) {
-		unsigned long pc = KSTK_EIP(tsk);
-
-		preload_age(ti);
-		preload_add(ti, pc);
-	}
-
-	for (i = 0; i < ti->slb_preload_nr; i++) {
-		unsigned char idx;
-		unsigned long ea;
-
-		idx = (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
-		ea = (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
-
-		slb_allocate_user(mm, ea);
-	}
+	if (!mm->context.skip_slb_preload)
+		preload_slb_entries(tsk, mm);
 
 	/*
 	 * Synchronize slbmte preloads with possible subsequent user memory
-- 
2.26.1

