Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0154718D6E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjXR2V5Pz3gKG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:47:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cEdd+3Jq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cEdd+3Jq;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBn3qNFz3fLc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:45 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5689335d2b6so715547b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568705; x=1688160705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9eRM/zDkfdSk+8A/Hewm27be7ojppibpTW/4yMTPrs=;
        b=cEdd+3JqSM8NFS7GIxJNDGEwvf5zLrjyKSP/sMa+M4iyqruEv0NeTXFNM3FuEOve0w
         BIidhyYZPlXr46Gag37ah0Z9lK+/zubpEH8qTvbGBEkRrc++Uy/9vmo7kzodV2wrSQQX
         I30LmfVEDViclfTqhhCm9JCK+j60eB88X4OE4kx5hV9tTa2skQgGrRsYDfbJW0ibMSeL
         XGmJa+8fFqRfTTRXmPxLl8Ng1lVV80Cc71vk49EsIYa6/DzcwK4zi4KQyIaDphcDsbUr
         cdzc/H0c6XAN15Wd27KyDlOf+VJeKUYgNs/w5+avyyLu4TkMCo4jGnCkWr4fOUgF3X5G
         tX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568705; x=1688160705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9eRM/zDkfdSk+8A/Hewm27be7ojppibpTW/4yMTPrs=;
        b=E/1EMvMuichojqFDObCXUDdOzkbUHcas9/cNqIOHe16Hb4B258FdmCuyCG0oe2t8O7
         bQjAJWxDuTLWKSJl6IPv0Lr10H+hLdvK0JO1okVj9B77qn4Qi4kFMs1jLoCxMlHld5Xe
         DAQNAjif0Q/giVRERmVdQ28M0VAA24s3q3qvBm8HiAojP3uqr0M8BKTnXCvPJA2uVgVa
         A78KwMms3gKAVSsquPdZZKm3Yp0OS7yOSDmS4Qnor6v6VSoVc559SKFETqrik/m1mn4B
         9zYccItoM3DdYkJTJ0F88lGSXnyxVZYZAlkAF7rdq6EvJGz+BAWpTAL59Oj72DLdM5nv
         yAQw==
X-Gm-Message-State: AC+VfDwXN15iK8HGjjhIgUrTmUMqo6KtlR14lDIyBJBv0bVTpzFy7Sx0
	ord6Qo4NNF163jNqmucVnSt6V63qlylzWA==
X-Google-Smtp-Source: ACHHUZ6qsHeUoao2+s8uy7ftoyOjIWcEzXHhSNjnyPVGfYnJHG4o2q2q2wEf6DyMGhXFqCryp1fDIQ==
X-Received: by 2002:a81:778b:0:b0:565:ee47:5844 with SMTP id s133-20020a81778b000000b00565ee475844mr7319022ywc.38.1685568704868;
        Wed, 31 May 2023 14:31:44 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:44 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 18/34] mm: Remove page table members from struct page
Date: Wed, 31 May 2023 14:30:16 -0700
Message-Id: <20230531213032.25338-19-vishal.moola@gmail.com>
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

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm_types.h | 14 --------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6161fe1ae5b8..31ffa1be21d0 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -141,20 +141,6 @@ struct page {
 		struct {	/* Tail pages of compound page */
 			unsigned long compound_head;	/* Bit zero is set */
 		};
-		struct {	/* Page table pages */
-			unsigned long _pt_pad_1;	/* compound_head */
-			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			unsigned long _pt_s390_gaddr;	/* mapping */
-			union {
-				struct mm_struct *pt_mm; /* x86 pgds only */
-				atomic_t pt_frag_refcount; /* powerpc */
-			};
-#if ALLOC_SPLIT_PTLOCKS
-			spinlock_t *ptl;
-#else
-			spinlock_t ptl;
-#endif
-		};
 		struct {	/* ZONE_DEVICE pages */
 			/** @pgmap: Points to the hosting device page map. */
 			struct dev_pagemap *pgmap;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5f12622d1521..3b89dd028973 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1020,10 +1020,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 #undef TABLE_MATCH
 static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
 
-- 
2.40.1

