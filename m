Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E97E6A488C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:48:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSdp07JNz3fBV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:48:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NrffhdAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3qer8ywykddaegdqznsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NrffhdAm;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNz1Gh8z3cJn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:07 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id x9-20020a1709028ec900b0019cad25ecf5so3960919plo.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/GJoky+VbSuk6dzXc8JP5Q5/FC6q697TPLIvz4vCWo=;
        b=NrffhdAmMk53hmq587bWVqAcVwUoFMyrGdI1dcdSP5rFWcjv1b2dxTOEh/45qUYAPi
         h/0PdE/bzVHMe1/toIQLnI1PA1/EP/QcNn95krcTC4R7+IMiZJdtCRCtMs9jcf3/2ANu
         i0kT+E3X8ZM+V+p/+ReYSUc0stVg3Z855SoJ4cBQAEK0+2hyKtIS1nwe4GOth2yQHLfU
         w8Fk0BJXAVVwtUoVe1w9Qpj9BUCfZjuVzX1iYFGwYp+nbDSsHPi+lTKw+kw0AGwaK95T
         wMmibkxVEN+68L0K6akco8ImKzGRBceFctt146aukjldpyDGZk2PpWKH7Fdr+teexTnY
         XHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/GJoky+VbSuk6dzXc8JP5Q5/FC6q697TPLIvz4vCWo=;
        b=SWzL2rKmG0+aYeVm5/G2FoYSYF2f3/zvtYNBVD+W/Bck/DMmUUiPM5QnAgGzVJlTjY
         9MGvVNUvsH+nQ5X4PmiMucOBDraI8F1Wu15fZsaHajH11wPz4Dz7pWq1At5a2MqS7uIt
         1YPOwJD4equ95S1LdDa9o5zBQnYkzdhswZR/zSHN3VsAfIaPTMuD7JEwzJQgXlcJ12A2
         wgyzQZyjsNYOL7p1zgNtDLshTEYsx2nC442j47TSKuLQ49AFscM2BxuvHhvr4sfc8oZU
         tWuKcEDyE0GwT1r9+01R8ntFKtGOyNk4+U6E9cOBe3w9oue6FUT9EHUO4Ws5HgXX3mXg
         xDUg==
X-Gm-Message-State: AO0yUKV0DsOYhU0CkB0M2Vlqe/CLd/7IKaUKZXmIi8BaGpdWuaOln4+o
	hgYPd8S/OTB28yzKfPFx8iTBLPueTSA=
X-Google-Smtp-Source: AK7set/svLuIVJzjBHat6rB8sP8zcMP/ZnW0bz7V1s9w04rE5j+sFd4oXDqXKYJ9s+zwLVwyfpWMezpHbsk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a17:90a:1081:b0:237:3b68:e50c with SMTP id
 c1-20020a17090a108100b002373b68e50cmr30137pja.1.1677519425412; Mon, 27 Feb
 2023 09:37:05 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:11 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-13-surenb@google.com>
Subject: [PATCH v4 12/33] mm: add per-VMA lock and helper functions to control it
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce per-VMA locking. The lock implementation relies on a
per-vma and per-mm sequence counters to note exclusive locking:
  - read lock - (implemented by vma_start_read) requires the vma
    (vm_lock_seq) and mm (mm_lock_seq) sequence counters to differ.
    If they match then there must be a vma exclusive lock held somewhere.
  - read unlock - (implemented by vma_end_read) is a trivial vma->lock
    unlock.
  - write lock - (vma_start_write) requires the mmap_lock to be held
    exclusively and the current mm counter is assigned to the vma counter.
    This will allow multiple vmas to be locked under a single mmap_lock
    write lock (e.g. during vma merging). The vma counter is modified
    under exclusive vma lock.
  - write unlock - (vma_end_write_all) is a batch release of all vma
    locks held. It doesn't pair with a specific vma_start_write! It is
    done before exclusive mmap_lock is released by incrementing mm
    sequence counter (mm_lock_seq).
  - write downgrade - if the mmap_lock is downgraded to the read lock, all
    vma write locks are released as well (effectivelly same as write
    unlock).

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h        | 82 +++++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h  |  8 ++++
 include/linux/mmap_lock.h | 13 +++++++
 kernel/fork.c             |  4 ++
 mm/init-mm.c              |  3 ++
 5 files changed, 110 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1f79667824eb..bbad5d4fa81b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -623,6 +623,87 @@ struct vm_operations_struct {
 					  unsigned long addr);
 };
 
+#ifdef CONFIG_PER_VMA_LOCK
+static inline void vma_init_lock(struct vm_area_struct *vma)
+{
+	init_rwsem(&vma->lock);
+	vma->vm_lock_seq = -1;
+}
+
+/*
+ * Try to read-lock a vma. The function is allowed to occasionally yield false
+ * locked result to avoid performance overhead, in which case we fall back to
+ * using mmap_lock. The function should never yield false unlocked result.
+ */
+static inline bool vma_start_read(struct vm_area_struct *vma)
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
+static inline void vma_end_read(struct vm_area_struct *vma)
+{
+	rcu_read_lock(); /* keeps vma alive till the end of up_read */
+	up_read(&vma->lock);
+	rcu_read_unlock();
+}
+
+static inline void vma_start_write(struct vm_area_struct *vma)
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
+static inline bool vma_start_read(struct vm_area_struct *vma)
+		{ return false; }
+static inline void vma_end_read(struct vm_area_struct *vma) {}
+static inline void vma_start_write(struct vm_area_struct *vma) {}
+static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
+
+#endif /* CONFIG_PER_VMA_LOCK */
+
 static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 {
 	static const struct vm_operations_struct dummy_vm_ops = {};
@@ -631,6 +712,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
+	vma_init_lock(vma);
 }
 
 /* Use when VMA is not part of the VMA tree and needs no locking */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 64a6b3f6b74f..a4e7493bacd7 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -508,6 +508,11 @@ struct vm_area_struct {
 		vm_flags_t __private __vm_flags;
 	};
 
+#ifdef CONFIG_PER_VMA_LOCK
+	int vm_lock_seq;
+	struct rw_semaphore lock;
+#endif
+
 	/*
 	 * For areas with an address space and backing store,
 	 * linkage into the address_space->i_mmap interval tree.
@@ -644,6 +649,9 @@ struct mm_struct {
 					  * init_mm.mmlist, and are protected
 					  * by mmlist_lock
 					  */
+#ifdef CONFIG_PER_VMA_LOCK
+		int mm_lock_seq;
+#endif
 
 
 		unsigned long hiwater_rss; /* High-watermark of RSS usage */
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index e49ba91bb1f0..aab8f1b28d26 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -72,6 +72,17 @@ static inline void mmap_assert_write_locked(struct mm_struct *mm)
 	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+static inline void vma_end_write_all(struct mm_struct *mm)
+{
+	mmap_assert_write_locked(mm);
+	/* No races during update due to exclusive mmap_lock being held */
+	WRITE_ONCE(mm->mm_lock_seq, mm->mm_lock_seq + 1);
+}
+#else
+static inline void vma_end_write_all(struct mm_struct *mm) {}
+#endif
+
 static inline void mmap_init_lock(struct mm_struct *mm)
 {
 	init_rwsem(&mm->mmap_lock);
@@ -114,12 +125,14 @@ static inline bool mmap_write_trylock(struct mm_struct *mm)
 static inline void mmap_write_unlock(struct mm_struct *mm)
 {
 	__mmap_lock_trace_released(mm, true);
+	vma_end_write_all(mm);
 	up_write(&mm->mmap_lock);
 }
 
 static inline void mmap_write_downgrade(struct mm_struct *mm)
 {
 	__mmap_lock_trace_acquire_returned(mm, false, true);
+	vma_end_write_all(mm);
 	downgrade_write(&mm->mmap_lock);
 }
 
diff --git a/kernel/fork.c b/kernel/fork.c
index a63b739aeca9..e1dd79c7738c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -474,6 +474,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 		 */
 		data_race(memcpy(new, orig, sizeof(*new)));
 		INIT_LIST_HEAD(&new->anon_vma_chain);
+		vma_init_lock(new);
 		dup_anon_vma_name(orig, new);
 	}
 	return new;
@@ -1216,6 +1217,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	seqcount_init(&mm->write_protect_seq);
 	mmap_init_lock(mm);
 	INIT_LIST_HEAD(&mm->mmlist);
+#ifdef CONFIG_PER_VMA_LOCK
+	mm->mm_lock_seq = 0;
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
2.39.2.722.g9855ee24e9-goog

