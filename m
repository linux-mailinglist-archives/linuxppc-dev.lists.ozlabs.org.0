Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD0769EF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 19:10:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YUReldkg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF4WC1jj8z3dfX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:10:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YUReldkg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF4Mb3gKBz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 03:03:55 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d18566dc0c1so5047581276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823032; x=1691427832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=YUReldkgnetLqvGL1NS71WdWnAzNWWYQnltnVm2rTkEUcOO9WrPWjz/VupfwLsV4R5
         O5U+HAQBX2TEiL7rUmM64hTiM4qIIq6sg/drG9M/BGuBJ33Wydz1s/G+0U+eMZJumoRB
         f1161HPnuyBRb78dTfpgaCSHu9Qo0gegUmxh0kC4FT9lRFkm1YwjVBx9HbpfTIAYT8q1
         zvd8Be582ZnNdhPs3i3IT6jC/uh09at7IMfH8Z/47sZBuFG6ajCrrTeAaD1eGKL98sQ4
         Picd2DUZ0mNQhUFLQyvKhXnHde4rCRB/z+5yBj02B6B5K38q9rbIBp+H/OlzOyaGOHuW
         1Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823032; x=1691427832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=OF9v7k6NZDCUtx/s7rpMSmXdsr8cjWb+AAEGez1jczvTV6ZIqH1ZklXXyCPoTvrf90
         hucDsXMftucYC8XhpHLAoPBeEyESF14+fP28EpplVCl51lQMz68L2D/QKiXgl6JgfnNR
         tLemOM4MD8aJxXjtn73cJ4mqMfv9Uik1EzzbcLdo0FBd9d9vIrZLhyYze7TifcNz6NQp
         z0Qu29ZWcBXtemme5epvH93phJWB7iB6rlpCajhIfd/+C99IKu9dMSs+D+AutKQj5dbb
         STckGXlVZjTcv3E7e2RV0im/c1fVViXFHDyR3PGdjHDr7z0HRuldLVMombE4po9GHvzL
         9LGg==
X-Gm-Message-State: ABy/qLZ+6t2/pqclnMG4GtlppZmF6lwdrtKvKz6+QHoMrbtwiDT8ZIin
	IOGSM6rR3E8ZRBRSRLs8l/U=
X-Google-Smtp-Source: APBJJlHh2ZxIPqvNCWcG3uzKtYIqmu+SYBCgcUqQThaKL5dLb97zd0arq7kj2mXQ9GbTc2zqN8ZRqQ==
X-Received: by 2002:a25:84:0:b0:c67:5adb:36fc with SMTP id 126-20020a250084000000b00c675adb36fcmr11678833yba.38.1690823031787;
        Mon, 31 Jul 2023 10:03:51 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:03:51 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v8 07/31] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:08 -0700
Message-Id: <20230731170332.69404-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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

