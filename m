Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8826A492E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 19:06:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQT2V0RLqz3gC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 05:06:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AIld2qfh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3cer8ywykdgaqspcl9emmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AIld2qfh;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPv26qvz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:55 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id q5-20020a170902788500b0019b0c60afa8so3956157pll.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3L0KDnzHjfWSabmEfm0QwnSpYouz37Z4kQXdx4wyok=;
        b=AIld2qfh1hJ81pjBHIB2k6hHEBq4B9cQ7unRZ/ajU5zus4NStrM4vKSoC+D3xf5i2V
         I3lWxazmPww6pY3JnOd6ILpcq/3gMzUiBxySkT7gq+qA5zIjvIc98kXlCsV1T3OkgNoC
         wkB+0CjdoEsCW0SjfCSG1j8AzXTBtq+xLwxdRi9trKrWP6pzQ/z8RPgzdw1aTSBFWEFp
         tuWqf3fIoKXV2B5eA1r5q/mXlFY1b1mqVSiItBYfUpJVFKPT1XTPlAbMteQM7dFl9Yt7
         rI/aJtYFzH6GTH9qBEbz2dvU/L39seWUdch/8Eafr+7mGpiemwVm0woR+UJD5ik1qt28
         1vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3L0KDnzHjfWSabmEfm0QwnSpYouz37Z4kQXdx4wyok=;
        b=O+Zp6NCDkKUFVAaVh+ehRg60lLEdh90ZgzKH76NJBjyYl+N9pXmffqMxnm995To3tS
         hdBJb+vsucQp+1lJaxNOFDfZwXRnXkET7qk+Dpqd2ympeR4u9KRnwcy2MHy3aRRLG19q
         HPadnfGXzHVY5xz+mn22ftstahisCF2psLgUsisLzNfwkZeJI0umVa3P28Ie7EmadigG
         1BiJ1DTzdKN5a3u/4/yJ9N/nIuqHT189d1giQzEMtvcLZ6AWEx834hLOCCcA0l85hApK
         vGvFgNq1Rno+s7RFLgirB/+ar77fPEELtQ7RMw1WUnUhJ+Hy8sNKpBrS/nBeQMkp2eEw
         gBIA==
X-Gm-Message-State: AO0yUKURldYBC6wvOclHQDJtZceYMPG4qDPCV1wkM3KPZ6COJ7n0iqDw
	IA2fNV7HXMcVMmeZHLd/S3RQ5C/3TEY=
X-Google-Smtp-Source: AK7set/h2/2/QuyVN0yF0KgPZgsVR0g2a/0YsQFw2JhIAgW+zKPw0n5+assM7s0mQSWtQbHur04pQimjpmw=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a17:90a:b388:b0:234:ba6f:c97a with SMTP id
 e8-20020a17090ab38800b00234ba6fc97amr24135pjr.3.1677519473325; Mon, 27 Feb
 2023 09:37:53 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:31 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-33-surenb@google.com>
Subject: [PATCH v4 32/33] mm/mmap: free vm_area_struct without call_rcu in exit_mmap
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

call_rcu() can take a long time when callback offloading is enabled.
Its use in the vm_area_free can cause regressions in the exit path when
multiple VMAs are being freed.
Because exit_mmap() is called only after the last mm user drops its
refcount, the page fault handlers can't be racing with it. Any other
possible user like oom-reaper or process_mrelease are already synchronized
using mmap_lock. Therefore exit_mmap() can free VMAs directly, without
the use of call_rcu().
Expose __vm_area_free() and use it from exit_mmap() to avoid possible
call_rcu() floods and performance regressions caused by it.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h |  2 ++
 kernel/fork.c      |  2 +-
 mm/mmap.c          | 11 +++++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d07ac923333f..5e142bfe7a58 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -256,6 +256,8 @@ void setup_initial_init_mm(void *start_code, void *end_code,
 struct vm_area_struct *vm_area_alloc(struct mm_struct *);
 struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
 void vm_area_free(struct vm_area_struct *);
+/* Use only if VMA has no other users */
+void __vm_area_free(struct vm_area_struct *vma);
 
 #ifndef CONFIG_MMU
 extern struct rb_root nommu_region_tree;
diff --git a/kernel/fork.c b/kernel/fork.c
index bdb55f25895d..ad37f1d0c5ab 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -480,7 +480,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	return new;
 }
 
-static void __vm_area_free(struct vm_area_struct *vma)
+void __vm_area_free(struct vm_area_struct *vma)
 {
 	free_anon_vma_name(vma);
 	kmem_cache_free(vm_area_cachep, vma);
diff --git a/mm/mmap.c b/mm/mmap.c
index df13c33498db..0cd3714c2182 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -133,7 +133,7 @@ void unlink_file_vma(struct vm_area_struct *vma)
 /*
  * Close a vm structure and free it.
  */
-static void remove_vma(struct vm_area_struct *vma)
+static void remove_vma(struct vm_area_struct *vma, bool unreachable)
 {
 	might_sleep();
 	if (vma->vm_ops && vma->vm_ops->close)
@@ -141,7 +141,10 @@ static void remove_vma(struct vm_area_struct *vma)
 	if (vma->vm_file)
 		fput(vma->vm_file);
 	mpol_put(vma_policy(vma));
-	vm_area_free(vma);
+	if (unreachable)
+		__vm_area_free(vma);
+	else
+		vm_area_free(vma);
 }
 
 static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator *vmi,
@@ -2130,7 +2133,7 @@ static inline void remove_mt(struct mm_struct *mm, struct ma_state *mas)
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += nrpages;
 		vm_stat_account(mm, vma->vm_flags, -nrpages);
-		remove_vma(vma);
+		remove_vma(vma, false);
 	}
 	vm_unacct_memory(nr_accounted);
 	validate_mm(mm);
@@ -3070,7 +3073,7 @@ void exit_mmap(struct mm_struct *mm)
 	do {
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += vma_pages(vma);
-		remove_vma(vma);
+		remove_vma(vma, true);
 		count++;
 		cond_resched();
 	} while ((vma = mas_find(&mas, ULONG_MAX)) != NULL);
-- 
2.39.2.722.g9855ee24e9-goog

