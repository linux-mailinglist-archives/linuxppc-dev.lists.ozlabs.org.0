Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5F56F382F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9D452yPFz3fYL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:36:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UIGt4Rxs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UIGt4Rxs;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Ctm5CTmz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:28:48 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aaf70676b6so9588555ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969327; x=1685561327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr6GrFg3nf2tpOD8Orpodgx1J1bZoReYY/j4MOttH8M=;
        b=UIGt4Rxs2HkrsHutpAYaiWsjpykN6YUUd9E7lUyM0xl9pxC5slr+PivAMCf0kJWRtN
         +uixoPZwp4Vkl4YHEUToQjjzNjvIathQteky2ye14eE7NbHDFgUdPJKRNVXQAhEugOmA
         SnKo0+DWLOVbHHUZvAiFOaLnHaj2/1PYZhJmFGNiABpmjR+0nby25eJKrDAKj84VfLsp
         mCPKXur9uRrX02YRe2GBv91KFh4j6FQNTVZMtFBm8+b26dYihW/DQX+FZ7CAta9Gp4QP
         rZEIiymi83HRxeSWeuBi69l3Fo9OQWMSSxYcww0ZzqBAzl9SsUUSi153JEf/pt3dBwk3
         OFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969327; x=1685561327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr6GrFg3nf2tpOD8Orpodgx1J1bZoReYY/j4MOttH8M=;
        b=LR6KAu9ckRC2IAGDjrPWwcRKOOBfAc4JhBPcAH4CobbOGJv2+a8oTfaZCULwJd7LCg
         OVaE45tUMg7B8PLcHmAbnAqF21g9PRt35QuvUG1wLxnkPCNlzlkyiDzk7pnHwvyFbHxX
         YuH3tvdGiKSUDF152bKGM4kV8gMHhHrb5ctTLVtnKLPfC0O23p4X+lwjMZYRknh83uzI
         x0AbrVjuGmxgzc3BVlH3zxs9MCjtYyBbI2tPoVvm1ImDQBeR4tY6cXoXgn015U2eyDqK
         X8htR09pJHWO4d5VWSThML8ZIqkMnNPyBwh5hBv2ULw9DkRyDuq17Zu2RJu/mZfB2z0A
         M5NQ==
X-Gm-Message-State: AC+VfDzYvgGZyhBltyYneG/JtdRz9rELMctfKo4Jtx+C9nNfL5OiStAO
	UEJ6wPGxzoo/7PqXcjkJYfc=
X-Google-Smtp-Source: ACHHUZ7U6exPykPvKxCgekHmX9KTHTAx49eIcN0vG+aTw+3qX+uTyRXMYpekTZ9RZqGTjPxZ9ZewtA==
X-Received: by 2002:a17:902:ecca:b0:1a6:4127:857 with SMTP id a10-20020a170902ecca00b001a641270857mr17426348plh.5.1682969326811;
        Mon, 01 May 2023 12:28:46 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:46 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 09/34] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon,  1 May 2023 12:28:04 -0700
Message-Id: <20230501192829.17086-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 49fdc1199bd4..044c9f874b47 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2903,12 +2903,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -2928,7 +2928,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2944,7 +2944,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.39.2

