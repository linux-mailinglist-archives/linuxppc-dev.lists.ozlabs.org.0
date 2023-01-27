Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BF67EF58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3TJ02QRyz3fcs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R8vm5sGe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3jsnuywykdowgifsbpuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R8vm5sGe;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sf02vGXz3fJZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:32 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-50e79ffba49so13667557b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3NZtkliWQhGwQQ6J+V08tBPQFOX7N0W14jS8GdMVSo=;
        b=R8vm5sGePmLU1Pe4mKnKd7BNiKDqaMQRSE2Uxaf9jHVe/UX+8wZaZnli/NAPrvHh5D
         Gp2YVdh1UhOUz23uxWg1VsM9bUD5cup3/ZbXShp0DX2DQS4OYSwXrDDdrwmKhIAFH0Hw
         74ENSW8vtZuV6jUaLsmkcaEy+yDT+z+95V7siTwW55EWIBuns5aniQb/TRczPRcRq3g4
         VhtuB5yMK58BxiemGZ2CqsONqT2FuthDA4119d3zQhl7jpXryXulujWcH7o4rSRWH8Tl
         w610sqrsMHevwvr509uliYrTdDC7Uzh2VKUBma4LjNdxi7kycc6HPZnQZbUV0crFM3wd
         Zbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3NZtkliWQhGwQQ6J+V08tBPQFOX7N0W14jS8GdMVSo=;
        b=ToZTt0cKLJypYrhVZPXRRCYCeXWIPpM8l7s9u3Bb0SdUDy85lYG1G7MOS+kWBuyTzO
         i/wRCZnnc6icvUQFKkDaT/OwDO/WLA57crJuK+89AVrciH39E5uWxcULKvIP7QxKOb6q
         89t938ye5lvDK/QrqKJJhv+Yv/fq66/0sr6H6M0ORSPjiA3AeUhLQ7VkNmeCuJTJH2os
         zy2p+02EUWoD2rKjsJiJErlkZTjWG5u3jYFAXIIXsDaTNgli1jvi3AiJ/nhu9PU7b1kt
         vwv/IH+pMWiOOGfFndGmiAa8KxQ3bo1zk8JlbhG/zcWJJkKiMbPzWARSChpnaes502+K
         KAjg==
X-Gm-Message-State: AO0yUKXLAqm9/Rue0Y0Rz3bXlZhws/naBkFlnKwRzuw1svNHkgCVgqpC
	zzK4HtwQw4JOG/ALhokloY9UX2usXeU=
X-Google-Smtp-Source: AK7set9ZwBhHaiq8PgHnHZpi30bVFoqemTYpH4CqkWTR3ntjpG4ZYW0UY93Gsvx11KtEAuMPsZpv9FPCPgs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a25:db07:0:b0:80b:8dd0:7b35 with SMTP id
 g7-20020a25db07000000b0080b8dd07b35mr1614607ybf.322.1674848549978; Fri, 27
 Jan 2023 11:42:29 -0800 (PST)
Date: Fri, 27 Jan 2023 11:41:09 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-33-surenb@google.com>
Subject: [PATCH v2 32/33] mm/mmap: free vm_area_struct without call_rcu in exit_mmap
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
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
index a6de58bb40c7..1c4ddcd6fd84 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -250,6 +250,8 @@ void setup_initial_init_mm(void *start_code, void *end_code,
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
index 3d0cfbc92745..1028fe131bb7 100644
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
@@ -2134,7 +2137,7 @@ static inline void remove_mt(struct mm_struct *mm, struct ma_state *mas)
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += nrpages;
 		vm_stat_account(mm, vma->vm_flags, -nrpages);
-		remove_vma(vma);
+		remove_vma(vma, false);
 	}
 	vm_unacct_memory(nr_accounted);
 	validate_mm(mm);
@@ -3083,7 +3086,7 @@ void exit_mmap(struct mm_struct *mm)
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

