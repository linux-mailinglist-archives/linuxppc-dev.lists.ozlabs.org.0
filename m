Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E31732D937D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 08:05:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvXT80JpWzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 18:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IR9n6Xx3; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvXP12yC5zDqHS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 18:01:25 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id hk16so6061255pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 23:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTzD/PwVnUryCFsCtBkXOLSBdB20HGAb9puUxId4JVk=;
 b=IR9n6Xx3XA7TWORm+admowft3H2sA37sBIcd+GaFLOP0qFk15JB6uoOrHhMuzatwsC
 HQ26+f50MnEXp3JmLnlvTNWfB67/uTwwboaOXijLrWMS6goDqh1RGiVPj6YwHXedhuRY
 ONdoimeRGscvIVFc1AQRLCydCRLvZxavxCIVqjhlqtBuGaHa2ynhR8Y6wfovleCF/YR/
 8TzsXLnt+Plc6HEfBAzkyeRebiyMGgTwde7hSwzi50i/1jG056NrAeoOuUjU7F6IIrfA
 Pj80cWPZLza80QoJ00gbstNsZK2bmcjZeoCU3aGM10vTa0vfEgq5iccJ+843aJqUDBJn
 V/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTzD/PwVnUryCFsCtBkXOLSBdB20HGAb9puUxId4JVk=;
 b=cQiXnY6Q/HercpJ4kZCkg9ttceCqhBFOtJ35iZ+ol1yN+d3PIcwcZVX2Ncpk8ZVp1l
 FwQEU9vgOnmlVakHDzcvxBOhGsCpD9Ad56YDD+1HZd07jXWME/nUb+7f8HVL49dDkvF5
 Yda1mTa4d2f/hXMIXPqa2Dj1HEYNpdpaLIE1qamYKpfmzAYrlaL+YFnB+S+bx2V7pr8p
 F/fvXfQA3LVyZADBCVLtGUWSbiSJSKeI8akynS4J3rUDzChQOMlOIhZTCXkto4QQ4waO
 +Agn+aUAjGeOoshHfk/SdtdRgtxLMnu7JMf/6iOh1Plk0kyIsXeC5a9ASHvoWNlvGWHP
 /GRQ==
X-Gm-Message-State: AOAM530mO1tEnxgWLKNTipg9Wjt/YhZURStfvRbf0ZA9g2EXmk6n7Rim
 56/7S9VfpA+CmFEM97ahBYE=
X-Google-Smtp-Source: ABdhPJwxGbCiA5g+oFBRL0MsR3yqlxPJyXmC3pmGD+mzl4QTJz+fHRqE9o5Gyew/trGb6oI0bDkZuQ==
X-Received: by 2002:a17:902:7887:b029:dc:20e:47ff with SMTP id
 q7-20020a1709027887b02900dc020e47ffmr2078675pll.65.1607929282651; 
 Sun, 13 Dec 2020 23:01:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id 84sm19570018pfy.9.2020.12.13.23.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 23:01:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] lazy tlb: allow lazy tlb mm switching to be
 configurable
Date: Mon, 14 Dec 2020 16:53:09 +1000
Message-Id: <20201214065312.270062-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201214065312.270062-1-npiggin@gmail.com>
References: <20201214065312.270062-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add CONFIG_MMU_LAZY_TLB which can be configured out to disable
the lazy tlb mechanism entirely, and switches to init_mm when
switching to a kernel thread.

NOMMU systems could easily go without this and save a bit of code
and the refcount atomics, because their mm switch is a no-op. They
have not been switched over by default because the arch code needs
to be audited and tested for lazy tlb mm refcounting and converted
to _lazy_tlb refcounting if necessary.

CONFIG_MMU_LAZY_TLB_REFCOUNT is also added, but it must always
be enabled if CONFIG_MMU_LAZY_TLB is enabled until the next patch
which provides an alternate scheme.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig             | 17 +++++++++
 include/linux/sched/mm.h | 13 +++++--
 kernel/sched/core.c      | 75 ++++++++++++++++++++++++++++++----------
 kernel/sched/sched.h     |  4 ++-
 4 files changed, 87 insertions(+), 22 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index ba4e966484ab..84faaba66364 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -430,6 +430,23 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	  irqs disabled over activate_mm. Architectures that do IPI based TLB
 	  shootdowns should enable this.
 
+# Should make this depend on MMU, because there is little use for lazy mm switching
+# with NOMMU. Must audit NOMMU architecture code for lazy mm refcounting first.
+config MMU_LAZY_TLB
+	def_bool y
+	help
+	  Enable "lazy TLB" mmu context switching for kernel threads.
+	  If this is disabled then switching to a kernel thread always
+	  switches to init_mm. If mm switches are inexpensive or free
+	  (in the case of NOMMU) then this could be disabled.
+
+config MMU_LAZY_TLB_REFCOUNT
+	def_bool y
+	depends on MMU_LAZY_TLB
+	help
+	  This must be enabled if MMU_LAZY_TLB is enabled until the next
+	  patch.
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 94a117160083..5edf8e942c84 100644
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
index c2f8ea43d29b..9c1dc9406e4b 100644
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
@@ -3722,22 +3725,10 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
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
@@ -3766,11 +3757,57 @@ context_switch(struct rq *rq, struct task_struct *prev,
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

