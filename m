Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267096E783B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dRx6WWSz3fnK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:12:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r15/y1KD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r15/y1KD;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQZ6lM3z3f4Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:10 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id cm18-20020a17090afa1200b0024713adf69dso15384722pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764789; x=1684356789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySUR2NhNYIi45iieMc0XGAHKG7J++HPTQWlVu2Tasao=;
        b=r15/y1KDif+Drf/4AN1jpq4aAvcL2g0C6yBlVejRZjViwAKdx4tN5lVxRrilW72t8W
         lxYrwwZ1V+6OuCBWGNjnVnFHs9fxA0+y+Hq/T2Xun9HaX6uevRtPhFT+6Fyn6rL6cuxl
         Z3/9OHOOCrjsch5rq9oWYEod7RCMO4fFtyd7gUBrmXZG32pCnlsISiWWId2b7LrGrhST
         kpDrkb186Ifgo7UoD/Ti/tLM6Mv74UfKgE7j3u4BhSVZUj1yrtlCsZDlhuTy+CmGW1TT
         t+a+qaRd0Bf5+Wl/CDmlKFz2wUcV2Pe9TbKsnSy3YV2N+zpAWDFA5l3JzNu+kIHHm1Jf
         2puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764789; x=1684356789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySUR2NhNYIi45iieMc0XGAHKG7J++HPTQWlVu2Tasao=;
        b=LfNTxiOdnPx6eCWjv6T/lneEQ4RGggyDGazsfPU2iqZtKJ7LtK7R0dwWU+ZT8WYsFJ
         zpGqb/uGkVrBawAIljGy8IQiZBFsHdj8rGmHPiEpZVfVvmHsvCYLqu57QNSQFWfwVOB3
         Duk/u7uKo61y3YOVJDD/CTrI6XWM3yRItTQR1UaVmvxB74GJbpOZa0tzikM/OthWHiUc
         Sc+qsw20Gt8cyX4qnRp4DRFh4rApAwmCmqkiGOgbPioO/1EvasgLhX9HIoj1U472NSjf
         iRBEzGTjqkrmyUeEFUsyuAyrLQG8cv6zDw1h+z+gU6c0kwcx2DbPZm1rAn0TetJR+OWP
         MSLg==
X-Gm-Message-State: AAQBX9fzEG81fHUfdr/cR7Y2hMwvRnu6kVA3fPSktSEinlIYJ5kn+hUN
	NQRyIzC4uiXGuwncmW+Npxk=
X-Google-Smtp-Source: AKy350ZVl3PNdJ0+nN/Rb9LpMw5+uyjbe8u9t4N4aIteNFpQkEwBCpgg7+YRGDc+SZWH4x4d964lpw==
X-Received: by 2002:a17:90a:d205:b0:234:409:9752 with SMTP id o5-20020a17090ad20500b0023404099752mr15223725pju.25.1681764789129;
        Mon, 17 Apr 2023 13:53:09 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:08 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 17/33] mm: Remove page table members from struct page
Date: Mon, 17 Apr 2023 13:50:32 -0700
Message-Id: <20230417205048.15870-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
index 2616d64c0e8c..4355f95abc5a 100644
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
index 7cd803aa38eb..8cacdf1fc411 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -91,9 +91,6 @@ TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 #undef TABLE_MATCH
 static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
 
-- 
2.39.2

