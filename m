Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152705A9E2A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:38:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJStd05cfz3dpK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:38:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l1V4yVON;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ye0qywykdj4qspcl9emmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l1V4yVON;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSql3GHTz2xZw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:31 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3449870f0e4so11664367b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=LVrV0vnZTvQ/veouCVIJ2VKTA1Jw28r4MCl6DiRcaDY=;
        b=l1V4yVONtNOUfesG20Bnq72dRtkCeRcz+SXGtADVXwnLsewU/bV2Wj+5K0ek8rbJL5
         /VnIb4yjvzQAA64ppyeiv2tN7SgqNypFCNDrFPFTIYKrt4K6WTB+yC3yHFvMB+ausBHt
         SSGrmorbtqBk+v9sXJa+cknHYK7SdsAdZfIlHKdNs08dvIfwUr5y5G+bCOuk9GDx3jZe
         o3Fb422GusB/mLwU2fWqp5J3gMNLaE1B/UaEPdikTdaz6ywBZryiSPL/0bdT3F8UE3iA
         1RBsfylmTB6McidRxeHwpl546i9VITPOIoqZ/5tnno4M6ww922Mvm4adk4fXxTHJ359z
         mtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=LVrV0vnZTvQ/veouCVIJ2VKTA1Jw28r4MCl6DiRcaDY=;
        b=7qy1sNedEsNG8GjCtSjxNf3MasrzEvPaaCRn7JZpW63hmL2I1YULLYWwhg6+C251zx
         5oV1rw4Kh+YR4MXo4n28nQegjo3nGVyIo2u9oOzGGIMvnRuQsjVh6+VZqh15LmB8BlPT
         RhNTN0CzM+dQNd5+hJL0QUEKIroX+9fsSgNltlaXKPwh5titV9IWxs3z7dWBaNqERpyh
         GZxgwclY9qhEK++oCiePQH90cMTHsuqzLfCjsHa022q/27MkWY+NexnDbPpgTgsHG6ih
         cyEx/fqiDd3RxmnRC6pAuiQUh1U1OMFxgbnHR+MVUeTyxOtr10UQBsW3tCq6ndl3xmi3
         TYFg==
X-Gm-Message-State: ACgBeo3vRxJ0ygpu6j0pAnpcWauEhcQq+k5qtPPP303x9S8lbo7aq+7K
	iADGY9jP7qyRd0PS99Pk20hjtX5gJSU=
X-Google-Smtp-Source: AA6agR5xL9cSC69c+1y/uWKTqLFokWxQZenGw3Ln10dS2nyve2acvx9iJCiS8dOE4h1muByL940MlpUFLCY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:25cf:0:b0:6a2:fe22:657 with SMTP id
 l198-20020a2525cf000000b006a2fe220657mr784117ybl.481.1662053729233; Thu, 01
 Sep 2022 10:35:29 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:51 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-4-surenb@google.com>
Subject: [RFC PATCH RESEND 03/28] mm: introduce __find_vma to be used without
 mmap_lock protection
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

Add __find_vma function to be used for VMA lookup under rcu protection.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
 include/linux/mm.h                    | 9 ++++++++-
 mm/mmap.c                             | 6 ++----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 32e92651ef7c..fc94985c95c8 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -507,7 +507,7 @@ static void error_print_context(struct drm_i915_error_state_buf *m,
 }
 
 static struct i915_vma_coredump *
-__find_vma(struct i915_vma_coredump *vma, const char *name)
+__i915_find_vma(struct i915_vma_coredump *vma, const char *name)
 {
 	while (vma) {
 		if (strcmp(vma->name, name) == 0)
@@ -521,7 +521,7 @@ __find_vma(struct i915_vma_coredump *vma, const char *name)
 struct i915_vma_coredump *
 intel_gpu_error_find_batch(const struct intel_engine_coredump *ee)
 {
-	return __find_vma(ee->vma, "batch");
+	return __i915_find_vma(ee->vma, "batch");
 }
 
 static void error_print_engine(struct drm_i915_error_state_buf *m,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 21f8b27bd9fd..7d322a979455 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2712,7 +2712,14 @@ extern int expand_upwards(struct vm_area_struct *vma, unsigned long address);
 #endif
 
 /* Look up the first VMA which satisfies  addr < vm_end,  NULL if none. */
-extern struct vm_area_struct * find_vma(struct mm_struct * mm, unsigned long addr);
+extern struct vm_area_struct *__find_vma(struct mm_struct *mm, unsigned long addr);
+static inline
+struct vm_area_struct *find_vma(struct mm_struct *mm, unsigned long addr)
+{
+	mmap_assert_locked(mm);
+	return __find_vma(mm, addr);
+}
+
 extern struct vm_area_struct * find_vma_prev(struct mm_struct * mm, unsigned long addr,
 					     struct vm_area_struct **pprev);
 
diff --git a/mm/mmap.c b/mm/mmap.c
index 9d780f415be3..693e6776be39 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2250,12 +2250,11 @@ get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 EXPORT_SYMBOL(get_unmapped_area);
 
 /* Look up the first VMA which satisfies  addr < vm_end,  NULL if none. */
-struct vm_area_struct *find_vma(struct mm_struct *mm, unsigned long addr)
+struct vm_area_struct *__find_vma(struct mm_struct *mm, unsigned long addr)
 {
 	struct rb_node *rb_node;
 	struct vm_area_struct *vma;
 
-	mmap_assert_locked(mm);
 	/* Check the cache first. */
 	vma = vmacache_find(mm, addr);
 	if (likely(vma))
@@ -2281,8 +2280,7 @@ struct vm_area_struct *find_vma(struct mm_struct *mm, unsigned long addr)
 		vmacache_update(addr, vma);
 	return vma;
 }
-
-EXPORT_SYMBOL(find_vma);
+EXPORT_SYMBOL(__find_vma);
 
 /*
  * Same as find_vma, but also return a pointer to the previous VMA in *pprev.
-- 
2.37.2.789.g6183377224-goog

