Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C24CA86C3FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:44:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQhYYM36;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQhYYM36;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TllC32jSYz3vd4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:44:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQhYYM36;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQhYYM36;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tll9j4C0cz3dVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:43:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJJ0eqDZ1S0vUv+Nro3fA2Y1PjBXchWPHo5qT9tenrk=;
	b=dQhYYM36D8ExffPi3iVU8jAqDiYUYaVR6nK3A93bsvLMwJS35ZIUd+q7p4lebqgBKgaTn7
	L6C7ZY8lyp9l4bYCKiFqY2vPrQB+IyktZ1rtDn/5aUcUmBstGmpTT5BchHCDCu8Jl0N1+u
	7YBpGRRcWlEzQcko7DbaS/SMQSbsd44=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJJ0eqDZ1S0vUv+Nro3fA2Y1PjBXchWPHo5qT9tenrk=;
	b=dQhYYM36D8ExffPi3iVU8jAqDiYUYaVR6nK3A93bsvLMwJS35ZIUd+q7p4lebqgBKgaTn7
	L6C7ZY8lyp9l4bYCKiFqY2vPrQB+IyktZ1rtDn/5aUcUmBstGmpTT5BchHCDCu8Jl0N1+u
	7YBpGRRcWlEzQcko7DbaS/SMQSbsd44=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-nrzUiLqfPF6NDPYG9jg0YA-1; Thu, 29 Feb 2024 03:43:15 -0500
X-MC-Unique: nrzUiLqfPF6NDPYG9jg0YA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7393383BA86;
	Thu, 29 Feb 2024 08:43:14 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7863E28D;
	Thu, 29 Feb 2024 08:43:07 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] mm/ppc: Define pXd_large() with pXd_leaf()
Date: Thu, 29 Feb 2024 16:42:52 +0800
Message-ID: <20240229084258.599774-2-peterx@redhat.com>
In-Reply-To: <20240229084258.599774-1-peterx@redhat.com>
References: <20240229084258.599774-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

The two definitions are the same.  The only difference is that pXd_large()
is only defined with THP selected, and only on book3s 64bits.

Instead of implementing it twice, make pXd_large() a macro to pXd_leaf().
Define it unconditionally just like pXd_leaf().  This helps to prepare
merging the two APIs.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 16 ++--------------
 arch/powerpc/include/asm/pgtable.h           |  2 +-
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 927d585652bc..d1318e8582ac 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1157,20 +1157,6 @@ pud_hugepage_update(struct mm_struct *mm, unsigned long addr, pud_t *pudp,
 	return pud_val(*pudp);
 }
 
-/*
- * returns true for pmd migration entries, THP, devmap, hugetlb
- * But compile time dependent on THP config
- */
-static inline int pmd_large(pmd_t pmd)
-{
-	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-}
-
-static inline int pud_large(pud_t pud)
-{
-	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
-}
-
 /*
  * For radix we should always find H_PAGE_HASHPTE zero. Hence
  * the below will work for radix too
@@ -1455,6 +1441,7 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
  */
 #define pmd_is_leaf pmd_is_leaf
 #define pmd_leaf pmd_is_leaf
+#define pmd_large pmd_leaf
 static inline bool pmd_is_leaf(pmd_t pmd)
 {
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
@@ -1462,6 +1449,7 @@ static inline bool pmd_is_leaf(pmd_t pmd)
 
 #define pud_is_leaf pud_is_leaf
 #define pud_leaf pud_is_leaf
+#define pud_large pud_leaf
 static inline bool pud_is_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 7a1ba8889aea..5928b3c1458d 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -101,7 +101,7 @@ void poking_init(void);
 extern unsigned long ioremap_bot;
 extern const pgprot_t protection_map[16];
 
-#ifndef CONFIG_TRANSPARENT_HUGEPAGE
+#ifndef pmd_large
 #define pmd_large(pmd)		0
 #endif
 
-- 
2.43.0

