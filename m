Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A52C6FDA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 17:12:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjxMw2hKQzDrc9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 03:12:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VkLwTGPm; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cjx8R2jk2zDrR2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 03:02:15 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id s63so6716224pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 08:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74N67GuHsAKlUQCHO+8oJizzPlrfnBq33d6B/Ovug1c=;
 b=VkLwTGPmwmZvnPJHpLNIUbEQ3XRa/sOpBoQE2Sgr7xSLqciwk0q3eYNRAupvsW9v3M
 0Lwkb6wKoJjwhSbv10vfipxeq0nYWJtscGMbipiKOasgKYbjQ1+8k2J3ZSDqVgpZw+5k
 a0bQ7fDQGWs1BdqUP9p3zbwz3Ygx6Vnnnu13rHLs+Q77qJ10HfJ8afd4voMDkqzvYBSH
 Whs7pDJNUlUjHy2MHiGrJrMJ+l+1Mpi7jTugmuKoprsToU4KTqKcb0S7wxDlNskhFhX8
 kNnwDm1ODJbdMOAOQzpbbfnXq1HicbPfvzXdxI+O6MnJQTmxQ7fKgfP4rLg2TsEqStX4
 pbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74N67GuHsAKlUQCHO+8oJizzPlrfnBq33d6B/Ovug1c=;
 b=GwGzs+KY9IDOYtmTcMijG4ll8R0F2naRYje1rQTgGJfcJ34tlI1P+Pynt7eVW1DvBW
 Uqfo/ruohmJGy2neF75e4VwefMkBKUJsygI5j4raNPGDoeN1rwzTVfScYxgBDrs9HnTK
 6bSKTd/7zTpHXLDuMobaOW54HYnLI8khustuPUz+0fhkfzUqjcCZ1bPuVR1tT97pfz9+
 WmWYEx3coVbDGRneav2cPXFaUhz3GMlL3NccLykpPe+Nk8XoqK3zVlx1vUdfZsgV+x+W
 nPoz81rsm1LBxwvibfFO7R1PH7MV6GbtS4M+XJZIJKgCsXWcCbTifFvtG7auEokpRwD7
 dh/Q==
X-Gm-Message-State: AOAM531ZTYA13Fn/8Likyyn1D2G4jrTun8y0Yg2UbLKcuxvazTANmz8G
 vpjrx/MccxOJAYZeyKkWr3g=
X-Google-Smtp-Source: ABdhPJwxDwD+9zFmjMFp1FY1SUXYVEy5AQmGVT0CSX61N4g2WeQJxNZHGbtbroa2pwOuEZsmwpocJg==
X-Received: by 2002:a17:90a:a50b:: with SMTP id
 a11mr17214934pjq.170.1606579333519; 
 Sat, 28 Nov 2020 08:02:13 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d4sm9762607pjz.28.2020.11.28.08.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 08:02:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] lazy tlb: allow lazy tlb mm switching to be configurable
Date: Sun, 29 Nov 2020 02:01:38 +1000
Message-Id: <20201128160141.1003903-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128160141.1003903-1-npiggin@gmail.com>
References: <20201128160141.1003903-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NOMMU systems could easily go without this and save a bit of code
and the refcount atomics, because their mm switch is a no-op. I
haven't flipped them over because haven't audited all arch code to
convert over to using the _lazy_tlb refcounting.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig             | 11 +++++++
 include/linux/sched/mm.h | 13 ++++++--
 kernel/sched/core.c      | 68 +++++++++++++++++++++++++++++-----------
 kernel/sched/sched.h     |  4 ++-
 4 files changed, 75 insertions(+), 21 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..596bf589d74b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -430,6 +430,17 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	  irqs disabled over activate_mm. Architectures that do IPI based TLB
 	  shootdowns should enable this.
 
+# Should make this depend on MMU, because there is little use for lazy mm switching
+# with NOMMU. Must audit NOMMU architecture code for lazy mm refcounting first.
+config MMU_LAZY_TLB
+	def_bool y
+	help
+	  Enable "lazy TLB" mmu context switching for kernel threads.
+
+config MMU_LAZY_TLB_REFCOUNT
+	def_bool y
+	depends on MMU_LAZY_TLB
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 7157c0f6fef8..bd0f27402d4b 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -51,12 +51,21 @@ static inline void mmdrop(struct mm_struct *mm)
 /* Helpers for lazy TLB mm refcounting */
 static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
 {
-	mmgrab(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
+		mmgrab(mm);
 }
 
 static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
 {
-	mmdrop(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
+		mmdrop(mm);
+	} else {
+		/*
+		 * mmdrop_lazy_tlb must provide a full memory barrier, see the
+		 * membarrier comment finish_task_switch.
+		 */
+		smp_mb();
+	}
 }
 
 /**
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e372b613d514..3b79c6cc3a37 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3579,7 +3579,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq = this_rq();
-	struct mm_struct *mm = rq->prev_mm;
+	struct mm_struct *mm = NULL;
 	long prev_state;
 
 	/*
@@ -3598,7 +3598,10 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 		      current->comm, current->pid, preempt_count()))
 		preempt_count_set(FORK_PREEMPT_COUNT);
 
-	rq->prev_mm = NULL;
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
+	mm = rq->prev_lazy_mm;
+	rq->prev_lazy_mm = NULL;
+#endif
 
 	/*
 	 * A task struct has one reference for the use as "current".
@@ -3630,6 +3633,8 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 * rq->curr, before returning to userspace, for
 	 * {PRIVATE,GLOBAL}_EXPEDITED. This is implicitly provided by
 	 * mmdrop_lazy_tlb().
+	 *
+	 * This same issue applies to other places that mmdrop_lazy_tlb().
 	 */
 	if (mm)
 		mmdrop_lazy_tlb(mm);
@@ -3719,22 +3724,10 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	calculate_sigpending();
 }
 
-/*
- * context_switch - switch to the new MM and the new thread's register state.
- */
-static __always_inline struct rq *
-context_switch(struct rq *rq, struct task_struct *prev,
-	       struct task_struct *next, struct rq_flags *rf)
+static __always_inline void
+context_switch_mm(struct rq *rq, struct task_struct *prev,
+	       struct task_struct *next)
 {
-	prepare_task_switch(rq, prev, next);
-
-	/*
-	 * For paravirt, this is coupled with an exit in switch_to to
-	 * combine the page table reload and the switch backend into
-	 * one hypercall.
-	 */
-	arch_start_context_switch(prev);
-
 	/*
 	 * kernel -> kernel   lazy + transfer active
 	 *   user -> kernel   lazy + mmgrab_lazy_tlb() active
@@ -3765,11 +3758,50 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		if (!prev->mm) {                        // from kernel
 			exit_lazy_tlb(prev->active_mm, next);
 
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
 			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
-			rq->prev_mm = prev->active_mm;
+			rq->prev_lazy_mm = prev->active_mm;
 			prev->active_mm = NULL;
+#else
+			/* See membarrier comment in finish_task_switch(). */
+			smp_mb();
+#endif
 		}
 	}
+}
+
+static __always_inline void
+context_switch_mm_nolazy(struct rq *rq, struct task_struct *prev,
+	       struct task_struct *next)
+{
+	if (!next->mm)
+		next->active_mm = &init_mm;
+	membarrier_switch_mm(rq, prev->active_mm, next->active_mm);
+	switch_mm_irqs_off(prev->active_mm, next->active_mm, next);
+	if (!prev->mm)
+		prev->active_mm = NULL;
+}
+
+/*
+ * context_switch - switch to the new MM and the new thread's register state.
+ */
+static __always_inline struct rq *
+context_switch(struct rq *rq, struct task_struct *prev,
+	       struct task_struct *next, struct rq_flags *rf)
+{
+	prepare_task_switch(rq, prev, next);
+
+	/*
+	 * For paravirt, this is coupled with an exit in switch_to to
+	 * combine the page table reload and the switch backend into
+	 * one hypercall.
+	 */
+	arch_start_context_switch(prev);
+
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
+		context_switch_mm(rq, prev, next);
+	else
+		context_switch_mm_nolazy(rq, prev, next);
 
 	rq->clock_update_flags &= ~(RQCF_ACT_SKIP|RQCF_REQ_SKIP);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index df80bfcea92e..3b72aec5a2f2 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -950,7 +950,9 @@ struct rq {
 	struct task_struct	*idle;
 	struct task_struct	*stop;
 	unsigned long		next_balance;
-	struct mm_struct	*prev_mm;
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
+	struct mm_struct	*prev_lazy_mm;
+#endif
 
 	unsigned int		clock_update_flags;
 	u64			clock;
-- 
2.23.0

