Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF25396D54
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 08:24:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvMZQ31jJz3c0s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 16:24:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XDJ2kYvm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XDJ2kYvm; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvMY63Xxhz2ymY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 16:23:22 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so807892pjp.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2ZM54o9Bp1W7ui49t2FYRDuyLvPHwC8Il/uTHhhdMs=;
 b=XDJ2kYvmv/Z5M24qrG7KDMUE9p7aJ0RlQOBX1p/t2w4hIRyxR6UjTzA19/wWm8wdfC
 2bssCYG5blnj9LMkj0KYjULkjvgmSvquyWjePNQYm//MxqhrHejkK0QcMGRIOOJbMpox
 7lTAot474lVNko8WQIRuPXUlRf3A83o42kAVvfnakMYQ5V5QvGDcEzfdLv1MpTxUKbNv
 e+S+jSKkwHUTddDHEL3mGYjuaQDAWQaGCy1sXxnPFkwfKdci8juvdPKPN8bYXqfSQPrI
 UD3u5SitNYnPXIjG3reVtT1Z66MrR1ddVVxfrlRrOkUzRhQFpbERqoAxcac1BEAeYuRK
 nDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2ZM54o9Bp1W7ui49t2FYRDuyLvPHwC8Il/uTHhhdMs=;
 b=CIHbCfc0cSw0JrVEAmmTsaVVgJADEfHMAGIXAuOyqp5iIEg81vPj3bNI1dGgbAQJd/
 iiGsOtciracgQluYMsp7kC4mVmlcxoI9F2sZVOp54wmFttMYSnTLevdzN6iOfJy99IjM
 /sg8TjmfqVPvCO2EcJvWKRhrnbu3KcWjsFPEaxl7jUAPO632HIr0TVuwGdpk7IuAJqcZ
 bA0qmeabkjDQZFUbsWNj4C/+5P/ZG9xHbwttEK9l5UKVx+XOXTLgMYcq6IQn+brKV02/
 vFTZltQ5hZ2YnPrl4Ok1cpq6M5vp/zhMU+oYpHzu3a9xcL3YFJDVyZeHC6TkVlZr3yOm
 vv+Q==
X-Gm-Message-State: AOAM530pON6y4A0yKOg2Pc0VEmXeH4lOh7aDb4R/H7EEBaKV3EksT/EU
 A/K7yESFYqsxDLAorXKHnwg=
X-Google-Smtp-Source: ABdhPJy2DUM8gibAhLieX5iGh16ca9VDqhVgs0t9sh7k8/bnT7er59ZtGvorelTu6yvv6DxaKgwUsw==
X-Received: by 2002:a17:90b:3587:: with SMTP id
 mm7mr21958255pjb.71.1622528599607; 
 Mon, 31 May 2021 23:23:19 -0700 (PDT)
Received: from bobo.ibm.com (60-241-69-122.static.tpgi.com.au. [60.241.69.122])
 by smtp.gmail.com with ESMTPSA id h1sm12519100pfh.72.2021.05.31.23.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 23:23:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 2/4] lazy tlb: allow lazy tlb mm switching to be
 configurable
Date: Tue,  1 Jun 2021 16:23:01 +1000
Message-Id: <20210601062303.3932513-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210601062303.3932513-1-npiggin@gmail.com>
References: <20210601062303.3932513-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add CONFIG_MMU_LAZY_TLB which can be configured out to disable the lazy
tlb mechanism entirely, and switches to init_mm when switching to a
kernel thread.

NOMMU systems could easily go without this and save a bit of code and
the refcount atomics, because their mm switch is a no-op. They have not
been switched over by default because the arch code needs to be audited
and tested for lazy tlb mm refcounting and converted to _lazy_tlb
refcounting if necessary.

CONFIG_MMU_LAZY_TLB_REFCOUNT is also added, but it must always be
enabled if CONFIG_MMU_LAZY_TLB is enabled until the next patch which
provides an alternate scheme.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig             | 26 ++++++++++++++
 include/linux/sched/mm.h | 13 +++++--
 kernel/sched/core.c      | 75 ++++++++++++++++++++++++++++++----------
 kernel/sched/sched.h     |  4 ++-
 4 files changed, 96 insertions(+), 22 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index c45b770d3579..276e1c1c0219 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -418,6 +418,32 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	  irqs disabled over activate_mm. Architectures that do IPI based TLB
 	  shootdowns should enable this.
 
+# Enable "lazy TLB", which means a user->kernel thread context switch does not
+# switch the mm to init_mm and the kernel thread takes a reference to the user
+# mm to provide its kernel mapping. This is how Linux has traditionally worked
+# (see Documentation/vm/active_mm.rst), for performance. Switching to and from
+# idle thread is a performance-critical case.
+#
+# If mm context switches are inexpensive or free (in the case of NOMMU) then
+# this could be disabled.
+#
+# It would make sense to have this depend on MMU, but need to audit and test
+# the NOMMU architectures for lazy mm refcounting first.
+config MMU_LAZY_TLB
+	def_bool y
+	depends on !NO_MMU_LAZY_TLB
+
+# This allows archs to disable MMU_LAZY_TLB. mmgrab/mmdrop in arch/ code has
+# to be audited and switched to _lazy_tlb postfix as necessary.
+config NO_MMU_LAZY_TLB
+	def_bool n
+
+# Use normal mm refcounting for MMU_LAZY_TLB kernel thread references.
+# For now, this must be enabled if MMU_LAZY_TLB is enabled.
+config MMU_LAZY_TLB_REFCOUNT
+	def_bool y
+	depends on MMU_LAZY_TLB
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index bfd1baca5266..29e4638ad124 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -52,12 +52,21 @@ static inline void mmdrop(struct mm_struct *mm)
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
+		 * membarrier comment finish_task_switch which relies on this.
+		 */
+		smp_mb();
+	}
 }
 
 /**
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e359c76ea2e2..299c3eb12b2b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4171,7 +4171,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq = this_rq();
-	struct mm_struct *mm = rq->prev_mm;
+	struct mm_struct *mm = NULL;
 	long prev_state;
 
 	/*
@@ -4190,7 +4190,10 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 		      current->comm, current->pid, preempt_count()))
 		preempt_count_set(FORK_PREEMPT_COUNT);
 
-	rq->prev_mm = NULL;
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
+	mm = rq->prev_lazy_mm;
+	rq->prev_lazy_mm = NULL;
+#endif
 
 	/*
 	 * A task struct has one reference for the use as "current".
@@ -4282,22 +4285,10 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
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
@@ -4326,11 +4317,57 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
 
 		if (!prev->mm) {                        // from kernel
-			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
-			rq->prev_mm = prev->active_mm;
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
+			/* Will mmdrop_lazy_tlb() in finish_task_switch(). */
+			rq->prev_lazy_mm = prev->active_mm;
 			prev->active_mm = NULL;
+#else
+			/*
+			 * Without MMU_LAZY_REFCOUNT there is no lazy
+			 * tracking (because no rq->prev_lazy_mm) in
+			 * finish_task_switch, so no mmdrop_lazy_tlb(),
+			 * so no memory barrier for membarrier (see the
+			 * membarrier comment in finish_task_switch()).
+			 * Do it here.
+			 */
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
index a189bec13729..0729cf19a987 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -961,7 +961,9 @@ struct rq {
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

