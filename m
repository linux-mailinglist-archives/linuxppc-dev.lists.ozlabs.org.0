Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37467EF17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T6c6gSKz3fcN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mLwUPJ0n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3finuywykdn0rtqdmafnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mLwUPJ0n;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sdh4cPXz3fK6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:16 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4d5097a95f5so65086797b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2v/Evza9dkU4Ne98Lm6HAWxL8/YazIwD41pmx7joRkE=;
        b=mLwUPJ0nc0ulmmwFoyR9amwtEYn4GV75pogWN7ijAK31MqrZCBgfhijsONjhepzopP
         2wYY2SkQatHOd+vKpDSxYxHFT1IvhzZTwDWuTcrFWygojUbcZe7xPlEiO9BQnq0w9fKe
         z4cHjJJqSwoele+PetnaYF8lewRv+be+h1Bgt+SNNsmNqcyEHhiyYbNRieovHRIQnY7Q
         KgzOHSrbk4QlZX3GRmHUucd8wrsetfG2ey7u2AbUsjqg+O7jZuWXERmenSwIYYomTRZT
         0AcxNZ8Sif0L8fvqzJHXb63zST/Gg9+vMF9oOa1KQZBohhw7ZSFfQ9eLw7FWbw/nE4Qf
         wodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2v/Evza9dkU4Ne98Lm6HAWxL8/YazIwD41pmx7joRkE=;
        b=Hb9wFpOMjQ2SnCJbhyhh1r7PWW31HI5dIOZ4nPzfeNKJuAgJbkSKe4iPKKTUJzIOtu
         bqW70J1gmi2GArXicwwqpIw9LzkODau+FS9bms77ksXVXpnwAa49pRXLT7FQSznA747H
         /OVZEbxAsjA43A2nLpM8Lh8b4la5lFfueNLwTp2Y1kOLyfbtqQ5KWkHciJgILxxsI7oJ
         icwt003DPKWvx0IGZX3eM2tIdmNt4oUTbQgqJsiaDP7D0BlsGSlsWzB4gQIy7Ho6MfCU
         ukE3Frgr1Xcl4L0F+aHlMMKpCgKs9HU/H6KkIENvOaiMQJU8Kb4j6jpDsjd9igmvt0CA
         V1Gg==
X-Gm-Message-State: AO0yUKUDXluBifBIJlJO6i+FszHLqJ4quUjbT73DCgFsLXna/UknqR8O
	TwqMDve6YQV/yHkpfw79ohRUzF6gFXQ=
X-Google-Smtp-Source: AK7set9kKqDiJe5U7EOGuYIrwgRntRqTHzt+zr2t5qOdc5+YeQS/lL3tZ/xnNoww1dZdAcqE9B1Pln9KCVk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:b2c6:0:b0:509:5b20:ff22 with SMTP id
 q189-20020a81b2c6000000b005095b20ff22mr917640ywh.328.1674848534136; Fri, 27
 Jan 2023 11:42:14 -0800 (PST)
Date: Fri, 27 Jan 2023 11:41:02 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-26-surenb@google.com>
Subject: [PATCH v2 25/33] mm: add FAULT_FLAG_VMA_LOCK flag
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin
 @google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new flag to distinguish page faults handled under protection of
per-vma lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 include/linux/mm.h       | 3 ++-
 include/linux/mm_types.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fa2b9d6e665e..a6de58bb40c7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -472,7 +472,8 @@ static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
 	{ FAULT_FLAG_USER,		"USER" }, \
 	{ FAULT_FLAG_REMOTE,		"REMOTE" }, \
 	{ FAULT_FLAG_INSTRUCTION,	"INSTRUCTION" }, \
-	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }
+	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }, \
+	{ FAULT_FLAG_VMA_LOCK,		"VMA_LOCK" }
 
 /*
  * vm_fault is filled by the pagefault handler and passed to the vma's
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 88619c6a29a3..c4c43f10344a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1053,6 +1053,7 @@ enum fault_flag {
 	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
 	FAULT_FLAG_UNSHARE =		1 << 10,
 	FAULT_FLAG_ORIG_PTE_VALID =	1 << 11,
+	FAULT_FLAG_VMA_LOCK =		1 << 12,
 };
 
 typedef unsigned int __bitwise zap_flags_t;
-- 
2.39.1

