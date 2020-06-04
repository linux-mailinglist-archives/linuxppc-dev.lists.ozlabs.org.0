Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5A1EDEE3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 09:56:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cylW1DNfzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 17:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=8bytes.org (client-ip=2a01:238:4383:600:38bc:a715:4b6d:a889;
 helo=theia.8bytes.org; envelope-from=joro@8bytes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=8bytes.org
X-Greylist: delayed 575 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Jun 2020 17:54:36 AEST
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cyjS2Gp6zDqkq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 17:54:36 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A93F826F; Thu,  4 Jun 2020 09:44:48 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm: Fix pud_alloc_track()
Date: Thu,  4 Jun 2020 09:44:46 +0200
Message-Id: <20200604074446.23944-1-joro@8bytes.org>
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linux-next@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, manvanth@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joerg Roedel <jroedel@suse.de>

The pud_alloc_track() needs to do different checks based on whether
__ARCH_HAS_5LEVEL_HACK is defined, like it already does in
pud_alloc(). Otherwise it causes boot failures on PowerPC.

Provide the correct implementations for both possible settings of
__ARCH_HAS_5LEVEL_HACK to fix the boot problems.

Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Fixes: d8626138009b ("mm: add functions to track page directory modifications")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 include/asm-generic/5level-fixup.h |  5 +++++
 include/linux/mm.h                 | 26 +++++++++++++-------------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
index 58046ddc08d0..afbab31fbd7e 100644
--- a/include/asm-generic/5level-fixup.h
+++ b/include/asm-generic/5level-fixup.h
@@ -17,6 +17,11 @@
 	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
 		NULL : pud_offset(p4d, address))
 
+#define pud_alloc_track(mm, p4d, address, mask)					\
+	((unlikely(pgd_none(*(p4d))) &&						\
+	  (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?	\
+	  NULL : pud_offset(p4d, address))
+
 #define p4d_alloc(mm, pgd, address)		(pgd)
 #define p4d_alloc_track(mm, pgd, address, mask)	(pgd)
 #define p4d_offset(pgd, start)			(pgd)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 66e0977f970a..ad3b31c5bcc3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
 		NULL : pud_offset(p4d, address);
 }
 
-static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
+static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
 				     unsigned long address,
 				     pgtbl_mod_mask *mod_mask)
-
 {
-	if (unlikely(pgd_none(*pgd))) {
-		if (__p4d_alloc(mm, pgd, address))
+	if (unlikely(p4d_none(*p4d))) {
+		if (__pud_alloc(mm, p4d, address))
 			return NULL;
-		*mod_mask |= PGTBL_PGD_MODIFIED;
+		*mod_mask |= PGTBL_P4D_MODIFIED;
 	}
 
-	return p4d_offset(pgd, address);
+	return pud_offset(p4d, address);
 }
 
-#endif /* !__ARCH_HAS_5LEVEL_HACK */
-
-static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
+static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
 				     unsigned long address,
 				     pgtbl_mod_mask *mod_mask)
+
 {
-	if (unlikely(p4d_none(*p4d))) {
-		if (__pud_alloc(mm, p4d, address))
+	if (unlikely(pgd_none(*pgd))) {
+		if (__p4d_alloc(mm, pgd, address))
 			return NULL;
-		*mod_mask |= PGTBL_P4D_MODIFIED;
+		*mod_mask |= PGTBL_PGD_MODIFIED;
 	}
 
-	return pud_offset(p4d, address);
+	return p4d_offset(pgd, address);
 }
 
+#endif /* !__ARCH_HAS_5LEVEL_HACK */
+
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 {
 	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
-- 
2.26.2

