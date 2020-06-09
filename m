Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6811F3A69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 14:09:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h86n1MqwzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 22:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=8bytes.org (client-ip=2a01:238:4383:600:38bc:a715:4b6d:a889;
 helo=theia.8bytes.org; envelope-from=joro@8bytes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=8bytes.org
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h83237BHzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 22:05:48 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F011E2C3; Tue,  9 Jun 2020 14:05:39 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm: Move p?d_alloc_track to separate header file
Date: Tue,  9 Jun 2020 14:05:33 +0200
Message-Id: <20200609120533.25867-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 jroedel@suse.de, linux-mm@kvack.org, peterz@infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linux-next@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, manvanth@linux.vnet.ibm.com, hch@lst.de,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joerg Roedel <jroedel@suse.de>

The functions are only used in two source files, so there is no need
for them to be in the global <linux/mm.h> header. Move them to the new
<linux/pgalloc-track.h> header and include it only where needed.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 include/linux/mm.h            | 45 -------------------------------
 include/linux/pgalloc-track.h | 51 +++++++++++++++++++++++++++++++++++
 lib/ioremap.c                 |  1 +
 mm/vmalloc.c                  |  1 +
 4 files changed, 53 insertions(+), 45 deletions(-)
 create mode 100644 include/linux/pgalloc-track.h

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9d6042178ca7..22d8b2a2c9bc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2092,51 +2092,11 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
 		NULL : pud_offset(p4d, address);
 }
 
-static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
-				     unsigned long address,
-				     pgtbl_mod_mask *mod_mask)
-
-{
-	if (unlikely(pgd_none(*pgd))) {
-		if (__p4d_alloc(mm, pgd, address))
-			return NULL;
-		*mod_mask |= PGTBL_PGD_MODIFIED;
-	}
-
-	return p4d_offset(pgd, address);
-}
-
-static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
-				     unsigned long address,
-				     pgtbl_mod_mask *mod_mask)
-{
-	if (unlikely(p4d_none(*p4d))) {
-		if (__pud_alloc(mm, p4d, address))
-			return NULL;
-		*mod_mask |= PGTBL_P4D_MODIFIED;
-	}
-
-	return pud_offset(p4d, address);
-}
-
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 {
 	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
 		NULL: pmd_offset(pud, address);
 }
-
-static inline pmd_t *pmd_alloc_track(struct mm_struct *mm, pud_t *pud,
-				     unsigned long address,
-				     pgtbl_mod_mask *mod_mask)
-{
-	if (unlikely(pud_none(*pud))) {
-		if (__pmd_alloc(mm, pud, address))
-			return NULL;
-		*mod_mask |= PGTBL_PUD_MODIFIED;
-	}
-
-	return pmd_offset(pud, address);
-}
 #endif /* CONFIG_MMU */
 
 #if USE_SPLIT_PTE_PTLOCKS
@@ -2252,11 +2212,6 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
 		NULL: pte_offset_kernel(pmd, address))
 
-#define pte_alloc_kernel_track(pmd, address, mask)			\
-	((unlikely(pmd_none(*(pmd))) &&					\
-	  (__pte_alloc_kernel(pmd) || ({*(mask)|=PGTBL_PMD_MODIFIED;0;})))?\
-		NULL: pte_offset_kernel(pmd, address))
-
 #if USE_SPLIT_PMD_PTLOCKS
 
 static struct page *pmd_to_page(pmd_t *pmd)
diff --git a/include/linux/pgalloc-track.h b/include/linux/pgalloc-track.h
new file mode 100644
index 000000000000..1dcc865029a2
--- /dev/null
+++ b/include/linux/pgalloc-track.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_PGALLLC_TRACK_H
+#define _LINUX_PGALLLC_TRACK_H
+
+#if defined(CONFIG_MMU)
+static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
+				     unsigned long address,
+				     pgtbl_mod_mask *mod_mask)
+{
+	if (unlikely(pgd_none(*pgd))) {
+		if (__p4d_alloc(mm, pgd, address))
+			return NULL;
+		*mod_mask |= PGTBL_PGD_MODIFIED;
+	}
+
+	return p4d_offset(pgd, address);
+}
+
+static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
+				     unsigned long address,
+				     pgtbl_mod_mask *mod_mask)
+{
+	if (unlikely(p4d_none(*p4d))) {
+		if (__pud_alloc(mm, p4d, address))
+			return NULL;
+		*mod_mask |= PGTBL_P4D_MODIFIED;
+	}
+
+	return pud_offset(p4d, address);
+}
+
+static inline pmd_t *pmd_alloc_track(struct mm_struct *mm, pud_t *pud,
+				     unsigned long address,
+				     pgtbl_mod_mask *mod_mask)
+{
+	if (unlikely(pud_none(*pud))) {
+		if (__pmd_alloc(mm, pud, address))
+			return NULL;
+		*mod_mask |= PGTBL_PUD_MODIFIED;
+	}
+
+	return pmd_offset(pud, address);
+}
+#endif /* CONFIG_MMU */
+
+#define pte_alloc_kernel_track(pmd, address, mask)			\
+	((unlikely(pmd_none(*(pmd))) &&					\
+	  (__pte_alloc_kernel(pmd) || ({*(mask)|=PGTBL_PMD_MODIFIED;0;})))?\
+		NULL: pte_offset_kernel(pmd, address))
+
+#endif /* _LINUX_PGALLLC_TRACK_H */
diff --git a/lib/ioremap.c b/lib/ioremap.c
index ad485f08173b..608fcccd21c8 100644
--- a/lib/ioremap.c
+++ b/lib/ioremap.c
@@ -11,6 +11,7 @@
 #include <linux/sched.h>
 #include <linux/io.h>
 #include <linux/export.h>
+#include <linux/pgalloc-track.h>
 #include <asm/cacheflush.h>
 #include <asm/pgtable.h>
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3091c2ca60df..edc43f003165 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -35,6 +35,7 @@
 #include <linux/bitops.h>
 #include <linux/rbtree_augmented.h>
 #include <linux/overflow.h>
+#include <linux/pgalloc-track.h>
 
 #include <linux/uaccess.h>
 #include <asm/tlbflush.h>
-- 
2.26.2

