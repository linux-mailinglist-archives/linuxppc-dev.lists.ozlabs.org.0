Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F117734BE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:15:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WW7U9RxJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXGf6DKLz3dFR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WW7U9RxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX3f5PTzz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:05:34 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so4187595276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449532; x=1692054332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV51lKtiOhMWQgAl7GNvRpOxJtkn3o5Ia4Rm5PKGOL0=;
        b=WW7U9RxJoy+3YY4y3qa+Z9OsxlwmyOU3wMBaX5rDPLFmIEHt/X6v4NdYOpBq8PRkh5
         HGAvbPPuVPcaXp+7bIkcS5zKLOts7aoRAq2rmpfhl809GhQ5Z7qhyD2D1O9jUw02JT8D
         ByQrQ+74LtD1rxejz5iV5Ji3t3biqjBaLILP+cGmcXMABNbKMRqAqcPv+Q5eVbDOwvco
         pnySxrcubM/hR4SWo6309aJr0ghUYXqxorm9LprpxBDG4pKG7rw8FnMSIxuCIl+L3G3f
         pQ7sJFVehZ1e4LudKLyLwUTD+K2Hcr+cYbBqgmDPIUau/hEmU0pgvAzvLPGNFfNzyEIP
         WwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449532; x=1692054332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV51lKtiOhMWQgAl7GNvRpOxJtkn3o5Ia4Rm5PKGOL0=;
        b=Ui0HJAera/wYEYBaBpWY+Mk2CvSh+Rqx7KewRHzyCcu7X10fCGOTiRVOb9rvDgBQka
         IPIQI3jTj9s9iMLkyZ6dIAkqsia4dpv5lL/JvStxCWYc2/0WUOWQBIBTH1LjiheCY9/5
         i7BZqmwmsbJIocKt29wR7WxigdTwjIy9/lPGpQvpQ5TbMoA0KCvlDzHGehB4ekIBG532
         gDHB8/FJkGAyikp+qVgNtCFUJ4SiC+Ss8PBeGSFPBt15QbI7bbJW2MR2yEW03Nq2B0Cm
         uaeOnoH/T6xCpPgHc3oN3h1t1PswMbkzbbjV/YgSenoW9HAIAl7HWNJNSETLcFB0uAhU
         cw2Q==
X-Gm-Message-State: AOJu0YzW2G78TpAzJejvriUejHKNS6riugDS5DgIc50AMv8XIKDl0zdB
	0KgQuuvLeQJ7pvsUwv86vS4=
X-Google-Smtp-Source: AGHT+IEvrDCY+UE05HZYU4gf4n6Ovk9myxbAlbrTcNmkwiJKi0vLSKG9giGoSfLWvI4ILhQ42gUDlQ==
X-Received: by 2002:a25:bd7:0:b0:d14:6e28:69a4 with SMTP id 206-20020a250bd7000000b00d146e2869a4mr9317696ybl.29.1691449532541;
        Mon, 07 Aug 2023 16:05:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:32 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 07/31] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:49 -0700
Message-Id: <20230807230513.102486-8-vishal.moola@gmail.com>
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
index bc82a64e5f01..040982fe9063 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2993,12 +2993,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -3018,7 +3018,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -3034,7 +3034,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

