Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1A73F297
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:25:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NN6JuQbc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqqps6bP3z3cCt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:25:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NN6JuQbc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqqbS6wGTz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:15:32 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-570284c7e61so43269717b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835731; x=1690427731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhgUYiKwQSwYMGFv9d1r56wjiuPfdLCT9N5JwdJpvSY=;
        b=NN6JuQbcJSEhuQl119fqyrzmvfTJLSgZNGPIizHO44moV6zy7vRkkkGbpzNnm+T/zk
         LfpssTQxYHLCLcRT6ur03GhfUH0PR3hr1gEAZWn4KlOVQ/bRaXKu0XwyzIXh7FK2T78w
         GV5aBHngJRtwmpryMrqg1wnpyNcK63Z6rXozTP8pqdze8wtkdCn+4d6Nxd1VmHHTwiSp
         Hj2gVskjJaa7d3mxLgebdTWNoaiyWHEkTnVETMwzQNfFNqae/PKVEKJL0sEqbBCs/7Gc
         Lg3rR1WUfvzFXQfsjuyOG1PSX82wJS5wL2NRG2ks6qk/cPnX1GTuY36dOOOiPPB0JsGq
         3KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835731; x=1690427731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhgUYiKwQSwYMGFv9d1r56wjiuPfdLCT9N5JwdJpvSY=;
        b=JUagOyNvoaiRBITdVPEKXIHDvCMeLSW9Mb8fgv5f3/xjoJdBTsrmSmKDZydlCyYblj
         W8yEUVawML3B3+1c5MpvU5DpqOiuiHPytbyry0Z8ZshmIu4avuWZNdK7eaGetLK0YLYL
         /b8+8xDyyHH4hll45T420fuqCPGsbR37cbmYzk3Xgp+ySf0QT2rbHg5fhfpiWBYK7Ohj
         515GfcxefxX98H80AVS1IG+So8LfbEmHUcJsSMS7s3F19QktGgenK2yTsopX9DwAJR53
         /5nzVW7CHqyXeOYUKhGYz92m7jw+6ax/drh1/S8ABDtT3tVR23f5wLBTyAdiv7RrwOEp
         tmLQ==
X-Gm-Message-State: AC+VfDx3DVwAPBPz9KUww11++VZavcTL+7vpKnJymjzEw7oa/Ra0tVEM
	dPfiYpnlQfHIFuPgfIqbqS8=
X-Google-Smtp-Source: ACHHUZ77IlfDYtyaiNtbQBvQ+hst+uMDswEhJokbRedTnkaskK+XBmCINjFgoTdvnk/TaS9G8YnT8Q==
X-Received: by 2002:a81:6cc3:0:b0:56f:fcb0:26f6 with SMTP id h186-20020a816cc3000000b0056ffcb026f6mr25623334ywc.52.1687835730840;
        Mon, 26 Jun 2023 20:15:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:30 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 11/33] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:09 -0700
Message-Id: <20230627031431.29653-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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
index 0221675e4dc5..69e6d6696c44 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2799,7 +2799,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2815,7 +2815,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2856,7 +2856,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2870,7 +2870,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2939,7 +2939,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 2ff14f50c7b3..8743aef6095b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5931,8 +5931,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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

