Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1300D7734E8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:23:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=A70KAiN4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXS635ntz3d8s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=A70KAiN4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX3z5V4Gz3bsx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:05:51 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-585fd99ed8bso87274817b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449548; x=1692054348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djDHSA50q7R+UyBiZfR1OlHjGJmDs73q9nwlLjbVi90=;
        b=A70KAiN4sx+tlFlhyX9BkgJstVMLVR3VqHlhU0rx7I/q1gK7xadYJiksKbuvoZ1TCU
         vtYAPdjYMcohI4FUcCDaUSvo3KExkCCd8i4ZAJlLsd7GGEFa35HZ6ueu66zMG9Pjessv
         IfHL3oLMSZbSj2Xq1C5vYTgwWzjwrMyTCzKH7w07IcqqBjGPHvlKkPkr5yx2TrtnD3V5
         vilM5UK235QUkkDj7spFvnAsyD47IB2DFcBmstKvpCiE4ENrGAtmtfggM5j3FhO6Urma
         yNzpPXlABiRMwP18oUglZegWP3XimvmMFaP4ALUxkyZmGiszwVYNBF+f3K+ck5Grr2Wp
         NJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449548; x=1692054348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djDHSA50q7R+UyBiZfR1OlHjGJmDs73q9nwlLjbVi90=;
        b=Ku2Ffp4SUY8NQ6HgD7cJigzARVDQUgUMyxRRh6+kr51erW4YHs+RDiyfZHnQgfaq8I
         Gfge+m4mW0fp84Dx1RLOdq9X3qS8oWqzgET9tBDraYgefsf/k9Y5EUE9QeeAVdraTx2l
         dswl4t60vMpgmZBkqeMLMhHWiaF7c/NYwk2/p05MJa1PYF/SZy6nFWhYHJr+HrjCowmH
         wlumCckX0/F0WRzuu3tqwNy8Cl6wu16IVP7rJTUcIFVQ8lOIHyl1udCpCtuKhqk0EkSK
         rdlgt3PRxxfXqUjg7F/8J9FwPRUgqmoox6OkZBPSyIfXT2pqHR4BL1FBe483WCS8LPwo
         WW7A==
X-Gm-Message-State: AOJu0YwGj6NECyyzPhTLHwq2gWrEZg6GVOGz3QZ5gZRY+3ztFA3jUY1L
	ptpsnquVS/JwvQPwsyT/TfM=
X-Google-Smtp-Source: AGHT+IGTzP73V6D5bA3Obfkv2DqAOxUsUVIIigLLB5NQKEC9VyMSvyrKel3HyW7I0Mz7ccDZUXFbIA==
X-Received: by 2002:a25:d8c4:0:b0:d05:2616:3363 with SMTP id p187-20020a25d8c4000000b00d0526163363mr9753736ybg.26.1691449548551;
        Mon, 07 Aug 2023 16:05:48 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:48 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 15/31] mm: remove page table members from struct page
Date: Mon,  7 Aug 2023 16:04:57 -0700
Message-Id: <20230807230513.102486-16-vishal.moola@gmail.com>
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

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm_types.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index ea34b22b4cbf..f5ba5b0bc836 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -141,24 +141,6 @@ struct page {
 		struct {	/* Tail pages of compound page */
 			unsigned long compound_head;	/* Bit zero is set */
 		};
-		struct {	/* Page table pages */
-			unsigned long _pt_pad_1;	/* compound_head */
-			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			/*
-			 * A PTE page table page might be freed by use of
-			 * rcu_head: which overlays those two fields above.
-			 */
-			unsigned long _pt_pad_2;	/* mapping */
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
@@ -454,10 +436,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, __page_mapping);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 TABLE_MATCH(page_type, __page_type);
 TABLE_MATCH(_refcount, _refcount);
-- 
2.40.1

