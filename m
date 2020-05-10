Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB931CC957
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 10:20:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KcSr16TlzDqJl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 18:20:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+effa4c2fe12dfa74dce9+6104+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=sDtpyjEU; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Kbwq4G92zDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 17:56:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tuZN2xrlpt1mzaSPTZQmZcxarUCgYHN/WWoYWZD5CMA=; b=sDtpyjEUq3idoip3kyow2/PSWu
 uJVQ905vcUrXcgxrIxGDiLMbwWkdmWFL3KbQPd5+UF85+oP4oMmaS3xkzpsUVWiDcixEhOIKo/cl1
 Vz3AFViQKVcBMvGEUWzwdyMeL1JUopahMHntY+9iMB0v+wY6a9xjPr6yUq6SzVBFRERWKDF7DIK4u
 zoOU9tCQc5fmTiPoje0X5bG83/bSW3bju4T9r039OVyhynk/4L3Icfau7cwcNJ7XPebW0TDm7A1OX
 1O3JDWHPFgqgs+gHRxXS1Qt6gMyAwHTxZ2HknlcDl7IGeRSp00xiM1nRdlnl7T/U5tvQBRlsfW9wQ
 oGw6IPLg==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgoM-0008NU-Lt; Sun, 10 May 2020 07:55:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 11/31] arm64: use asm-generic/cacheflush.h
Date: Sun, 10 May 2020 09:54:50 +0200
Message-Id: <20200510075510.987823-12-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ARM64 needs almost no cache flushing routines of its own.  Rely on
asm-generic/cacheflush.h for the defaults.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/cacheflush.h | 46 ++++-------------------------
 1 file changed, 5 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index e6cca3d4acf70..03a5a187163ab 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -94,20 +94,7 @@ static inline void flush_icache_range(unsigned long start, unsigned long end)
 #endif
 	kick_all_cpus_sync();
 }
-
-static inline void flush_cache_mm(struct mm_struct *mm)
-{
-}
-
-static inline void flush_cache_page(struct vm_area_struct *vma,
-				    unsigned long user_addr, unsigned long pfn)
-{
-}
-
-static inline void flush_cache_range(struct vm_area_struct *vma,
-				     unsigned long start, unsigned long end)
-{
-}
+#define flush_icache_range flush_icache_range
 
 /*
  * Cache maintenance functions used by the DMA API. No to be used directly.
@@ -123,12 +110,7 @@ extern void __dma_flush_area(const void *, size_t);
  */
 extern void copy_to_user_page(struct vm_area_struct *, struct page *,
 	unsigned long, void *, const void *, unsigned long);
-#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
-	do {							\
-		memcpy(dst, src, len);				\
-	} while (0)
-
-#define flush_cache_dup_mm(mm) flush_cache_mm(mm)
+#define copy_to_user_page copy_to_user_page
 
 /*
  * flush_dcache_page is used when the kernel has written to the page
@@ -154,29 +136,11 @@ static __always_inline void __flush_icache_all(void)
 	dsb(ish);
 }
 
-#define flush_dcache_mmap_lock(mapping)		do { } while (0)
-#define flush_dcache_mmap_unlock(mapping)	do { } while (0)
-
-/*
- * We don't appear to need to do anything here.  In fact, if we did, we'd
- * duplicate cache flushing elsewhere performed by flush_dcache_page().
- */
-#define flush_icache_page(vma,page)	do { } while (0)
-
-/*
- * Not required on AArch64 (PIPT or VIPT non-aliasing D-cache).
- */
-static inline void flush_cache_vmap(unsigned long start, unsigned long end)
-{
-}
-
-static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
-{
-}
-
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 
-#endif
+#include <asm-generic/cacheflush.h>
+
+#endif /* __ASM_CACHEFLUSH_H */
-- 
2.26.2

