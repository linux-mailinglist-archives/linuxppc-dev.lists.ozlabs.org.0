Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971B21ACDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 04:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2xFl4KvyzDrHb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 12:05:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gCXjs8bI; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2x4g396QzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 11:57:23 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id d10so1601226pll.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 18:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TndaA+7n10SOeC82kaRc/SAF/MahQj0lom1PGKrEXvU=;
 b=gCXjs8bI2mKELHWhu45fBwg1UfGpXWYrZpw6lFS/SvzlUgi0yqDt8mR0Swy0XW/Eoh
 OxqpNXxxb+SbP/lNioVntQfSfi4+giY2ZWkfv6+c2VV1Qi1h2qu8pfPyehvx7JDtU+cj
 fvFVZxq2JpBW77ynSZam+fy+gVUFRdFqePTsZSQz9vkfcGVU7meycx1z83dKI6D6L/tX
 IeuWG+VZDdlxt2r8ZWdEGs3JCuZlfe+MRZJkfZUwxv0/SwopWrbT5G8its/MryhEKJ/d
 ClkJ1u2tLeLTb181Zjyjn82cQDXUyvsMLzzmGPsgTdpCvZWDM2JzPr7Eb1HexxQB+tSM
 +CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TndaA+7n10SOeC82kaRc/SAF/MahQj0lom1PGKrEXvU=;
 b=Ui52kdeEXhbg9hncZCETWY6WePYEeWeJNqQO3NAIQaZ4kBOj8xiPLwb0kOLii40z/L
 +EBRo/LbLNeb6p65zdJuZylSTnWghQgmcpOvDGUPvjYL8O2dtozM+bko4t+sEVVclfK3
 gqO11yGLpiPb2hLH7IZQpP4qgeLEEN63EXup6pv2XHJAjkKRRos8gzwnynZTXR5lW6BG
 fvh7S1GlSIBqeRAoR8fxP9hBqbpqBEbJFNxEp5LoMwaR6Q5G8EoSI9R79C8h7pn+Fhnu
 /VBmiwIFIQ00RmXrvjB0JzfmAdQWclN7xverCmqu8W6i5ooPH/O0VYVfn8i1y9girTo5
 5ngg==
X-Gm-Message-State: AOAM532xporBRKwbwyVmgpiUPL014oykULn3FBM6A3hpst0rixltNCNI
 jVCMuBEdylN1/diIygMClkM=
X-Google-Smtp-Source: ABdhPJzaWKUBO6GLgF6DS/ZblFwcTQFZaXYAVtzx8AT9SnnyhUC2nMRdbyYbGy72wTEeylcuoM1gzw==
X-Received: by 2002:a17:90a:4bc7:: with SMTP id
 u7mr3117178pjl.217.1594346241669; 
 Thu, 09 Jul 2020 18:57:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-245-19-62.static.tpgi.com.au.
 [220.245.19.62])
 by smtp.gmail.com with ESMTPSA id 7sm3912834pgw.85.2020.07.09.18.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 18:57:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [RFC PATCH 3/7] mm: introduce exit_lazy_tlb
Date: Fri, 10 Jul 2020 11:56:42 +1000
Message-Id: <20200710015646.2020871-4-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 fs/exec.c                         |  5 +++--
 include/asm-generic/mmu_context.h | 20 ++++++++++++++++++++
 kernel/kthread.c                  |  1 +
 kernel/sched/core.c               |  2 ++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index e6e8a9a70327..e2ab71e88293 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1117,9 +1117,10 @@ static int exec_mmap(struct mm_struct *mm)
 		setmax_mm_hiwater_rss(&tsk->signal->maxrss, old_mm);
 		mm_update_next_owner(old_mm);
 		mmput(old_mm);
-		return 0;
+	} else {
+		exit_lazy_tlb(active_mm, tsk);
+		mmdrop(active_mm);
 	}
-	mmdrop(active_mm);
 	return 0;
 }
 
diff --git a/include/asm-generic/mmu_context.h b/include/asm-generic/mmu_context.h
index 86cea80a50df..3fc4c3879b79 100644
--- a/include/asm-generic/mmu_context.h
+++ b/include/asm-generic/mmu_context.h
@@ -24,6 +24,26 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
 }
 #endif
 
+/*
+ * exit_lazy_tlb - Called after switching away from a lazy TLB mode mm.
+ *
+ * mm:  the lazy mm context that was switched away from
+ * tsk: the task that was switched to non-lazy mm
+ *
+ * tsk->mm will not be NULL.
+ *
+ * Note this is not symmetrical to enter_lazy_tlb, this is not
+ * called when tasks switch into the lazy mm, it's called after the
+ * lazy mm becomes non-lazy (either switched to a different mm or the
+ * owner of the mm returns).
+ */
+#ifndef exit_lazy_tlb
+static inline void exit_lazy_tlb(struct mm_struct *mm,
+			struct task_struct *tsk)
+{
+}
+#endif
+
 /**
  * init_new_context - Initialize context of a new mm_struct.
  * @tsk: task struct for the mm
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 132f84a5fde3..e813d92f2eab 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1253,6 +1253,7 @@ void kthread_use_mm(struct mm_struct *mm)
 
 	if (active_mm != mm)
 		mmdrop(active_mm);
+	exit_lazy_tlb(active_mm, tsk);
 
 	to_kthread(tsk)->oldfs = get_fs();
 	set_fs(USER_DS);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ca5db40392d4..debc917bc69b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3439,6 +3439,8 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
 
 		if (!prev->mm) {                        // from kernel
+			exit_lazy_tlb(prev->active_mm, next);
+
 			/* will mmdrop() in finish_task_switch(). */
 			rq->prev_mm = prev->active_mm;
 			prev->active_mm = NULL;
-- 
2.23.0

