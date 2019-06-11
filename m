Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAD13D1F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:13:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZn02Pp9zDqdG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:13:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+98d4ae9035936dc2f97b+5770+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="X22/uN/3"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXkw0n7RzDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:41:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g4MxpUkGP+hxy8ku71ZEZt00ts6l03REsi5/bfFDlbU=; b=X22/uN/3aqQ1VzBdZFYnIpfrIJ
 JgQOzg3WSjfNhYKznXgvyyQPBF9PGAwq6jJ+1Hl6cDJMxwNjBGvNc5s3srm+ocnQmrf4M8kkhOO/W
 gUs3R2xrlOGvqs5y2CBuev39K1ER5sRtYrGoq4y0dvrKATsVsJpdUPRmS687iV9RkUotsvw15Mh/S
 4xZTVyXHovu/nPgEBWXHfcBFWVWgBaRnr9MDCEclbB2bKjUsn3GX8AOIK006JtuGdhzZjag1gYo4f
 8nPJijR2K316Q4pSDbA33p2yfBWo6yWTrnofL9AuquV2WMhI6Gu2jUVnjmOBUfBlIATdgpoy+HhA9
 kLOu+C6w==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hahxc-0005Pc-Qw; Tue, 11 Jun 2019 14:41:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 03/16] mm: lift the x86_32 PAE version of gup_get_pte to
 common code
Date: Tue, 11 Jun 2019 16:40:49 +0200
Message-Id: <20190611144102.8848-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611144102.8848-1-hch@lst.de>
References: <20190611144102.8848-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-sh@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 x86@kernel.org, linux-mips@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The split low/high access is the only non-READ_ONCE version of
gup_get_pte that did show up in the various arch implemenations.
Lift it to common code and drop the ifdef based arch override.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/Kconfig                      |  1 +
 arch/x86/include/asm/pgtable-3level.h | 47 ------------------------
 arch/x86/kvm/mmu.c                    |  2 +-
 mm/Kconfig                            |  3 ++
 mm/gup.c                              | 51 ++++++++++++++++++++++++---
 5 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2bbbd4d1ba31..7cd53cc59f0f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -121,6 +121,7 @@ config X86
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL
+	select GUP_GET_PTE_LOW_HIGH		if X86_PAE
 	select HARDLOCKUP_CHECK_TIMESTAMP	if X86_64
 	select HAVE_ACPI_APEI			if ACPI
 	select HAVE_ACPI_APEI_NMI		if ACPI
diff --git a/arch/x86/include/asm/pgtable-3level.h b/arch/x86/include/asm/pgtable-3level.h
index f8b1ad2c3828..e3633795fb22 100644
--- a/arch/x86/include/asm/pgtable-3level.h
+++ b/arch/x86/include/asm/pgtable-3level.h
@@ -285,53 +285,6 @@ static inline pud_t native_pudp_get_and_clear(pud_t *pudp)
 #define __pte_to_swp_entry(pte)	(__swp_entry(__pteval_swp_type(pte), \
 					     __pteval_swp_offset(pte)))
 
-#define gup_get_pte gup_get_pte
-/*
- * WARNING: only to be used in the get_user_pages_fast() implementation.
- *
- * With get_user_pages_fast(), we walk down the pagetables without taking
- * any locks.  For this we would like to load the pointers atomically,
- * but that is not possible (without expensive cmpxchg8b) on PAE.  What
- * we do have is the guarantee that a PTE will only either go from not
- * present to present, or present to not present or both -- it will not
- * switch to a completely different present page without a TLB flush in
- * between; something that we are blocking by holding interrupts off.
- *
- * Setting ptes from not present to present goes:
- *
- *   ptep->pte_high = h;
- *   smp_wmb();
- *   ptep->pte_low = l;
- *
- * And present to not present goes:
- *
- *   ptep->pte_low = 0;
- *   smp_wmb();
- *   ptep->pte_high = 0;
- *
- * We must ensure here that the load of pte_low sees 'l' iff pte_high
- * sees 'h'. We load pte_high *after* loading pte_low, which ensures we
- * don't see an older value of pte_high.  *Then* we recheck pte_low,
- * which ensures that we haven't picked up a changed pte high. We might
- * have gotten rubbish values from pte_low and pte_high, but we are
- * guaranteed that pte_low will not have the present bit set *unless*
- * it is 'l'. Because get_user_pages_fast() only operates on present ptes
- * we're safe.
- */
-static inline pte_t gup_get_pte(pte_t *ptep)
-{
-	pte_t pte;
-
-	do {
-		pte.pte_low = ptep->pte_low;
-		smp_rmb();
-		pte.pte_high = ptep->pte_high;
-		smp_rmb();
-	} while (unlikely(pte.pte_low != ptep->pte_low));
-
-	return pte;
-}
-
 #include <asm/pgtable-invert.h>
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_H */
diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index 1e9ba81accba..3f7cd11168f9 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -653,7 +653,7 @@ static u64 __update_clear_spte_slow(u64 *sptep, u64 spte)
 
 /*
  * The idea using the light way get the spte on x86_32 guest is from
- * gup_get_pte(arch/x86/mm/gup.c).
+ * gup_get_pte (mm/gup.c).
  *
  * An spte tlb flush may be pending, because kvm_set_pte_rmapp
  * coalesces them and we are running out of the MMU lock.  Therefore
diff --git a/mm/Kconfig b/mm/Kconfig
index f0c76ba47695..fe51f104a9e0 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -762,6 +762,9 @@ config GUP_BENCHMARK
 
 	  See tools/testing/selftests/vm/gup_benchmark.c
 
+config GUP_GET_PTE_LOW_HIGH
+	bool
+
 config ARCH_HAS_PTE_SPECIAL
 	bool
 
diff --git a/mm/gup.c b/mm/gup.c
index 3237f33792e6..9b72f2ea3471 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1684,17 +1684,60 @@ struct page *get_dump_page(unsigned long addr)
  * This code is based heavily on the PowerPC implementation by Nick Piggin.
  */
 #ifdef CONFIG_HAVE_GENERIC_GUP
+#ifdef CONFIG_GUP_GET_PTE_LOW_HIGH
+/*
+ * WARNING: only to be used in the get_user_pages_fast() implementation.
+ *
+ * With get_user_pages_fast(), we walk down the pagetables without taking any
+ * locks.  For this we would like to load the pointers atomically, but sometimes
+ * that is not possible (e.g. without expensive cmpxchg8b on x86_32 PAE).  What
+ * we do have is the guarantee that a PTE will only either go from not present
+ * to present, or present to not present or both -- it will not switch to a
+ * completely different present page without a TLB flush in between; something
+ * that we are blocking by holding interrupts off.
+ *
+ * Setting ptes from not present to present goes:
+ *
+ *   ptep->pte_high = h;
+ *   smp_wmb();
+ *   ptep->pte_low = l;
+ *
+ * And present to not present goes:
+ *
+ *   ptep->pte_low = 0;
+ *   smp_wmb();
+ *   ptep->pte_high = 0;
+ *
+ * We must ensure here that the load of pte_low sees 'l' IFF pte_high sees 'h'.
+ * We load pte_high *after* loading pte_low, which ensures we don't see an older
+ * value of pte_high.  *Then* we recheck pte_low, which ensures that we haven't
+ * picked up a changed pte high. We might have gotten rubbish values from
+ * pte_low and pte_high, but we are guaranteed that pte_low will not have the
+ * present bit set *unless* it is 'l'. Because get_user_pages_fast() only
+ * operates on present ptes we're safe.
+ */
+static inline pte_t gup_get_pte(pte_t *ptep)
+{
+	pte_t pte;
 
-#ifndef gup_get_pte
+	do {
+		pte.pte_low = ptep->pte_low;
+		smp_rmb();
+		pte.pte_high = ptep->pte_high;
+		smp_rmb();
+	} while (unlikely(pte.pte_low != ptep->pte_low));
+
+	return pte;
+}
+#else /* CONFIG_GUP_GET_PTE_LOW_HIGH */
 /*
- * We assume that the PTE can be read atomically. If this is not the case for
- * your architecture, please provide the helper.
+ * We require that the PTE can be read atomically.
  */
 static inline pte_t gup_get_pte(pte_t *ptep)
 {
 	return READ_ONCE(*ptep);
 }
-#endif
+#endif /* CONFIG_GUP_GET_PTE_LOW_HIGH */
 
 static void undo_dev_pagemap(int *nr, int nr_start, struct page **pages)
 {
-- 
2.20.1

