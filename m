Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA017734C4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:17:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ipvaU8x/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXK570gdz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ipvaU8x/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX3l5PPRz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:05:39 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so5463390276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449536; x=1692054336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL6AQetgHURU9peF5jMm+1QPkGPdtGd2X/zb9xq5Tzw=;
        b=ipvaU8x/4/BvbPbL1JSP5UKyrvOXFJin5b02qnpk0+g2WqZ4eJ+PO+ktIgA+6wNoSm
         aaVqpEKee+fuDlQKCW2FfgF7SgMBsBqJt3e1nMH+AXWpM2n5M5vJ6ySCVS0SQ6gxdoiI
         D+Vz3KZ0hmlesWiSA/IngK6t1yMsQcmq6H5TLlpCkzZtF+sAfosr9KpkynHtpBKwq7VS
         GLoFH093mbAem14YxFU+jWVsiLanVvmYVX25waYX2eZafZZIUXESTosUd2Oq+mhwT6KE
         DFWO6vdcB84fh2CYUtre/BRV5qGnoLxfl2hREphZC8Q8m4iPBusEVSAtzxRpIAKFC+MO
         xrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449536; x=1692054336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL6AQetgHURU9peF5jMm+1QPkGPdtGd2X/zb9xq5Tzw=;
        b=JU6+I8ItIerdF8bD9HGLJ4jbPH5LRGLcqGMd/TSErIL2P4nbGzP91eM8dBX7A2p1T4
         cRM5OktwaBMZpJjMLjrm7LKFJs0U0ukHV7Q1KRqG93s4cXgcBOuuHrPJPoaW4nbhKsre
         VbWMP2zqZSHX8ey4aFdEnoN1zbFi23k0NFgI7DBEU+6fuuK95tTZ5BWWaeP0tTNF0YyN
         HrKkzoO5ubyzRY+CzIXwJ0VqPg6VAvTzOdd3Jk7LqpS6cNCNf4jBmaArdQVTF2uQummn
         tgJzIYuKn5vyWMiVJUGifOOAdENda8CnA/vWYrRk0DJCzb+zphXgRlmBteG0uTwn4v/u
         oO4w==
X-Gm-Message-State: AOJu0YxCfXaHGTk59GLampB1VO3dpuwzcxARQndOMC8HdpW4zZv54Cz9
	ajA3HrMhY+ipD8/nwNPv+Xo=
X-Google-Smtp-Source: AGHT+IEvxj9+7jMT4q6zEzLr5Igqcb/a7jma6HML30e7U0QAJ8Bd3AhAgHjN0UpvuwRaK7JUtc9G0w==
X-Received: by 2002:a25:738b:0:b0:d09:7f94:6ea3 with SMTP id o133-20020a25738b000000b00d097f946ea3mr11456718ybc.65.1691449536455;
        Mon, 07 Aug 2023 16:05:36 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 09/31] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:51 -0700
Message-Id: <20230807230513.102486-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
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

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 13947b17f25e..aa6f77c71453 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,12 +3001,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -3019,7 +3019,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -3043,7 +3043,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

