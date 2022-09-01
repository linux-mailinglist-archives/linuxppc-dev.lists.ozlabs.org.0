Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369BD5A9E3A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:39:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSvy1hZmz3f3B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:39:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OULzLK//;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3zu0qywykdkmvxuhqejrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OULzLK//;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqs1wTkz3015
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:36 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id v8-20020a258488000000b00695847496a4so4934328ybk.19
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=eIMt0K4Dq/+E4lj9SQ/fnMIDQQYvNY/8MPu6+maRPr0=;
        b=OULzLK//lObTRMGAKryDz/AAItdyiK5yqhZqIIxu+sL1Dieokt2jidmnz3C7/IkvFZ
         m9XlR/LP/dWBo2UxnXyYn7qdVCzxgLbSFD2CG9EOYY1gruRvre30gd8M27oZrFHurKvO
         KqLi6QjNq7f2EcLrXhJZo+HJMeLkP9RVRxlBnBeo9kXpz7L5PtGPdJWGZy8ptDnDibsD
         BU++Zg9dqZVio0ctwQpkNxICzBLOlMkeBzfVJBfO5ajkBVunOWr6F+myD0p5P9YWiss6
         hO75UDowCTjrDDdzDEi22CFFlp+R1gx4mTcBiehvp3OGDbyQbHz6/QfMRzJJk1Rc6B1v
         GPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=eIMt0K4Dq/+E4lj9SQ/fnMIDQQYvNY/8MPu6+maRPr0=;
        b=lSGUJxH5WjaKgRJmIVff9l1niV8Sle0ERTjKLFKfm3AjYvhUuXxk6aBgwxUOxLrq1d
         +2OLeK/ZBbBr8qKjFajO6w+zdx5bJVkeKgWq/upYgit1Z9VAA/K75rP834vJcTC4Rf29
         PaPV07NVEKjwUKVkV+j569mW7Y90t3oKy2GeUwZxYZkx3z3lbaD2YJDVsyvSoHq9DpPX
         3R5Q/dWT67+MnaSlVBFeB6WHvSUB4hypEWorh5oUFdSH9uQ73oRquGX6Yevn1w97g9qz
         HhfAw16ZumlFYqwwE4oKtoKySSiPChHmRYKthjYJMwkQO5y6YBSlrmF8byDwXTaT9XxU
         GRLA==
X-Gm-Message-State: ACgBeo302HflEqUPHaLjLaXDxGcj4JKMqYuMdnuW4AJ9Un94z8/1W2jy
	47FPJBx4CMIJU/kndyMReNnpu3lDXtISRStVdGrOK+GkFItg03Cg4XzD5Bb7SpyHQqPvaBxFIvT
	Mx0YrhXgkAGVdMOgXcTxcTw==
X-Google-Smtp-Source: AA6agR57KkNIgUFHWPdFiQWyoY7oyjG1ZvVgnOFqYQ9kJCo94JBJEo43qz2wa5ev7XB45jgLE1aOSNe2TR4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a0d:ff86:0:b0:341:5844:5527 with SMTP id
 p128-20020a0dff86000000b0034158445527mr14770867ywf.504.1662053734514; Thu, 01
 Sep 2022 10:35:34 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:53 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-6-surenb@google.com>
Subject: [RFC PATCH RESEND 05/28] mm: add per-VMA lock and helper functions to
 control it
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-ccpol: medium
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a per-VMA rw_semaphore to be used during page fault handling
instead of mmap_lock. Because there are cases when multiple VMAs need
to be exclusively locked during VMA tree modifications, instead of the
usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
exclusively and setting vma->lock_seq to the current mm->lock_seq. When
mmap_write_lock holder is done with all modifications and drops mmap_lock,
it will increment mm->lock_seq, effectively unlocking all VMAs marked as
locked.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h        | 78 +++++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h  |  7 ++++
 include/linux/mmap_lock.h | 13 +++++++
 kernel/fork.c             |  4 ++
 mm/init-mm.c              |  3 ++
 5 files changed, 105 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7d322a979455..476bf936c5f0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -611,6 +611,83 @@ struct vm_operations_struct {
 					  unsigned long addr);
 };
 
+#ifdef CONFIG_PER_VMA_LOCK
+static inline void vma_init_lock(struct vm_area_struct *vma)
+{
+	init_rwsem(&vma->lock);
+	vma->vm_lock_seq = -1;
+}
+
+static inline void vma_mark_locked(struct vm_area_struct *vma)
+{
+	int mm_lock_seq;
+
+	mmap_assert_write_locked(vma->vm_mm);
+
+	/*
+	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
+	 * mm->mm_lock_seq can't be concurrently modified.
+	 */
+	mm_lock_seq = READ_ONCE(vma->vm_mm->mm_lock_seq);
+	if (vma->vm_lock_seq == mm_lock_seq)
+		return;
+
+	down_write(&vma->lock);
+	vma->vm_lock_seq = mm_lock_seq;
+	up_write(&vma->lock);
+}
+
+static inline bool vma_read_trylock(struct vm_area_struct *vma)
+{
+	if (unlikely(down_read_trylock(&vma->lock) == 0))
+		return false;
+
+	/*
+	 * Overflow might produce false locked result but it's not critical.
+	 * False unlocked result is critical but is impossible because we
+	 * modify and check vma->vm_lock_seq under vma->lock protection and
+	 * mm->mm_lock_seq modification invalidates all existing locks.
+	 */
+	if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq)) {
+		up_read(&vma->lock);
+		return false;
+	}
+	return true;
+}
+
+static inline void vma_read_unlock(struct vm_area_struct *vma)
+{
+	up_read(&vma->lock);
+}
+
+static inline void vma_assert_locked(struct vm_area_struct *vma)
+{
+	lockdep_assert_held(&vma->lock);
+	VM_BUG_ON_VMA(!rwsem_is_locked(&vma->lock), vma);
+}
+
+static inline void vma_assert_write_locked(struct vm_area_struct *vma, int pos)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	/*
+	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
+	 * mm->mm_lock_seq can't be concurrently modified.
+	 */
+	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
+}
+
+#else /* CONFIG_PER_VMA_LOCK */
+
+static inline void vma_init_lock(struct vm_area_struct *vma) {}
+static inline void vma_mark_locked(struct vm_area_struct *vma) {}
+static inline bool vma_read_trylock(struct vm_area_struct *vma)
+		{ return false; }
+static inline void vma_read_unlock(struct vm_area_struct *vma) {}
+static inline void vma_assert_locked(struct vm_area_struct *vma) {}
+static inline void vma_assert_write_locked(struct vm_area_struct *vma, int pos) {}
+
+#endif /* CONFIG_PER_VMA_LOCK */
+
 static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 {
 	static const struct vm_operations_struct dummy_vm_ops = {};
@@ -619,6 +696,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
+	vma_init_lock(vma);
 }
 
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index bed25ef7c994..6a03f59c1e78 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -486,6 +486,10 @@ struct vm_area_struct {
 	struct mempolicy *vm_policy;	/* NUMA policy for the VMA */
 #endif
 	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
+#ifdef CONFIG_PER_VMA_LOCK
+	struct rw_semaphore lock;
+	int vm_lock_seq;
+#endif
 } __randomize_layout;
 
 struct kioctx_table;
@@ -567,6 +571,9 @@ struct mm_struct {
 					  * init_mm.mmlist, and are protected
 					  * by mmlist_lock
 					  */
+#ifdef CONFIG_PER_VMA_LOCK
+		int mm_lock_seq;
+#endif
 
 
 		unsigned long hiwater_rss; /* High-watermark of RSS usage */
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index e49ba91bb1f0..a391ae226564 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -72,6 +72,17 @@ static inline void mmap_assert_write_locked(struct mm_struct *mm)
 	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+static inline void vma_mark_unlocked_all(struct mm_struct *mm)
+{
+	mmap_assert_write_locked(mm);
+	/* No races during update due to exclusive mmap_lock being held */
+	WRITE_ONCE(mm->mm_lock_seq, mm->mm_lock_seq + 1);
+}
+#else
+static inline void vma_mark_unlocked_all(struct mm_struct *mm) {}
+#endif
+
 static inline void mmap_init_lock(struct mm_struct *mm)
 {
 	init_rwsem(&mm->mmap_lock);
@@ -114,12 +125,14 @@ static inline bool mmap_write_trylock(struct mm_struct *mm)
 static inline void mmap_write_unlock(struct mm_struct *mm)
 {
 	__mmap_lock_trace_released(mm, true);
+	vma_mark_unlocked_all(mm);
 	up_write(&mm->mmap_lock);
 }
 
 static inline void mmap_write_downgrade(struct mm_struct *mm)
 {
 	__mmap_lock_trace_acquire_returned(mm, false, true);
+	vma_mark_unlocked_all(mm);
 	downgrade_write(&mm->mmap_lock);
 }
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 614872438393..bfab31ecd11e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -475,6 +475,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 		 */
 		*new = data_race(*orig);
 		INIT_LIST_HEAD(&new->anon_vma_chain);
+		vma_init_lock(new);
 		new->vm_next = new->vm_prev = NULL;
 		dup_anon_vma_name(orig, new);
 	}
@@ -1130,6 +1131,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	seqcount_init(&mm->write_protect_seq);
 	mmap_init_lock(mm);
 	INIT_LIST_HEAD(&mm->mmlist);
+#ifdef CONFIG_PER_VMA_LOCK
+	WRITE_ONCE(mm->mm_lock_seq, 0);
+#endif
 	mm_pgtables_bytes_init(mm);
 	mm->map_count = 0;
 	mm->locked_vm = 0;
diff --git a/mm/init-mm.c b/mm/init-mm.c
index fbe7844d0912..8399f90d631c 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -37,6 +37,9 @@ struct mm_struct init_mm = {
 	.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
 	.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
 	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
+#ifdef CONFIG_PER_VMA_LOCK
+	.mm_lock_seq	= 0,
+#endif
 	.user_ns	= &init_user_ns,
 	.cpu_bitmap	= CPU_BITS_NONE,
 #ifdef CONFIG_IOMMU_SVA
-- 
2.37.2.789.g6183377224-goog

