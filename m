Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839A1D55BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 18:19:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ntrp23l6zDqP2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 02:19:06 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=qAhrFRCG; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nrcb4sKmzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 00:38:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=b/AKrpkhJpxezrTGvPZBC9SW3CgmeEDvWHVUmiGEvwM=; b=qAhrFRCGcIQb9NDVcbKnnI87MO
 rAFmmbjM2sLu6e+feJPc3c5I4D7qGwprfGKsIR8476ANnfS/yu+Lwia+kMttqQbXC0L114HXUN3Zx
 /rZuenpggIX5ieHsOhX9HaVYQzc60QnpIUS1gFYUdtvTNzlWDdgHKpgNbNOzKmviizUSkBt4JEYbf
 bnHS19xdmEcmi4mAmx1qWzsIQQu+OMiLEWB/1RWRZwrkJeYHKqw6O3F0JT5GZFxCOTQT37/cwdPJq
 iO2aQzvkIHxDSKKgPu2mIE1NMibz1IIqvSU5BNlDIGKCAv1NeWRgcfGBjQ7o90LDDCdUWVzlGDBAd
 GiLHjF/Q==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTK-00054u-7X; Fri, 15 May 2020 14:37:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 23/29] arm: rename flush_cache_user_range to
 flush_icache_user_range
Date: Fri, 15 May 2020 16:36:40 +0200
Message-Id: <20200515143646.3857579-24-hch@lst.de>
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

flush_icache_user_range will be the name for a generic primitive.
Move the arm name so that arm already has an implementation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/cacheflush.h | 4 ++--
 arch/arm/kernel/traps.c           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cacheflush.h b/arch/arm/include/asm/cacheflush.h
index c78e14fcfb5df..2e24e765e6d3a 100644
--- a/arch/arm/include/asm/cacheflush.h
+++ b/arch/arm/include/asm/cacheflush.h
@@ -258,11 +258,11 @@ extern void flush_cache_page(struct vm_area_struct *vma, unsigned long user_addr
 #define flush_cache_dup_mm(mm) flush_cache_mm(mm)
 
 /*
- * flush_cache_user_range is used when we want to ensure that the
+ * flush_icache_user_range is used when we want to ensure that the
  * Harvard caches are synchronised for the user space address range.
  * This is used for the ARM private sys_cacheflush system call.
  */
-#define flush_cache_user_range(s,e)	__cpuc_coherent_user_range(s,e)
+#define flush_icache_user_range(s,e)	__cpuc_coherent_user_range(s,e)
 
 /*
  * Perform necessary cache operations to ensure that data previously
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 1e70e7227f0ff..316a7687f8133 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -566,7 +566,7 @@ __do_cache_op(unsigned long start, unsigned long end)
 		if (fatal_signal_pending(current))
 			return 0;
 
-		ret = flush_cache_user_range(start, start + chunk);
+		ret = flush_icache_user_range(start, start + chunk);
 		if (ret)
 			return ret;
 
-- 
2.26.2

