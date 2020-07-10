Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF921ACEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 04:11:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2xPC0YMHzDrFn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 12:11:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O7+ulI/L; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2x4z5ZJDzDqR5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 11:57:39 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id cv18so3940387pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 18:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lq+5YyzIbnzKrC5WXbMgZS97wejAnzujpqVbQxvF/Lw=;
 b=O7+ulI/LRglcP5qCLuMbbgD0ofzWmJwZEblGzJ+okVuGkOiR2gTyC03zrMjdXEH0hB
 5Gaw0vVEYTp/Qit2rqR8IwLbwn7QiKgsDKG0Fd7Xj2HiGjxd3aUPrm5RTkEYO3SLArfy
 CHQUEdv8xru96CJgIzueA831qH9INkjuVQSpgeUmTYZvUpsq+S9dcwtGqnUqc4Ff/XnN
 98BCZh90kPt0oy7qNLowjzgpHH4fVv1tL6+BRsfo2l0lALCrdOaf7pBzecCBEWfR17te
 Ct71OUJd6ZG2tIibzIJLu0lpZD31xXWBnaPD4lvungG6xgPkYsKnz/NsfKtkTikcts8Z
 yxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lq+5YyzIbnzKrC5WXbMgZS97wejAnzujpqVbQxvF/Lw=;
 b=JkHqbONQcbiNrjUVbAbH+MX7LGe/tjm6OgUNfjUqW2cEymDaZDBgAwH+KSx8cYe9zb
 cp2kuXlkEc/sGje5rmbx7myCjIhvJTg7L5jn9ZVPBBW4E/vHDgSJWaW/jHhEe1cF2z7L
 qIC+cLk+QlEY+KFHuIf49zzjkq2LUbhVPBnK9yywew3FjK1W+zLFWYRp+WOAOOCeAbXR
 +pkPwhqWL7SvzrByzExCQH91pJR738/4/xcrD2Pr0SnZkt9w0byz2eOyQViQHNUmzV8w
 yw/X0TuBRko2HIWvQFcgwqMt6ZRr7Vl9/WWRJuKO9yGJ/gLoP/ka0FtPbdl+IxHX/Zg9
 Ml7A==
X-Gm-Message-State: AOAM533BJzwHLOssDYNiD7TANWw6GZ4HfA6pnovn2aGi+UNCeffvKNCo
 ABuQan8pBTygtV71J5spe3c=
X-Google-Smtp-Source: ABdhPJzyKsV6YEQg8K0l5yERbWIQQgXyBnhpP546f8l96ub+MkrLebwuhaNiEd0fTTPWSKV0eL1Jog==
X-Received: by 2002:a17:90a:7185:: with SMTP id
 i5mr3327864pjk.170.1594346256131; 
 Thu, 09 Jul 2020 18:57:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-245-19-62.static.tpgi.com.au.
 [220.245.19.62])
 by smtp.gmail.com with ESMTPSA id 7sm3912834pgw.85.2020.07.09.18.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 18:57:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [RFC PATCH 6/7] lazy tlb: allow lazy tlb mm switching to be
 configurable
Date: Fri, 10 Jul 2020 11:56:45 +1000
Message-Id: <20200710015646.2020871-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200710015646.2020871-1-npiggin@gmail.com>
References: <20200710015646.2020871-1-npiggin@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NOMMU systems could easily go without this and save a bit of code
and the mm refcounting, because their mm switch is a no-op. I haven't
flipped them over because haven't audited all arch code to convert
over to using the _lazy_tlb refcounting.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig             |  7 +++++
 include/linux/sched/mm.h | 12 ++++++---
 kernel/sched/core.c      | 55 +++++++++++++++++++++++++++-------------
 kernel/sched/sched.h     |  4 ++-
 4 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8cc35dc556c7..2daf8fe6146a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -411,6 +411,13 @@ config MMU_GATHER_NO_GATHER
 	bool
 	depends on MMU_GATHER_TABLE_FREE
 
+# Would like to make this depend on MMU, because there is little use for lazy mm switching
+# with NOMMU, but have to audit NOMMU architecture code first.
+config MMU_LAZY_TLB
+	def_bool y
+	help
+	  Enable "lazy TLB" mmu context switching for kernel threads.
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 110d4ad21de6..2c2b20e2ccc7 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -53,18 +53,22 @@ void mmdrop(struct mm_struct *mm);
 /* Helpers for lazy TLB mm refcounting */
 static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
 {
-	mmgrab(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
+		mmgrab(mm);
 }
 
 static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
 {
-	mmdrop(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
+		mmdrop(mm);
 }
 
 static inline void mmdrop_lazy_tlb_smp_mb(struct mm_struct *mm)
 {
-	/* This depends on mmdrop providing a full smp_mb() */
-	mmdrop(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
+		mmdrop(mm); /* This depends on mmdrop providing a full smp_mb() */
+	else
+		smp_mb();
 }
 
 /*
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d19f2f517f6c..14b4fae6f6e3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3253,7 +3253,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq = this_rq();
-	struct mm_struct *mm = rq->prev_mm;
+	struct mm_struct *mm = NULL;
 	long prev_state;
 
 	/*
@@ -3272,7 +3272,10 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 		      current->comm, current->pid, preempt_count()))
 		preempt_count_set(FORK_PREEMPT_COUNT);
 
-	rq->prev_mm = NULL;
+#ifdef CONFIG_MMU_LAZY_TLB
+	mm = rq->prev_lazy_mm;
+	rq->prev_lazy_mm = NULL;
+#endif
 
 	/*
 	 * A task struct has one reference for the use as "current".
@@ -3393,22 +3396,11 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
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
+#ifdef CONFIG_MMU_LAZY_TLB
 	/*
 	 * kernel -> kernel   lazy + transfer active
 	 *   user -> kernel   lazy + mmgrab_lazy_tlb() active
@@ -3440,10 +3432,37 @@ context_switch(struct rq *rq, struct task_struct *prev,
 			exit_lazy_tlb(prev->active_mm, next);
 
 			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
-			rq->prev_mm = prev->active_mm;
+			rq->prev_lazy_mm = prev->active_mm;
 			prev->active_mm = NULL;
 		}
 	}
+#else
+	if (!next->mm)
+		next->active_mm = &init_mm;
+	membarrier_switch_mm(rq, prev->active_mm, next->active_mm);
+	switch_mm_irqs_off(prev->active_mm, next->active_mm, next);
+	if (!prev->mm)
+		prev->active_mm = NULL;
+#endif
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
+	context_switch_mm(rq, prev, next);
 
 	rq->clock_update_flags &= ~(RQCF_ACT_SKIP|RQCF_REQ_SKIP);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 877fb08eb1b0..b196dd885d33 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -929,7 +929,9 @@ struct rq {
 	struct task_struct	*idle;
 	struct task_struct	*stop;
 	unsigned long		next_balance;
-	struct mm_struct	*prev_mm;
+#ifdef CONFIG_MMU_LAZY_TLB
+	struct mm_struct	*prev_lazy_mm;
+#endif
 
 	unsigned int		clock_update_flags;
 	u64			clock;
-- 
2.23.0

