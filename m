Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168267EEC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Sr15gyZz3fVh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:51:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Q7jceUjh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=38ijuywykdlkrtqdmafnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Q7jceUjh;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sd10ktBz3fJf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:40 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-507aac99fdfso65532237b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfsRQat1IE0fDeYSs5Psw7qjLLZE8mkiXmSdSDqQs6E=;
        b=Q7jceUjhtfhNXIUFz0/MzwmS5ZgtWEAK+cBK0blt69F8+KIFs/AwOKnAqPB+IEDKT/
         FyLbx1gLVqD34Rlv7gRilV5FNygR87+qF/41EC627UqwDLTg6NJEFnAj/1s6LMME1gBy
         h9D9urWoN0e32uyucIiiCDtt59fZ91UJGpShxrAxprHccHpeDkPGS432b78Iuw1rAi+Y
         PGxS0P/Csnmusy4TpNpOjbr38NhV2uRvkkx/I7vAEJVPhb/fpP3E3BB7l9N5Jq8Ddy4K
         G0deOaLN7bYZJlZOXJL3xM94KhFiD/71EdmjsD4THVYmj7eB4g9ZYLPfdvfcp6yLyVR8
         Oqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfsRQat1IE0fDeYSs5Psw7qjLLZE8mkiXmSdSDqQs6E=;
        b=EP9Qz5CSdGuGb7TU3mbvb1fw1Gn76jM39NBCjxv+T69CMXve4yOTlMui8gsbSRtprS
         JVNoWnF+5i44T0GbH9/cR5jCpHGW00gGe1OfXcdwQxkv1/K6DXYqZKmOmYjgAuWfDSuL
         jc6B3Yjtc/F4ieQ3xMIj7Wws8OKHymAMQK9waf0t65e041X9yToaoQAskwDqtoCl+BWV
         ck1/qJHLuuUa5s0Nkz8z0C7K/rkEw9L80HNKN1LDVomkFwM6V/woVGu1KK5IOZu+WCh4
         z8CrI3stQxSJdoZsVaL0smmH3N6U9AKcDS9MBgXokAMXXCc7/nnbj8evpxz5mE7EmqaR
         j1RQ==
X-Gm-Message-State: AO0yUKW2AKGJrzfiRunFV18MQvLubTF9Dy+3MsnfLwk7u4v8XCWXD+F0
	vPP+6a7v60eu8jFm0j+eZLlFe9AZnEw=
X-Google-Smtp-Source: AK7set9LIYXWd5UhR4gu2cf1OYz0XpBzDlrTVxbQWEhDgYvTk1OPOqMByF3iTmnXKTsrl+3RDXXXUtjCRT8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a0d:f2c3:0:b0:50a:468d:48d8 with SMTP id
 b186-20020a0df2c3000000b0050a468d48d8mr731943ywf.104.1674848498315; Fri, 27
 Jan 2023 11:41:38 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:47 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-11-surenb@google.com>
Subject: [PATCH v2 10/33] mm: move mmap_lock assert function definitions
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
2.39.1

