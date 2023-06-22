Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C673AB4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:13:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bxkxtD+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnCm00dVJz3dBY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:13:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bxkxtD+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnCQL6cyqz3bm2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:58:34 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-763dc87aac4so187123585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 13:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467511; x=1690059511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=bxkxtD+QQAC8zd161RKeCcg6MaoPAPE7L+CauClsYEL0Xy9+Td62VuxUGsgYxnFiq0
         O6uvJ71cZ3HzaD3sn95/EOTS8BXKpmL+IQrAYm0nHFHW9S+p9vWLuqdK4qFg64CCRbun
         joR+Hl/5hsxihcXKPDNMSOwFhI08HqC+OD8d0u+5w8Qz5HarhFJT9jfwORvF779fEL9V
         zRFvHmiRuYANo66EVjgtR36nI9raB2GVIEDQNVqxyl97sNwtEBiuGHRD00zHWqOmK+wx
         CCZ2jYpmNaAVgCE8uPmkzzzOyp8bu94YHjJqAydk7W1+LKznmMU3DWFCBUl+KliiUs4D
         rLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467511; x=1690059511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=kVyDd0SWIX/koIo+Ab/uMdGzihbrU6JUGuw7NzVq5329DVF97u44HTQeuWsqh/zjb3
         Zycds6PCI9z+vxnooyKtQXk5thAOt/20QPZ2oNV67Oa4StgR5ODtevTCG5HLZAQwGkWb
         VWDokZNoYeKeqLinvtbc45mOQccRTpJUCYfP4JS09TxaKBBn1GMUDTnZ7bx5N7MTbbNo
         KdS6meTriDM1lvtqo8ErWnEv25B0I742Co+v1Hn6ltuI1wHaV+TW4a1koqTSHv+Nx5xw
         URKMc4chEE1VSdsZhpczapNKJ9nEoVYpZ5I8M0iamfTNdbuuaL/MMpqVhpsmCKBJwF3G
         TzIg==
X-Gm-Message-State: AC+VfDxLsZwj+ddOo4t7w0T+iY9kwx0Gzyr9AEUQtaoHO7NYRO3pftkl
	ixDJAckqi2/OLk5SlyB09NI=
X-Google-Smtp-Source: ACHHUZ4ad8Rj1cEO907Psdq+ajLgAiK0FYJ6eHB9wwgKt19FWwArd1FWX8Y4TNXwZH2eE/VH/YBYiA==
X-Received: by 2002:a05:620a:4790:b0:765:41c1:31eb with SMTP id dt16-20020a05620a479000b0076541c131ebmr1410020qkb.48.1687467511080;
        Thu, 22 Jun 2023 13:58:31 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:30 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v5 17/33] mm: Remove page table members from struct page
Date: Thu, 22 Jun 2023 13:57:29 -0700
Message-Id: <20230622205745.79707-18-vishal.moola@gmail.com>
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

