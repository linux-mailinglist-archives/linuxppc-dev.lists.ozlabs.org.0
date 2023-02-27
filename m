Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A625B6A488E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSfv3QyGz3fRx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:49:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XBhlBuuW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3q-r8ywykddigifsbpuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XBhlBuuW;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSP20sNfz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:09 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536e8d6d9ceso153568227b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I212iwzKiM4RAh4/x5atSdllFVTlqkGJNP08f3JbnWQ=;
        b=XBhlBuuWfB0rAIGd6hmSTNeCzmJSeNc8sCljBThxSUCF4xl/MSw7wD8HJnBQqXsjUJ
         57kJQANXg6fNdWd8Pt4eiSrUjDCyUw1I4L84NqCzMgqp7jq/T8VmsbuNmrFrLa4O4XYU
         GqAQJ+b6Oca+hy9pxgzol0kd/HIC9ER2wtl/KEZHOhFYwY8HxJnljLvK30eOyvBMk653
         HhqyRDcfvr4BXt/19NWrR6/WQesJSjC/tN0jtggmEFB14E/QwVd/f4szWEolKHRDFF2I
         b8hGsHDba//nCM47ED9hrsor6X6kCcWnUTvy8GzRTm8e9DVF7x8YXaJ1E8nG+/bnJf9E
         7yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I212iwzKiM4RAh4/x5atSdllFVTlqkGJNP08f3JbnWQ=;
        b=zfY1Mq7neJMY8GwnBk/ggzeoS6c4XWt81xfsBdNYT4fDPMw8qfarA3pNgcEXiRJsC4
         91sjHdSd3XdAbqX6d3qAXiTibR33fhLcm8zb6dz3eeHjEmBVQy1cMSi4LtvXG8S3Kxt4
         Y2qXQzqpvBH5xxbK47ERSiIpGA6YExpGPxSr1vUTlCffoEQxNiBKvR5v86KMu7eHHlet
         hDoKXVMgC0/boDsRH+37wlpBtyUug07Um4Y6ALzL0YBcmjXxgLTeGDBNrvhwHGJcRk4e
         zZZbF23dkbkmKbxIFZK7iWwtvVpMi5wNOxVJdy2t7mRnv+CWXob/FfzpEaT0G1lViZqy
         8lfQ==
X-Gm-Message-State: AO0yUKWtW/IQIzAecruLLzVPn0nIh/b2/DTLANeQPPaIHSUqgsv3jsUa
	E6FEu2nuI9jZN4/+6mfzPWwy52xL4mU=
X-Google-Smtp-Source: AK7set92Gr75A5uaM9VLoSN3m2+g8CdJzSD2poMBi0hZE65OwRnSrd/3zaVdEb4P76h2ChlMWirB5h4UQZs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a5b:a4b:0:b0:a06:5ef5:3a82 with SMTP id
 z11-20020a5b0a4b000000b00a065ef53a82mr7473143ybq.5.1677519427726; Mon, 27 Feb
 2023 09:37:07 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:12 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-14-surenb@google.com>
Subject: [PATCH v4 13/33] mm: mark VMA as being written when changing vm_flags
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

Updates to vm_flags have to be done with VMA marked as being written for
preventing concurrent page faults or other modifications.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bbad5d4fa81b..3d5e8666892d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -726,28 +726,28 @@ static inline void vm_flags_init(struct vm_area_struct *vma,
 static inline void vm_flags_reset(struct vm_area_struct *vma,
 				  vm_flags_t flags)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	vm_flags_init(vma, flags);
 }
 
 static inline void vm_flags_reset_once(struct vm_area_struct *vma,
 				       vm_flags_t flags)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	WRITE_ONCE(ACCESS_PRIVATE(vma, __vm_flags), flags);
 }
 
 static inline void vm_flags_set(struct vm_area_struct *vma,
 				vm_flags_t flags)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	ACCESS_PRIVATE(vma, __vm_flags) |= flags;
 }
 
 static inline void vm_flags_clear(struct vm_area_struct *vma,
 				  vm_flags_t flags)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	ACCESS_PRIVATE(vma, __vm_flags) &= ~flags;
 }
 
@@ -768,7 +768,7 @@ static inline void __vm_flags_mod(struct vm_area_struct *vma,
 static inline void vm_flags_mod(struct vm_area_struct *vma,
 				vm_flags_t set, vm_flags_t clear)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	__vm_flags_mod(vma, set, clear);
 }
 
-- 
2.39.2.722.g9855ee24e9-goog

