Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B056632E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:30:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRtR1Jkrz3fKL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:30:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R+wIE/Pt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3nn-8ywykdes574r0ot11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R+wIE/Pt;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR6K0c0Hz3cBy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:55:21 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4c16ff0159eso105576157b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q4uicoifY7gC/4yqte16SYBfutCg5tFbw97tUXlS1Bs=;
        b=R+wIE/Pt4KhRz8VFgR0zMOS2JkvFmXy26q+OSQ9LjCyq0QISjHNPW3JBEjDsyfPMZn
         JHIhnIofZ7qGF96jAqweLgH0bhrxbWlUBYN16b0h3IUNriVtZxEflnZ/KJaCsGgJuROJ
         7NtSec9kWHRW8dxlpNmOxFIq510sDiRPIwm32r6PlWpXwb1OQmeULeUN7CB+D4fk8aTq
         1FAeEWt3FnKxXn+FEK6NZ2a1Nn+94uGmt6MDM7k61uLqgDX1MFlIF8o4Zu3p/TF9jRMz
         yr+WOD/8oTTja8WHghFFUJvljuYoTFD7DGiXYFX6wrr/dkh/UC1lDtuKJ2cCE65save6
         YCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4uicoifY7gC/4yqte16SYBfutCg5tFbw97tUXlS1Bs=;
        b=i044eEpNqzigSfWIICxCTRrP8IVrJDHAunPZx/ngh1KUiHV6D6INeG1DlYVo+EsiW2
         GmTwRh6DbAZxpLEe/W9n4sYsfl5K26w9kYfAM8dIIoucey66KwytSsWk2+tvjqv93xxd
         XjHjuhaCp0iWQjv8Uzq1+qpS6JQI3I6tudYWBLJr1Va9YdATovVjn4k8JoqPpSVWtv1o
         hvK4U9dLyJRCDvzekTEeYVSLxHGMACe+SZTbG19ZSv4WtdUwXIRa/yE/xLuikeBCIHMl
         Qr2UlKcKspS2MkbLlvlKJ16eDvXSJjSVTKGGTrCY1kfCPixd6p5o+MOIxf/AtgdJZNeV
         6rSw==
X-Gm-Message-State: AFqh2kqsv4qiKjSWrMRoh/QxwRhj80j0+rAnvzZ3NsGOsNzz4AdiqD5d
	Fuxx+lo5sRRBRrKVYCv9gJMQhOopUZA=
X-Google-Smtp-Source: AMrXdXufHU+YEXa/HPbI4vLLyfNw163JJwFMEsJciRnPr1X88dc4ccEYYlMB1fPlEQ5O4fkaQPa8neGtLug=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:9246:0:b0:6f2:2d54:dcdf with SMTP id
 e6-20020a259246000000b006f22d54dcdfmr6080399ybo.144.1673297718997; Mon, 09
 Jan 2023 12:55:18 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:34 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-40-surenb@google.com>
Subject: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
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

call_rcu() can take a long time when callback offloading is enabled.
Its use in the vm_area_free can cause regressions in the exit path when
multiple VMAs are being freed. To minimize that impact, place VMAs into
a list and free them in groups using one call_rcu() call per group.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       |  1 +
 include/linux/mm_types.h | 19 +++++++++--
 kernel/fork.c            | 68 +++++++++++++++++++++++++++++++++++-----
 mm/init-mm.c             |  3 ++
 mm/mmap.c                |  1 +
 5 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3158f33e268c..50c7a6dd9c7a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -250,6 +250,7 @@ void setup_initial_init_mm(void *start_code, void *end_code,
 struct vm_area_struct *vm_area_alloc(struct mm_struct *);
 struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
 void vm_area_free(struct vm_area_struct *);
+void drain_free_vmas(struct mm_struct *mm);
 
 #ifndef CONFIG_MMU
 extern struct rb_root nommu_region_tree;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index fce9113d979c..c0e6c8e4700b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -592,8 +592,18 @@ struct vm_area_struct {
 	/* Information about our backing store: */
 	unsigned long vm_pgoff;		/* Offset (within vm_file) in PAGE_SIZE
 					   units */
-	struct file * vm_file;		/* File we map to (can be NULL). */
-	void * vm_private_data;		/* was vm_pte (shared mem) */
+	union {
+		struct {
+			/* File we map to (can be NULL). */
+			struct file *vm_file;
+
+			/* was vm_pte (shared mem) */
+			void *vm_private_data;
+		};
+#ifdef CONFIG_PER_VMA_LOCK
+		struct list_head vm_free_list;
+#endif
+	};
 
 #ifdef CONFIG_ANON_VMA_NAME
 	/*
@@ -693,6 +703,11 @@ struct mm_struct {
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
index 6d9f14e55ecf..97f2b751f88d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -481,26 +481,75 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
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
@@ -1150,6 +1199,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
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
index 33269314e060..b53d23c2d7a3 100644
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
index 332af383f7cd..a0d5d3af1d95 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3159,6 +3159,7 @@ void exit_mmap(struct mm_struct *mm)
 	trace_exit_mmap(mm);
 	__mt_destroy(&mm->mm_mt);
 	mmap_write_unlock(mm);
+	drain_free_vmas(mm);
 	vm_unacct_memory(nr_accounted);
 }
 
-- 
2.39.0

