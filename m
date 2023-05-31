Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5DA718D62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjNt3HYRz3fjY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:40:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L8ygLqSR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L8ygLqSR;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBW2Hr2z3fFg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:31 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-565e6beb7aaso736037b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568689; x=1688160689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xowfOyB08CJw8MKGIIgRKSCkyhh2uF8MvUFj9KXpTSw=;
        b=L8ygLqSRY2eqB8nseiiMf24A2f/spwq3tiGOrBuR5p7dj9EWG9ImFwe46ZZwXRtvRX
         /V86q8xSGkCuVPlvQOJ2SMa4rsoFmPrmu5autDJLeyd3yfLXEA6bbO2/4Yqm1LlWBfgW
         xJxuutRSGFBvTral/NTreMAMCGbSkBu5TZ5qxdEeFHUTponOUVV1jiviowhgii7tWLBq
         MEHuHS4DCf2z1UfCtRdUmDITSqJKFDRP0C3+jLAFaOsLApRcLJ8PsQ+aNZLN1wbuZUBY
         Px85P6DC+zY+Gwn3bCa+FGLrsmclVsP0ccqay7jLihOMLhj3/zlw+zFLVxYDPwbySfXO
         VKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568689; x=1688160689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xowfOyB08CJw8MKGIIgRKSCkyhh2uF8MvUFj9KXpTSw=;
        b=iPfwofhRZRGK6hjKIsAuehwFx/JJWRYpczLGD6Jf8T2F6yvfsoismRYeix7Q6JZyeu
         3X3SjKBPpcTy8xtPw2ebqa0OXh+Q+oWkNwJj55SW+8763fM7bpliDTDM+wNM6/n56/Bj
         8wR9dFf5FknVc3vrN4UOxyNLc7GYp56MXwqTWQRdp4J8fbrw304VHURySSFwhPiiHOBi
         pp+ao+zcwyiB0wRVRwbSm5Ltdt2ROL3iy9sqDWHju7aBp3IrS7F7ie4ZeujFx3GITKQl
         RasDC1lsJ/iJa6jJ6U7iP5pE64y4jZbupy1hxnmsPPsiXaEahgx+cKYBe/7s3XZznK5C
         YzTw==
X-Gm-Message-State: AC+VfDwJwyS1AWUrB6nu6TKjAYAMRNn5518OqSCO7PWXtqK1G0FyvCwh
	cfPlbx3Hq21Tkuh48abgMuY=
X-Google-Smtp-Source: ACHHUZ4HC/p6n5oc2YZUDdXfXImpqPK7MSZMtRTu8JGDzMkRUKKOQ8wmCGx7YESYze8Eib1xLonoHg==
X-Received: by 2002:a81:5357:0:b0:561:c5c3:9d79 with SMTP id h84-20020a815357000000b00561c5c39d79mr7593955ywb.45.1685568689113;
        Wed, 31 May 2023 14:31:29 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:28 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 10/34] mm: Convert ptlock_init() to use ptdescs
Date: Wed, 31 May 2023 14:30:08 -0700
Message-Id: <20230531213032.25338-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8e63e60c399c..bc2f139de4e7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2838,7 +2838,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2847,10 +2847,10 @@ static inline bool ptlock_init(struct page *page)
 	 * It can happen if arch try to use slab for page table allocation:
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
-	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page_ptdesc(page)))
+	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
+	if (!ptlock_alloc(ptdesc))
 		return false;
-	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
+	spin_lock_init(ptlock_ptr(ptdesc));
 	return true;
 }
 
@@ -2863,13 +2863,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 static inline void ptlock_cache_init(void) {}
-static inline bool ptlock_init(struct page *page) { return true; }
+static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct page *page) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
-	if (!ptlock_init(page))
+	if (!ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
@@ -2928,7 +2928,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.40.1

