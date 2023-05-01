Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850A6F382B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9D242w7sz3fb3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:35:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=roKi10VJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=roKi10VJ;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Ctk3MGnz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:28:46 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a9253d4551so21236045ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969324; x=1685561324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5AaOHEPf+h0pPpRdylr/G5bcmt7vW9RVYKqYfsRH1I=;
        b=roKi10VJs9dRiilqVeW0uT+zBJLQBRTUlVbgvCysCoLkLcBaFtSDJFWEbNs2bywIGo
         H3vsreWJ1ZpYCtBmz7ULTfsdWW+yedXBXQs/IwteaEsgFryEWzy4p352hRLq6aefxJE1
         6kRZZ9T8eU7cXFjWBj8Pc1GfIk6+0XR5y+mT0ED8uGwr4lyimQw2Z0aiiwvL0/TUCnLz
         1YAzhf+9hpLKk/t8M1Z7w1Ox1h7cTnYF1yo9NW5nVgHqgkVIivMOhZpN29c9g57SmIug
         sEztd2i0kQBJZgz4HOMkQSUf4qdi6lxWXkVGt+hsJgx7i60d4BQr0JdQ/AyxEv6LKtIb
         /zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969324; x=1685561324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5AaOHEPf+h0pPpRdylr/G5bcmt7vW9RVYKqYfsRH1I=;
        b=Sdwxwhwmqo+t9fyJrVEjdQc0EhLBU/yJlFlPV0WVekwPBRp9JgPnnww2xA4jIynmFo
         GtiTh2GG0YubyL2ezfkpbt7OZAWM1/IGoN8RQZD/WPWccnh1BVdyS1sYoIKzdWoPIz0K
         9jW81QKOnZ38vblg06bh8WIdWtCSbhQYXE+v10fOepRrpWlRklhOIJMDRST4y+zETTTi
         qOFK9ffYtgfK3fHFyJh4KASXSxsudSsi7vZioTyB7VPuHCTFUdpleN5lUeScBD7MpkQ8
         7khE4g0zjujERiRlgs34Ue9o6cLSCentkEp7B8TG6cqmnSZ0JIvpYLSbRTny2D7J1EUM
         YnTA==
X-Gm-Message-State: AC+VfDx7Q2M5bhpY+tb6S1la5Bm03X5kVIC3QOx5SztaRk83n7AXNChY
	sUzxy35afcPEOXoKvz30qdE=
X-Google-Smtp-Source: ACHHUZ4PPvDcr1ZSfGKsFuoX96n8X09PGID8nEMj55TFVd8R4rz9suoKbv6A+ENi8FZ5wQLN727S7w==
X-Received: by 2002:a17:902:ca0d:b0:1a6:5274:c1b0 with SMTP id w13-20020a170902ca0d00b001a65274c1b0mr12751445pld.60.1682969324101;
        Mon, 01 May 2023 12:28:44 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:43 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 07/34] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon,  1 May 2023 12:28:02 -0700
Message-Id: <20230501192829.17086-8-vishal.moola@gmail.com>
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 62c1635a9d44..565da5f39376 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2786,7 +2786,7 @@ static inline void ptdesc_clear(void *x)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2798,7 +2798,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2828,7 +2828,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 5e2c6b1fc00e..ba0dd1b2d616 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5939,14 +5939,14 @@ void __init ptlock_cache_init(void)
 			SLAB_PANIC, NULL);
 }
 
-bool ptlock_alloc(struct page *page)
+bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	spinlock_t *ptl;
 
 	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
 	if (!ptl)
 		return false;
-	page->ptl = ptl;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-- 
2.39.2

