Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7572D241
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:11:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FDAUnHm2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4BD1Nfgz30f3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:11:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FDAUnHm2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42S372kz3009
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:03 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565aa2cc428so40612377b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603900; x=1689195900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csibueTQMI8hz/axFpDokmCUVKS4XWTLf0OEMRBu+sg=;
        b=FDAUnHm2faFSWGwfZS5hO+D9w8GP4e4g1ML7/tmHqNMsyYqyAD51ooe/UZAynheb45
         JUNAZVEGWiy3FM+aYWlvoHKaBUFoNzNTwUdIl4kQAVJN12Picp2GbnIh1UwydO/qddyi
         DCuNf5aNp8X4OTmdAm+cAeL3CGsOgaZ27ub95e/8MTqIlBQGK4N048waW9QZBpSO9XHI
         sWfFM9CmbvJbA3uGm5rS2JNk4GtvKzbhh98S182OZhG/f2sSkxT71cjOLs4vhjGq3bqf
         ArQftxucDa5+VY1eeLZl1/JDXSt6Px6z9h8EFmxArPTIN+H3XkndN1zswUa8dX9vrXU3
         5Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603900; x=1689195900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csibueTQMI8hz/axFpDokmCUVKS4XWTLf0OEMRBu+sg=;
        b=Sn6l1w4LstZXYlVFrtq/YGLgDiPXaBrnwgsr/bcjqPiTODMgmAzEQgx5l/6Shy7DTO
         ui41+4Hy1NQURlimNkWMW3LzknAVAz/KI/QlU5NvqwqY89h5JHqWpoBhzhiLdx+dhN3r
         03jbyHGz81yjz5FJre6lxWk41Qnmy1XZ4jk3nJDdTYgMTU6+/1nbVw/TH97d91PmxwrU
         NXbDwiNtpe4UIJ2Hw398jkwAovLvGAWZUdLCPGD8yTBOoaTXS3ELZgbihsVs04W1MlSr
         4A/Qx1pvBXiWkmi9qegbrb52H+umzhMUZOR+4Ef7crD03NNojWTRLzO845Zqy0YXiMZY
         c1PQ==
X-Gm-Message-State: AC+VfDyRFPXVdj/AeMp+JlsAl0iMq3TjosHrpqOhe9Gm3Jx6LZT3+lED
	x+Cq4rGxGZNVhUZSQbj9sWE=
X-Google-Smtp-Source: ACHHUZ7XKzfLRWmcjDH1kOSVD0e6fKxxbDH/DoQa8Wv3QDYuxgXM2gpDCQ5rMsZn09dpzldtR2HsSA==
X-Received: by 2002:a0d:e294:0:b0:56d:5041:78b with SMTP id l142-20020a0de294000000b0056d5041078bmr1552114ywe.2.1686603900209;
        Mon, 12 Jun 2023 14:05:00 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:59 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 07/34] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 12 Jun 2023 14:03:56 -0700
Message-Id: <20230612210423.18611-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
index 088b7664f897..e6f1be2a405e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2825,7 +2825,7 @@ static inline void pagetable_clear(void *x)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2837,7 +2837,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2867,7 +2867,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 80ce9dda2779..ba9579117686 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5934,14 +5934,14 @@ void __init ptlock_cache_init(void)
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
2.40.1

