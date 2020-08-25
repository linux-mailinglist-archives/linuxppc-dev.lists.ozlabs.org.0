Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715C251BF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:13:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbXYc5KbhzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 01:13:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xfp2e3Xt; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbXDW3lSWzDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 00:58:19 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u128so7553158pfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sv/9eriXs4YMtuUqEg5bncZ0rlcJBEbL+hLm5+QBb40=;
 b=Xfp2e3Xtmw0mMDWZ1ueqN80X0o3DlaU18t1Cz/zK/F/eG1y7CuKlm8YpZiO4eoodn+
 pou5w1vEvYGji3W/Lm6246DlLB/o7In87TRc/AlIA0ZsHzwWyB0AsKNL0vlL6mmEPmR/
 0IFy4YCNvsAbiS9HKLsJN9yeZ1WKIzzFRSqG80JdkpP9JkQJa2GyYnw+7nlUPr8PhBrr
 TY8Tk3e6jBiHxthHc5rRMIvlJ2nuZy+ZQoGTKOPCVESC2mNUa1jBOftgRpfR8gVwsahg
 ndpNRGLeSb03UdhbXf5Oglnz1f2x6ei+zbwAPqXu52ALcrF+qkQbmNdZkrQCvBaKPAmB
 o9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sv/9eriXs4YMtuUqEg5bncZ0rlcJBEbL+hLm5+QBb40=;
 b=DB3CYPn58vC4EpL+fjZ+9hVq3JiwCHQK/XFAPxQKHX/e+RdmaryUQH7hlaVgnXwtFa
 hqPqo8yOBmObLt/RU/UqJsfI/KdFWHFQPAMhAQH0brXRPZ/dz+lmFQIyCseexboPjdsU
 vFsCIl8+P//amQXWuDoY7pEDHPFKckTn2CtI/mLuDgis1v10iK4ylkqHWOVV2+avwpZm
 AVObT12/872lUXlq8gN1zqi39b5Cj1TKus8tKFqa/ulOU4d8b0dWzy+yaKRsugYvmSxo
 PjZa2x2OdC5oWZc15vD43lQo+vFpzfFMmTCM8lSLAXSh3cN8WogyURErtGMMs9JVUKdh
 hDrw==
X-Gm-Message-State: AOAM533AwniZjzRQxWoYfyYwFffq5gJzvk4JLVGB5g0FJP4HBSEldLtF
 /8m8SzmuiA/o/EpnzLbdbkY=
X-Google-Smtp-Source: ABdhPJzgj9qz6s3F5P6AAw9oSEmK+WKjXVI/Yh0BhuKrx77hUIFnOe4T+XEIWRGHePjBI4hUL0PHmQ==
X-Received: by 2002:a17:902:eb03:: with SMTP id
 l3mr5592962plb.296.1598367497180; 
 Tue, 25 Aug 2020 07:58:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id e29sm15755956pfj.92.2020.08.25.07.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:58:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 03/12] mm/vmalloc: rename vmap_*_range vmap_pages_*_range
Date: Wed, 26 Aug 2020 00:57:44 +1000
Message-Id: <20200825145753.529284-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825145753.529284-1-npiggin@gmail.com>
References: <20200825145753.529284-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The vmalloc mapper operates on a struct page * array rather than a
linear physical address, re-name it to make this distinction clear.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 4e9b21adc73d..45cd80ec7eeb 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -189,7 +189,7 @@ void unmap_kernel_range_noflush(unsigned long start, unsigned long size)
 		arch_sync_kernel_mappings(start, end);
 }
 
-static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
+static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -217,7 +217,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
 	return 0;
 }
 
-static int vmap_pmd_range(pud_t *pud, unsigned long addr,
+static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -229,13 +229,13 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pte_range(pmd, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
 			return -ENOMEM;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
+static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -247,13 +247,13 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pmd_range(pud, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
 			return -ENOMEM;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
+static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -265,7 +265,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pud_range(p4d, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
 			return -ENOMEM;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
@@ -306,7 +306,7 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
 		if (err)
 			return err;
 	} while (pgd++, addr = next, addr != end);
-- 
2.23.0

