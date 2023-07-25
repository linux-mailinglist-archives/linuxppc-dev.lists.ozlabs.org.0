Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B014D76088E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:30:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RYLJ+HHh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R93wq4MGWz3cmZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:30:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RYLJ+HHh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R93kd3MKpz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 14:21:29 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d0fc1d97716so2005842276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 21:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258887; x=1690863687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EZnRhm4Fj3KaK4sFjI+P1mIVDNOtVXSgVauozi7/LE=;
        b=RYLJ+HHhZ3SW3XdvMN1AzT9gPBErVqrhuCtcU9fNt2oY7ALxgSJoFkBn6Vm9nhRIfL
         WiTjjdSQLpNPnjH/5n9WBm6wJTnH8dJRd1NltGEZ286BUnLn7Q2MMvQIs7uIZqTwGdGS
         eL9nBqdaNLlYe8KWVzFFhBRvhsKclpu6/YA+4Q97+gqJ/tvmMP0hkmlN965zL32r5aWq
         lGDtyvV+tLl+Z/pogbSTjxnJu1qRtO3WfiwXTUnVp3YPllt2BfK2Izz7z0ivGxPYpzFU
         UjwvvFWDj18TjEMiWj89EXU3QbdGQMvzZCK7ByPk/vtnFluG2/Q0k/42+A+1E3bms/jl
         vfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258887; x=1690863687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EZnRhm4Fj3KaK4sFjI+P1mIVDNOtVXSgVauozi7/LE=;
        b=fH+JIEuG9bRkXQfFXd18ZAz1+FdlwBZMACrb5FJkP0x8rZXirFnNX3GJtY6IKyTO6H
         vD9r6GYS6wP9V6VenJz5ZbQCMK2J/2D4d9WAXE6qk1DPSAnWN/rqdnjdGFVhwKNjHvTr
         RUJWCbyFa9CCNIQ3LZPTktvHFaWaALy1GID8tlk9sxdecfdYQHMNeExhTsgs8QvYmTKe
         Bcm/HRhPtxKxQTfLjwTuvcLSjTIkf7bjhTPibVK+x7W2SKHfMwBGXstdDV3n7ovSHuIY
         sgSX8V+YV68By6Q0uOp+fP0UISweafw45gI/hjFxc2Yq141RUGOQNWMboCk7rSNI0rJJ
         TNwA==
X-Gm-Message-State: ABy/qLZXuWKEguT2Y/Lv1QDjV+zijwo4rAxlzEYs6bgfkKBhlIBavOM+
	AhFfKwiQ9FZXvcSFWIKTz9A=
X-Google-Smtp-Source: APBJJlEDrySQ7FY0Or7EcCMVmcmwbMMbiMSaZShCmPSyL8HtQQZFeTHHFjIo1cF+xzs4edAkc8Gy+Q==
X-Received: by 2002:a5b:782:0:b0:c91:cc0e:1aef with SMTP id b2-20020a5b0782000000b00c91cc0e1aefmr9011877ybq.58.1690258887257;
        Mon, 24 Jul 2023 21:21:27 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:27 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v7 10/31] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:30 -0700
Message-Id: <20230725042051.36691-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 774fe83c0c16..ffddae95af78 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2842,7 +2842,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2858,7 +2858,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2899,7 +2899,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2913,7 +2913,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2987,7 +2987,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 4fee273595e2..e5e370cdac23 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6242,8 +6242,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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
2.40.1

