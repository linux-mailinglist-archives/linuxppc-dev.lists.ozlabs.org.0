Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8915A9E7D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:52:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTCf63sMz3gK3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:52:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bRQh8Am0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ou0qywykdn8tvsfochpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bRQh8Am0;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSs16WvBz30Ll
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:37 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id z8-20020a17090abd8800b001fd5f11fca7so1734690pjr.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=UrxjF4stvOlBFlzO5LCraBZUw6+ypd0ZdM4ea92X40o=;
        b=bRQh8Am0cRUFMzevPI1RLDrAVB56xe5Pyl618ML1xG5UbYShnlVJ+JUC6EbLQY52Qs
         CIQg2N84xHgD40zt1+Fs+lh7e1EeSPRAe2LH3ariXyDtYJfOUFwmaa2nyKSPAMv4C2LL
         ixfdMT3qEKwsQzU0zWx46k2Kgwbo6qL2ZMjk9kwAzxSkMtv3E+2VRRPySs58VX6WIHgc
         UmMCPxZ+/fBN36M7ZZRa1nwJWHDtOFVZGjkXHsv+iTsKxj9Rn4GNhqh8P+D/9RlG7Da5
         L4TwcjQTaJ8DlcHg4rJEt6EYpCMy8N2APz0jZiSGuITg1YyaGh6hU+QCGH5FDg92dBPv
         Wubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=UrxjF4stvOlBFlzO5LCraBZUw6+ypd0ZdM4ea92X40o=;
        b=4mF67KQfR569QiyKo5p9vrQbvKS1SSV7qYyuaJnfMVnaxFEc8Dn466+cxzxPqcG3ye
         7r/eCmTa6RT0XA/rBhKUuoyKnc8AvDLxfeZsXivNI2WWntf7u2QuDc00YuAm+WE9gEZ+
         U9vvnvXobLOT5p1sirim6lrsIK+lxbudnygqaCH7wRLzzrMkGut5gQguRGWiUiAZwOLa
         s0+S73Xx6HIFN/9W6Dopk77yH0+N+dzSdf8U6YXKjg6esQGIYbzt9nqvnJFwZqCufbN+
         6o+OdjPc1kklsZh/f0QXgnhkKhcHmRM/am8XYamAIJezzoKfyd4A/MwqFz+93vDfDYIi
         qVaQ==
X-Gm-Message-State: ACgBeo02yQh3lfzCVhx07PQufcZmAQHxxf4dzTia1ew8EX0TIrpLtHC1
	uzfjGQe5ZvFiMZfmnYD9lb9Ysc9xdNA=
X-Google-Smtp-Source: AA6agR7mDmCeuzlvD1IqXjWBDc5GDtYGg6tZms9fC4JNMJ+6ZNkDA7fZXZfEW+TFSrB8Qt+rbpDI3NajKAM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:aa7:804c:0:b0:536:80bb:8270 with SMTP id
 y12-20020aa7804c000000b0053680bb8270mr31869167pfm.13.1662053794990; Thu, 01
 Sep 2022 10:36:34 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:16 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-29-surenb@google.com>
Subject: [RFC PATCH RESEND 28/28] kernel/fork: throttle call_rcu() calls in vm_area_free
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

call_rcu() can take a long time when callback offloading is enabled.
Its use in the vm_area_free can cause regressions in the exit path when
multiple VMAs are being freed. To minimize that impact, place VMAs into
a list and free them in groups using one call_rcu() call per group.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       |  1 +
 include/linux/mm_types.h | 11 ++++++-
 kernel/fork.c            | 68 +++++++++++++++++++++++++++++++++++-----
 mm/init-mm.c             |  3 ++
 mm/mmap.c                |  1 +
 5 files changed, 75 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a3cbaa7b9119..81dff694ac14 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -249,6 +249,7 @@ void setup_initial_init_mm(void *start_code, void *end_code,
 struct vm_area_struct *vm_area_alloc(struct mm_struct *);
 struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
 void vm_area_free(struct vm_area_struct *);
+void drain_free_vmas(struct mm_struct *mm);
 
 #ifndef CONFIG_MMU
 extern struct rb_root nommu_region_tree;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 36562e702baf..6f3effc493b1 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -412,7 +412,11 @@ struct vm_area_struct {
 			struct vm_area_struct *vm_next, *vm_prev;
 		};
 #ifdef CONFIG_PER_VMA_LOCK
-		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
+		struct {
+			struct list_head vm_free_list;
+			/* Used for deferred freeing. */
+			struct rcu_head vm_rcu;
+		};
 #endif
 	};
 
@@ -573,6 +577,11 @@ struct mm_struct {
 					  */
 #ifdef CONFIG_PER_VMA_LOCK
 		int mm_lock_seq;
+		struct {
+			struct list_head head;
+			spinlock_t lock;
+			int size;
+		} vma_free_list;
 #endif
 
 
diff --git a/kernel/fork.c b/kernel/fork.c
index b443ba3a247a..7c88710aed72 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -483,26 +483,75 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 }
 
 #ifdef CONFIG_PER_VMA_LOCK
-static void __vm_area_free(struct rcu_head *head)
+static inline void __vm_area_free(struct vm_area_struct *vma)
 {
-	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
-						  vm_rcu);
 	/* The vma should either have no lock holders or be write-locked. */
 	vma_assert_no_reader(vma);
 	kmem_cache_free(vm_area_cachep, vma);
 }
-#endif
+
+static void vma_free_rcu_callback(struct rcu_head *head)
+{
+	struct vm_area_struct *first_vma;
+	struct vm_area_struct *vma, *vma2;
+
+	first_vma = container_of(head, struct vm_area_struct, vm_rcu);
+	list_for_each_entry_safe(vma, vma2, &first_vma->vm_free_list, vm_free_list)
+		__vm_area_free(vma);
+	__vm_area_free(first_vma);
+}
+
+void drain_free_vmas(struct mm_struct *mm)
+{
+	struct vm_area_struct *first_vma;
+	LIST_HEAD(to_destroy);
+
+	spin_lock(&mm->vma_free_list.lock);
+	list_splice_init(&mm->vma_free_list.head, &to_destroy);
+	mm->vma_free_list.size = 0;
+	spin_unlock(&mm->vma_free_list.lock);
+
+	if (list_empty(&to_destroy))
+		return;
+
+	first_vma = list_first_entry(&to_destroy, struct vm_area_struct, vm_free_list);
+	/* Remove the head which is allocated on the stack */
+	list_del(&to_destroy);
+
+	call_rcu(&first_vma->vm_rcu, vma_free_rcu_callback);
+}
+
+#define VM_AREA_FREE_LIST_MAX	32
+
+void vm_area_free(struct vm_area_struct *vma)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	bool drain;
+
+	free_anon_vma_name(vma);
+
+	spin_lock(&mm->vma_free_list.lock);
+	list_add(&vma->vm_free_list, &mm->vma_free_list.head);
+	mm->vma_free_list.size++;
+	drain = mm->vma_free_list.size > VM_AREA_FREE_LIST_MAX;
+	spin_unlock(&mm->vma_free_list.lock);
+
+	if (drain)
+		drain_free_vmas(mm);
+}
+
+#else /* CONFIG_PER_VMA_LOCK */
+
+void drain_free_vmas(struct mm_struct *mm) {}
 
 void vm_area_free(struct vm_area_struct *vma)
 {
 	free_anon_vma_name(vma);
-#ifdef CONFIG_PER_VMA_LOCK
-	call_rcu(&vma->vm_rcu, __vm_area_free);
-#else
 	kmem_cache_free(vm_area_cachep, vma);
-#endif
 }
 
+#endif /* CONFIG_PER_VMA_LOCK */
+
 static void account_kernel_stack(struct task_struct *tsk, int account)
 {
 	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
@@ -1137,6 +1186,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	INIT_LIST_HEAD(&mm->mmlist);
 #ifdef CONFIG_PER_VMA_LOCK
 	WRITE_ONCE(mm->mm_lock_seq, 0);
+	INIT_LIST_HEAD(&mm->vma_free_list.head);
+	spin_lock_init(&mm->vma_free_list.lock);
+	mm->vma_free_list.size = 0;
 #endif
 	mm_pgtables_bytes_init(mm);
 	mm->map_count = 0;
diff --git a/mm/init-mm.c b/mm/init-mm.c
index 8399f90d631c..7b6d2460545f 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -39,6 +39,9 @@ struct mm_struct init_mm = {
 	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
 #ifdef CONFIG_PER_VMA_LOCK
 	.mm_lock_seq	= 0,
+	.vma_free_list.head = LIST_HEAD_INIT(init_mm.vma_free_list.head),
+	.vma_free_list.lock =  __SPIN_LOCK_UNLOCKED(init_mm.vma_free_list.lock),
+	.vma_free_list.size = 0,
 #endif
 	.user_ns	= &init_user_ns,
 	.cpu_bitmap	= CPU_BITS_NONE,
diff --git a/mm/mmap.c b/mm/mmap.c
index 1edfcd384f5e..d61b7ef84ba6 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3149,6 +3149,7 @@ void exit_mmap(struct mm_struct *mm)
 	}
 	mm->mmap = NULL;
 	mmap_write_unlock(mm);
+	drain_free_vmas(mm);
 	vm_unacct_memory(nr_accounted);
 }
 
-- 
2.37.2.789.g6183377224-goog

