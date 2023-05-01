Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D16F382E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9D313NzJz3fp0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:35:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ORzYAt4f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ORzYAt4f;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Ctl22XTz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:28:47 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1aafa03f541so12193385ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969325; x=1685561325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsNph+IH8G9kAdlfpPDvdsVRvR3y4GWwc24n4bCHoNE=;
        b=ORzYAt4fgaepA0jj/nxqG5QCQUnwh7Hd86B8NHpvgQ9XS5bxCw6FjAddYAhSWVBGhs
         RguloM+rsX2sX5k8L8jQmcK3uoCnItaXGukxO2sNFKQkHNbJapaDcmG0iMAuRZwI8f8t
         xe4tIz8OOyBZAi/AlwagFAtmsldgUDQdHIa2vdidJh9lpo3fAW1D+2jPZJhQXOxhvdZs
         c4hk+WfixJsxNAANDMRcuNKXIxHiA6rEY6QaL0IGeoKtL1JoS6dBJBARbulTJ6NVKxdj
         8lac9J2KQ3hHBoBfb7fQ//alN+wtsMCP7K7b5tVdh9EZXnnMD2pBGWAPXyEldDpkm7ax
         zAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969325; x=1685561325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsNph+IH8G9kAdlfpPDvdsVRvR3y4GWwc24n4bCHoNE=;
        b=Ko991h0fOLUqO3Yqhixt88+St6LCneCk3eZYaVUpR/fNMdZrzu6X8rXzQm1aFyn1Un
         NKzjy532AX1N/7NQN+9RrBCsf7qScAUKxs+m0ieZ8+eQIumJ6Ua2f4C6W9RgIpC6q/9Y
         sK0C68hpXCKofg9oS6cPByml6YS/7pmVcUuR8r2HQw1pnXrj2P5wl+0D33nP1XcMxg3T
         WdYwgMjL6xk9eaTx3PyZ7JjLXuHWTlCoUVPj1PFhI5G7C0Mbw3h+Pocx+S58+b8c9snJ
         Wg4bwhgZlwUAGeH5qwRc/imaHHAHJgyRVFcwx2Lxjae6GaR1XaWUWy5P7VNrfOl2QTBG
         R5lA==
X-Gm-Message-State: AC+VfDxtJTfv7BJJvwU/b/+Ixwc9Ydm8GKVFQpZXN0BhE2GX2Rg7t0zX
	62SR9YttgzBxXJGHVT9Zclo=
X-Google-Smtp-Source: ACHHUZ6Hyp/uTZNVOfbVle27YVii8Y9q7eyatfM6y5VDboeAGhZWSkyjhlYeOczpnOUzLbM+Y5y88w==
X-Received: by 2002:a17:902:da90:b0:1a9:b902:84b9 with SMTP id j16-20020a170902da9000b001a9b90284b9mr18090785plx.24.1682969325399;
        Mon, 01 May 2023 12:28:45 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:45 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 08/34] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon,  1 May 2023 12:28:03 -0700
Message-Id: <20230501192829.17086-9-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/x86/xen/mmu_pv.c |  2 +-
 include/linux/mm.h    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index fdc91deece7e..a1c9f8dcbb5a 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -651,7 +651,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
 	spinlock_t *ptl = NULL;
 
 #if USE_SPLIT_PTE_PTLOCKS
-	ptl = ptlock_ptr(page);
+	ptl = ptlock_ptr(page_ptdesc(page));
 	spin_lock_nest_lock(ptl, &mm->page_table_lock);
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 565da5f39376..49fdc1199bd4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2789,9 +2789,9 @@ void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return page->ptl;
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
@@ -2807,15 +2807,15 @@ static inline void ptlock_free(struct page *page)
 {
 }
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &page->ptl;
+	return &ptdesc->ptl;
 }
 #endif /* ALLOC_SPLIT_PTLOCKS */
 
 static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_page(*pmd));
+	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
 static inline bool ptlock_init(struct page *page)
@@ -2830,7 +2830,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2900,7 +2900,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.39.2

