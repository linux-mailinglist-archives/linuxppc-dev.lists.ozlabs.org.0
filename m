Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB33D6632F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRvb5Y1Tz3fCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:31:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sWtobSCB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ox-8ywykde48a7u3rw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sWtobSCB;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR6M4Q0hz3fC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:55:23 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4c6bd2981d8so66572347b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsiQb/dE9yymRpEr0UBz2Qq4KLrRHehGb+mEU6hVzX0=;
        b=sWtobSCBvoHV5TPkE/zYtWszgUW3jVRDiVjTt3sAcjFBaXlqjfdYiQ6AHG86rnNt0b
         mg+e+VoU+a89JO+rslq34FfyzRkAoGg7DuVDlMH1H1ePQ32MuB2+77t0gAtkJ+y+wX6p
         B/589/jsqLZApvm6BoQPTAcfoFYkEfWsjxaKMUYIa10AIrZvQul2s59ukdBVjUu/Ibrp
         egNG28U4wT5FZXec8pRJXGar6bKM6QyHpkRg0GkDbw6/Hl7olgQ7YiTkujC6hmd+0b7u
         2fP91n1+O4wNRIiFMGmQ1g/TPPehatod7VMoh0dY0z9ogD+TX+MKDQ5sfW6QhS4fa9cZ
         O/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsiQb/dE9yymRpEr0UBz2Qq4KLrRHehGb+mEU6hVzX0=;
        b=ra9q/E6LH8psgSwk1oTQT+uuxJQZgjX+Rt4VPzjKKScuInsPfmUPMUdXW1kbdw2Tkm
         UpZZj1D+FgP5e/V/S6KIeQ3iQCGdPpAIR6xFeF4S/pFegVsrWGiCMfuy6/VIopFZW7y3
         nTlyTK1OWzobGFnlD0dJDBEVWQBdZGfQOtnDLS/8s2qzscDXvSCBzzmZZvli5IrBYY1o
         rRXeksKDYfHUtKeeT5Z0ScDBU0z1Ah2jQCnOis+8IZgyaZubTyMUwGvqHlPZhvG+VQAI
         enPnAGi/YXoyC9ntriUD4LxVBhcjPf5t4LN18z2RQ6/uQYQtvloqSBE5ddC3hLFS/weM
         smAA==
X-Gm-Message-State: AFqh2kpDus8W+VxtCMFQQ+KpwvNW0/2BQbtMcbFii4czqLgU1/jHMtwa
	M2nOcEB4k/hw3BexZ/xok4EYh/vwi8Y=
X-Google-Smtp-Source: AMrXdXvB4GUb8flK/fogRdz9aeHP/yrxt0+V7dhaMMs1drQdYkqQuuAWfxuEu+0du5vQqeydWK6w8e3+WKU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:abc6:0:b0:755:29c5:63e with SMTP id
 v64-20020a25abc6000000b0075529c5063emr6840356ybi.142.1673297721512; Mon, 09
 Jan 2023 12:55:21 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:35 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-41-surenb@google.com>
Subject: [PATCH 40/41] mm: separate vma->lock from vm_area_struct
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

vma->lock being part of the vm_area_struct causes performance regression
during page faults because during contention its count and owner fields
are constantly updated and having other parts of vm_area_struct used
during page fault handling next to them causes constant cache line
bouncing. Fix that by moving the lock outside of the vm_area_struct.
All attempts to keep vma->lock inside vm_area_struct in a separate
cache line still produce performance regression especially on NUMA
machines. Smallest regression was achieved when lock is placed in the
fourth cache line but that bloats vm_area_struct to 256 bytes.
Considering performance and memory impact, separate lock looks like
the best option. It increases memory footprint of each VMA but that
will be addressed in the next patch.
Note that after this change vma_init() does not allocate or
initialize vma->lock anymore. A number of drivers allocate a pseudo
VMA on the stack but they never use the VMA's lock, therefore it does
not need to be allocated. The future drivers which might need the VMA
lock should use vm_area_alloc()/vm_area_free() to allocate it.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       | 25 ++++++------
 include/linux/mm_types.h |  6 ++-
 kernel/fork.c            | 82 ++++++++++++++++++++++++++++------------
 3 files changed, 74 insertions(+), 39 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 50c7a6dd9c7a..d40bf8a5e19e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -615,11 +615,6 @@ struct vm_operations_struct {
 };
 
 #ifdef CONFIG_PER_VMA_LOCK
-static inline void vma_init_lock(struct vm_area_struct *vma)
-{
-	init_rwsem(&vma->lock);
-	vma->vm_lock_seq = -1;
-}
 
 static inline void vma_write_lock(struct vm_area_struct *vma)
 {
@@ -635,9 +630,9 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
 	if (vma->vm_lock_seq == mm_lock_seq)
 		return;
 
-	down_write(&vma->lock);
+	down_write(&vma->vm_lock->lock);
 	vma->vm_lock_seq = mm_lock_seq;
-	up_write(&vma->lock);
+	up_write(&vma->vm_lock->lock);
 }
 
 /*
@@ -651,17 +646,17 @@ static inline bool vma_read_trylock(struct vm_area_struct *vma)
 	if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
 		return false;
 
-	if (unlikely(down_read_trylock(&vma->lock) == 0))
+	if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
 		return false;
 
 	/*
 	 * Overflow might produce false locked result.
 	 * False unlocked result is impossible because we modify and check
-	 * vma->vm_lock_seq under vma->lock protection and mm->mm_lock_seq
+	 * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
 	 * modification invalidates all existing locks.
 	 */
 	if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
-		up_read(&vma->lock);
+		up_read(&vma->vm_lock->lock);
 		return false;
 	}
 	return true;
@@ -669,7 +664,7 @@ static inline bool vma_read_trylock(struct vm_area_struct *vma)
 
 static inline void vma_read_unlock(struct vm_area_struct *vma)
 {
-	up_read(&vma->lock);
+	up_read(&vma->vm_lock->lock);
 }
 
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
@@ -684,7 +679,7 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 
 static inline void vma_assert_no_reader(struct vm_area_struct *vma)
 {
-	VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
+	VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock->lock) &&
 		      vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq),
 		      vma);
 }
@@ -694,7 +689,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 
 #else /* CONFIG_PER_VMA_LOCK */
 
-static inline void vma_init_lock(struct vm_area_struct *vma) {}
 static inline void vma_write_lock(struct vm_area_struct *vma) {}
 static inline bool vma_read_trylock(struct vm_area_struct *vma)
 		{ return false; }
@@ -704,6 +698,10 @@ static inline void vma_assert_no_reader(struct vm_area_struct *vma) {}
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
+/*
+ * WARNING: vma_init does not initialize vma->vm_lock.
+ * Use vm_area_alloc()/vm_area_free() if vma needs locking.
+ */
 static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 {
 	static const struct vm_operations_struct dummy_vm_ops = {};
@@ -712,7 +710,6 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_init_lock(vma);
 }
 
 /* Use when VMA is not part of the VMA tree and needs no locking */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index c0e6c8e4700b..faa61b400f9b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -526,6 +526,10 @@ struct anon_vma_name {
 	char name[];
 };
 
+struct vma_lock {
+	struct rw_semaphore lock;
+};
+
 /*
  * This struct describes a virtual memory area. There is one of these
  * per VM-area/task. A VM area is any part of the process virtual memory
@@ -563,7 +567,7 @@ struct vm_area_struct {
 
 #ifdef CONFIG_PER_VMA_LOCK
 	int vm_lock_seq;
-	struct rw_semaphore lock;
+	struct vma_lock *vm_lock;
 #endif
 
 	/*
diff --git a/kernel/fork.c b/kernel/fork.c
index 97f2b751f88d..95db6a521cf1 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -451,40 +451,28 @@ static struct kmem_cache *vm_area_cachep;
 /* SLAB cache for mm_struct structures (tsk->mm) */
 static struct kmem_cache *mm_cachep;
 
-struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
-{
-	struct vm_area_struct *vma;
+#ifdef CONFIG_PER_VMA_LOCK
 
-	vma = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
-	if (vma)
-		vma_init(vma, mm);
-	return vma;
-}
+/* SLAB cache for vm_area_struct.lock */
+static struct kmem_cache *vma_lock_cachep;
 
-struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
+static bool vma_init_lock(struct vm_area_struct *vma)
 {
-	struct vm_area_struct *new = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
+	vma->vm_lock = kmem_cache_alloc(vma_lock_cachep, GFP_KERNEL);
+	if (!vma->vm_lock)
+		return false;
 
-	if (new) {
-		ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
-		ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
-		/*
-		 * orig->shared.rb may be modified concurrently, but the clone
-		 * will be reinitialized.
-		 */
-		*new = data_race(*orig);
-		INIT_LIST_HEAD(&new->anon_vma_chain);
-		vma_init_lock(new);
-		dup_anon_vma_name(orig, new);
-	}
-	return new;
+	init_rwsem(&vma->vm_lock->lock);
+	vma->vm_lock_seq = -1;
+
+	return true;
 }
 
-#ifdef CONFIG_PER_VMA_LOCK
 static inline void __vm_area_free(struct vm_area_struct *vma)
 {
 	/* The vma should either have no lock holders or be write-locked. */
 	vma_assert_no_reader(vma);
+	kmem_cache_free(vma_lock_cachep, vma->vm_lock);
 	kmem_cache_free(vm_area_cachep, vma);
 }
 
@@ -540,6 +528,7 @@ void vm_area_free(struct vm_area_struct *vma)
 
 #else /* CONFIG_PER_VMA_LOCK */
 
+static bool vma_init_lock(struct vm_area_struct *vma) { return true; }
 void drain_free_vmas(struct mm_struct *mm) {}
 
 void vm_area_free(struct vm_area_struct *vma)
@@ -550,6 +539,48 @@ void vm_area_free(struct vm_area_struct *vma)
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
+struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+
+	vma = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
+	if (!vma)
+		return NULL;
+
+	vma_init(vma, mm);
+	if (!vma_init_lock(vma)) {
+		kmem_cache_free(vm_area_cachep, vma);
+		return NULL;
+	}
+
+	return vma;
+}
+
+struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
+{
+	struct vm_area_struct *new;
+
+	new = kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
+	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
+	/*
+	 * orig->shared.rb may be modified concurrently, but the clone
+	 * will be reinitialized.
+	 */
+	*new = data_race(*orig);
+	if (!vma_init_lock(new)) {
+		kmem_cache_free(vm_area_cachep, new);
+		return NULL;
+	}
+	INIT_LIST_HEAD(&new->anon_vma_chain);
+	dup_anon_vma_name(orig, new);
+
+	return new;
+}
+
 static void account_kernel_stack(struct task_struct *tsk, int account)
 {
 	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
@@ -3138,6 +3169,9 @@ void __init proc_caches_init(void)
 			NULL);
 
 	vm_area_cachep = KMEM_CACHE(vm_area_struct, SLAB_PANIC|SLAB_ACCOUNT);
+#ifdef CONFIG_PER_VMA_LOCK
+	vma_lock_cachep = KMEM_CACHE(vma_lock, SLAB_PANIC|SLAB_ACCOUNT);
+#endif
 	mmap_init();
 	nsproxy_cache_init();
 }
-- 
2.39.0

