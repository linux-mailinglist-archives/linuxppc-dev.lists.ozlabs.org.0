Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAE8760885
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:27:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jYui+PKK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R93sz0zJHz3cnJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jYui+PKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R93kW2WT2z30g2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 14:21:23 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d05a63946e0so4083539276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 21:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258881; x=1690863681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=jYui+PKKLrYwW/9bkeBCxZuH30ZLFCfjk6k83i08YHGZs5qBvg098warmUkrhehPA7
         w4YGyti6UCNUragO2itKU02HUpV/ViBpQF9TFUZFW/NNv47MTUMBLJ+3J2/znigqsRJs
         QhHBOUaU/0pdlJBDEn1DtnKR6Jjb52zcMeUqfdcetzMdFupe+5WkVJfD4fN5fJJOsgL0
         e1lfCQXQItA0Ro7t73ofq2YB2adhnzcCWoT2HIbviNcoaPhOqdkOZB4a44aYijkjfd8z
         BHV0Z8ytCVZzLV7QMejslcSqJexW00RaRFmpSqinl2bowLcrU0F1887NS/OPVowYeO94
         sAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258881; x=1690863681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=Gp6assXLfsFSpZOWi3YPORQRIrFN3e9O4eUNP1fW4MLfFdcfOJ9E0Pup2XmeGCIF/r
         GGeFqjKb43jGTNLSdqk10kU1kSYX/tKP3lFCMnEK/b3CYuhkuNhqoiEV3W3DrJ0d98DR
         dKlaHR4V15EcxBfv41Kn5XnMYPldWAgXmfhbmj/ufSm7jcgxHxxw3zOk1fwO/62wzOtU
         GpZOxAXOwknRpwncS5eP7tT4aC4QRd7N7Vyy0Y/+q0F6QVR96QwZHAWoT0Io5X3C0Lzy
         Tvbu182/7lXNPQJ6ESKvAy43O5PojI6Zf+MlvxtuwEq4ivU/dHTVCGr+yl+R0wAWUqzm
         Ocww==
X-Gm-Message-State: ABy/qLbXXdo9Kx1WipF/L3NdJ0dvxwPUTYSxJwgtQrqLCzYTh7x3CIr+
	HjD1/+rqdzxQXdPnNzDGvu4=
X-Google-Smtp-Source: APBJJlGCGmZmbOTlDUcCFEi74mEzBDVKNi9w9+0D8ZZZqBiNJxZc6NQL85g34qQbwNZIlG7Tv+r/mA==
X-Received: by 2002:a25:356:0:b0:d0b:ed07:7f56 with SMTP id 83-20020a250356000000b00d0bed077f56mr5325321ybd.18.1690258881187;
        Mon, 24 Jul 2023 21:21:21 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:20 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v7 07/31] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:27 -0700
Message-Id: <20230725042051.36691-8-vishal.moola@gmail.com>
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
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c155f82dd2cc..52ef09c100a2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2974,12 +2974,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2999,7 +2999,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -3015,7 +3015,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

