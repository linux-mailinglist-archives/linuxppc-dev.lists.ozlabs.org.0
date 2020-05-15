Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B7D1D5533
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 17:54:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NtJ01HYbzDqfc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 01:54:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e5f7f93d3739a79b60a3+6109+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=W5kTDVZU; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nrbx6mN3zDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 00:37:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8Bf5PQavcsPSk/30moW6k6biuN3Qcs8ONGd4UJ1YFiA=; b=W5kTDVZULzZpxH3nY2FA8EeWtC
 0pxyBdBG5EpPvyEV/Z9cblrqAO9N+qw+On7PqqrTZSrzr1RPRzT0Phkdj87X2ZkuR7CYFd5S+eevF
 0n9RgWvPZ7i7a5oAMZ97LJaLFd1pmN4dBgXCs6eEwOt8KECPC0rehSxD0JfrVfkON6hWEG8uvCKEo
 RE3Nh1w1ujF7q1ih51KWgBKH42wZuT8D/Z+87xmnMUHz66GFWEvo7/Z/1jxMfp8DfHA1EpdUhRJ90
 TDY+NbvF/S/3K0Xiky7/Ae8WckmjKhSIVCbnN11xUn1hKvhHlkCoTI3WbTQGOdOqP3J9XDfCsY7da
 18ZV6AZA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSk-0004PG-IT; Fri, 15 May 2020 14:37:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 12/29] ia64: use asm-generic/cacheflush.h
Date: Fri, 15 May 2020 16:36:29 +0200
Message-Id: <20200515143646.3857579-13-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
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

IA64 needs almost no cache flushing routines of its own.  Rely on
asm-generic/cacheflush.h for the defaults.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/include/asm/cacheflush.h | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/arch/ia64/include/asm/cacheflush.h b/arch/ia64/include/asm/cacheflush.h
index 6d3478f8abc89..a8f1c86ac242a 100644
--- a/arch/ia64/include/asm/cacheflush.h
+++ b/arch/ia64/include/asm/cacheflush.h
@@ -12,44 +12,22 @@
 
 #include <asm/page.h>
 
-/*
- * Cache flushing routines.  This is the kind of stuff that can be very expensive, so try
- * to avoid them whenever possible.
- */
-
-#define flush_cache_all()			do { } while (0)
-#define flush_cache_mm(mm)			do { } while (0)
-#define flush_cache_dup_mm(mm)			do { } while (0)
-#define flush_cache_range(vma, start, end)	do { } while (0)
-#define flush_cache_page(vma, vmaddr, pfn)	do { } while (0)
-#define flush_icache_page(vma,page)		do { } while (0)
-#define flush_cache_vmap(start, end)		do { } while (0)
-#define flush_cache_vunmap(start, end)		do { } while (0)
-
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
 #define flush_dcache_page(page)			\
 do {						\
 	clear_bit(PG_arch_1, &(page)->flags);	\
 } while (0)
 
-#define flush_dcache_mmap_lock(mapping)		do { } while (0)
-#define flush_dcache_mmap_unlock(mapping)	do { } while (0)
-
-extern void flush_icache_range (unsigned long start, unsigned long end);
+extern void flush_icache_range(unsigned long start, unsigned long end);
+#define flush_icache_range flush_icache_range
 extern void clflush_cache_range(void *addr, int size);
 
-
 #define flush_icache_user_range(vma, page, user_addr, len)					\
 do {												\
 	unsigned long _addr = (unsigned long) page_address(page) + ((user_addr) & ~PAGE_MASK);	\
 	flush_icache_range(_addr, _addr + (len));						\
 } while (0)
 
-#define copy_to_user_page(vma, page, vaddr, dst, src, len) \
-do { memcpy(dst, src, len); \
-     flush_icache_user_range(vma, page, vaddr, len); \
-} while (0)
-#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
-	memcpy(dst, src, len)
+#include <asm-generic/cacheflush.h>
 
 #endif /* _ASM_IA64_CACHEFLUSH_H */
-- 
2.26.2

