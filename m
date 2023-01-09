Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58631663229
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:03:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRJ214SPz3fRh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:03:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lU92C8Jc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=37x68ywykdaiuwtgpdiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lU92C8Jc;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4w0fbZz3cFl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:07 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 11-20020a25050b000000b007b7968a6423so10315501ybf.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Z9LsPdf1X6x51hAUi2Nm1VlEONIlFgbEepvCuHuj0=;
        b=lU92C8Jcfmul8qFoqZuzCOb83nRDo2DOHABHtbUeff7KpjabsQdodVMIjgjNegm4Ui
         gxUyuAPRcETsiRyXJ5mliOj6g1oYM6B1qnPvTAT1LA3dK82Ds4hQfkrM9RtYlbde0cbx
         i9uLWTSQCuYKj1fxgTqem2OIhsK37AMmmELynCklGF8pD//eviNoFDjhffy4KqRRdQJC
         MSzyVPeVUGI3nBlo70SJ15d8SfW3UoSbvzQXr0uydmfUdXg4Fl9jpjR3RSUiLlvME5Kv
         Z62tI5fReQIg+DMNczYR66QAZbTIG8pGdwhVnCRBmPZaWsdfRkDIb3vX4UMeFSba2+4A
         TcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Z9LsPdf1X6x51hAUi2Nm1VlEONIlFgbEepvCuHuj0=;
        b=q7ojBptqXM8KK4kJcIGK/vAfm9FL3hnpRPj1Q6H434gn3CppX0MSm97xWakl3XItPJ
         i+ob8vcnu4AocRIH/cy4KghCEWyYoHr9DiZJkHAfKCoxCaKD21dFz5QIEkjw1aAAoRVj
         p0OSzzZIAzQrpS0b2QdNblDySuV4KlWRxTFl9VUngCLabfHHsAHABPwvqnrdGkxWGvTH
         6QWK6recauegG/+Ine9iEnR2oEu+mCSTXe/YZWYIAmB9Uu2VgZWOR7UIqjGdxfst9PWc
         p+Z2L8bB0cu2tBXg6zxrlaJkW7e2w40FyfjEPShIlI0Klw+vlYVaP2YaTovmIPWUfMi2
         ClBQ==
X-Gm-Message-State: AFqh2kqxq+PgElJo2zVLFxV7DGG4cG5mflAwTFh8y+R21EdpvnX3QCo2
	ZMh0iNPxpbmfDk+hbQ4166/2b8VBmfM=
X-Google-Smtp-Source: AMrXdXt5VtatAvHvgu6DDkpLTQLv6tox4QHYgsFVwcGGt6mUkf2zF94ad2ULjvwhvY9gJJrtYWAmbQIwTHs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a81:4fd0:0:b0:468:5f78:265a with SMTP id
 d199-20020a814fd0000000b004685f78265amr1632391ywb.87.1673297645909; Mon, 09
 Jan 2023 12:54:05 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:05 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-11-surenb@google.com>
Subject: [PATCH 10/41] mm: move mmap_lock assert function definitions
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
2.39.0

