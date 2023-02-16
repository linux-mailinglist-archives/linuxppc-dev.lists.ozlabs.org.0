Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA36698C60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:49:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHPD0284Nz3gN9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:49:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JAL2Aq1j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=31lztywykdcszbyluinvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JAL2Aq1j;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXj3Mtlz3chq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:19:17 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id p83-20020a25d856000000b0095d2ada3d26so833506ybg.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCR40Nt3TWmXm3CiMW8diiOUlGd9n6tZbm3lsLizpE8=;
        b=JAL2Aq1jm/4r1JqeZYEWBrue/W3MPTrJmtqCzmWLkH/WIKCq/WNMS7CZcuyalyxOey
         IosycXB+MxcwT4QBmmHaciSLx6z1YK/qs/xuZHAZ6O8LZPapUolphd/QYky6xf7HXG4m
         TIajJoSTXZu0Yk9TmYuKl91OepBHI9VMsFb9wtZhCPHchjEtdJSeWxPPYnIrHgMp6AHH
         zReb74rJ9HRrecOXakA/GD9/YkepqNwyoeE0Te0FwV1uNkov7IGEqryUYtJWv/bTKuMJ
         k46shKzXYlPWW+imaaqXvyzMwcruK2EkfBqoUiODxJ9SCK0t0Bhmm1Z4Ww2xAI1rN1gq
         fZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCR40Nt3TWmXm3CiMW8diiOUlGd9n6tZbm3lsLizpE8=;
        b=xhcyGW/jnpGn+zymL1M/Csyg6rZKyo9sBpTkZWyUsJKAeFCF13C5jTNK8TdJCZ2GJJ
         UUkd5Kw3GgLSGax/0LjgznFjRHyRsNtQ7wo3iK7fbJ68UOIUyjavcW6I//SJGi27/LJ3
         LWMz6hY42JgGYA8T1C/YrOhxAYqiQwNGxZVJcIv46qBLSwm2SJsQpultGv7/JCf9iyqs
         ELaCqR7l7yuzEaFP9LMN/fbe2iNj1zyttGV+OzqjIvJsMmJeke+8yJTfrb5yGGrlZehZ
         wIWup9NCYQXnE1+6RGLMM/LVxjgRil6TufvLOtZ8A9bYEldsjNkkvX5M8ndmMkG5u3MP
         yaoQ==
X-Gm-Message-State: AO0yUKWSGxAOzI7citgrgYCHoE4vMtmqJeXsAMH6kY5rIiVIemwlpfum
	FJgLeGBfJoUPt6YJMMA7SvLbuhEYKVk=
X-Google-Smtp-Source: AK7set+zfCXRRrabneP7jbhvgAuIkh3ByJMNAQijkS9aLyX/yWFovh9nbJLYkoOZH5rfO4SiFvvO8qqtNyU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a5b:609:0:b0:80b:adf8:4f9b with SMTP id
 d9-20020a5b0609000000b0080badf84f9bmr575565ybq.33.1676524756940; Wed, 15 Feb
 2023 21:19:16 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:49 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-35-surenb@google.com>
Subject: [PATCH v3 34/35] mm/mmap: free vm_area_struct without call_rcu in exit_mmap
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
index 3c9167529417..cedef02dfd2b 100644
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
index a08cc0e2bfde..d0999de82f94 100644
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
index adf40177e68f..d847be615720 100644
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
@@ -2135,7 +2138,7 @@ static inline void remove_mt(struct mm_struct *mm, struct ma_state *mas)
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += nrpages;
 		vm_stat_account(mm, vma->vm_flags, -nrpages);
-		remove_vma(vma);
+		remove_vma(vma, false);
 	}
 	vm_unacct_memory(nr_accounted);
 	validate_mm(mm);
@@ -3085,7 +3088,7 @@ void exit_mmap(struct mm_struct *mm)
 	do {
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += vma_pages(vma);
-		remove_vma(vma);
+		remove_vma(vma, true);
 		count++;
 		cond_resched();
 	} while ((vma = mas_find(&mas, ULONG_MAX)) != NULL);
-- 
2.39.1

