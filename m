Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25F79AAF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 21:05:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkx512G3Jz3dJb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 05:05:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkx2Y2gj2z3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 05:03:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Rkx2D2DjSz9vQx;
	Mon, 11 Sep 2023 21:03:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiYdjTbvmM6N; Mon, 11 Sep 2023 21:03:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Rkx275Qmjz9vQw;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9042E8B787;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 88Pi_4G6CqMN; Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EED0B8B786;
	Mon, 11 Sep 2023 21:03:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38BJ3H5l3544205
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 21:03:18 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38BJ3Ho53544203;
	Mon, 11 Sep 2023 21:03:17 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 05/19] powerpc: Deduplicate prototypes of ptep_set_access_flags() and phys_mem_access_prot()
Date: Mon, 11 Sep 2023 21:03:11 +0200
Message-ID: <d938ea610d07225a33fe5b8f6539548a90dc3c0a.1694443576.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694443576.git.christophe.leroy@csgroup.eu>
References: <cover.1694443576.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694458986; l=3011; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=hV24awO1k2ITaiMZFdoSXDaSkZhmyt2kjzbXnNeJWss=; b=/1irJg/NBuaxzbKLPAK5ePLvqsFt6J3NgmDqAOA5kRNWTjTUthXiuhFNQ0olWoR45LtNhp2K9 cIQOiSDMUKqBrKw0MrhqmiiOGPcI4w8d4SkxSiJNlSfYhZ+m0BHcO2X
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prototypes of ptep_set_access_flags() and phys_mem_access_prot() are identical
for book3s and nohash.

Deduplicate them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/pgtable.h |  9 ---------
 arch/powerpc/include/asm/nohash/pgtable.h | 10 ----------
 arch/powerpc/include/asm/pgtable.h        | 10 ++++++++++
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index 3b7bd36a2321..6f4578daea6c 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -9,15 +9,6 @@
 #endif
 
 #ifndef __ASSEMBLY__
-#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
-extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
-				 pte_t *ptep, pte_t entry, int dirty);
-
-struct file;
-extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-				     unsigned long size, pgprot_t vma_prot);
-#define __HAVE_PHYS_MEM_ACCESS_PROT
-
 void __update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
 
 /*
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index c721478c5934..5b6647fb398b 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -207,11 +207,6 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 		mb();
 }
 
-
-#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
-extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
-				 pte_t *ptep, pte_t entry, int dirty);
-
 /*
  * Macro to mark a page protection value as "uncacheable".
  */
@@ -240,11 +235,6 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long addre
 
 #define pgprot_writecombine pgprot_noncached_wc
 
-struct file;
-extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-				     unsigned long size, pgprot_t vma_prot);
-#define __HAVE_PHYS_MEM_ACCESS_PROT
-
 #ifdef CONFIG_HUGETLB_PAGE
 static inline int hugepd_ok(hugepd_t hpd)
 {
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index d0ee46de248e..bcdbdeda65d3 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -110,6 +110,16 @@ void mark_initmem_nx(void);
 static inline void mark_initmem_nx(void) { }
 #endif
 
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
+			  pte_t *ptep, pte_t entry, int dirty);
+
+struct file;
+pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
+			      unsigned long size, pgprot_t vma_prot);
+#define __HAVE_PHYS_MEM_ACCESS_PROT
+
+
 /*
  * When used, PTE_FRAG_NR is defined in subarch pgtable.h
  * so we are sure it is included when arriving here.
-- 
2.41.0

