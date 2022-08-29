Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1795A56A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGkwf09BPz3f82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:03:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=f0ZITQpE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=31s4nywykdiy241oxlqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=f0ZITQpE;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4l66bsz308b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:43 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-32a115757b6so148252717b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=r66X5QU6Hd1zKKrQM4VdH4G/hUbDUrS2PjBFocCJ7kE=;
        b=f0ZITQpEExaLaSKDQb+h3/jYVFf5BjWfu0A0p9NMJ80xDBwkhscojqDzgDQ6W2gLIU
         JqyvlNc6N0TYQxhXpPiBzGuyzj1xr5cqDIbNzDR0v00qVutFwkDUQtyKnSj2Dn+NYRmF
         XbYPUhr7ZlEh9zlxoVr+7UyC5/R2ipvFX7ptRmhGZgjobP0J3ITaBrEOKND2CAY9iU2J
         fnwalrszPulqwRWfSp/VwWSeSLynEBR581yqV4QALN8e0aPzId5HIRtAjN2fmV4usJpw
         ghPowcSLA4CLZg9Bm0wFQDYbe3eb9NsWWsLPsurv1jkHcSRK8KYhRIFhxtRmb7OcOQkd
         NeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=r66X5QU6Hd1zKKrQM4VdH4G/hUbDUrS2PjBFocCJ7kE=;
        b=ss+C7wr0IcoshoahLeeI5xNGr4JQBHCAYN9PLRRX3L3ru2jLGK2b4Hdxrh+ILFAtAt
         yAx6L4HOhYSvz0VUSdwTEWv8conJ0z8YJ4epftAX6ni25hytfK/nAL3ony/1eIyr0fTO
         wI37B1238MGOxd3Nle7NrpUDOV7OtHol85THkEOWOZgXsY3+toH6jcU5NkcIjJfmSgK9
         rExF9At2OEa1vJhVSZvv1kkClm6M2wXbFPMoVqbr+RC5LGmVBwiR2fLUK06erWGqMkRc
         0jlMnHNOBfIbr3HmlTH6EXfuZNHeVvnA1zojbfGfc7Kf0MxMkkH3uZeS/xrBEeTMhLkd
         T4kA==
X-Gm-Message-State: ACgBeo2wEgUKTSsloTWmmkM0M1WH3QQ1TSx/xc0QxY2YGPzYzcIg058V
	TYPqL5RN6kFctxMVFhnECp/s+adhWls=
X-Google-Smtp-Source: AA6agR7RORyYEvgHp7XQu1QQYhj/biZijMsx0xRWZsAvcqgghjoomkWy7B4TiExDCzWJq5q+aaEXQCYL4WE=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a25:254f:0:b0:695:7c37:9202 with SMTP id
 l76-20020a25254f000000b006957c379202mr10232936ybl.79.1661808341087; Mon, 29
 Aug 2022 14:25:41 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:06 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-4-surenb@google.com>
Subject: [RFC PATCH 03/28] mm: introduce __find_vma to be used without
 mmap_lock protection
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
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
2.37.2.672.g94769d06f0-goog

