Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F26E7824
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dMJ1cVmz3fYw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:08:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FTIIrhTe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FTIIrhTe;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQR1cthz3cjP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:03 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id s23-20020a17090aba1700b00247a8f0dd50so3409722pjr.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764781; x=1684356781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc0m/U8RaSqOAaIvHe2pZ8la6AwQPtvql1ppirfWYYQ=;
        b=FTIIrhTe8vfWt4jgLQ0zryZ+NfsJ/OFhYpHyrwEJjHtN6fYrjayv1wmbuEiWrZWNBG
         Ab6oC0JEVFKaVtr5ERs/HGyia4m0cuJPp54Y6qKJvGxwoWwnKA3jL+mq6GAMCgFGvFWn
         bEbIp/iuCRzaSQasJ9iYfHsEIZ8C5L6UBjIsqJjVLRNCdj3wFA0VCJaoyvqsQShlPxAr
         nn14k2m42+J6xR2hfl2ffw8tFItkZsF+DKNsuBC18vZWoMB4mE4FcDOZiJ4pqP0DqYky
         PjLPxBMY5gAsTXZg/iGvnD4lxFGHfkuFymQLt7EWHTlIBpCDY+iSj33ZpMo6EFdNFztz
         HYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764781; x=1684356781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hc0m/U8RaSqOAaIvHe2pZ8la6AwQPtvql1ppirfWYYQ=;
        b=ly16ly9LM/DejRLrIML2F9YWZA+r53N8pgSYbjij1ZfGgj+bKzCtnKEhQo0J1mue7s
         aHxw9FX+Ohf4fN+k02JFyFtnVcxnPWps52I44IQNT8RPZ7YVSW5fJKvdwTuk+SErZQ56
         gQCM+Gv9QcKhhPWZ0zbJDNkyp5zDfIiHw1NVHtfL2GLy3Sm3hRKrNTfamo7YFUV1azeq
         EiqnTA7fXYqhvWVs3GJWNqbYOMvPe5HKXfNNgWRw7MuhSSUzPbEGZK8cn75Kt1QlUPPQ
         JBCawonMI9i+AyrCdx5SsKoaEwl1zg1zpZEeYtFxqAZrJK4e2LMJdHYKFPVr51h3j+s1
         XaIA==
X-Gm-Message-State: AAQBX9cRzH1qe7AEHksPn2oek6BqybaCPJGua8d4ux1dAU5I4gbJ5y2W
	xDPoKIRNprzZqrcqV6OzMygRi+wIo2/hrw==
X-Google-Smtp-Source: AKy350ZMofF2taT9lCtSfGwXj3mTLikp6R4dNTLL/p579XSegIqzslR/71TUEAWTkG6EWBZpLey91g==
X-Received: by 2002:a17:90a:d143:b0:23b:2c51:6e7 with SMTP id t3-20020a17090ad14300b0023b2c5106e7mr16554327pjw.21.1681764780697;
        Mon, 17 Apr 2023 13:53:00 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:00 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 11/33] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:26 -0700
Message-Id: <20230417205048.15870-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2390fc2542aa..17a64cfd1430 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2787,7 +2787,7 @@ static inline void ptdesc_clear(void *x)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2803,7 +2803,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2844,7 +2844,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2858,7 +2858,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2916,7 +2916,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 37d408ac1b8d..ca74425c9405 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5937,8 +5937,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-void ptlock_free(struct page *page)
+void ptlock_free(struct ptdesc *ptdesc)
 {
-	kmem_cache_free(page_ptl_cachep, page->ptl);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
-- 
2.39.2

