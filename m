Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6267734AE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:12:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q3CUliIC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXCc0N0qz3dLd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:12:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q3CUliIC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX3Z3zcnz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:05:30 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a6f87b2993so3744785b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449528; x=1692054328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo55EeeiRtqMJzFppY7LfosEC+4EKSW+Y1wbH/R/zko=;
        b=Q3CUliICB5ucW5n1+cyfiOVvgvAwhYv3ZRrcZge/C2xN1y7mPAKTaAhnTC4tg457In
         GS5yV5pdx2fEbQ6Paw0G9gZpAwxLk7uLiA6v3+SIa2nM9cjP9BC4TMrWHjABBg1TkaAc
         jFqkxuJnd0T58a+3c4oi7Pn3k6jPqHaryISvoGLWFF1pysLGpyRN4pc1ANxWoEwI+30p
         K69XzaaIceuwI5auke9JvMGfHaTbti7Lrj0CNiE6K9RZ1Cm9I6s2gJdVHKhyUn9Bc8fw
         XFhL6ezBClgRYA33kHsXSFVngHlISmggGRScePESZQUU6OPVK5MugkAHJIXH8vtrGuLn
         AiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449528; x=1692054328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo55EeeiRtqMJzFppY7LfosEC+4EKSW+Y1wbH/R/zko=;
        b=VBmlQ9KBGWJoTLMvtVVhKM/lSBft7u3z212Zq0vDWByDCcv7pILk+U53jAmkrw7d+q
         /OhsWurLnn1evWmqYjW63iSB7JEt6NDUwF48hvS8KB17FOf1/bZaEP8p19vxycW9jCpS
         +QxPHJRR6u+wKoTghbMl1iwKKEUfLXJnNkkR+XNRIcpCDe/OcafZnhV99uyKg0nRwb8G
         /4XTEvrR/Zm5NnE8dMCvFlWp3Wl5QengbKL6O32jLhSF8bsltd8BGwH7FNIltFxMIwHT
         zrocLbmYQQgoLRkczy5usL8Y09rpUtcEcMOmwyJHtIkSzdk/yvQxnx/DeUb3ZNHU/oWm
         Ya7w==
X-Gm-Message-State: AOJu0YwkjJzoTlH/oOiO+74y270SRzZ2G3tmfZ6fuQffOUG7UqlYkf13
	4ngDBXPUSJOooIzktwO9VDja8ZowqlCs3w==
X-Google-Smtp-Source: AGHT+IEuvpqTpP0gccwCdePAresyzfHn008a21Ty6dvsje55NxjSSMn6qMCPG3M+rc/X2+vc3Y/lYA==
X-Received: by 2002:a54:4886:0:b0:3a7:238a:143e with SMTP id r6-20020a544886000000b003a7238a143emr10421463oic.2.1691449528538;
        Mon, 07 Aug 2023 16:05:28 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:28 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 05/31] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:47 -0700
Message-Id: <20230807230513.102486-6-vishal.moola@gmail.com>
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f6d14a5fe747..6aea8fb671f1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2860,7 +2860,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2872,7 +2872,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2902,7 +2902,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 956aad8aff34..3606ef72ba70 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6134,14 +6134,14 @@ void __init ptlock_cache_init(void)
 			SLAB_PANIC, NULL);
 }
 
-bool ptlock_alloc(struct page *page)
+bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	spinlock_t *ptl;
 
 	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
 	if (!ptl)
 		return false;
-	page->ptl = ptl;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-- 
2.40.1

