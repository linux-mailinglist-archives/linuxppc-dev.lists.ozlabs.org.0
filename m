Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E2718D55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:38:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjL22NM0z3fcv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:38:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ekb2h5vY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ekb2h5vY;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBQ2CCvz3fF9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:26 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-565cd2fc9acso950617b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568683; x=1688160683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27lyfpZ04FD2UDRY/I33l74zvzgaqoXO3tIGNjTPBPg=;
        b=ekb2h5vYZpG+cwgCVg4fQK7EHYCXZwnN3tICBhvbAXV/qaJ4duvuh8+ArMRtJnIp/1
         3RGo21yGJSysDJalslm0N3KJ+xBemufNmCM4QUS+AlLps3g1asXmgD446fAwgWFlRe+6
         a7aoyacEmBOwDL/dieiMjv/UIxc7tBtkwjPRg8HdgpDriWcSnd2JpyypDy8aN9IwIMR1
         dAM+p/G53wM0julinDJp886bQVRAOW6SvsbsPDW7Xp4BxlToFfeY++p5U7tcCmWgdlyl
         aRBYNbpeHC4ndh8fG8DxUBYpHsoQ7lFfl1tkv5LwqehXHAbOBlEVGGEVzchpWOIR1fN9
         uokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568683; x=1688160683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27lyfpZ04FD2UDRY/I33l74zvzgaqoXO3tIGNjTPBPg=;
        b=BZqxLUB/B4lyFZLO7NdGRAXb6FrlJGNQOKOr2OdnYHcghnu4v6CC/i+rrLrmoe1yyI
         7PKIbXaV0xQbrLyoMn44YkJfl9htelbweEqOxh7D+QHWt0XQxfItvMRpLnkHUEGCeT6y
         J8scXBNUfrNV53ELP5Aybr2KEDlWHFKEZqXWGdOGSzGCCtHt5712/Q+GCsVMzdOsfQeS
         rT++V/hmo1RieK3MIA2dC19k10J9SjIkqrXSG1C93jyF9RkvoQq5Dhq7UJ5EsfrwiAde
         SOy5E4SmQ1d/tfPBzH8qw+HOA3uglVxdwYhOtehrw6IQJplgCWsvDUDvvlq1yQw4U62C
         qH3A==
X-Gm-Message-State: AC+VfDw/zeY0d/b/DD3ceTxbbjWAdr4pMTOpBV6py5HzD9WlN5IDVN3v
	/u/WqYe9EZjX/CU4XgdyiPQ=
X-Google-Smtp-Source: ACHHUZ6dr8MPeM7AL/jHaXXQ52piABkpCgdGqBTW+dyh+LgB10RRsXu3Y1HlJGFoY/78HDuWSu9FGg==
X-Received: by 2002:a0d:d741:0:b0:565:dff1:d1e2 with SMTP id z62-20020a0dd741000000b00565dff1d1e2mr7923571ywd.18.1685568683472;
        Wed, 31 May 2023 14:31:23 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:23 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 07/34] mm: Convert ptlock_alloc() to use ptdescs
Date: Wed, 31 May 2023 14:30:05 -0700
Message-Id: <20230531213032.25338-8-vishal.moola@gmail.com>
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3a9c40e90dd7..1fd16ac96036 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2806,7 +2806,7 @@ static inline void pagetable_clear(void *x)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2818,7 +2818,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2848,7 +2848,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 8358f3b853f2..8d37dd302f2f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5938,14 +5938,14 @@ void __init ptlock_cache_init(void)
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

