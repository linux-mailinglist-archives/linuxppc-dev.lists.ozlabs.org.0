Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A00766322F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:05:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRL32ctmz3cgr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:05:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TUshLIkn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=38368ywykdag02zmvjowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TUshLIkn;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5123Chz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:13 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 81-20020a250b54000000b007c002e178dfso1325092ybl.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=79bvrukKvLAS13wwuEGJsW+4aNck296i4OOdN8AZrSw=;
        b=TUshLIkna8lEowgf738l64K6OhURrpjePFxYxdKUuWhyUGH2D62dGB+OGRki5oXp4C
         xTYuRmR7XzQ7I/28ieatH6mJigev2F3K0HIzC6hflnBGI34WrRdJkJZ4AZfQFOQ8gGav
         9UNpZpO2F0owMoX4KYmO5GlLvBicz0eIhvCyoFVAlBVkJOLooeK67cBYtsiWvskUp6uE
         tE8t31WtIP9ueuHL/u/lXs1s/RC2HGn9FvMQfHmx5Itoy4F3Nj/5Ls77RI1e7g50JCXC
         9+/P6cV1602qOnEnSC6h6SSpk6hPN1ukv5Ai24vZZWfGTttvD7F17H6z929cULqI8Sm7
         oWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79bvrukKvLAS13wwuEGJsW+4aNck296i4OOdN8AZrSw=;
        b=qOQm3vwWqYrlfXrF1TiIhko2FWaomZEgQEJZJ7v2OKp3rDxBslIotCshu0jyiNY/C9
         8YASbze6m8QnTXJbUt7vw6oMoWcgfW7zLE487IE88HhDp5/bueau8sdMNXbkJgepE8zv
         YDCysaxjag6Q4zo0vB/F1P3Q1m9SmF4XpWuHwDl3XuPoCf9KpQ1gFvXzmZFNBba+9zx+
         WKLqG1tG1nnL/45u+jIsw5fR0dx5jlrzjERH8LVX95LyC07T3T/lA0XuD5xsuW73J1R3
         XcFWzbo3EKg3BraTGPSn3U9ONendKRfJvCEt2AwsHlKVb1DN7K6iQs3bt+toAv2c5jkA
         qkxg==
X-Gm-Message-State: AFqh2krrV8Mlw4NxNPhTZnuAmS7MJpG1uapXjf+rACIMhCCqXnUvxzrr
	ehvyCS3wwEvcW1adENQNaPRHmrgGdzk=
X-Google-Smtp-Source: AMrXdXukETqaSxCpG7iZuCRz7oEpYHbdWSzbf1+vDAfX24FIika8R4beORIYrEIIAWwV84R+bp3+gXy0ol4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a0d:c481:0:b0:4ad:7104:1f66 with SMTP id
 g123-20020a0dc481000000b004ad71041f66mr3418570ywd.53.1673297651084; Mon, 09
 Jan 2023 12:54:11 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:07 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-13-surenb@google.com>
Subject: [PATCH 12/41] mm: add per-VMA lock and helper functions to control it
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
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
VMA lock is placed on the cache line boundary so that its 'count' field
falls into the first cache line while the rest of the fields fall into
the second cache line. This lets the 'count' field to be cached with
other frequently accessed fields and used quickly in uncontended case
while 'owner' and other fields used in the contended case will not
invalidate the first cache line while waiting on the lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h        | 80 +++++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h  |  8 ++++
 include/linux/mmap_lock.h | 13 +++++++
 kernel/fork.c             |  4 ++
 mm/init-mm.c              |  3 ++
 5 files changed, 108 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f3f196e4d66d..ec2c4c227d51 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -612,6 +612,85 @@ struct vm_operations_struct {
 					  unsigned long addr);
 };
 
+#ifdef CONFIG_PER_VMA_LOCK
+static inline void vma_init_lock(struct vm_area_struct *vma)
+{
+	init_rwsem(&vma->lock);
+	vma->vm_lock_seq = -1;
+}
+
+static inline void vma_write_lock(struct vm_area_struct *vma)
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
+/*
+ * Try to read-lock a vma. The function is allowed to occasionally yield false
+ * locked result to avoid performance overhead, in which case we fall back to
+ * using mmap_lock. The function should never yield false unlocked result.
+ */
+static inline bool vma_read_trylock(struct vm_area_struct *vma)
+{
+	/* Check before locking. A race might cause false locked result. */
+	if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
+		return false;
+
+	if (unlikely(down_read_trylock(&vma->lock) == 0))
+		return false;
+
+	/*
+	 * Overflow might produce false locked result.
+	 * False unlocked result is impossible because we modify and check
+	 * vma->vm_lock_seq under vma->lock protection and mm->mm_lock_seq
+	 * modification invalidates all existing locks.
+	 */
+	if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
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
+static inline void vma_assert_write_locked(struct vm_area_struct *vma)
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
+static inline void vma_write_lock(struct vm_area_struct *vma) {}
+static inline bool vma_read_trylock(struct vm_area_struct *vma)
+		{ return false; }
+static inline void vma_read_unlock(struct vm_area_struct *vma) {}
+static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
+
+#endif /* CONFIG_PER_VMA_LOCK */
+
 static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 {
 	static const struct vm_operations_struct dummy_vm_ops = {};
@@ -620,6 +699,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
+	vma_init_lock(vma);
 }
 
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d5cdec1314fe..5f7c5ca89931 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -555,6 +555,11 @@ struct vm_area_struct {
 	pgprot_t vm_page_prot;
 	unsigned long vm_flags;		/* Flags, see mm.h. */
 
+#ifdef CONFIG_PER_VMA_LOCK
+	int vm_lock_seq;
+	struct rw_semaphore lock;
+#endif
+
 	/*
 	 * For areas with an address space and backing store,
 	 * linkage into the address_space->i_mmap interval tree.
@@ -680,6 +685,9 @@ struct mm_struct {
 					  * init_mm.mmlist, and are protected
 					  * by mmlist_lock
 					  */
+#ifdef CONFIG_PER_VMA_LOCK
+		int mm_lock_seq;
+#endif
 
 
 		unsigned long hiwater_rss; /* High-watermark of RSS usage */
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index e49ba91bb1f0..40facd4c398b 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -72,6 +72,17 @@ static inline void mmap_assert_write_locked(struct mm_struct *mm)
 	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+static inline void vma_write_unlock_mm(struct mm_struct *mm)
+{
+	mmap_assert_write_locked(mm);
+	/* No races during update due to exclusive mmap_lock being held */
+	WRITE_ONCE(mm->mm_lock_seq, mm->mm_lock_seq + 1);
+}
+#else
+static inline void vma_write_unlock_mm(struct mm_struct *mm) {}
+#endif
+
 static inline void mmap_init_lock(struct mm_struct *mm)
 {
 	init_rwsem(&mm->mmap_lock);
@@ -114,12 +125,14 @@ static inline bool mmap_write_trylock(struct mm_struct *mm)
 static inline void mmap_write_unlock(struct mm_struct *mm)
 {
 	__mmap_lock_trace_released(mm, true);
+	vma_write_unlock_mm(mm);
 	up_write(&mm->mmap_lock);
 }
 
 static inline void mmap_write_downgrade(struct mm_struct *mm)
 {
 	__mmap_lock_trace_acquire_returned(mm, false, true);
+	vma_write_unlock_mm(mm);
 	downgrade_write(&mm->mmap_lock);
 }
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 5986817f393c..c026d75108b3 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -474,6 +474,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 		 */
 		*new = data_race(*orig);
 		INIT_LIST_HEAD(&new->anon_vma_chain);
+		vma_init_lock(new);
 		dup_anon_vma_name(orig, new);
 	}
 	return new;
@@ -1145,6 +1146,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
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
index c9327abb771c..33269314e060 100644
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
2.39.0

