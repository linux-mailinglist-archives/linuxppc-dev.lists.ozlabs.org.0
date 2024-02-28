Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E011A86AA94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 09:57:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xw9ZjIy1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xw9ZjIy1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl7Xq3Lybz3vlb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 19:57:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xw9ZjIy1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xw9ZjIy1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl7TF5vYgz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:54:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709110479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AlPPB19GveccKF6q5GC4EGyOTsyd3+7/CoVODcDmFpU=;
	b=Xw9ZjIy11TB1bKvv1m/mpqEy2d4j9Cx/fLpX6iaA+qFTEw1Ns6zJ4fp/gJLNcc2jXTjbIy
	kZ8SIlYmoG4UXKSEX+Iz3CPVxDXrlMlNuUd6U6xxoU3UvVioy6WrKemOLXp34n/2cRS19Z
	Ld/t4bRgLUrKSyhza0MYxWIwplVJskU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709110479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AlPPB19GveccKF6q5GC4EGyOTsyd3+7/CoVODcDmFpU=;
	b=Xw9ZjIy11TB1bKvv1m/mpqEy2d4j9Cx/fLpX6iaA+qFTEw1Ns6zJ4fp/gJLNcc2jXTjbIy
	kZ8SIlYmoG4UXKSEX+Iz3CPVxDXrlMlNuUd6U6xxoU3UvVioy6WrKemOLXp34n/2cRS19Z
	Ld/t4bRgLUrKSyhza0MYxWIwplVJskU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-jkzvL2X3OE2u2sJzQFKwag-1; Wed, 28 Feb 2024 03:54:32 -0500
X-MC-Unique: jkzvL2X3OE2u2sJzQFKwag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A249108BFCC;
	Wed, 28 Feb 2024 08:54:32 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58914200A382;
	Wed, 28 Feb 2024 08:54:26 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 5/5] mm/treewide: Drop pXd_large()
Date: Wed, 28 Feb 2024 16:53:50 +0800
Message-ID: <20240228085350.520953-6-peterx@redhat.com>
In-Reply-To: <20240228085350.520953-1-peterx@redhat.com>
References: <20240228085350.520953-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

They're not used anymore, drop all of them.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/include/asm/pgtable-2level.h        |  1 -
 arch/arm/include/asm/pgtable-3level.h        |  1 -
 arch/powerpc/include/asm/book3s/64/pgtable.h |  2 --
 arch/powerpc/include/asm/pgtable.h           |  4 ----
 arch/s390/include/asm/pgtable.h              |  8 ++++----
 arch/sparc/include/asm/pgtable_64.h          |  8 ++++----
 arch/x86/include/asm/pgtable.h               | 15 +++++++--------
 7 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index ce543cd9380c..b0a262566eb9 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -213,7 +213,6 @@ static inline pmd_t *pmd_offset(pud_t *pud, unsigned long addr)
 
 #define pmd_pfn(pmd)		(__phys_to_pfn(pmd_val(pmd) & PHYS_MASK))
 
-#define pmd_large(pmd)		(pmd_val(pmd) & 2)
 #define pmd_leaf(pmd)		(pmd_val(pmd) & 2)
 #define pmd_bad(pmd)		(pmd_val(pmd) & 2)
 #define pmd_present(pmd)	(pmd_val(pmd))
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 71c3add6417f..4b1d9eb3908a 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -118,7 +118,6 @@
 						 PMD_TYPE_TABLE)
 #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
 						 PMD_TYPE_SECT)
-#define pmd_large(pmd)		pmd_sect(pmd)
 #define pmd_leaf(pmd)		pmd_sect(pmd)
 
 #define pud_clear(pudp)			\
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index d1318e8582ac..176d63ec5c3a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1441,7 +1441,6 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
  */
 #define pmd_is_leaf pmd_is_leaf
 #define pmd_leaf pmd_is_leaf
-#define pmd_large pmd_leaf
 static inline bool pmd_is_leaf(pmd_t pmd)
 {
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
@@ -1449,7 +1448,6 @@ static inline bool pmd_is_leaf(pmd_t pmd)
 
 #define pud_is_leaf pud_is_leaf
 #define pud_leaf pud_is_leaf
-#define pud_large pud_leaf
 static inline bool pud_is_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 5928b3c1458d..8a19066e5e12 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -101,10 +101,6 @@ void poking_init(void);
 extern unsigned long ioremap_bot;
 extern const pgprot_t protection_map[16];
 
-#ifndef pmd_large
-#define pmd_large(pmd)		0
-#endif
-
 /* can we use this in kvm */
 unsigned long vmalloc_to_phys(void *vmalloc_addr);
 
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index a5f16a244a64..9e08af5b9247 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -705,16 +705,16 @@ static inline int pud_none(pud_t pud)
 	return pud_val(pud) == _REGION3_ENTRY_EMPTY;
 }
 
-#define pud_leaf	pud_large
-static inline int pud_large(pud_t pud)
+#define pud_leaf pud_leaf
+static inline int pud_leaf(pud_t pud)
 {
 	if ((pud_val(pud) & _REGION_ENTRY_TYPE_MASK) != _REGION_ENTRY_TYPE_R3)
 		return 0;
 	return !!(pud_val(pud) & _REGION3_ENTRY_LARGE);
 }
 
-#define pmd_leaf	pmd_large
-static inline int pmd_large(pmd_t pmd)
+#define pmd_leaf pmd_leaf
+static inline int pmd_leaf(pmd_t pmd)
 {
 	return (pmd_val(pmd) & _SEGMENT_ENTRY_LARGE) != 0;
 }
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 652af9d63fa2..6ff0a28d5fd1 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -680,8 +680,8 @@ static inline unsigned long pte_special(pte_t pte)
 	return pte_val(pte) & _PAGE_SPECIAL;
 }
 
-#define pmd_leaf	pmd_large
-static inline unsigned long pmd_large(pmd_t pmd)
+#define pmd_leaf pmd_leaf
+static inline unsigned long pmd_leaf(pmd_t pmd)
 {
 	pte_t pte = __pte(pmd_val(pmd));
 
@@ -867,8 +867,8 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 /* only used by the stubbed out hugetlb gup code, should never be called */
 #define p4d_page(p4d)			NULL
 
-#define pud_leaf	pud_large
-static inline unsigned long pud_large(pud_t pud)
+#define pud_leaf pud_leaf
+static inline unsigned long pud_leaf(pud_t pud)
 {
 	pte_t pte = __pte(pud_val(pud));
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 69ed0ea0641b..87be73474e8d 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -251,8 +251,8 @@ static inline unsigned long pgd_pfn(pgd_t pgd)
 	return (pgd_val(pgd) & PTE_PFN_MASK) >> PAGE_SHIFT;
 }
 
-#define p4d_leaf	p4d_large
-static inline int p4d_large(p4d_t p4d)
+#define p4d_leaf p4d_leaf
+static inline int p4d_leaf(p4d_t p4d)
 {
 	/* No 512 GiB pages yet */
 	return 0;
@@ -260,8 +260,8 @@ static inline int p4d_large(p4d_t p4d)
 
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 
-#define pmd_leaf	pmd_large
-static inline int pmd_large(pmd_t pte)
+#define pmd_leaf pmd_leaf
+static inline int pmd_leaf(pmd_t pte)
 {
 	return pmd_flags(pte) & _PAGE_PSE;
 }
@@ -1085,8 +1085,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
  */
 #define pud_page(pud)	pfn_to_page(pud_pfn(pud))
 
-#define pud_leaf	pud_large
-static inline int pud_large(pud_t pud)
+static inline int pud_leaf(pud_t pud)
 {
 	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
 		(_PAGE_PSE | _PAGE_PRESENT);
@@ -1097,12 +1096,12 @@ static inline int pud_bad(pud_t pud)
 	return (pud_flags(pud) & ~(_KERNPG_TABLE | _PAGE_USER)) != 0;
 }
 #else
-#define pud_leaf	pud_large
-static inline int pud_large(pud_t pud)
+static inline int pud_leaf(pud_t pud)
 {
 	return 0;
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 2 */
+#define pud_leaf pud_leaf
 
 #if CONFIG_PGTABLE_LEVELS > 3
 static inline int p4d_none(p4d_t p4d)
-- 
2.43.0

