Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F591698BFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:30:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNnq1sCLz3fj1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:30:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QqHoT4KB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3o7ztywykdpgxzwjsglttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QqHoT4KB;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWl4PPQz3f3H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:27 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-532e96672b3so8516837b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lpf0g6jEgEDruwUAtDYeX37TOF9sV0bBdZYAp5OaPFw=;
        b=QqHoT4KBvKUoUdLlMqp51fx+DvEGbEeCQBAnfd6VVaWQ1iGMSVWdcYYT+IcmdoGW6k
         3cvpI3DbxmqWzlsZbZtdKxchg+b34bnVwYQM28D7iM4wfdyptvE97biBiYefhiTugMIi
         6QLuIfwXdU8feO6tOQjuROgghWTm3q6OIMngPhTxYx3FIBx/Q/vwNR9bBonlFJnVLRif
         jIgBrdCbBh8/u0HLrcAEynfXgVsHAUyrN5D1sUvBi7o9DTj4LnFYvOofA3wqcNiCIoKK
         +suiPaGBCd0kL8KKwbFLDtmEf/YUc3gt6F4GpOlLFqmXcdgxQWnJd0Ox4qoA9H1pNQ9Z
         aRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lpf0g6jEgEDruwUAtDYeX37TOF9sV0bBdZYAp5OaPFw=;
        b=OytGXrQyIn1Zfv3qcUg7nKfFmr55Vx6j0v9jPXPnBJiYcRFrk1RWjaxvj9HDQshca/
         eWUTOaRza1fWA6vu119XU8jyG9ejOoRj3y0kqGpXyLRopiQVVzzUbqsfwu/zGC68yK2W
         44eV1g1pdLzxCwx5iK1Dwnw7eA8qdRkKVrr7GHkX6JrKR9UzeoS9iOljFOlbV/F3QLSF
         47JQF5uBnn9OxIKhYyhj2lyLOgBKZhsX1cP5xnd51Jf65CVzDo6e3m69Me7uEk0LzQX/
         Z125IQF1svnaVE96wtqlKTOO7XExzjC4tPuieiQYz9jPAWFSRoh+xiJ6LF3F3pXS1Vvx
         F3UA==
X-Gm-Message-State: AO0yUKXh9fdl07s1cGjlVv0XcODdgxvl10GesHR6rKLocty7C9JYRfga
	gDodjo3Wq9k84Mn4MX6/apvB14/UAVE=
X-Google-Smtp-Source: AK7set9lI2rlt8srxq1B77BNUY6DsMc7qDNM9tTWpZOotyLmczPTVi4pDHBbcvVuKtvP6t7k4zPbNPC6UU8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a81:5a03:0:b0:527:83f5:3f08 with SMTP id
 o3-20020a815a03000000b0052783f53f08mr494142ywb.425.1676524707124; Wed, 15 Feb
 2023 21:18:27 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:28 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-14-surenb@google.com>
Subject: [PATCH v3 13/35] mm: mark VMA as being written when changing vm_flags
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
index a056ee170e34..f4f702224ec5 100644
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
2.39.1

