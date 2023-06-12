Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D233B72D309
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:16:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RjdfKdwo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4HG4k5wz3bxH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:16:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RjdfKdwo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42d6k00z30P8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:13 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bc4e41b7bc9so2832992276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603910; x=1689195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3tBY7hT3/idMeTvV/y5HT5RaeYwytDxSu3wHZHQdRM=;
        b=RjdfKdwo6GGvbEWocjhzyfrIG+s4yeNfDttrrqwnEGORQ/YPC7ZVmdyS10JF0LYqJm
         b6bU5xmGwzXI5ZQkTCKkSHLlY6xUp5TM7mFPqEQ9UqdLvwpNas5BJtZzv+iakqyWNnr7
         ZbUjNLXHM5JpGCASroX3mIknKspaiVxCKS4EWppAxztT7eGSIBBwCNu77Cy7Q7mvbAeg
         nTWfF3Iwgf3p1K6E3gymTY1cP1wx9AawPcYyp7n9Z4TFzq2NVk0pgr/BAa6wSZIWoNVz
         1+4z+b7cL83but8FZFxeoUPYZLJOz76q6IoC2hSwlZOG2NbQ38EQV2G66LjHRDN0bxiF
         BZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603910; x=1689195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3tBY7hT3/idMeTvV/y5HT5RaeYwytDxSu3wHZHQdRM=;
        b=fqMsd+5FkuxMufRgC6B5wKllhaC0SrJh3cfikROJqsqiCRYzZ7jLVNxfsYcCv1S0OU
         0ROz2bGL1ps+pt5yZpjOrnQYQyzIbghin0tA0qphth5A61Iz3AHcSMrFsjeXt7BVQlfc
         e+WPnDCBxoiVYAqmjNrr8IaC+hcUVGfqwn//zVe8VCFeoGIX/AU4wBwvLkCOtATwuKLq
         FoKtH9tZYxx71yBDha+m6cVVWNBzu/U13449jjDupoGhSAc1rbXaPM2kzmy6JrKMOXNW
         WjoqSiIr51trPVQzTXRUq1Do0jGFgDvx0S8yNaIIljBRPtS8EQT9Kkj8y2F3XMaIJ8g7
         ZTng==
X-Gm-Message-State: AC+VfDyM/uAiTLUX5AnmXtA/0WrLFCilmiZRJ/fChU8VSXxsrCO4ELOc
	PFO11L3G0r2iO4QkYFUVOHg=
X-Google-Smtp-Source: ACHHUZ7G4LX/rzVzMPXBxUvcWoM4NVaiAOMXANZTQdr/GK3rhr2fg9ZSIMvpPffGov7SQ8stbPFS3w==
X-Received: by 2002:a05:6902:2c7:b0:ba6:e17a:abc2 with SMTP id w7-20020a05690202c700b00ba6e17aabc2mr8959494ybh.63.1686603910188;
        Mon, 12 Jun 2023 14:05:10 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:09 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 12/34] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:01 -0700
Message-Id: <20230612210423.18611-13-vishal.moola@gmail.com>
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
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3b54bb4c9753..a1af7983e1bd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2826,7 +2826,7 @@ static inline void pagetable_clear(void *x)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2842,7 +2842,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2883,7 +2883,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2897,7 +2897,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2955,7 +2955,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index ba9579117686..d4d2ea5cf0fd 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5945,8 +5945,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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

