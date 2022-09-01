Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF695A9E5E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT273PLyz3f7M
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:44:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RQU4Av3G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3fu0qywykdlstvsfochpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RQU4Av3G;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrK0sCrz3bxp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:00 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id bu13-20020a056902090d00b00671743601f1so4875265ybb.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=CVmSMjmLYwB9FBtpYSNLJ0EV++HpteWYtmAikuEnyj8=;
        b=RQU4Av3GuaGnYpE9oeVZ2Qc2D9oyD+ip4sYivAtlCkyS2/hNn9rv0v8p2M0NIGYJND
         Yf8x5cX18al4RtSO4Q1PhkVmfw1aU1Ab/Cll55dcKrRpQKauqrB7xyNC80pmZ6bW9bAC
         e95UH0jr+QtsvW6E0Yi+7Q29f7LTJtJy2OM2cQAlA/mMmKe3iC7olC3Rgqr7kYyQ1CJQ
         Co86J6JNei7V+ykfhNyFAPymL77cyA2ZQroFaHENAEs99CXDu6wa2X/Gpfr/HBQQdv4H
         QNCI3+GHYcOaSG+P0vp/Qcr7DGv7/3qUpIL4nQqbN3ksWTquAWAHtimY4d22gaOesNyT
         C0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=CVmSMjmLYwB9FBtpYSNLJ0EV++HpteWYtmAikuEnyj8=;
        b=19wULD39AS4L9V9CRWYwDuIgiVYiGVbyEde+kBQXu5Ubt3blz6IrEAbN61q5I8dT8z
         Wf0GNLpgDjHxHbUkgVxv+DpTy7UK9nHHn6lnRnXID/Xg4NpsA8dzqUQ46D0N56XDPZxy
         pBDGQKzVM9lx58vJDj3UW//qKvKqGlKB8rsptazrmN0iuXYWMa0roqMVotY6MJNuRjij
         irBu91JMQ2eF1I0GhRJ0BFrJMaGHj23GMAH3JQ+pBMjptXpqdi7skZOKSfD8ktGCA5vQ
         RePTaV/u6GQO/oWXquv0uG7pDdXCsVyEhYD4xi7fcTB5FMKjcQz7Mj5S0byMw3X7FqU8
         YYTQ==
X-Gm-Message-State: ACgBeo2Sd/yWAZUZup1f+DhzCwc+1rlfWa5BcMdTWGrvHs1BQ2h3PnWL
	GjkDDd98UXoRrglf7x8pekKN2PlMhag=
X-Google-Smtp-Source: AA6agR571otBJ73SV6fz6quBhFyvEDhG9tsbvxbf3EGsugmeaIr00wfh/qpDUZrPhQkoYyC6wjg4lFM6a0U=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:1c3:0:b0:6a2:2d4e:6bf8 with SMTP id
 186-20020a2501c3000000b006a22d4e6bf8mr1787307ybb.564.1662053758377; Thu, 01
 Sep 2022 10:35:58 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:02 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-15-surenb@google.com>
Subject: [RFC PATCH RESEND 14/28] mm: mark VMAs as locked before isolating them
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

Mark VMAs as locked before isolating them and clear their tree node so
that isolated VMAs are easily identifiable. In the later patches page
fault handlers will try locking the found VMA and will check whether
the VMA was isolated. Locking VMAs before isolating them ensures that
page fault handlers don't operate on isolated VMAs.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c  | 2 ++
 mm/nommu.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 094678b4434b..b0d78bdc0de0 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -421,12 +421,14 @@ static inline void vma_rb_insert(struct vm_area_struct *vma,
 
 static void __vma_rb_erase(struct vm_area_struct *vma, struct rb_root *root)
 {
+	vma_mark_locked(vma);
 	/*
 	 * Note rb_erase_augmented is a fairly large inline function,
 	 * so make sure we instantiate it only once with our desired
 	 * augmented rbtree callbacks.
 	 */
 	rb_erase_augmented(&vma->vm_rb, root, &vma_gap_callbacks);
+	RB_CLEAR_NODE(&vma->vm_rb);
 }
 
 static __always_inline void vma_rb_erase_ignore(struct vm_area_struct *vma,
diff --git a/mm/nommu.c b/mm/nommu.c
index e819cbc21b39..ff9933e57501 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -622,6 +622,7 @@ static void delete_vma_from_mm(struct vm_area_struct *vma)
 	struct mm_struct *mm = vma->vm_mm;
 	struct task_struct *curr = current;
 
+	vma_mark_locked(vma);
 	mm->map_count--;
 	for (i = 0; i < VMACACHE_SIZE; i++) {
 		/* if the vma is cached, invalidate the entire cache */
@@ -644,6 +645,7 @@ static void delete_vma_from_mm(struct vm_area_struct *vma)
 
 	/* remove from the MM's tree and list */
 	rb_erase(&vma->vm_rb, &mm->mm_rb);
+	RB_CLEAR_NODE(&vma->vm_rb);
 
 	__vma_unlink_list(mm, vma);
 }
-- 
2.37.2.789.g6183377224-goog

