Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16348714F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:45:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY/Ud9yO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY/Ud9yO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpjgT53blz3vpW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY/Ud9yO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY/Ud9yO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpjWr4q8nz3vZb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 15:39:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjhEXhItmtgWJcOdZcIsr7lX1LpUjnzN2RuMZC/FUxw=;
	b=SY/Ud9yOeOwuVSBfeXvLRQTx+WKNLiWQhRMegTPamDdAJNodzeEnpZmsJFThmMPr8q3FMI
	qt9X2FA21jMAlfPzKzlbtdS67nKcM6bKPVbjtDhEFPE56iSHvVwPCF2sXLrNMUO932n8rg
	JyvuZrMCG3Iqm4hxwTnuPRkW1b8xpjY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjhEXhItmtgWJcOdZcIsr7lX1LpUjnzN2RuMZC/FUxw=;
	b=SY/Ud9yOeOwuVSBfeXvLRQTx+WKNLiWQhRMegTPamDdAJNodzeEnpZmsJFThmMPr8q3FMI
	qt9X2FA21jMAlfPzKzlbtdS67nKcM6bKPVbjtDhEFPE56iSHvVwPCF2sXLrNMUO932n8rg
	JyvuZrMCG3Iqm4hxwTnuPRkW1b8xpjY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-SJW2FwMcNIWT4KdeDhGtsQ-1; Mon,
 04 Mar 2024 23:39:13 -0500
X-MC-Unique: SJW2FwMcNIWT4KdeDhGtsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 790DC29AB3F0;
	Tue,  5 Mar 2024 04:39:12 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CE65C1F090;
	Tue,  5 Mar 2024 04:39:06 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] mm/treewide: Align up pXd_leaf() retval across archs
Date: Tue,  5 Mar 2024 12:37:50 +0800
Message-ID: <20240305043750.93762-11-peterx@redhat.com>
In-Reply-To: <20240305043750.93762-1-peterx@redhat.com>
References: <20240305043750.93762-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Even if pXd_leaf() API is defined globally, it's not clear on the retval,
and there are three types used (bool, int, unsigned log).

Always return a boolean for pXd_leaf() APIs.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/riscv/include/asm/pgtable-64.h | 2 +-
 arch/riscv/include/asm/pgtable.h    | 2 +-
 arch/s390/include/asm/pgtable.h     | 4 ++--
 arch/sparc/include/asm/pgtable_64.h | 4 ++--
 arch/x86/include/asm/pgtable.h      | 8 ++++----
 include/linux/pgtable.h             | 8 ++++----
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index b42017d76924..2c7e1661db01 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -190,7 +190,7 @@ static inline int pud_bad(pud_t pud)
 }
 
 #define pud_leaf	pud_leaf
-static inline int pud_leaf(pud_t pud)
+static inline bool pud_leaf(pud_t pud)
 {
 	return pud_present(pud) && (pud_val(pud) & _PAGE_LEAF);
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index add5cd30ab34..6839520dbcb1 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -241,7 +241,7 @@ static inline int pmd_bad(pmd_t pmd)
 }
 
 #define pmd_leaf	pmd_leaf
-static inline int pmd_leaf(pmd_t pmd)
+static inline bool pmd_leaf(pmd_t pmd)
 {
 	return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
 }
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 9e08af5b9247..60950e7a25f5 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -706,7 +706,7 @@ static inline int pud_none(pud_t pud)
 }
 
 #define pud_leaf pud_leaf
-static inline int pud_leaf(pud_t pud)
+static inline bool pud_leaf(pud_t pud)
 {
 	if ((pud_val(pud) & _REGION_ENTRY_TYPE_MASK) != _REGION_ENTRY_TYPE_R3)
 		return 0;
@@ -714,7 +714,7 @@ static inline int pud_leaf(pud_t pud)
 }
 
 #define pmd_leaf pmd_leaf
-static inline int pmd_leaf(pmd_t pmd)
+static inline bool pmd_leaf(pmd_t pmd)
 {
 	return (pmd_val(pmd) & _SEGMENT_ENTRY_LARGE) != 0;
 }
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 6ff0a28d5fd1..4d1bafaba942 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -681,7 +681,7 @@ static inline unsigned long pte_special(pte_t pte)
 }
 
 #define pmd_leaf pmd_leaf
-static inline unsigned long pmd_leaf(pmd_t pmd)
+static inline bool pmd_leaf(pmd_t pmd)
 {
 	pte_t pte = __pte(pmd_val(pmd));
 
@@ -868,7 +868,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define p4d_page(p4d)			NULL
 
 #define pud_leaf pud_leaf
-static inline unsigned long pud_leaf(pud_t pud)
+static inline bool pud_leaf(pud_t pud)
 {
 	pte_t pte = __pte(pud_val(pud));
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index cfc84c55d0e6..7621a5acb13e 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -252,7 +252,7 @@ static inline unsigned long pgd_pfn(pgd_t pgd)
 }
 
 #define p4d_leaf p4d_leaf
-static inline int p4d_leaf(p4d_t p4d)
+static inline bool p4d_leaf(p4d_t p4d)
 {
 	/* No 512 GiB pages yet */
 	return 0;
@@ -261,7 +261,7 @@ static inline int p4d_leaf(p4d_t p4d)
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 
 #define pmd_leaf pmd_leaf
-static inline int pmd_leaf(pmd_t pte)
+static inline bool pmd_leaf(pmd_t pte)
 {
 	return pmd_flags(pte) & _PAGE_PSE;
 }
@@ -1086,7 +1086,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define pud_page(pud)	pfn_to_page(pud_pfn(pud))
 
 #define pud_leaf pud_leaf
-static inline int pud_leaf(pud_t pud)
+static inline bool pud_leaf(pud_t pud)
 {
 	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
 		(_PAGE_PSE | _PAGE_PRESENT);
@@ -1413,7 +1413,7 @@ static inline bool pgdp_maps_userspace(void *__ptr)
 }
 
 #define pgd_leaf	pgd_leaf
-static inline int pgd_leaf(pgd_t pgd) { return 0; }
+static inline bool pgd_leaf(pgd_t pgd) { return false; }
 
 #ifdef CONFIG_PAGE_TABLE_ISOLATION
 /*
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index a36cf4e124b0..85fc7554cd52 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1777,16 +1777,16 @@ typedef unsigned int pgtbl_mod_mask;
  * Only meaningful when called on a valid entry.
  */
 #ifndef pgd_leaf
-#define pgd_leaf(x)	0
+#define pgd_leaf(x)	false
 #endif
 #ifndef p4d_leaf
-#define p4d_leaf(x)	0
+#define p4d_leaf(x)	false
 #endif
 #ifndef pud_leaf
-#define pud_leaf(x)	0
+#define pud_leaf(x)	false
 #endif
 #ifndef pmd_leaf
-#define pmd_leaf(x)	0
+#define pmd_leaf(x)	false
 #endif
 
 #ifndef pgd_leaf_size
-- 
2.44.0

