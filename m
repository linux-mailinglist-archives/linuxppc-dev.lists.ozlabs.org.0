Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655E5A9E38
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSvH0Mw8z3drs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:38:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IEnDpG3Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3y-0qywykdkasurenbgoogle.comlinuxppc-devlists.ozlabs.org@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IEnDpG3Y;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqm2dBQz2xrX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:32 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-33ef3e5faeeso228800377b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=SmLlv5S95s1SYD/hq46yY1KSJ7CCwWbvNekA+AzNinI=;
        b=IEnDpG3YZTPCaLyxObjk7amCPTURBOnqU7bJ+HMdi+ub5B49wgcvI5S5rtmD90rv2Q
         AZvqZR25+q4mnRP5jUchvAffVc/FzpkmhNDkv4FRnlMM4OlY6itcjxw3UZXpfpnem++C
         EJWIMKaiqyYuCH4R4X9b15IgDB9xODniSPpGeOsiXfRmLSll0Bi1jUHU15lpXlXRSc5J
         +CLYoEdfwTQrLCZejly8sqYsr7A+RsOmJlAwK6fhbCZlwscLc4WTaIF87eXTXBY8BoJB
         i633PKqUr/jul5ZT9UiyTCl07dJq2r9+I6Xxo/FEUAli95MNIWyATvVTZ7NKsjxM0gu/
         3dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=SmLlv5S95s1SYD/hq46yY1KSJ7CCwWbvNekA+AzNinI=;
        b=fNSuXqdSjehjGvCXx9Fch+JB9Zocf8QT7j+y80vfXvkLck4BdKOIt6OGlaII1gObos
         uODcyCk5xj6xDv9bDPrIbypIgfVs9+GQA/L55s1eFwz/3+MGgwdOe1NNET8MHSmkr+82
         FylyFkVnS86e15/kebCTtRHALbpfv8JqLNxDEZywZ4jimnAALi4O7jU/h4I1lC1AFQoA
         zzy721HuNghLgI4ASoIIVtpZC89NT1uhOzVP/VVy3qR1Yp3JKSv16h8GovilSJXXBvT6
         MjHnH2NX5TVF7dIP+e9vMtzlxZmQruk0tuF0m0xaTQE+Fu6hnDGLmfO0lvO3E9PhVISa
         KatQ==
X-Gm-Message-State: ACgBeo3dUZskUyHGOUDHGwwNAgXNKBHPHtOBohbQ2JwBYt4V+s0U6RlH
	RzaAxOqtbTuQuciavNSQ62KoOUMFANY=
X-Google-Smtp-Source: AA6agR7LHtl/RnUFMM8Ba/UDLwcr+KKZqP3s3F3o0L7ZSX4nHIA8V0azyARB9tbw+yLexNRTedxLJOpzAXk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a05:6902:1366:b0:691:4335:455b with SMTP id
 bt6-20020a056902136600b006914335455bmr19454643ybb.282.1662053731874; Thu, 01
 Sep 2022 10:35:31 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:52 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-5-surenb@google.com>
Subject: [RFC PATCH RESEND 04/28] mm: move mmap_lock assert function definitions
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

Move mmap_lock assert function definitions up so that they can be used
by other mmap_lock routines.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mmap_lock.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 96e113e23d04..e49ba91bb1f0 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -60,6 +60,18 @@ static inline void __mmap_lock_trace_released(struct mm_struct *mm, bool write)
 
 #endif /* CONFIG_TRACING */
 
+static inline void mmap_assert_locked(struct mm_struct *mm)
+{
+	lockdep_assert_held(&mm->mmap_lock);
+	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
+}
+
+static inline void mmap_assert_write_locked(struct mm_struct *mm)
+{
+	lockdep_assert_held_write(&mm->mmap_lock);
+	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
+}
+
 static inline void mmap_init_lock(struct mm_struct *mm)
 {
 	init_rwsem(&mm->mmap_lock);
@@ -150,18 +162,6 @@ static inline void mmap_read_unlock_non_owner(struct mm_struct *mm)
 	up_read_non_owner(&mm->mmap_lock);
 }
 
-static inline void mmap_assert_locked(struct mm_struct *mm)
-{
-	lockdep_assert_held(&mm->mmap_lock);
-	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
-}
-
-static inline void mmap_assert_write_locked(struct mm_struct *mm)
-{
-	lockdep_assert_held_write(&mm->mmap_lock);
-	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
-}
-
 static inline int mmap_lock_is_contended(struct mm_struct *mm)
 {
 	return rwsem_is_contended(&mm->mmap_lock);
-- 
2.37.2.789.g6183377224-goog

