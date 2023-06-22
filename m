Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FAA73AB30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:07:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I/bVEj+D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnCcq5mg1z3c33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I/bVEj+D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnCQ25GZXz3bWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:58:18 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bb15165ba06so6115515276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467496; x=1690059496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=I/bVEj+DUjJI8l/gEF/kUAGaYNT5Bo0ZW57h+bRIiIunD3HbfI+MBQBKO4xoy6kMld
         by9iDd+YOlloG6orphek9MUhK7idN+HCTnjbwImmtOZyc6e9u9PHx9KvfH/RMgtU+eEw
         KkmIT3OJU3QYrQoQpzTDW/lNw6UL91T+VL7WZPaAaf3blTIwnU3tSpIBE8mZnuXVnYm+
         rvZ17E5R9YwQ5EOQRDXtuuSLgHPTNFwHVzddHdU5MZn7f0HGX0TpCThXTZUeoTrDSQuu
         9j0W4VdWm0ZtykEhgIk1WPxDhiiNhplU95urAkZpVmBWbtxqWeEVwFyvBy3V06yBmQux
         q4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467496; x=1690059496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=CHcUIzz4jASWHD1ewac06C7ZAJV9sJLaaVHuw1OsCxG+VjwOkyh/5OBkaNNqdUTIpN
         9TQ7gQMTP2RVg/FOyuGpnwWFUYtOGSum0uiUE06IZ+UoxvmPF3G6DyQJt4OfGvdfbYpC
         j3bt3X8k2aw8tOgooqJG91VZxFq1HHgo8DOJEu7GkiMADRVJkKw+uZ8rAI7fm9Su0GTS
         LnpVYdTx5Uw7z5+of8bxsf3rDUPh2nON1lm0G1XkhI4zBc2PiZ+kEUadadlGmTsJltQp
         SpTZZIOW80tPDnYmvQZgkWjJ7FMl9WguJ9PzNi6s8PlHKsLFsUxgOC/4exDNZb4xyzdv
         UGSA==
X-Gm-Message-State: AC+VfDy1aWGqzlT0VNPTmYoMtMC2PWIHkns4lN+Ha6VFzTc5/pruLpeq
	XNJ/K8hZ9w109e14kx9j2k0=
X-Google-Smtp-Source: ACHHUZ4fKnSuVlprYtWMiqysn5f2VA+PJ55bhXLl+JTYwbJxQpJ17qCGbx2gEAsv8+8GLejR/TMFxQ==
X-Received: by 2002:a25:6982:0:b0:ba8:1c9e:c77f with SMTP id e124-20020a256982000000b00ba81c9ec77fmr9956027ybc.22.1687467496585;
        Thu, 22 Jun 2023 13:58:16 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:16 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v5 10/33] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:22 -0700
Message-Id: <20230622205745.79707-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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
index 4af424e4015a..0221675e4dc5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2934,12 +2934,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -2952,7 +2952,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2976,7 +2976,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

