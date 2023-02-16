Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D78698BF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:28:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNln5TBwz3fn1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:28:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MfUNnuRV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3nbztywykdpimolyhvaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MfUNnuRV;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWh3L8Rz3cdm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:24 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-53317a0238dso8411377b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfsRQat1IE0fDeYSs5Psw7qjLLZE8mkiXmSdSDqQs6E=;
        b=MfUNnuRVqilTlETV75doNo5d3X2f1I64PkztavWwbIZWW2j+3a5GtwWp8jaeE2FAS7
         MLS5o+W6QzlLw73Ic3jcbhKR5fcnDvpJtAm6NUi7rdrBvnG1z5U94zlj5p9Rf6AtiMXB
         /0WTQWR4hibDfKvJz8o49Ph/XAqUGXxJaWOev01ngzcVh9Xd6JHGOFVoBB6DDs9XGB0U
         jDPi/dJdwD6mt/I/Iobb8XMkCnfA0C9OXZWj96tLYiXqom79AFLMHYYopE8HfxvEiMuA
         aI5RyI6LPkvxen53dNb8XfFirBUFuNssxJItswg1uaEv8wS3br6uTFvWft0h1+Cz189K
         IN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfsRQat1IE0fDeYSs5Psw7qjLLZE8mkiXmSdSDqQs6E=;
        b=LseY5Cmb/VTUkib3X8+Qft8zLk84WSrJ4ihBqvhj8O7lm3RE2VStpH720/iL7j/C1R
         TeGFAtau9n3dcoWUTjUpLNJ26JAIfSqHhB7klHRcCiMPFIbkyI3agsrZjh31KYwfPTsm
         kbLYZoyj+YT18oZz6mJvsAiyI6g/wuA1PktOKC0SAn4Ex7TSd2Pll/H+BVdI3QzLlJF8
         YPAvpC+NEOcsFH2bquz6z2PhKF8tKF1CA7DDyZJAxwRmpEN4RBrk0iv6RD5jg3vuqYzB
         5GR7AxssPYpSWOxmp2HEoONYH15tiyefR1CsYzYNVc6ZK/ZOGSA8pF1EAnceBN7wVmxD
         WnKg==
X-Gm-Message-State: AO0yUKWZ6lKhu+5zqRVGqhA2z4/mOX6XVVrDQ5D6bHLYnBNUeeLYgJtS
	5YB3wtur4jyMQgDfStk9u0LlNWVn8zM=
X-Google-Smtp-Source: AK7set/k5YICRmbO5PrlJaB9Zo139wu7UxHEXvq6ujpnvYnblxA9RcHNr8XeBP6uxC5C9xnIzXdi58p2CG0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a25:8e8c:0:b0:965:bac9:d458 with SMTP id
 q12-20020a258e8c000000b00965bac9d458mr0ybl.11.1676524701625; Wed, 15 Feb 2023
 21:18:21 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:26 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-12-surenb@google.com>
Subject: [PATCH v3 11/35] mm: move mmap_lock assert function definitions
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

