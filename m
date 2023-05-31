Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C950D718D45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:37:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjK036tYz3ftf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:37:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I4ZK3ufV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I4ZK3ufV;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBN3BPYz3fHm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:24 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-565f1145dc8so802477b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568681; x=1688160681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQi1r9n8ZvdAYjhQrP0RtpOHDwCF0T3SkT9pOHS3grY=;
        b=I4ZK3ufVe7mv71vTYogtgymswU5NJnWubvNrBVwVZ1xQ0v/p7EI5y5eDyiHJRrHKpG
         azRQJKWH7AViYgdCK9GdEYZ8omA3oIlbOzs852fLZAEvIF+ozvEvZkK1/lCOTaAOLLWg
         oij0mtTKcWvOTyQV92r6jSH492LqXNF3KyTROTbV0zOPwz64hVwHxQg5gRw6g2twpMr+
         Syr51H68T+2e3gvOiE/6C7bywaJcNLAGV+Y3hFA7u25fKQ4NEmZwbyYlQc7gCZ6R/kVr
         pYNZAd+SPL7/3au6VqcXubefeyJmThujQisY5D7sD9GWsMGa+7uty95WSWwZ8guF3AKi
         4svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568681; x=1688160681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQi1r9n8ZvdAYjhQrP0RtpOHDwCF0T3SkT9pOHS3grY=;
        b=BLuAAgF04jjZ0+GixZCAICNsaNMMBdylD7Pz7c7FBQExFD0Ldu5iLC6zdL8yPzSpg1
         zsDcmipqtlvIRHHysZq7KN19jl5xPTHSkn20+3bwpiz/X9Q9haocd9arvovfky6pUMdd
         Ovx0lLFqQ1RhMaC8wn1RfdDd1ztSBVM8ICgH6t+xmKWKNoYjtHgs9xnJ7dAW84yOjOKE
         YWJ2+h+oGGYB/FBjkQW5gPo+QkZZ2C0IDdCkDqNDIQVr8/GSLEW98+bKYd4E6sRKs+DW
         Vh2uccnApGHIuaYrubKBOMwNpNzwYHm0lFBOkO/8w3LHv4rt453EuB7PfRj1wQsdQz7E
         KnpQ==
X-Gm-Message-State: AC+VfDxu4Pk8XRvgnQu92SpK+liVo43lyrn7b+QX/AkEbooE62oISA73
	0OcM6R7xvkHbndHUbCBoQGA=
X-Google-Smtp-Source: ACHHUZ4MgiQhTnDT0ikSenPgoz+0X6zm2wOF95JZP/LWMfbyCLY8nB5YKCMBE1n0Fb7UhukNcNCVlw==
X-Received: by 2002:a0d:f5c6:0:b0:561:1c14:b8df with SMTP id e189-20020a0df5c6000000b005611c14b8dfmr6643798ywf.47.1685568681477;
        Wed, 31 May 2023 14:31:21 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:21 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Wed, 31 May 2023 14:30:04 -0700
Message-Id: <20230531213032.25338-7-vishal.moola@gmail.com>
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

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 620537e2f94f..3a9c40e90dd7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2912,15 +2912,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static inline struct page *pmd_pgtable_page(pmd_t *pmd)
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
+	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
 }
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2939,7 +2939,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

