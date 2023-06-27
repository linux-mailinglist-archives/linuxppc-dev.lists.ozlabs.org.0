Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A523473F2C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:30:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HLcNThhC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqqx646yzz3cV5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:30:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HLcNThhC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qqqbj5s49z3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:15:45 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5702415be17so30770987b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835744; x=1690427744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=HLcNThhCjrF2lW2DbUB2arEo4ko3B6allhXZIcElXjdr6H7L2X1FZfSho548An2x+c
         a+9K7HsBcoezl8dCiHuvfAoLyrYuTYtD9E2TWwaVAxGHkBxxc2/5TZ6nFsMXNvk6remM
         jx+8EfWgo0KYBg7GjeDiKlLbwiB7jM460FpLAi7tKdSlKxxDWqFHsa1UXC/mbPJcCtbU
         yj4Rp4J3hy1xGdNYGZKCLJPZo1cDJDTZZ/8LhFsRol7Jja96ui1kFTq+O1Fx747WJ4sF
         vLKKmUtgz/Vt/5vQzW3HaVNESXDRtjCa2KGe7DVgUo3lXiMXBnrUqjQNRU6qXKgQgpLj
         HQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835744; x=1690427744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=aHHzPiEA2dGgeAL0knnHJnzbF4IjCApe7JG7I5t5JR9Yby4FBwWvdoc2cO4fdc90jq
         G5Y+wV01WYbFUifgUhN5ME+IuPtGsFO4FeEsSZL+TZNRaVkLvoN/ogfpBLGCemW32SFB
         57vclt/rwRQ8x68LvlL7tw5B88+Uhnc92/dfdIKr3STi18ZBW3XzYDmc6KzElli6JmIs
         WNdK/snNHzmsLuAeRnA1PWvxsMwDOguAXPpeyHuMoYiVWdorm4iiHyD7UKdAhzFKrO8G
         av8KMJ6tzq6wk61MJ9TLAr4H9bOHZJr5uPsxIckr3CI3u0BY3mMtEbtIVkbMnCoQrCYi
         DiBg==
X-Gm-Message-State: AC+VfDxVFAIR1nQHOTuT9yaC4UFMRGA5tpV92A85ECmWwb/X/bNG2USc
	ac4pUH5mFCyrkXG5lbSH+YU=
X-Google-Smtp-Source: ACHHUZ4vo/lElRqyF24hRbACCzJ93507ECpcyy5/0zyyAPcDbkzDTEVAwpHPMKxzXN5UZzQtaYrpVQ==
X-Received: by 2002:a81:6bc5:0:b0:576:8fcd:270f with SMTP id g188-20020a816bc5000000b005768fcd270fmr7059365ywc.19.1687835743726;
        Mon, 26 Jun 2023 20:15:43 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:43 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 17/33] mm: Remove page table members from struct page
Date: Mon, 26 Jun 2023 20:14:15 -0700
Message-Id: <20230627031431.29653-18-vishal.moola@gmail.com>
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

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm_types.h | 14 --------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index fbbe4e93a9ba..434e54440686 100644
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
index e9bb5f18cade..daeacfe3930d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1044,10 +1044,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 #ifdef CONFIG_MEMCG
 TABLE_MATCH(memcg_data, pt_memcg_data);
-- 
2.40.1

