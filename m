Return-Path: <linuxppc-dev+bounces-4431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2549FAC22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:43:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtPN5j33z2ywR;
	Mon, 23 Dec 2024 20:43:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947000;
	cv=none; b=DJpioa3OpcBd37W5Xk5hxQC7ArKm7NOiTDuNUuCYzZ9AXgm93GEZeu4pdXR3xXPQSTFk+dZGUWdW8obUOsG4RdDVafbax6s4UwcjGltlu0yZysiunEDgVIKeCffus0hIELevqHBlxLWUoLy9E785JFtJf8UEAFQ8FgMozFm3lGlsHhD8a5b1y20NNthHv4pnMRuL4/MX6Y7reB0MP4Trj/XiScriA0k7dhuLEc0Mjj0kBiZSgjwooAGerjRY1fRZU/IWCyrV6OtIavB0CPAyduWz37HuNwwv2GVebBgCf0E+wqyV6gfUFFclH3S7Wu06rzXyDsuoXG9JrUROn23xQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947000; c=relaxed/relaxed;
	bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O5U+VrWF3xiXZDlNSgb93pG/AHYBJTTW0JEewMsI8UPrSDs+pAiXLAyOUJBE93vsRmqiqVdIfVzL7qxiNmflsUglKaM2XvXSeMNZcwAxLbb4rWFeqDjLxczMQ6JIoz24jX/GvOwQUGLKq1yISxuwg/4yu4QTk8TUusSoSUiCuXedJCNov2J1b2sc9b1nV9d0gh2R4r1nHN4IF49mznkfv3+MbnsBg1CvnUqhYuSCnEz7UK+T7xTE9D+SF8VgmJPgBQ9HJQ3TlkJ0tJkQ4AsWmPAsaSGOIfMNcvWehecG4Ce0QhRYAOP7OjJ7wghuUwGlENBMX06w0mVQHmdfOrXl7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PlB6/MgW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PlB6/MgW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtPM6pGtz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:43:19 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7fdc6e04411so2481329a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734946997; x=1735551797; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=PlB6/MgW4uz89OZeJ4tshWv1hB0k7eM9J1PSKMs4vRuRd69zTObLJsS9Cl8TP366rO
         rb4yAG7cQyVRMVZOXZnugl3l6uxqtxPTLrJ/24Rf4fmu1ZKPR4KjNw0xBPFvO0ZFeZIo
         r7hMy3SQ32sBGOtQ+Iz7m6r6/mR+qFD6UfXHb4EYeYtD8KqESvB4bEGXKxB3HKZ8C6US
         wrjgLUyG4bYqKvxrHuczVaEMtujRT9GCMgr6HQuIuC4wSIqf7TVIfmbxQ5SoRLi7N9L3
         spUXFn3g/LWYUhRyXVVMlFnMSwoOFVhknRHWXJMVXbBB9GctilUKpHSTo+B+1O68fsOq
         nIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734946997; x=1735551797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=PTNZyn7a2an6Sl1yT+EfIVKfi82V/UZ79LCPO5ESVR9ht7TgwCAQn6giiMM/ld0v9p
         wcmaluU3jVZmf6MO0UXmOgYDQxPnvsYw3CffRYa2CDipbpxc6vPIFAHtSvY3awTMQ3g8
         NWaGhANkLyya7cn0v0Yhuv5rNG7tg+BHyVH9VZSUrvtv6lB7VfNZqmPPQ7JlfbXWJDOO
         gj4+rmbuHF3aNTo5Lcc/5RLfsNttzeL6KyOFp6D+oNpssVXQZ/FzRk5RxwgyhHts2tvg
         Xmn2oiU8gzIe2kPZiTKgAQvlT6hIkK8MCRuBTjnxjdAnY2htImtMbEusNUNBERKM+6i+
         cQZA==
X-Forwarded-Encrypted: i=1; AJvYcCWaQkHJyF6nyT/hO08pLx55ZbT8IO2ZmnMSgsCzrtXpMl1VZtUlhuPJazEq0N/6LXiYZAW6SW7OQzSA6hg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdcGSz1hF/UENX3rrohpkJNhHbn6wbwrikEYKnhbySGtYl+74W
	VyA4Fj6ftbWGAIILj2C5iulRLzjmvA56CPAdZaqWWqZDqRuGwf4snXeGyUkP3c6B/PdYXAXCnTg
	p
X-Gm-Gg: ASbGncsKOhm38o+3IDNTcwwhAwX+FbD06F0jgua2JSN+B5el70/gl023U21LIKRYfc7
	rB1ZYHrzpIWS1uKoSMIah6IOsoqtr28zyaltsZxoHtReb/WKxzb66guqlKKo5k316pV9+FQvjM8
	VXDt4eJNeRMZgNYOJcrUUp9Vmcnky7Udnbx+KqJN3mZ5XIryLKWOky3Vfgx8LmT+MVst+b3st7X
	i8QIi3UpYOTIkFCzwMsHL2dW5CnD3zTR7VVuLbRjUEEVtaf/P8X6vSFOMKTvJ+a6nTVRYFZBUKy
	JoSAU5WoBiZlQ5b3At20vw==
X-Google-Smtp-Source: AGHT+IETS5CqVMOZwuklYBKyw2d6q7hBKdfBjuJ9ZQ+tZcvMnTE5pZk49SgpvcM01OaAXbZV7hq4vg==
X-Received: by 2002:a05:6a21:6da9:b0:1db:e338:ab0a with SMTP id adf61e73a8af0-1e5e0447f5bmr22664720637.8.1734946996090;
        Mon, 23 Dec 2024 01:43:16 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:15 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 01/17] Revert "mm: pgtable: make ptlock be freed by RCU"
Date: Mon, 23 Dec 2024 17:40:47 +0800
Message-Id: <b59adb960b2075822a6e57efc7a52e7eb7780068.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This reverts commit 2f3443770437e49abc39af26962d293851cbab6d.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/mm.h       |  2 +-
 include/linux/mm_types.h |  9 +--------
 mm/memory.c              | 22 ++++++----------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d61b9c7a3a7b0..c49bc7b764535 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2925,7 +2925,7 @@ void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &(ptdesc->ptl->ptl);
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 90ab8293d714a..6b27db7f94963 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -434,13 +434,6 @@ FOLIO_MATCH(flags, _flags_2a);
 FOLIO_MATCH(compound_head, _head_2a);
 #undef FOLIO_MATCH
 
-#if ALLOC_SPLIT_PTLOCKS
-struct pt_lock {
-	spinlock_t ptl;
-	struct rcu_head rcu;
-};
-#endif
-
 /**
  * struct ptdesc -    Memory descriptor for page tables.
  * @__page_flags:     Same as page flags. Powerpc only.
@@ -489,7 +482,7 @@ struct ptdesc {
 	union {
 		unsigned long _pt_pad_2;
 #if ALLOC_SPLIT_PTLOCKS
-		struct pt_lock *ptl;
+		spinlock_t *ptl;
 #else
 		spinlock_t ptl;
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index b9b05c3f93f11..9423967b24180 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7034,34 +7034,24 @@ static struct kmem_cache *page_ptl_cachep;
 
 void __init ptlock_cache_init(void)
 {
-	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(struct pt_lock), 0,
+	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(spinlock_t), 0,
 			SLAB_PANIC, NULL);
 }
 
 bool ptlock_alloc(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock;
+	spinlock_t *ptl;
 
-	pt_lock = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
-	if (!pt_lock)
+	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
+	if (!ptl)
 		return false;
-	ptdesc->ptl = pt_lock;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-static void ptlock_free_rcu(struct rcu_head *head)
-{
-	struct pt_lock *pt_lock;
-
-	pt_lock = container_of(head, struct pt_lock, rcu);
-	kmem_cache_free(page_ptl_cachep, pt_lock);
-}
-
 void ptlock_free(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock = ptdesc->ptl;
-
-	call_rcu(&pt_lock->rcu, ptlock_free_rcu);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
 
-- 
2.20.1


