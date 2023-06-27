Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F231073F298
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:26:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GTe2EUys;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqqqr6FHWz2ygG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:26:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GTe2EUys;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqqbX34WLz3bWy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:15:36 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-57338656a8aso30875567b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835733; x=1690427733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnNdr5PDFTKJu1h5zX1p1xVUKJvhUfKvVUh/w7ZbrdI=;
        b=GTe2EUys5qOsmL9h+39HkmdbRnOOR/ecm3IZWO97nmipqYf9WxPQOFqim+diknH7FN
         cktZXimy2BTWcqn/5d10bb15uuq3PUdsia+9j36BiOqVzXj30Geeor6rYSL1Rhj9WqCn
         LmJ9N5OLeEYa/H4vUyKvc7Otfz8SqaPNrXVtQODdE9ilutCJ24KAZJChe9ZmvWB1bUx1
         7bpUWrAZkpPXIiT5JcrWxhsn1qZ9K0WItSWhparWMs+/rm9Q3PdTkYO+KF0D1GfwN1hv
         0eQBee2svyGNdGSpwEO15WqpXr0WlpHBW3JMLWAP0NGZGcgLzbwqXYAJu19e1eeZo9JE
         G7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835733; x=1690427733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnNdr5PDFTKJu1h5zX1p1xVUKJvhUfKvVUh/w7ZbrdI=;
        b=lUvgQdt/PmaKMJd18w3VaUrKrRPoMXjS56ZIOSPIAH5HdIrbRfDv5I5f1CI4kQZQTN
         QPUPipQudt43NsjfYBMrxLj+aY7xb/SNfezbIPJeS8TqhF4RwNDgdFbZgsKUOP4pYaIV
         yLeHYeLDR7NE/5Akbi+o1+lUI8l4T00buQuckdJCM8/CiTp+x4btuxcFLxtqVF8wET54
         v7NcE73C9dkn/Ey0jrIpemGFDM0VzyORGBe/srUaUwwu/To2cZELu0FyXdLiU6XYXh2I
         jMvPjf0xmURuvGTqCmtmbjkM4VwdUudMMF5OGgisdvl3OoRgg7AFcEx+jEqR2WAanXRh
         KN+w==
X-Gm-Message-State: AC+VfDwm07GdDue2KeYKglodbsdlBehaVJpcEBUWIHnxxkYyiysfebI9
	NhKq+nEdZqD3S54SWIi8KtA=
X-Google-Smtp-Source: ACHHUZ42Y/0xAZG9OHSM8VrbwgLQ6VZ3weOziZPodRcVkI1essgSTHJwJyadoUyqzcMtcD2kr7P2zg==
X-Received: by 2002:a0d:e005:0:b0:573:4d89:ecb5 with SMTP id j5-20020a0de005000000b005734d89ecb5mr19780303ywe.39.1687835732948;
        Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 12/33] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon, 26 Jun 2023 20:14:10 -0700
Message-Id: <20230627031431.29653-13-vishal.moola@gmail.com>
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

Create pagetable_pte_ctor(), pagetable_pmd_ctor(), pagetable_pte_dtor(),
and pagetable_pmd_dtor() and make the original pgtable
constructor/destructors wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 69e6d6696c44..356e79984cf9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2859,20 +2859,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
+static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
-	if (!ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pte_page_ctor(struct page *page)
+{
+	return pagetable_pte_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	ptlock_free(ptdesc);
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pte_dtor(page_ptdesc(page));
 }
 
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
@@ -2965,20 +2979,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	return pagetable_pmd_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	pmd_ptlock_free(ptdesc);
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pmd_dtor(page_ptdesc(page));
 }
 
 /*
-- 
2.40.1

