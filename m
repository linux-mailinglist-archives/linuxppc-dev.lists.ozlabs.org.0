Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 103BA39C4E6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 03:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fxj8c3lswz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 11:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=t/BsozX+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t/BsozX+; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fxj7J582sz306K
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 11:42:36 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id n12so9192789pgs.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 18:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8uxX4t8g+DxGYDGoM+1rG8fWNFKPCHDobEAy7P79JU=;
 b=t/BsozX+HKFZD2zebtgF3JGrIwCTcVj4ffmsJERRbi/MNaFuO3WFo3bmI7M7Pw7IDj
 5k7ho9NFtodvy2hED8NQ029kOKEcm+emddzxclcV+A/9uFGxWtrrqyVwZBqBZQayVv8o
 uvzpSo3qbCEaRJsIsMf83kmaSWU82D3nQyk4UoworXY/8rBuy0UT3gajZ92D9fUUpVvL
 nkRMAM3yjYbObExBGVtCTrrn8upzvtdmLXXteWz7/0ii5TkWeGOPk21w9hgHzbsJtd4n
 8a+HzVHQmMqiendjAtp1CC0CeIVqy3BZs61INz/EoX+TblkTnx0ukJD5mdWH0Ta+yWQq
 0Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8uxX4t8g+DxGYDGoM+1rG8fWNFKPCHDobEAy7P79JU=;
 b=iL2OfdhpXrKHQkOayPgp9f/0tdomzXBVzfjzJ6DXd+DE/MPNINoNIWqrChdAa2PXD/
 5LNdOzeEp8YBdtYq5jGgRc68pjaOLwYqbn8c/Fci2o/4AGPVBb95Nm7wa2A/qk0Se/a7
 ejv7uf1JGJhSjW1QBEXAHST9cafMzycnbErUb+a0AkmFi9ACeVrcFeirDwyb2iPihFVP
 rx/MhqIqywILP+u4HPnIDQXxOyRPfkIiplt4t5MrBR00rf2sIMj6RqRtpw8TqMhCJWWz
 x01S9O20nH/L6tjeya0OWzq9Ez2QfkBrNb3IdA7oHqJr1Is0fmCKtzyNh1r4omZjy6GV
 ev7A==
X-Gm-Message-State: AOAM532lSgSdk7Rv2tdLwhgG69uIGUxUgI9QisclNmvEfdOVAZXyqQeJ
 ijUFJqiB5F0w/jgoIypHy44=
X-Google-Smtp-Source: ABdhPJyaiJ+cifU73dwUkfKSCUG8g6xUPympTQc18g/8gDitQusrenWMupQEWYNpZsq0HZ+33JFCOQ==
X-Received: by 2002:aa7:900f:0:b029:2ec:82d2:d23 with SMTP id
 m15-20020aa7900f0000b02902ec82d20d23mr5855353pfo.16.1622857354192; 
 Fri, 04 Jun 2021 18:42:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id q68sm5779056pjq.45.2021.06.04.18.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 18:42:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 2/4] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
Date: Sat,  5 Jun 2021 11:42:14 +1000
Message-Id: <20210605014216.446867-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210605014216.446867-1-npiggin@gmail.com>
References: <20210605014216.446867-1-npiggin@gmail.com>
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

Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tlb mm
when it is context switched. This can be disabled by architectures that
don't require this refcounting if they clean up lazy tlb mms when the
last refcount is dropped. Currently this is always enabled, which is
what existing code does, so the patch is effectively a no-op.

Rename rq->prev_mm to rq->prev_lazy_mm, because that's what it is.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig             |  4 ++++
 include/linux/sched/mm.h | 13 +++++++++++--
 kernel/sched/core.c      | 22 ++++++++++++++++++----
 kernel/sched/sched.h     |  4 +++-
 4 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index c45b770d3579..1cff045cdde6 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -418,6 +418,10 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	  irqs disabled over activate_mm. Architectures that do IPI based TLB
 	  shootdowns should enable this.
 
+# Use normal mm refcounting for MMU_LAZY_TLB kernel thread references.
+config MMU_LAZY_TLB_REFCOUNT
+	def_bool y
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
index e359c76ea2e2..5e10cb712be3 100644
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
@@ -4326,9 +4329,20 @@ context_switch(struct rq *rq, struct task_struct *prev,
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
+			 * Without MMU_LAZY_TLB_REFCOUNT there is no lazy
+			 * tracking (because no rq->prev_lazy_mm) in
+			 * finish_task_switch, so no mmdrop_lazy_tlb(), so no
+			 * memory barrier for membarrier (see the membarrier
+			 * comment in finish_task_switch()).  Do it here.
+			 */
+			smp_mb();
+#endif
 		}
 	}
 
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

