Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7FF5A56AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:04:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGkxH63hTz3fDH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:04:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XClgxH8b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=31i4nywykdic352pymrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XClgxH8b;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4n4SPCz308b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:45 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-33dbfb6d2a3so147060907b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=VHFOj4kfUa3xGA3HxCxfqSH2fyPnkF//iB8ZL7PxHTQ=;
        b=XClgxH8bXaTLY5kgySHmNtvDCCVAB8mjOROUY69yCIkvhLsUcaeiTHEG390LZTJ0UJ
         f+bTq7v3mEXk1WZIYhpvHYfgX0MddKEDnFBtUXG7eI4mzGho1uyo+BRigftRuUZpe5ed
         yTJv9FwpqBMqwvSi+XVWkQi2sCAbfOGrPpu1lkrGFWjYvxB7buAqdmGdNV7OSfwNKssU
         SvorUO1mGFzFR5b/hO2rDfP9WSX1xgC98rCcdyQIaEqfPxTvpPYobfXt4iE+GIx2WNMy
         khAj4t26F+rdvp0rGETv3PRP0ykKrNZPVAZGmSPMWGLG1X6s1pkbIB5IUW2TBK/ZgFFb
         KwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=VHFOj4kfUa3xGA3HxCxfqSH2fyPnkF//iB8ZL7PxHTQ=;
        b=4cWWb0i8VgbzDubfNMvMl0GEtETq+OuaPQF//YaBDsFfuMiFAaBTDBkS/vCsWIzASG
         GtaJSVo2cn08GNqJ5llNLw8FLA4/nqQcfIMllnwaVWL5Kn3zpsYckln/JiJ41Y1wbbX+
         e066ogq416ApVSKv06+BKj4svhgo5RsuXY1QjZUiJetvOVFoOzNYW/8H0wZA5DmrJlMy
         +6eKskWeFHypqPnSIPiWwGZtKKaPgPxxozF0nHZQ/96m4zR4VPagLa8jeWbYfHvezi5a
         B2G9LpzbOlq0KuspWtnhtZ+z4TKXLu20k49zwp9Gn3ZCRhAyRdZv4OihptOmrnHvY22F
         HA3g==
X-Gm-Message-State: ACgBeo2zXq8mOOMQTt0Sdw21Jur1kOQCWEC/viH02qsOc0L0LqlaWONu
	X7Z/m9jVY4/2nx1s/d3FFwUc/a8JpXg=
X-Google-Smtp-Source: AA6agR6wyKOqZ82JQBWMvaTOKlqh8vry2Onq3V9mMTZsNJ+QDBtzKC1cVl90fnxR++4fsXM2QhKkAh66mSQ=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a0d:eac9:0:b0:33d:c025:8a74 with SMTP id
 t192-20020a0deac9000000b0033dc0258a74mr11722581ywe.430.1661808342911; Mon, 29
 Aug 2022 14:25:42 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:07 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-5-surenb@google.com>
Subject: [RFC PATCH 04/28] mm: move mmap_lock assert function definitions
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
2.37.2.672.g94769d06f0-goog

